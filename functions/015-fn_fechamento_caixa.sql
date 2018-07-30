if (object_id('fn_fechamento_caixa') is not null)
  drop function fn_fechamento_caixa
go
create function fn_fechamento_caixa
(
  @dt_ini datetime,
  @dt_fim datetime,
  @func_id varchar(6),
  @apenas_ultimo_fechamento bit,
  @turno_id int = 0,
  @modos_venda varchar(10) = ''
)                                
returns @tbl table
(
  --identificação
  data datetime,
  turno int,
  func_id int,
  func_nome varchar(50),
  dt_hr_abertura datetime,
  dt_hr_fechamento datetime,
  meio_id int,
  meio_nome varchar(30),
  bandeira varchar(50),

  --conferência
  valor_calculado as (valor_venda + credito_assinada + troco + repique + sangria + suprimento),
  valor_informado money,
  diferenca as (isnull(valor_informado,0) - isnull(valor_venda + credito_assinada + troco + repique + sangria + suprimento,0)),

  --totais do movimento de caixa
  valor_venda money default 0,
  credito_assinada money default 0,
  troco money default 0,
  repique money default 0,
  contra_vale money default 0,
  sangria money default 0,
  suprimento money default 0,

  cfgConfereCaixa bit default 1
)

as begin

  if @modos_venda = ''
    set @modos_venda = '0,1,2,3,4'

  declare @TefSimplificado bit = 0
  if exists(select * from parametro where codigo = 'CfgUsaTEFSimplificado' and valor = '1')
    set @TefSimplificado = 1

  /*Tabelas auxiliares*/
  declare @turnos table
  (
    data datetime,
    func_id int,
    turno_id int
  )

----------------------------------------------
--Recupera o ultimo turno do usuario informado
----------------------------------------------
  if @turno_id > 0 begin
    insert into @turnos
    (
      data,
      func_id,
      turno_id
    )
    select
      dt_contabil,
      func_id,
      turno_id = cx.turno_id
    from turno cx
    where cx.turno_id = @turno_id
  end
  else if @func_id <> '-1' and @apenas_ultimo_fechamento = 1 begin
    insert into @turnos
    (
      data,
      func_id,
      turno_id
    )
    select
      dt_contabil,
      func_id,
      turno_id = cx.turno_id
    from dbo.fn_turnos(@func_id, @dt_ini, @dt_fim, @apenas_ultimo_fechamento, default) fn
    join turno cx on
      cx.func_id = @func_id and
      cx.turno_id = fn.turno_id
  end

