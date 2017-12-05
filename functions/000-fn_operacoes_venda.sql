if (object_id('fn_operacoes_venda') is not null)
  drop function fn_operacoes_venda
go

create function fn_operacoes_venda
(
  @dtContabilIni date,  --inicio do periodo de consulta
  @dtContabilFim date,  --fim do periodo de consulta
  @modoVenda int = 0    --modo de venda
)
returns @tbl table
(
  operacao_id uniqueidentifier,
  dt_contabil date,
  periodo_aberto bit,
  modo_venda_id int,
  qtd_pessoas int,
  vl_total money,
  cancelada bit,
  encerrada bit,
  dt_hr_encerramento datetime,
  dt_encerramento date,
  hr_encerramento time,
  func_encerrou_id int,
  maquina_encerrou_id int
)
as
begin

  declare @tabelasDoDia bit = 0

  if exists (
    select *
    from periodo h
    where h.dt_hr_fechamento is null
      and h.dt_contabil <= @dtContabilFim
  ) set @tabelasDoDia = 1

  /*
  Só pesquisa as tabelas do dia se a data final for maior que o dia aberto.*/
  if (@tabelasDoDia = 1) begin
    with oper as
    (
      select
        o.operacao_id,
        o.dt_contabil,
        periodo_aberto = 1,
        ov.modo_venda_id,
        ov.qtd_pessoas,
        o.vl_total,
        o.cancelada,
        ov.encerrada,
        ov.dt_hr_encerramento,
        dt_encerramento = cast(ov.dt_hr_encerramento as date),
        hr_encerramento = cast(ov.dt_hr_encerramento as time),
        ov.func_encerrou_id,
        ov.maquina_encerrou_id
      from operacao o with(nolock)
      join operacao_venda ov with(nolock) on o.operacao_id = ov.operacao_id
      where (o.tipo = 'venda')
        and (@modoVenda = 0 or ov.modo_venda_id = @modoVenda)
        and o.operacao_id in
        (
          select operacao_id
          from venda h
        )
    )
    insert @tbl
    (
      operacao_id,
      dt_contabil,
      periodo_aberto,
      modo_venda_id,
      qtd_pessoas,
      vl_total,
      cancelada,
      encerrada,
      dt_hr_encerramento,
      dt_encerramento,
      hr_encerramento,
      func_encerrou_id,
      maquina_encerrou_id
    )
    select
      oper.operacao_id,
      oper.dt_contabil,
      oper.periodo_aberto,
      oper.modo_venda_id,
      oper.qtd_pessoas,
      oper.vl_total,
      oper.cancelada,
      oper.encerrada,
      oper.dt_hr_encerramento,
      oper.dt_encerramento,
      oper.hr_encerramento,
      oper.func_encerrou_id,
      oper.maquina_encerrou_id
    from oper
  end;

  with oper as
  (
    select
      o.operacao_id,
      o.dt_contabil,
      periodo_aberto = 0,
      ov.modo_venda_id,
      ov.qtd_pessoas,
      o.vl_total,
      o.cancelada,
      ov.encerrada,
      ov.dt_hr_encerramento,
      dt_encerramento = cast(ov.dt_hr_encerramento as date),
      hr_encerramento = cast(ov.dt_hr_encerramento as time),
      ov.func_encerrou_id,
      ov.maquina_encerrou_id
    from operacao_geral o with(nolock)
    join operacao_venda_geral ov with(nolock) on o.operacao_id = ov.operacao_id
    where (o.dt_contabil between @dtContabilIni and @dtContabilFim)
      and (o.tipo = 'venda')
      and (@modoVenda = 0 or ov.modo_venda_id = @modoVenda)
  )
  insert @tbl
  (
    operacao_id,
    dt_contabil,
    periodo_aberto,
    modo_venda_id,
    qtd_pessoas,
    vl_total,
    cancelada,
    encerrada,
    dt_hr_encerramento,
    dt_encerramento,
    hr_encerramento,
    func_encerrou_id,
    maquina_encerrou_id
  )
  select
    oper.operacao_id,
    oper.dt_contabil,
    oper.periodo_aberto,
    oper.modo_venda_id,
    oper.qtd_pessoas,
    oper.vl_total,
    oper.cancelada,
    oper.encerrada,
    oper.dt_hr_encerramento,
    oper.dt_encerramento,
    oper.hr_encerramento,
    oper.func_encerrou_id,
    oper.maquina_encerrou_id
  from oper

  return
end
