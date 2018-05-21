if (object_id('sp_fechar_periodo') is not null)
  drop procedure sp_fechar_periodo
go
--------------------------------------------------------------------------------------------
create procedure sp_fechar_periodo(@data datetime, @funcionario int, @libera_checkout bit, @debug bit = 0)
as
begin
/*Try..catch incluido para interromper a execução 
  de outros comandos se algum apresentar falha*/
  begin try  

    --SET NOCOUNT ON 
    begin transaction
    declare 
      @cmd varchar(max)    

    if @debug = 1 
      print '== FECHAMENTO DO PERIODO ' + cast(@data as varchar) + ' =='
    if @debug = 1 
      print '# Garantindo que nenhum turno sem movimento fique aberto'
    update turno
    set dt_hr_fechamento = getdate()
    where dt_hr_fechamento is null

    if @debug = 1 print '  venda' 
    update venda
    set dt_contabil = @data

    if @debug = 1 print '  venda_item' 
    update venda_item
    set dt_contabil = @data

    if @debug = 1 print '  operacao' 
    update operacao
    set dt_contabil = @data
  
    truncate table cache.numero_chamada

   if @debug = 1 
     print '# Montando lista de IDs para operacao e venda'
   
    if @debug = 1 print '  vendas' 
   --todas as vendas recebidas ou canceladas
    if object_id('tempdb.dbo.#vendas') is not null
      exec ('drop table #vendas')

    select
      id = h.venda_id,
      h.operacao_id
    into #vendas
    from operacao_venda o
    join venda h on h.operacao_id = o.operacao_id
    where o.encerrada = 1

    --operacoes de origem das vendas recebidas ou canceladas
    if @debug = 1 print '  operacoes origens' 
    if object_id('tempdb.dbo.#opers_orig') is not null
      exec ('drop table #opers_orig')

    select id = operacao_origem_id
    into #opers_orig
    from venda
    where venda_id in (select id from #vendas)

    if @debug = 1 print '  operacoes' 
    --monta a lista dos ids das operações que não são de venda, ou que foram recebidas ou canceladas
    if object_id('tempdb.dbo.#opers') is not null
      exec ('drop table #opers')

    select id = operacao_id
    into #opers
    from operacao
    where (tipo <> 'Venda')
       or operacao_id in (select operacao_id from #vendas)

    /********************************************************************************
                                 INICIO DO FECHAMENTO
     ********************************************************************************/
    if @debug = 1 print '# INICIO DO FECHAMENTO'   
    if @debug = 1 print '  movimentocaixa'   
    set @cmd = dbo.fn_insert_para_fechamento('movimento_caixa', 'o')
    exec(@cmd + '
where o.operacao_id in (select id from #opers)'
    )

    if @debug = 1 print '  atribuindo o cliente do ticket à venda antes de desligar o ticket da venda'   
    update venda
    set cliente_id =
    (
      select t.cliente_id
      from ticket t
      where (t.modo_venda_id = 2)
        and (t.venda_id = venda.venda_id)
    )
    where (modo_venda_id = 2)

    if @debug = 1 print '  operacao'
    set @cmd = dbo.fn_insert_para_fechamento('operacao', 'o')
    exec(@cmd + '
where o.operacao_id in (select id from #opers)'
    )

    if @debug = 1 print '  operacao_venda'
    set @cmd = dbo.fn_insert_para_fechamento('operacao_venda', 'o')
    exec(@cmd + '
where o.operacao_id in (select id from #opers)'
    )

    if @debug = 1 print '  limpando as operacões de origem dos tickets agrupados'
    exec sp_apagar_operacao_origem --revisar se está apagando somente das operações recebidas!

    if @debug = 1 print '  venda'
    set @cmd = dbo.fn_insert_para_fechamento('venda', '')
    exec(@cmd + '
where venda_id in (select id from #vendas)'
    )

    if @debug = 1 print '  venda_item'
    set @cmd = dbo.fn_insert_para_fechamento('venda_item', '')
    exec(@cmd + '
where venda_id in (select id from #vendas)'
    )

    if @debug = 1 print '  historico_operacao'
    set @cmd = dbo.fn_insert_para_fechamento('historico_operacao', 'h')
    exec(@cmd+ '
where h.operacao_id in (select id from #opers)'
    )

    if @debug = 1 print '  comprovante'
    set @cmd = dbo.fn_insert_para_fechamento('comprovante', 'c')
    exec(@cmd + '
where c.operacao_id in (select id from #opers)'
    )

    if @debug = 1 
      print '# LIMPANDO AS TABELAS DIÁRIAS'
    
    if @debug = 1 
      print '  apagando os ticket de entrega'
        
    delete from ticket
    where modo_venda_id = 2
      and estado in ('livre','finalizado','cancelado')

    if @debug = 1 
      print '  voltando o estado para livre dos tickets que não foram reaproveitados ou utilizados'

    update ticket
    set
      estado = case when estado <> 'checkout' or @libera_checkout = 1 then 'livre' else estado end,
      perfil_id = null,
      venda_id = null,
      cliente_id = null,
      dt_hr_abertura = null,
      limite_consumo = null,
      saiu = null
    where estado in ('finalizado', 'aberto', 'livre', 'checkout','cancelado')

    if @debug = 1 
      print '  atribuindo apelido_origem para apelido das fichas'

    update ticket
    set apelido = apelido_origem
    where modo_venda_id in (3, 4)
      and estado = 'livre'

    if @debug = 1 print '  historico_operacao'
   
	  delete from dbo.historico_operacao
    where operacao_id in (select id from #opers union select id from #opers_orig)

    if @debug = 1 print '  cache.slot_rodizio'
    delete from cache.slot_rodizio
    where venda_id in (select id from #vendas)

    if @debug = 1 print '  venda_item'
    delete from venda_item
    where venda_id in (select id from #vendas)

    if @debug = 1 print '  venda'
    delete from venda
    where venda_id in (select id from #vendas)

	  if @debug = 1 print '  comprovante'
    delete from comprovante
    where operacao_id in (select id from #opers union select id from #opers_orig)

    if @debug = 1 print '  operacao_venda'
    delete from operacao_venda
    where operacao_id in (select id from #opers union select id from #opers_orig)

    if @debug = 1 print '  operacao'
    delete from operacao
    where operacao_id in (select id from #opers union select id from #opers_orig)

    if @debug = 1 print '  movimento_caixa'
    delete from movimento_caixa
    where operacao_id in (select id from #opers union select id from #opers_orig)

   /********************************************************************
                                FINALIZANDO
   *********************************************************************/
   if @debug = 1 print '# FINALIZANDO'
    
    declare 
      @transferediaseguinte bit
    
    select 
      @transferediaseguinte = case valor 
        when '0' then 0 
        else 1 
      end
    from parametro 
    where codigo = 'CfgTransfereMovimentoPendente'

    if (@transferediaseguinte = 0) begin
      if @debug = 1 print '  CfgTransfereMovimentoPendente = 0'   
      if @debug = 1 print '  limpando venda_id da tabela ticket'   
      update ticket 
      set venda_id = null

      if @debug = 1 print '  apagando todos os registros das tabelas diarias'   
      delete movimento_caixa
      delete venda_item
      delete venda
      delete operacao_venda
      delete operacao
    end
    
    if @debug = 1 print '  atualizando periodo'   
    update periodo
    set
      dt_hr_fechamento = getdate(),
      func_fechou_id = @funcionario
    where dt_contabil = @data

    if @debug = 1 print '  apagando cache.data_contabil'   
    delete cache.data_contabil

    if @debug = 1 print '  apagando cache.numero_chamada_seq'   
    truncate table cache.numero_chamada_seq

	  if @debug = 1 print '  reiniciando o contador do numero de venda'   
    declare @num_venda int = (select isnull(max(numero_venda),0) from venda)
	  DBCC CheckIdent ('venda',reseed, @num_venda )

    if @debug = 1 print '  reiniciando o sequencial dos tickets'
    delete cache.proximo_ticket

    if @debug = 1 print '  apagando as tabelas temporárias'
    drop table #vendas
    drop table #opers
    drop table #opers_orig

    if @debug = 1 print '== FIM =='
    commit
  end try

  begin catch
    if @@trancount > 0 rollback

    declare
      @errmsg nvarchar(4000),
      @errseverity int

    select
      @errmsg = 'Falha no fechamento do período. ' + error_message(),
      @errseverity = error_severity()

    raiserror(@errmsg, @errseverity, 1)
  end catch

  SET NOCOUNT OFF 
end
