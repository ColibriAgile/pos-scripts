if dbo.fn_existe('fn_conferencia_caixa') = 1
  drop function fn_conferencia_caixa
go

create function dbo.fn_conferencia_caixa(@func_id int, @dt_contabil date)
returns @tbl table
(
  ordem int,
  id int,
  codigo int,
  descricao varchar(30),
  bandeira varchar(50),
  cartao bit,
  tef bit,
  vl_calculado money default 0,
  vl_calculado_sem_repique money default 0,
  vl_venda money default 0,
  vl_sangria money default 0,
  vl_suprimento money default 0,
  vl_repique money default 0,
  obs varchar(150),
  obs_com_repique varchar(150)
)
as begin

  declare @TefSimplificado bit = 0

  if exists(
    select * 
    from dbo.parametro 
    where codigo = 'CfgUsaTEFSimplificado' 
      and valor = '1'
  )
    set @TefSimplificado = 1

  if (@TefSimplificado = 1) 
  begin
    insert into @tbl
    select
      ordem = mp.ordem,
      id = f.meio_id,
      codigo = mp.codigo,
      descricao = dbo.fn_capitalize(f.meio_nome, 1),
      bandeira = f.bandeira,
      isnull(mp.cartao, 0),
      isnull(mp.tef, 0),
      vl_calculado = f.valor_calculado,
      vl_calculado_sem_repique = f.valor_calculado - f.repique,
      vl_venda = f.valor_venda + f.troco,
      vl_sangria = f.sangria,
      vl_suprimento = f.suprimento,
      vl_repique = f.repique,
      obs = 'Total: ' + convert(varchar(20), f.valor_venda + f.troco) + nullif
      (
        isnull(char(13) + '  + Suprimento: ' + convert(varchar(20), nullif(f.suprimento, 0)), '')+
        isnull(char(13) + '  - Sangria: ' + convert(varchar(20), abs(nullif(f.sangria, 0))), ''),
        ''
      ),
      obs_com_repique = 'Total: ' + convert(varchar(20), f.valor_venda + f.troco) + nullif
      (
        isnull(char(13) + '  + Suprimento: ' + convert(varchar(20), nullif(f.suprimento, 0)), '') +
        isnull(char(13) + '  - Sangria: ' + convert(varchar(20), abs(nullif(f.sangria, 0))), '') +
        isnull(char(13) + '  - Repique: ' + convert(varchar(20), abs(nullif(f.repique, 0))), ''),
        ''
      )
    from dbo.fn_fechamento_caixa(@dt_contabil, @dt_contabil, @func_id, 1, 0, '') f
    left join dbo.meio_pagamento mp on mp.id = f.meio_id
    order by 
      mp.ordem, 
      mp.codigo,
      mp.descricao, 
      f.bandeira
  end

  else begin
    insert into @tbl
    select
      ordem = mp.ordem,
      id = mp.id,
      codigo = mp.codigo,
      descricao = dbo.fn_capitalize(mp.descricao,1),
      bandeira = '',
      isnull(mp.cartao, 0),
      isnull(mp.tef, 0),
      vl_calculado = x.calculado,
      valor_calculado_sem_repique = x.calculado - x.repique,
      vl_venda = x.venda + x.troco,
      vl_sangria = x.sangria,
      vl_suprimento = x.suprimento,
      vl_repique = x.repique,
      obs = 'Total: ' + convert(varchar(20), x.venda + x.troco) + nullif
      (
        isnull(char(13) + '  + Suprimento: ' + convert(varchar(20), nullif(x.suprimento, 0)), '')+
        isnull(char(13) + '  - Sangria: ' + convert(varchar(20), abs(nullif(x.sangria, 0))), ''),
        ''
      ),
      obs_com_repique = 'Total: ' + convert(varchar(20), x.venda + x.troco) + nullif
      (
        isnull(char(13) + '  + Suprimento: ' + convert(varchar(20), nullif(x.suprimento, 0)), '') +
        isnull(char(13) + '  - Sangria: ' + convert(varchar(20), abs(nullif(x.sangria, 0))), '') +
        isnull(char(13) + '  - Repique: ' + convert(varchar(20), abs(nullif(x.repique, 0))), ''),
        ''
      )
    from 
    (
      select
        meio_id = f.meio_id,
        calculado = sum(isnull(valor_calculado, 0)),
        venda = sum(isnull(f.valor_venda,0)),
        troco = sum(isnull(f.troco,0)),
        sangria = sum(isnull(f.sangria, 0)),
        suprimento = sum(isnull(f.suprimento, 0)),
        repique = sum(isnull(f.repique, 0))
      from dbo.fn_fechamento_caixa(@dt_contabil, @dt_contabil, @func_id, 1, 0, '') f
      group by f.meio_id
    ) x
    left join dbo.meio_pagamento mp on mp.id = x.meio_id
    order by
      mp.ordem,
      mp.codigo,
      mp.descricao
  end
  return
end
go