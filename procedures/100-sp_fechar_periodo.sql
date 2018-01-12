if (object_id('sp_fechar_periodo') is not null)
  drop procedure sp_fechar_periodo
go
--------------------------------------------------------------------------------------------
create procedure sp_fechar_periodo(@data datetime, @funcionario int, @libera_checkout bit)
as
begin
/*Try..catch incluido para interromper a execução 
  de outros comandos se algum apresentar falha*/
  begin try  

    begin transaction
    declare 
      @cmd varchar(max)    

   --Garantindo que nenhum turno sem movimento fique aberto
    update turno
    set dt_hr_fechamento = getdate()
    where dt_hr_fechamento is null

    update venda
    set dt_contabil = @data

    update venda_item
    set dt_contabil = @data

    update operacao
    set dt_contabil = @data
  
    truncate table cache.numero_chamada

   /*Montando lista de IDs para operacao e venda*/

   /*VENDA*/
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
    if object_id('tempdb.dbo.#opers_orig') is not null
      exec ('drop table #opers_orig')

    select id = operacao_origem_id
    into #opers_orig
    from venda
    where venda_id in (select id from #vendas)

    /*OPERACAO*/
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

    /*movimento_caixa*/
    set @cmd = dbo.fn_insert_para_fechamento('movimento_caixa', 'o')
    exec(@cmd + '
where o.operacao_id in (select id from #opers)'
    )

    --atribuindo o cliente do ticket à venda antes de desligar o ticket da venda
    update venda
    set cliente_id =
    (
      select t.cliente_id
      from ticket t
      where (t.modo_venda_id = 2)
        and (t.venda_id = venda.venda_id)
    )
    where (modo_venda_id = 2)

    /*operacao
    Copia todas as operações que não são de venda ou que já foram finalizadas ou canceladas*/
    set @cmd = dbo.fn_insert_para_fechamento('operacao', 'o')
    exec(@cmd + '
where o.operacao_id in (select id from #opers)'
    )

    /*operacao_venda
    copia todas as operações de venda do dia que já foram finalizadas ou canceladas*/
    set @cmd = dbo.fn_insert_para_fechamento('operacao_venda', 'o')
    exec(@cmd + '
where o.operacao_id in (select id from #opers)'
    )

    --limpa as operacões de origem dos tickets agrupados
    exec sp_apagar_operacao_origem --revisar se está apagando somente das operações recebidas!

    /*venda
    copia todos as vendas recebidas ou canceladas*/
    set @cmd = dbo.fn_insert_para_fechamento('venda', '')
    exec(@cmd + '
where venda_id in (select id from #vendas)'
    )

    /*venda_item*/
    set @cmd = dbo.fn_insert_para_fechamento('venda_item', '')
    exec(@cmd + '
where venda_id in (select id from #vendas)'
    )

   /*HistoricoDaOperacao*/
    set @cmd = dbo.fn_insert_para_fechamento('historico_operacao', 'h')
    exec(@cmd+ '
where h.operacao_id in (select id from #opers)'
    )

    /*LIMPANDO AS TABELAS DIÁRIAS*/

    /*TICKET
    apaga os ticket de entrega*/
    delete from ticket
    where modo_venda_id = 2
      and estado in ('livre','finalizado','cancelado')

    --voltando o estado para livre dos tickets que não foram reaproveitados ou utilizados
    update ticket
    set
      estado = case when estado <> 'checkout' or @libera_checkout = 1 then 'livre' else estado end,
      perfil_id = null,
      venda_id = null,
      cliente_id = null,
      dt_hr_abertura = null,
      limite_consumo = null
    where estado in ('finalizado', 'aberto', 'livre', 'checkout','cancelado')

    --atribuindo apelido_origem para apelido das fichas
    update ticket
    set apelido = apelido_origem
    where modo_venda_id in (3, 4)
      and estado = 'livre'

    /*Historico*/
	  delete from dbo.historico_operacao
    where operacao_id in (select id from #opers union select id from #opers_orig)

    /*venda_item*/
    delete from venda_item
    where venda_id in (select id from #vendas)

    /*venda*/
    delete from venda
    where venda_id in (select id from #vendas)

    /*operacao_venda*/
    delete from operacao_venda
    where operacao_id in (select id from #opers union select id from #opers_orig)

    /*OPERACAO*/
    delete from operacao
    where operacao_id in (select id from #opers union select id from #opers_orig)

    /*movimento_caixa*/
    delete from movimento_caixa
    where operacao_id in (select id from #opers union select id from #opers_orig)

    /*cache.slot_rodizio*/
    delete from cache.slot_rodizio
    where venda_id not in (select venda_id from venda with(nolock))

   /********************************************************************
                                FINALIZANDO
   *********************************************************************/

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
      update ticket 
      set venda_id = null

      delete movimento_caixa
      delete venda_item
      delete venda
      delete operacao_venda
      delete operacao
    end
    
    /* atualiza o periodo */
    update periodo
    set
      dt_hr_fechamento = getdate(),
      func_fechou_id = @funcionario
    where dt_contabil = @data

    delete cache.data_contabil

    /*Limpa e reinicia o contador identity*/
    truncate table cache.numero_chamada_seq

	  /*Reinicia contador do numero da venda*/
	  declare @num_venda int = (select isnull(max(numero_venda),0) from venda)
	  DBCC CheckIdent ('venda',reseed, @num_venda )

    /*Reinicia o sequencial dos tickets*/
    delete cache.proximo_ticket

    --apagando as tabelas temporárias
    drop table #vendas
    drop table #opers
    drop table #opers_orig

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
end
