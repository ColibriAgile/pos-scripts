if (object_id('fn_operacoes_venda_encerradas') is not null)
  drop function fn_operacoes_venda_encerradas
go

create function fn_operacoes_venda_encerradas
(
  @dt_ini date,        --inicio do periodo de consulta
  @dt_fim date,        --fim do periodo de consulta
  @hr_ini time = null, --hora inicial
  @hr_fim time = null  --hora final
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

  declare 
    @dt_contabil date = '20000101',
    @inclui_diaria bit = 0,
    @somente_diaria bit = 0

  /*
  Obtem a data do periodo aberto. Se o periodo 
  esta fechado, utiliza uma data no futuro para 
  nao consultar as tabelas do dia*/
  select @dt_contabil = isnull(valor, '20990101')
  from cache.data_contabil

  /*
  Verifica e ajusta hora inicial e final.
  A hora final deve ser ser hh:mm e no final 
  fica hh:mm:59.999 */
  if (@hr_ini is null) 
    set @hr_ini = '00:00'
  if (@hr_fim is null) 
    set @hr_fim = '23:59'
  set @hr_fim = dateadd(millisecond, 59999, @hr_fim)

  /* 
  Aumenta 1 dia na data final para garantir que pega 
  todas vendas mesmo considerando o horario */
  set @dt_fim = dateadd(day, 1, @dt_fim)

  /*
  Otimizacao para verificar se consulta 
  somente as tabelas do dia aberto */
  if (@dt_fim > @dt_contabil) 
    set @inclui_diaria = 1
  if (@dt_ini = @dt_contabil)
    set @somente_diaria = 1

  /*
  So pesquisa as tabelas do dia se a data final for maior que o dia aberto.
  Ainda preciso do filtro pq pode ter varios encerramentos com datas diferentes
  para a mesma data contabil */
  if (@inclui_diaria = 1) begin
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
      ov.operacao_id,
      ov.dt_hr_encerramento,
      ov.dt_encerramento,
      ov.hr_encerramento,
      ov.modo_venda_id,
      ov.func_encerrou_id,
      ov.maquina_encerrou_id,
      o.vl_total,
      o.cancelada,
      o.dt_contabil,
      consumidor = c.consumidor,    
      comprovante = c.numero,
      comprovante_chave = c.chave,
      comprovante_status = c.[status],
      comprovante_ressalva = c.ressalva,
      [status] = case
        /*
        Se tem texto de ressalva foi resolvido com ressalva*/
        when (isnull(c.ressalva, '') <> '') then 'Resolvido com ressalva'
        /*
        Se operacao foi cancelada tem que verificar se o comprovante tb o foi */
        when (o.cancelada = 1 and c.[status] = 'Cancelado') 
	        or (o.cancelada = 1 and isnull(c.[status], '') = '' and o.vl_total = 0) then 'Cancelada'
        /*
        Comprovante emitido ou venda transferida ou recebida com valor 0, consideramos OK */
        when (c.[status] = 'Emitido' and o.cancelada = 0) 
          or (ov.transferida = 1) 
	        or (o.vl_total = 0) then 'Ok'
        /*
        Nenhuma das situacoes anteriores, entao tem alguma pendencia */
        else 'Pendente'
      end,
      diaria = 1,
      transferida
    from operacao_venda ov with(nolock)
    join operacao o with(nolock) on o.operacao_id = ov.operacao_id
    left join comprovante c with(nolock) on c.operacao_id = o.operacao_id
    where ov.dt_hr_encerramento between @dt_ini and @dt_fim --usar este campo devido ao indice
      and ov.hr_encerramento between @hr_ini and @hr_fim
      and ov.encerrada = 1         
  end;

  /*
  OTIMIZACAO: So roda esta consulta se o periodo 
  informado abrange data anterior ao periodo aberto */
  if (@somente_diaria = 0) begin
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
      ov.operacao_id,
      ov.dt_hr_encerramento,
      ov.dt_encerramento,
      ov.hr_encerramento,
      ov.modo_venda_id,
      ov.func_encerrou_id,
      ov.maquina_encerrou_id,
      o.vl_total,
      o.cancelada,
      o.dt_contabil,      
      consumidor = c.consumidor,    
      comprovante = c.numero,
      comprovante_chave = c.chave,
      comprovante_status = c.[status],
      comprovante_ressalva = c.ressalva,
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
    where ov.dt_hr_encerramento between @dt_ini and @dt_fim --usar este campo devido ao indice
      and ov.hr_encerramento between @hr_ini and @hr_fim
    --and ov.encerrada = 1 (Na tabela geral todas as operacoes estao encerradas)
  end;

  return
end
