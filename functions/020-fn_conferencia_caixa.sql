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
  vl_calculado_com_repique money default 0,
  vl_pago money default 0,
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
      vl_calculado_com_repique = f.valor_calculado - f.repique,
      vl_pago = f.valor_venda + f.troco + f.credito_assinada,
      vl_sangria = f.sangria,
      vl_suprimento = f.suprimento,
      vl_repique = f.repique,
      obs = 'Total       : ' + convert(char(15), f.valor_venda + f.troco + f.credito_assinada) + nullif
      (
        isnull(char(13) + '» Suprimento: ' + convert(char(15), nullif(f.suprimento, 0)), '')+
        isnull(char(13) + '» Sangria   : ' + convert(char(15), nullif(f.sangria, 0)), ''),
        ''
      ),
      obs_com_repique = 'Total: ' + convert(char(15), f.valor_venda + f.troco + f.credito_assinada) + nullif
      (
        isnull(char(13) + '» Suprimento: ' + convert(char(15), nullif(f.suprimento, 0)), '') +
        isnull(char(13) + '» Sangria   : ' + convert(char(15), nullif(f.sangria, 0)), '') +
        isnull(char(13) + '» Repique   : ' + convert(char(15), nullif(f.repique, 0)), ''),
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
      vl_calculado_com_repique = x.calculado - x.repique,
      vl_pago = x.venda + x.troco + x.credito_assinada,
      vl_sangria = x.sangria,
      vl_suprimento = x.suprimento,
      vl_repique = x.repique,
      obs = 'Total       : ' + convert(char(15), x.venda + x.troco + x.credito_assinada) + nullif
      (
        isnull(char(13) + '» Suprimento: ' + convert(char(15), nullif(x.suprimento, 0), 1), '')+
        isnull(char(13) + '» Sangria   : ' + convert(char(15), nullif(x.sangria, 0), 1), ''),
        ''
      ),
      obs_com_repique = 'Total       : ' + convert(char(15), x.venda + x.troco + x.credito_assinada) + nullif
      (
        isnull(char(13) + '» Suprimento: ' + convert(char(15), nullif(x.suprimento, 0), 1), '') +
        isnull(char(13) + '» Sangria   : ' + convert(char(15), nullif(x.sangria, 0), 1), '') +
        isnull(char(13) + '» Repique   : ' + convert(char(15), nullif(x.repique, 0), 1), ''),
        ''
      )
    from 
    (
      select
        meio_id = f.meio_id,
        calculado = sum(isnull(valor_calculado, 0)),
        venda = sum(isnull(f.valor_venda,0)),
        credito_assinada = sum(isnull(f.credito_assinada, 0)),
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