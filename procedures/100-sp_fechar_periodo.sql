if (object_id('sp_fechar_periodo') is not null)
  drop procedure sp_fechar_periodo
go
--------------------------------------------------------------------------------------------
create procedure sp_fechar_periodo(@data datetime, @funcionario int, @libera_checkout bit, @debug bit = 0)
as
begin
/*Try..catch incluido para interromper a execu��o 
  de outros comandos se algum apresentar falha*/
  begin try  

    --SET NOCOUNT ON 
    begin transaction
    declare 
      @cmd varchar(max)    

/*-------------------------------------------------------
  Inicializa��es
  -------------------------------------------------------*/
    print 'Garante que nenhum turno sem movimento fique aberto'
    update dbo.turno
    set dt_hr_fechamento = getdate()
    where dt_hr_fechamento is null

    print 'Garante que todas a vendas tenham data contabil'
    update dbo.venda
    set dt_contabil = @data

    update dbo.venda_item
    set dt_contabil = @data

    update dbo.operacao
    set dt_contabil = @data
  
    print 'Reinicia o numero de chamada'
    truncate table cache.numero_chamada

/*-------------------------------------------------------
  Tabelas auxiliares. N�o d� para usar 'table' devido
  ao comandos exec('') que n�o detectam as variaveis.
  -------------------------------------------------------*/
    print 'Apaga as tabelas auxiliares'

    if object_id('tempdb.dbo.#vendas') is not null
      exec ('drop table #vendas')

    if object_id('tempdb.dbo.#opers') is not null
      exec ('drop table #opers')

    if object_id('tempdb.dbo.#opers_orig') is not null
      exec ('drop table #opers_orig')

/*-------------------------------------------------------
  Montando lista de IDs para operacao e venda
  -------------------------------------------------------*/

    print 'Garante que todas as operacoes canceladas estao com as vendas encerradas'
    update dbo.operacao_venda
    set encerrada = 1
    from dbo.operacao o 
    where o.cancelada = 1
      and o.operacao_id = operacao_venda.operacao_id

    print 'Coleta todas as vendas validas cuja operacao foi encerrada'
    print 'Vendas sem operacao sao descartadas aqui'
    print 'Operacoes sem venda sao descartadas aqui'
    select 
      h.operacao_id,
      h.operacao_origem_id,
      h.venda_id
    into #vendas
    from dbo.operacao_venda o 
    join dbo.venda h on o.operacao_id = h.operacao_id 
    where o.encerrada = 1

    print 'Coleta os IDs das operacoes de origem'
    select operacao_id = v.operacao_origem_id
    into #opers_orig
    from #vendas v
    where v.operacao_origem_id is not null

    print 'Coleta os IDs das operacoes de venda recebidas ou canceladas'
    select operacao_id = v.operacao_id
    into #opers
    from #vendas v

    print 'Coleta os IDs de operacoes que n�o s�o de venda'
    insert #opers
    select operacao_id
    from dbo.operacao
    where tipo <> 'Venda'