---------------------------------------------------------------------------
--Recupera os turnos do usuario informado ou os turnos de todos os usuarios
---------------------------------------------------------------------------
  else begin
    insert into @turnos
    (
      data,
      func_id,
      turno_id
    )
    select
      dt_contabil,
      func_id,
      turno_id = turno_id
    from turno with (nolock)
    where dt_contabil between @dt_ini and @dt_fim
      and (func_id = @func_id or @func_id = '-1')
  end

  declare @aux_totais_turno table
  (
    data datetime,
    turno int,
    func_id integer,
    tipo varchar(50),
    meio_id integer,
    meio_nome varchar(50),
    bandeira varchar(50),
    vl money
  )

  ---------------------------------------------------------------------------
  --Inserindo totais do caixa, por data, funcionário e meio de recebimento
  ---------------------------------------------------------------------------
  insert into @aux_totais_turno
  select
    data,
    turno,
    func_id,
    tipo = case
      when meio_id in (-1,-2,-3) then min(t.descricao)
      else tipo
    end,
    meio_id,
    meio_nome = min(t.descricao),
    bandeira,
    vl = sum(vl)
  from
  (
    select
      data = o.dt_contabil,
      turno = x.turno_id,
      func_id = m.func_recebeu_id,
      tipo = o.tipo,
      meio_id = m.meio_pagamento_id,
      bandeira = nullif(m.bandeira,''),
      vl = m.vl_recebido
    from operacao o with (nolock)
    left join dbo.operacao_venda ov with (nolock) on 
      ov.operacao_id = o.operacao_id
    join dbo.movimento_caixa m with (nolock) on
      m.operacao_id = o.operacao_id
    join @turnos x on
      x.data = o.dt_contabil and
      x.func_id = m.func_recebeu_id and
      x.turno_id = m.turno_id
    where o.dt_contabil between @dt_ini and @dt_fim
      and m.cancelado = 0
      and isnull(ov.modo_venda_id, 0) in (select id from dbo.fn_list2lines(@modos_venda, ''))

    union all

    select
      data = o.dt_contabil,
      turno = x.turno_id,
      func_id = m.func_recebeu_id,
      tipo = o.tipo,
      meio_id = m.meio_pagamento_id,
      bandeira = nullif(m.bandeira,''),
      vl = m.vl_recebido
    from operacao_geral o with (nolock)
    left join dbo.operacao_venda_geral ov with (nolock) on 
      ov.operacao_id = o.operacao_id
    join movimento_caixa_geral m with (nolock) on
      m.operacao_id = o.operacao_id
    join @turnos x on
      x.data = o.dt_contabil and
      x.func_id = m.func_recebeu_id and
      x.turno_id = m.turno_id
    where o.dt_contabil between @dt_ini and @dt_fim
      and m.cancelado = 0
      and isnull(ov.modo_venda_id, 0) in (select id from dbo.fn_list2lines(@modos_venda, ''))
  ) x
  left join meio_pagamento t on t.id = meio_id
  group by
    data,
    turno,
    func_id,
    tipo,
    meio_id,
    bandeira

  ---------------------------------------------------------------------------
  -- Inserindo formas de recebimentos ativas para cada dia e funcionário, o
  -- usuário quer ver também as formas que não foram praticadas no período.
  ---------------------------------------------------------------------------
  insert into @tbl
  (
    data,
    turno,
    func_id,
    dt_hr_abertura,
    dt_hr_fechamento,
    meio_id,
    meio_nome,
    bandeira
  )
  select
    data,
    turno_id,
    func_id,
    dt_hr_abertura,
    dt_hr_fechamento,
    meio_id,
    meio_nome,
    bandeira
  from
  (
    select
      meio_id = id,
      meio_nome = dbo.fn_capitalize (descricao, 0),
      bandeira
    from meio_pagamento mp
    left join 
    (
      select * 
      from 
      (
        select
          meio_pagamento_id,
          bandeira = nullif(bandeira, '')
        from movimento_caixa mc
        where mc.turno_id = @turno_id 
           or @turno_id = 0

        union

        select
          meio_pagamento_id,
          bandeira = nullif(bandeira, '')
        from dbo.turno_conferencia tc
        where tc.turno_id = @turno_id
           or @turno_id = 0

        union

        select 
          meio_id,
          bandeira
        from @aux_totais_turno
      ) x
      group by 
        meio_pagamento_id, 
        bandeira
    ) mc on 
      mp.id = mc.meio_pagamento_id
    where id not in (-1,-2,-3)
      and 
      (
        (tef = 0) or 
        (
          (tef = 1) and
          (
            (id < 0 and @TefSimplificado = 1) or
            (id > 0 and @TefSimplificado = 0)
          )
        )
      )
  ) meios
  full join
  (
    select distinct
      data,
      t.turno_id,
      t.func_id,
      a.dt_hr_abertura,
      a.dt_hr_fechamento
    from @turnos t
    join dbo.turno a on 
      a.turno_id = t.turno_id
  ) dtFunc on 0=0
  order by
    data,
    func_id,
    turno_id,
    dt_hr_abertura,
    dt_hr_fechamento,
    meio_id;

  --Atualizando totais da venda
  update @tbl
  set valor_venda = x.valor
  from
  (
    select
      dt = data,
      f_id = func_id,
      tur = turno,
      trec_id = meio_id,
      valor = sum(vl),
      bndr = bandeira
    from @aux_totais_turno
    where meio_id not in (-1,-2,-3)
      and tipo = 'venda'
    group by 
      data,
      func_id,
      turno, 
      meio_id, 
      bandeira
  ) x
  where data = x.dt
    and func_id = x.f_id
    and turno = x.tur
    and meio_id = x.trec_id
    and isnull(bandeira,'') = isnull(x.bndr,'')

  --Atualizando totais de créditos em conta assinada
  update @tbl
  set credito_assinada = x.valor
  from
  (
    select
      dt = data,
      f_id = func_id,
      tur = turno,
      trec_id = meio_id,
      valor = sum(vl),
      bndr = bandeira
    from @aux_totais_turno
    where meio_id not in (-1,-2,-3)
      and tipo = 'Conta Assinada'
    group by
      data,
      func_id,
      turno,
      meio_id,
      bandeira
  ) x
  where data = x.dt
    and func_id = x.f_id
    and turno = x.tur
    and meio_id = x.trec_id
    and isnull(bandeira, '') = isnull(x.bndr,'');

  /*Atualizando o valor informado na conferência de caixa*/
  with conf as
  (
    select
      turno_id,
      meio_pagamento_id,
      bndr = vl.bandeira,
      vl.vl_digitado
    from turno_conferencia vl
    where turno_id = @turno_id
       or @turno_id = 0
  )
  update @tbl
  set valor_informado = nullif(vl_digitado, 0)
  from conf
  where turno_id = turno
    and meio_id = meio_pagamento_id
    and isnull(bandeira, '') = isnull(conf.bndr,'');

  /*Atualizando totais de trocos:
    - troco e repique são abatidos do dinheiro;
    - troco em contra-vale será abatido do contra-vale;

    troco dinheiro -1
    contra vale    -2
    repique        -3
  */
  with trocos as
  (
    select
      dt,
      f_id,
      tur,
      trec_id,
      troco = sum(troco),
      contra_vale = sum(contra_vale),
      repique = sum(repique)
    from
    (
      select
        dt = data,
        f_id = func_id,
        tur = turno,
        trec_id = case
          when meio_id = -2 then 3
          else 1
        end,
        troco = case when meio_id = -1 then (vl) else 0 end,
        contra_vale = case when meio_id = -2 then (vl) else 0 end,
        repique = case when meio_id = -3 then (vl) else 0 end
      from @aux_totais_turno
      where meio_id in (-1,-2,-3)
    ) x
    group by
      dt,
      f_id,
      tur,
      trec_id
  )
  update @tbl
  set
    troco = x.troco,
    repique = x.repique,
    contra_vale = x.contra_vale
  from trocos x
  where data = x.dt
    and turno = x.tur
    and func_id = x.f_id
    and meio_id = x.trec_id;

  --Atualizando totais de sangria e suprimento
  with aux as
  (
    select
      dt,
      f_id,
      tur,
      trec_id,
      sangria = sum(sangria),
      suprimento = sum(suprimento)
    from
    (
      select
        dt = data,
        tur = turno,
        f_id = func_id,
        trec_id = meio_id,
        sangria = case when tipo = 'Sangria' then vl else 0 end,
        suprimento = case when tipo = 'Suprimento' then vl else 0 end
      from @aux_totais_turno
      where tipo in ('Sangria','Suprimento')
    ) x
    group by dt, f_id, tur, trec_id
  )
  update @tbl
  set
    sangria = x.sangria,
    suprimento = x.suprimento
  from aux x
  where data = x.dt
    and turno = x.tur
    and func_id = x.f_id
    and meio_id = x.trec_id;

    --atualizando nome do funcionario
    update @tbl
    set func_nome = dbo.fn_capitalize (usuario, 0)
    from funcionario f
    where func_id = f.id;

  --Configuração de conferencia de caixa
  with cfg as
  (
    select
      tur = turno,
      totInfo = nullif(sum(isnull(valor_informado,0)), 0)
    from @tbl
    group by turno
  )
  update @tbl
  set cfgConfereCaixa = 0
  from cfg
  where tur = turno
    and totInfo is null

  update @tbl
  set valor_informado = 0
  where valor_informado is null
    and cfgConfereCaixa = 1

  --Apaga meios inativos com valor 0
  delete @tbl
  where valor_calculado = 0
    and meio_id in
    (
      select id
      from dbo.meio_pagamento
      where ativo = 0
    )

  return
end
go
