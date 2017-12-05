if object_id('fn_extrato_conta_assinada') is not null
  drop function fn_extrato_conta_assinada
go
create function fn_extrato_conta_assinada (@clienteID uniqueidentifier, @dtIni datetime = null, @dtFim datetime = null, @mostracancelados bit = 0)
returns @tbl table
(
  pendura_seq bigint,
  pendura_id uniqueidentifier,
  operacao_id uniqueidentifier,
  movimento_id integer,
  cliente_id uniqueidentifier,
  dt_hr_pendura datetime,
  dt_contabil date,
  vl_total money,
  saldo money,
  saldo_ini money,
  saldo_fim money,
  obs varchar(200),
  cancelado bit
)
begin
/*Coleta dados na tabela temporária. Os campos saldo, saldo_ini e
  saldo_fim serão calculos e atualizados nos comandos abaixo.*/
  insert @tbl
  (
    pendura_seq,
    pendura_id,
    operacao_id,
    movimento_id,
    cliente_id,
    dt_hr_pendura,
    dt_contabil,
    vl_total,
    saldo,
    saldo_ini,
    saldo_fim,
    obs,
    cancelado
  )
  select
    pendura_seq = row_number() over (order by dt_hr_pendura, ordem),
    pendura_id,
    operacao_id,
    movimento_id,
    cliente_id,
    dt_hr_pendura,
    dt_contabil,
    vl_total,
    saldo,
    saldo_ini = 0,
    saldo_fim = 0,
    obs,
    cancelado
  from pendura
  where cliente_id = @clienteid
    and ((@mostracancelados = 1) or (cancelado <> 1))
  order by
    pendura_seq


/*Ajusta as datas do periodo para garantir o retorno correto das informações.*/
  if (@dtini is null) set @dtini = '19010101'
  if (@dtfim is null) set @dtfim = '21000101'
  else set @dtfim = round(cast(@dtfim as float), 0, 1) + 1

/*Atualiza o saldo inicial e final*/
  declare
    @saldoini money,
    @saldofim money

  select
    @saldoini = IsNull
    (
      (
        select top 1 saldo
        from @tbl
        where dt_hr_pendura < @dtini
          and cancelado <> 1
        order by
          dt_hr_pendura desc,
          pendura_seq desc
      ), 0
    ),
    @saldofim = isnull
    (
      (
        select top 1 saldo
        from @tbl
        where dt_hr_pendura < @dtfim
          and cancelado <> 1
        order by
          dt_hr_pendura desc,
          pendura_seq desc
      ), 0
    )

  update @tbl
  set
    saldo_ini = @saldoini,
    saldo_fim = @saldofim

  delete @tbl
  where (dt_hr_pendura < @dtini) or (dt_hr_pendura >= @dtfim)

  if not exists(select * from @tbl) begin
    insert @tbl
    (
      pendura_seq,
      pendura_id,
      operacao_id,
      cliente_id,
      dt_hr_pendura,
      dt_contabil,
      vl_total,
      saldo,
      saldo_ini,
      saldo_fim,
      obs,
      cancelado
    )
    select
      pendura_seq = 0,
      pendura_id = null,
      operacao_id = null,
      client_id = @clienteID,
      dt_hr_pendura = getdate(),
      dt_contabil = null,
      vl_total = 0,
      saldo = @saldofim,
      saldo_ini = @saldofim,
      saldo_fim = @saldofim,
      obs = '(sem movimento no período selecionado)',
      cancelado = 0
  end

  return
end
GO