/*------------------------------------------
 INICIO DO FECHAMENTO
 -------------------------------------------*/

    print 'Atribui o cliente do ticket � venda antes de desvincular o ticket da venda'
    update dbo.venda
    set cliente_id = t.cliente_id
    from dbo.ticket t
    where venda.modo_venda_id = 2
      and venda.venda_id = t.venda_id

    print 'Copia as opera��es de venda encerradas e outras operacoes'
    set @cmd = dbo.fn_insert_para_fechamento('operacao', 'o')
    exec(@cmd + '
where o.operacao_id in (select operacao_id from #opers)'
    )

    print 'Copia as opera��es de venda encerradas'
    set @cmd = dbo.fn_insert_para_fechamento('operacao_venda', 'o')
    exec(@cmd + '
where o.operacao_id in (select operacao_id from #opers)'
    )

    print 'Copia os movimentos de caixa das operacoes encerradas'
    set @cmd = dbo.fn_insert_para_fechamento('movimento_caixa', 'o')
    exec(@cmd + '
where o.operacao_id in (select operacao_id from #opers)'
    )

    print 'Limpa as operac�es de origem dos tickets agrupados'
    exec dbo.sp_apagar_operacao_origem --revisar se est� apagando somente das opera��es recebidas!

    print 'Copia as vendas pagas ou canceladas'
    set @cmd = dbo.fn_insert_para_fechamento('venda', 'v')
    exec(@cmd + '
where v.venda_id in (select venda_id from #vendas)'
    )

    print 'Copia os itens das vendas pagas ou canceladas'
    set @cmd = dbo.fn_insert_para_fechamento('venda_item', 'v')
    exec(@cmd + '
where v.venda_id in (select venda_id from #vendas)'
    )

    print 'Copia o historico das operacoes encerradas'
    set @cmd = dbo.fn_insert_para_fechamento('historico_operacao', 'h')
    exec(@cmd+ '
where h.operacao_id in (select operacao_id from #opers)'
    )

    print 'Copia os comprovantes das operacoes encerradas'
    set @cmd = dbo.fn_insert_para_fechamento('comprovante', 'c')
    exec(@cmd + '
where c.operacao_id in (select operacao_id from #opers)'
    )

/*------------------------------------------
 Ajustando os dados dos tickets
 -------------------------------------------*/

    print 'Apaga os tickets de entrega'
    delete from dbo.ticket
    where modo_venda_id = 2
      and estado in ('livre','finalizado','cancelado')

    print 'Volta para "livre" os tickets que n�o foram reaproveitados ou utilizados'
    update dbo.ticket
    set
      estado = case 
        when estado <> 'checkout' or @libera_checkout = 1 then 'livre' 
        else estado 
      end,
      perfil_id = null,
      venda_id = null,
      cliente_id = null,
      dt_hr_abertura = null,
      limite_consumo = null,
      saiu = null
    where estado in ('finalizado', 'aberto', 'livre', 'checkout', 'cancelado')

    print 'Devolve apelido_origem para apelido da ficha/mesa'
    update dbo.ticket
    set apelido = apelido_origem
    where modo_venda_id in (3, 4)
      and estado = 'livre'

/*------------------------------------------
 LIMPANDO AS TABELAS DI�RIAS
 -------------------------------------------*/

    print 'Apaga dbo.historico_operacao'
    delete dbo.historico_operacao
    where operacao_id in 
    (
      select operacao_id from #opers 
      union 
      select operacao_id from #opers_orig
    )

    print 'Apaga cache.slot_rodizio'
    delete cache.slot_rodizio
    where venda_id in (select venda_id from #vendas)

    print 'Apaga dbo.venda_item'
    delete dbo.venda_item
    where venda_id in (select venda_id from #vendas)

    print 'Apaga dbo.venda'
    delete dbo.venda
    where venda_id in (select venda_id from #vendas)

    print 'Apaga dbo.comprovante'
    delete dbo.comprovante
    where operacao_id in 
    (
      select operacao_id from #opers 
      union 
      select operacao_id from #opers_orig
    )

    print 'Apaga dbo.movimento_caixa'
    delete dbo.movimento_caixa
    where operacao_id in
    (
      select operacao_id from #opers 
      union 
      select operacao_id from #opers_orig
    )

    print 'Apaga dbo.operacao_venda'
    delete dbo.operacao_venda
    where operacao_id in
    (
      select operacao_id from #opers 
      union 
      select operacao_id from #opers_orig
    )

    print 'Apaga dbo.operacao'
    delete dbo.operacao
    where operacao_id in
    (
      select operacao_id from #opers 
      union 
      select operacao_id from #opers_orig
    )

/*------------------------------------------
 Finalizando
 -------------------------------------------*/

    print 'Se nao transfere movimento, apaga qq dado que restou nas tabelas do dia'
    declare 
      @transferediaseguinte bit
    
    select 
      @transferediaseguinte = case valor 
        when '0' then 0 
        else 1 
      end
    from dbo.parametro 
    where codigo = 'CfgTransfereMovimentoPendente'

    if (@transferediaseguinte = 0) begin
      update dbo.ticket 
      set venda_id = null

      delete dbo.movimento_caixa
      delete dbo.venda_item
      delete dbo.venda
      delete dbo.comprovante
      delete dbo.operacao_venda
      delete dbo.operacao
    end
    
    print 'Grava data/hora de fechamento do periodo'
    update dbo.periodo
    set
      dt_hr_fechamento = getdate(),
      func_fechou_id = @funcionario
    where dt_contabil = @data

    if @debug = 1 print '  apagando cache.data_contabil'   
    delete cache.data_contabil

    print 'Reinicia contador do numero de chamada'
    truncate table cache.numero_chamada_seq

    print 'Reinicia contador do numero da venda'
    declare @num_venda int = (select isnull(max(numero_venda),0) from dbo.venda)
    dbcc checkident ('venda', reseed, @num_venda)

    print 'Reinicia o sequencial dos tickets'
    delete cache.proximo_ticket

    print 'Apagando as tabelas tempor�rias'
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
      @errmsg = 'Falha no fechamento do per�odo. ' + error_message(),
      @errseverity = error_severity()

    raiserror(@errmsg, @errseverity, 1)
  end catch

  SET NOCOUNT OFF 
end
