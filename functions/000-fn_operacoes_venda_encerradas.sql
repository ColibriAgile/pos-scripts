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
  Só pesquisa as tabelas do dia se a data final for maior que o dia aberto.
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
        consumidor = c.string_value,    
        o.comprovante,
        o.comprovante_chave,
        o.comprovante_status,
        o.comprovante_ressalva,
        o.dt_contabil,
        [status] = case
          when
            (isnull(o.comprovante_status, '') = '' and ov.transferida = 0) or 
            (o.comprovante_status = 'Emitido' and o.cancelada = 1 and isnull(o.comprovante_ressalva, '') = '') then 'Pendente'
          when
            (isnull(o.comprovante_ressalva, '') <> '') then 'Resolvido com ressalva'
          when
            (o.comprovante_status = 'Cancelado' and o.cancelada = 1) then 'Cancelada'
          else 'Ok'
        end,
        diaria = case when o.dt_contabil = @dtcontabil then 1 else 0 end,
        transferida
      from operacao_venda ov with(nolock)
      join operacao o with(nolock) on o.operacao_id = ov.operacao_id
      cross apply dbo.fn_parse_json(isnull(case when consumidor = '' then null else consumidor end,'{"cpf":""}')) c
      where ov.dt_hr_encerramento between @dtini and @dtfim
        and ov.encerrada = 1
        and c.name = 'cpf'
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
      consumidor = c.string_value,    
      o.comprovante,
      o.comprovante_chave,
      o.comprovante_status,
      o.comprovante_ressalva,
      o.dt_contabil,
      [status] = case
        when (isnull(o.comprovante_ressalva, '') <> '') then 'Resolvido com ressalva'
        when (o.cancelada = 1) then 'Cancelada'
        else 'Ok'
      end,
      diaria = case when o.dt_contabil = @dtcontabil then 1 else 0 end,
      transferida
    from operacao_venda_geral ov with(nolock)
    join operacao_geral o with(nolock) on o.operacao_id = ov.operacao_id
    cross apply dbo.fn_parse_json(isnull(consumidor,'{"cpf":""}')) c
    where ov.dt_hr_encerramento between @dtini and @dtfim
      and c.name = 'cpf'
    --and ov.encerrada = 1 (Na tabela geral todas as operações estão encerradas)
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
