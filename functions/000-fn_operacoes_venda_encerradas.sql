if (object_id('fn_operacoes_venda_encerradas') is not null)
  drop function fn_operacoes_venda_encerradas
go

create function fn_operacoes_venda_encerradas
(
  @dtini date,        --inicio do periodo de consulta
  @dtfim date,        --fim do periodo de consulta
  @hrini time = null, --hora inicial
  @hrfim time = null  --hora final
)
returns @tbl table
(
  operacao_id uniqueidentifier,
  dt_hr_encerramento datetime,
  dt_encerramento date,
  hr_encerramento time,
  modo_venda_id int,
  func_encerrou_id int,
  maquina_encerrou_id int,
  vl_total money,
  cancelada bit,
  dt_contabil date,
  consumidor varchar(600),
  comprovante varchar(20),
  comprovante_chave varchar(150),
  comprovante_status varchar(50),
  comprovante_ressalva varchar(250),
  [status] varchar(25),
  diaria bit,
  transferida bit
)
as
begin

  declare @dtcontabil date
  if (@hrini is null) set @hrini = '00:00:00.000'
  if (@hrfim is null) set @hrfim = '23:59:59.999'

  set @dtfim = dateadd(day, 1, @dtfim)

  select top 1 @dtcontabil=isnull(dt_contabil, '20000101')
  from periodo h with (nolock)
  order by h.dt_contabil desc


  /*
  S� pesquisa as tabelas do dia se a data final for maior que o dia aberto.
  Ainda preciso do filtro pq pode ter varios encerramentos com datas diferentes
  para a mesma data contabil */
  if (@dtfim > @dtcontabil) begin
    with cxa as
    (
      select
        ov.operacao_id,
        ov.dt_hr_encerramento,
        dt_encerramento = cast(ov.dt_hr_encerramento as date),
        hr_encerramento = cast(ov.dt_hr_encerramento as time),
        ov.modo_venda_id,
        ov.func_encerrou_id,
        ov.maquina_encerrou_id,
        o.vl_total,
        o.cancelada,
        consumidor = c.consumidor,    
        comprovante = c.numero,
        comprovante_chave = c.chave,
        comprovante_status = c.[status],
        comprovante_ressalva = c.ressalva,
        o.dt_contabil,
        [status] = case
          when (isnull(c.ressalva, '') <> '') then 'Resolvido com ressalva'
          when (c.[status] = 'Cancelado' and o.cancelada = 1) 
            or (isnull(c.[status], '') = '' and o.cancelada = 1 and o.vl_total = 0) then 'Cancelada'
          when (c.[status] = 'Emitido' and o.cancelada = 0) 
            or (ov.transferida = 1) or (o.vl_total = 0) then 'Ok'
          else 'Pendente'
        end,
        diaria = 1,
        transferida
      from operacao_venda ov with(nolock)
      join operacao o with(nolock) on o.operacao_id = ov.operacao_id
      left join comprovante c with(nolock) on c.operacao_id = o.operacao_id
      where ov.dt_hr_encerramento between @dtini and @dtfim
        and ov.encerrada = 1         
    )
    insert @tbl
    (
      operacao_id,
      dt_hr_encerramento,
      dt_encerramento,
      hr_encerramento,
      modo_venda_id,
      func_encerrou_id,
      maquina_encerrou_id,
      vl_total,
      cancelada,
      dt_contabil,
      consumidor,
      comprovante,
      comprovante_chave,
      comprovante_status,
      comprovante_ressalva,
      [status],
      diaria,
      transferida
    )
    select
      cxa.operacao_id,
      cxa.dt_hr_encerramento,
      cxa.dt_encerramento,
      cxa.hr_encerramento,
      cxa.modo_venda_id,
      cxa.func_encerrou_id,
      cxa.maquina_encerrou_id,
      cxa.vl_total,
      cxa.cancelada,
      cxa.dt_contabil,
      cxa.consumidor,
      cxa.comprovante,
      cxa.comprovante_chave,
      cxa.comprovante_status,
      cxa.comprovante_ressalva,
      cxa.[status],
      cxa.diaria,
      cxa.transferida
    from cxa
    where cxa.hr_encerramento between @hrini and @hrfim
  end;

  with cxa as
  (
    select
      ov.operacao_id,
      ov.dt_hr_encerramento,
      dt_encerramento = cast(ov.dt_hr_encerramento as date),
      hr_encerramento = cast(ov.dt_hr_encerramento as time),
      ov.modo_venda_id,
      ov.func_encerrou_id,
      ov.maquina_encerrou_id,
      o.vl_total,
      o.cancelada,
      consumidor = c.consumidor,    
      comprovante = c.numero,
      comprovante_chave = c.chave,
      comprovante_status = c.[status],
      comprovante_ressalva = c.ressalva,
      o.dt_contabil,      
      [status] = case
        when (isnull(c.ressalva, '') <> '') then 'Resolvido com ressalva'
        when (o.cancelada = 1) then 'Cancelada'
        else 'Ok'
      end,
      diaria = 0,
      transferida
    from operacao_venda_geral ov with(nolock)
    join operacao_geral o with(nolock) on o.operacao_id = ov.operacao_id
    left join comprovante_geral c with(nolock) on c.operacao_id = o.operacao_id
    where ov.dt_hr_encerramento between @dtini and @dtfim
    --and ov.encerrada = 1 (Na tabela geral todas as opera��es est�o encerradas)
  )
  insert @tbl
  (
    operacao_id,
    dt_hr_encerramento,
    dt_encerramento,
    hr_encerramento,
    modo_venda_id,
    func_encerrou_id,
    maquina_encerrou_id,
    vl_total,
    cancelada,
    dt_contabil,
    consumidor,
    comprovante,
    comprovante_chave,
    comprovante_status,
    comprovante_ressalva,
    [status],
    diaria,
    transferida
  )
  select
    cxa.operacao_id,
    cxa.dt_hr_encerramento,
    cxa.dt_encerramento,
    cxa.hr_encerramento,
    cxa.modo_venda_id,
    cxa.func_encerrou_id,
    cxa.maquina_encerrou_id,
    cxa.vl_total,
    cxa.cancelada,
    cxa.dt_contabil,
    cxa.consumidor,
    cxa.comprovante,
    cxa.comprovante_chave,
    cxa.comprovante_status,
    cxa.comprovante_ressalva,
    cxa.[status],
    cxa.diaria,
    cxa.transferida
  from cxa
  where cxa.hr_encerramento between @hrini and @hrfim

  return
end
