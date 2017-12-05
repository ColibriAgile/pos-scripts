/*
  **** Procedures ****
*/
/* sp_apagar_checks */
if dbo.fn_existe('dbo.sp_apagar_checks') = 1
  exec sp_apagar 'procedure', 'dbo.sp_apagarchecks'
else
  exec sp_renomear 'dbo.sp_apagarchecks', 'sp_apagar_checks'
go

/* sp_apagar_defaults */
if dbo.fn_existe('dbo.sp_apagar_defaults') = 1
  exec sp_apagar 'procedure', 'dbo.sp_apagardefaults'
else
  exec sp_renomear 'dbo.sp_apagardefaults', 'sp_apagar_defaults'
go

/* sp_apagar_relacionamentos */
if dbo.fn_existe('dbo.sp_apagar_relacionamentos') = 1
  exec sp_apagar 'procedure', 'dbo.sp_apagarrelacionamentos'
else
  exec sp_renomear 'dbo.sp_apagarrelacionamentos', 'sp_apagar_relacionamentos'
go

/* sp_apagar_tabela */
if dbo.fn_existe('dbo.sp_apagar_tabela') = 1
  exec sp_apagar 'procedure', 'dbo.sp_apagartabela'
else
  exec sp_renomear 'dbo.sp_apagartabela', 'sp_apagar_tabela'
go

/* sp_apagar_indice */
if dbo.fn_existe('dbo.sp_apagar_indice') = 1
  exec sp_apagar 'procedure', 'dbo.sp_apagarindice'
else
  exec sp_renomear 'dbo.sp_apagarindice', 'sp_apagar_indice'
go

/* sp_apagar_campo */
if dbo.fn_existe('dbo.sp_apagar_campo') = 1
  exec sp_apagar 'procedure', 'dbo.sp_apagarcampo'
else
  exec sp_renomear 'dbo.sp_apagarcampo', 'sp_apagar_campo'
go

/* sp_apagar_campos */
if dbo.fn_existe('dbo.sp_apagar_campos') = 1
  exec sp_apagar 'procedure', 'dbo.sp_apagarcampos'
else
  exec sp_renomear 'dbo.sp_apagarcampos', 'sp_apagar_campos'
go

/* sp_adicionar_descricao */
if dbo.fn_existe('dbo.sp_adicionar_descricao') = 1
  exec sp_apagar 'procedure', 'dbo.sp_adicionardescricao'
else
  exec sp_renomear 'dbo.sp_adicionardescricao', 'sp_adicionar_descricao'
go

/* sp_descricao_campo */
if dbo.fn_existe('dbo.sp_descricao_campo') = 1
  exec sp_apagar 'procedure', 'dbo.sp_descricaocampo'
else
  exec sp_renomear 'dbo.sp_descricaocampo', 'sp_descricao_campo'
go

/* sp_descricao_tabela */
if dbo.fn_existe('dbo.sp_descricao_tabela') = 1
  exec sp_apagar 'procedure', 'dbo.sp_descricaotabela'
else
  exec sp_renomear 'dbo.sp_descricaotabela', 'sp_descricao_tabela'
go

/* sp_gerar_descricao */
if dbo.fn_existe('dbo.sp_gerar_descricao') = 1
  exec sp_apagar 'procedure', 'dbo.sp_gerardescricao'
else
  exec sp_renomear 'dbo.sp_gerardescricao', 'sp_gerar_descricao'
go

/* sp_padronizar_defaults */
if dbo.fn_existe('dbo.sp_padronizar_defaults') = 1
  exec sp_apagar 'procedure', 'dbo.sp_padronizardefaults'
else
  exec sp_renomear 'dbo.sp_padronizardefaults', 'sp_padronizar_defaults'
go

/* sp_obterproxima_ficha */
if dbo.fn_existe('dbo.sp_obter_proxima_ficha') = 1
  exec sp_apagar 'procedure', 'dbo.sp_obterproximaFicha'
else
  exec sp_renomear 'dbo.sp_obterproximaFicha', 'sp_obter_proxima_ficha'
go

/* sp_ajustar_saldo_cliente */
if dbo.fn_existe('dbo.sp_ajustar_saldo_cliente') = 1
  exec sp_apagar 'procedure', 'dbo.sp_ajustasaldocliente'
else
  exec sp_renomear 'dbo.sp_ajustasaldocliente', 'sp_ajustar_saldo_cliente'
go

/* sp_atualizar_periferico */
if dbo.fn_existe('dbo.sp_atualizar_periferico') = 1
  exec sp_apagar 'procedure', 'dbo.sp_atualizarperiferico'
else
  exec sp_renomear 'dbo.sp_atualizarperiferico', 'sp_atualizar_periferico'
go

/* sp_copiar_permissao */
if dbo.fn_existe('dbo.sp_copiar_permissao') = 1
  exec sp_apagar 'procedure', 'dbo.sp_copypermissao'
else
  exec sp_renomear 'dbo.sp_copypermissao', 'sp_copiar_permissao'
go

/* sp_abrir_periodo */
if dbo.fn_existe('dbo.sp_abrir_periodo') = 1
  exec sp_apagar 'procedure', 'dbo.sp_abrirperiodo'
else
  exec sp_renomear 'dbo.sp_abrirperiodo', 'sp_abrir_periodo'
go

/* sp_fechar_periodo */
if dbo.fn_existe('dbo.sp_fechar_periodo') = 1
  exec sp_apagar 'procedure', 'dbo.sp_fecharperiodo'
else
  exec sp_renomear 'dbo.sp_fecharperiodo', 'sp_fechar_periodo'
go

/* sp_posicao_caixa */
if dbo.fn_existe('dbo.sp_posicao_caixa') = 1
  exec sp_apagar 'procedure', 'dbo.sp_posicaocaixa'
else
  exec sp_renomear 'dbo.sp_posicaocaixa', 'sp_posicao_caixa'
go

/* sp_add_permissao */
if dbo.fn_existe('dbo.sp_add_permissao') = 1
  exec sp_apagar 'procedure', 'dbo.sp_addpermissao'
else
  exec sp_renomear 'dbo.sp_addpermissao', 'sp_add_permissao'
go

/* sp_ajustar_dispositivos */
if dbo.fn_existe('dbo.sp_ajustar_dispositivos') = 1
  exec sp_apagar 'procedure', 'dbo.sp_ajustadispositivos'
else
  exec sp_renomear 'dbo.sp_ajustadispositivos', 'sp_ajustar_dispositivos'
go

/* sp_mapa_ticket */
if dbo.fn_existe('dbo.sp_mapa_ticket') = 1
  exec sp_apagar 'procedure', 'dbo.sp_mapadeticket'
else
  exec sp_renomear 'dbo.sp_mapadeticket', 'sp_mapa_ticket'
go

/* sp_trocar_ficha */
if dbo.fn_existe('dbo.sp_trocar_ficha') = 1
  exec sp_apagar 'procedure', 'dbo.sp_trocarficha'
else
  exec sp_renomear 'dbo.sp_trocarficha', 'sp_trocar_ficha'
go

/* sp_inserir_botao_touch */
if dbo.fn_existe('dbo.sp_inserir_botao_touch') = 1
  exec sp_apagar 'procedure', 'dbo.sp_inserirbotaotouch'
else
  exec sp_renomear 'dbo.sp_inserirbotaotouch', 'sp_inserir_botao_touch'
go

/* sp_inserir_parametro */
if dbo.fn_existe('dbo.sp_inserir_parametro') = 1
  exec sp_apagar 'procedure', 'dbo.sp_inserirparametro'
else
  exec sp_renomear 'dbo.sp_inserirparametro', 'sp_inserir_parametro'
go


/*
  **** Funções ****
*/

/* fn_columns_compare */
if dbo.fn_existe('dbo.fn_columns_compare') = 1
  exec sp_apagar 'function', 'fn_columnsCompare'
else
  exec sp_renomear 'dbo.fn_columnsCompare', 'fn_columns_compare'
go

/* fn_consumos_operacao */
if dbo.fn_existe('dbo.fn_consumos_operacao') = 1
  exec sp_apagar 'function', 'fn_consumosDaOperacao'
else
  exec sp_renomear 'dbo.fn_consumosDaOperacao', 'fn_consumos_operacao'
go

/* fn_datas_recebimento */
if dbo.fn_existe('dbo.fn_datas_recebimento') = 1
  exec sp_apagar 'function', 'fn_datasderecebimento'
else
  exec sp_renomear 'dbo.fn_datasderecebimento', 'fn_datas_recebimento'
go

/* fn_dia_semana */
if dbo.fn_existe('dbo.fn_dia_semana') = 1
  exec sp_apagar 'function', 'fn_diaDaSemana'
else
  exec sp_renomear 'dbo.fn_diaDaSemana', 'fn_dia_semana'
go

/* fn_extrato_conta_assinada */
if dbo.fn_existe('dbo.fn_extrato_conta_assinada') = 1
  exec sp_apagar 'function', 'fn_extratocontaassinada'
else
  exec sp_renomear 'dbo.fn_extratocontaassinada', 'fn_extrato_conta_assinada'
go

/* fn_list_columns */
if dbo.fn_existe('dbo.fn_listar_colunas') = 1
  exec sp_apagar 'function', 'fn_listColumns'
else
  exec sp_renomear 'dbo.fn_listColumns', 'fn_listar_colunas'
go

/* fn_nome_sequencia_venda */
if dbo.fn_existe('dbo.fn_nome_sequencia_venda') = 1
  exec sp_apagar 'function', 'fn_nomeSequenciaVenda'
else
  exec sp_renomear 'dbo.fn_nomeSequenciaVenda', 'fn_nome_sequencia_venda'
go

/* fn_operacoes_venda */
if dbo.fn_existe('dbo.fn_operacoes_venda') = 1
  exec sp_apagar 'function', 'fn_operacoesDeVenda'
else
  exec sp_renomear 'dbo.fn_operacoesDeVenda', 'fn_operacoes_venda'
go

/* fn_operacoes_venda_encerradas */
if dbo.fn_existe('dbo.fn_operacoes_venda_encerradas') = 1
  exec sp_apagar 'function', 'fn_operacoesDeVendaEncerradas'
else
  exec sp_renomear 'dbo.fn_operacoesDeVendaEncerradas', 'fn_operacoes_venda_encerradas'
go

/* fn_progressao_aritmetica */
if dbo.fn_existe('dbo.fn_progressao_aritmetica') = 1
  exec sp_apagar 'function', 'fn_progressaoaritmetica'
else
  exec sp_renomear 'dbo.fn_progressaoaritmetica', 'fn_progressao_aritmetica'
go

/* fn_saldo_conta_assinada */
if dbo.fn_existe('dbo.fn_saldo_conta_assinada') = 1
  exec sp_apagar 'function', 'fn_saldocontaassinada'
else
  exec sp_renomear 'dbo.fn_saldocontaassinada', 'fn_saldo_conta_assinada'
go

/* fn_sequencia_venda */
if dbo.fn_existe('dbo.fn_sequencia_venda') = 1
  exec sp_apagar 'function', 'fn_sequenciaVenda'
else
  exec sp_renomear 'dbo.fn_sequenciaVenda', 'fn_sequencia_venda'
go

/* fn_so_numero */
if dbo.fn_existe('dbo.fn_so_numero') = 1
  exec sp_apagar 'function', 'fn_sonumero'
else
  exec sp_renomear 'dbo.fn_sonumero', 'fn_so_numero'
go

/* fn_status_venda */
if dbo.fn_existe('dbo.fn_status_venda') = 1
  exec sp_apagar 'function', 'fn_statusVenda'
else
  exec sp_renomear 'dbo.fn_statusVenda', 'fn_status_venda'
go

/* fn_tickets_operacao */
if dbo.fn_existe('dbo.fn_tickets_operacao') = 1
  exec sp_apagar 'function', 'fn_ticketsDaOperacao'
else
  exec sp_renomear 'dbo.fn_ticketsDaOperacao', 'fn_tickets_operacao'
go

/* fn_tipo_venda */
if dbo.fn_existe('dbo.fn_tipo_venda') = 1
  exec sp_apagar 'function', 'fn_tipovenda'
else
  exec sp_renomear 'dbo.fn_tipovenda', 'fn_tipo_venda'
go

/* fn_ultimos_pedidos */
if dbo.fn_existe('dbo.fn_ultimos_pedidos') = 1
  exec sp_apagar 'function', 'fn_ultimospedidos'
else
  exec sp_renomear 'dbo.fn_ultimospedidos', 'fn_ultimos_pedidos'
go

/* fn_vendas_perfil */
if dbo.fn_existe('dbo.fn_vendas_perfil') = 1
  exec sp_apagar 'function', 'fn_vendasporperfil'
else
  exec sp_renomear 'dbo.fn_vendasporperfil', 'fn_vendas_perfil'
go

/* fn_insert_para_fechamento */
if dbo.fn_existe('dbo.fn_insert_para_fechamento') = 1
  exec sp_apagar 'function', 'fn_criarInsertParaFechamento'
else
  exec sp_renomear 'dbo.fn_criarInsertParaFechamento', 'fn_insert_para_fechamento'
go

/* fn_historico_operacao */
if dbo.fn_existe('dbo.fn_historico_operacao') = 1
  exec sp_apagar 'function', 'fn_historicoDaOperacao'
else
  exec sp_renomear 'dbo.fn_historicoDaOperacao', 'fn_historico_operacao'
go

/* fn_fechamento_caixa */
if dbo.fn_existe('dbo.fn_fechamento_caixa') = 1
  exec sp_apagar 'function', 'fn_fechamentodecaixa'
else
  exec sp_renomear 'dbo.fn_fechamentodecaixa', 'fn_fechamento_caixa'
go

/*
  **** Tabelas ****
*/

/* data_contabil */
exec sp_renomear 'cache.datacontabil', 'data_contabil'
go

/* atendente_praca */
exec sp_renomear 'dbo.atendentexpraca', 'atendente_praca'
exec sp_renomear 'dbo.atendente_praca.funcionario_id', 'func_id', 'column'
go

/* balanca_material */
exec sp_renomear 'dbo.balancaxmaterial', 'balanca_material'
go

/* bloco_funcional */
exec sp_renomear 'dbo.blocofuncional', 'bloco_funcional'
go

/* turno */
exec sp_renomear 'dbo.caixaoperador', 'turno'
exec sp_renomear 'dbo.turno.funcionario_id', 'func_id', 'column'
exec sp_renomear 'dbo.turno.movcaixa_id', 'turno_id', 'column'
go

/* grupo_funcionario */
exec sp_renomear 'dbo.grupofuncionario', 'grupo_funcionario'
go

exec sp_renomear 'dbo.grupo_funcionario.grupofunc_id', 'grupo_id', 'column'
exec sp_renomear 'dbo.grupo_funcionario.nm_descricao', 'nome', 'column'
go

/* fechamento */
exec sp_renomear 'dbo.headerfechamento', 'periodo'
exec sp_renomear 'dbo.periodo.func_id_fechamento', 'func_fechou_id', 'column'
exec sp_renomear 'dbo.periodo.funcionario_id', 'func_abriu_id', 'column'
go

/* venda */
exec sp_renomear 'dbo.headervenda', 'venda'
go

if dbo.fn_existe('dbo.venda.ticket') = 1
  exec ('alter table dbo.venda drop column ticket')
go

if dbo.fn_existe('dbo.venda.bn_importado') = 1
  exec ('alter table dbo.venda drop column bn_importado')
go

exec sp_renomear 'dbo.venda.st_tipovenda',  'modo_venda_id', 'column'
exec sp_renomear 'dbo.venda.nu_fechamento',  'qtd_fechamentos', 'column'
exec sp_renomear 'dbo.venda.nu_chamada',  'numero_chamada', 'column'
exec sp_renomear 'dbo.venda.dt_ultimacons',  'dt_ultimo_consumo', 'column'
exec sp_renomear 'dbo.venda.codigoDoTicket',  'codigo_ticket', 'column'
exec sp_renomear 'dbo.venda.numero_da_venda',  'numero_venda', 'column'
exec sp_renomear 'dbo.venda.operacao_id_origem',  'operacao_origem_id', 'column'
exec sp_renomear 'dbo.venda.atendente_id',  'func_atendeu_id', 'column'
go

if dbo.fn_existe('dbo.venda.st_cancelado') = 1
begin
  exec sp_apagar_campo 'dbo.venda', 'cancelado'
  exec sp_apagar_campo 'dbo.venda', 'transferido'
end
go

if dbo.fn_existe('dbo.venda.st_cancelado') = 1
  exec sp_renomear 'dbo.venda.st_cancelado',  'codigo_situacao', 'column'
go

if dbo.fn_existe('dbo.venda.situacao') = 0
begin
  alter table dbo.venda
    add situacao as (case codigo_situacao
        when 'N' then 'normal'
        when 'E' then 'estornada'
        when 'C' then 'cancelada'
        when 'T' then 'transferida'
      else 'desconhecida'
      end)
  alter table dbo.venda
    add cancelado as (convert([bit], case [codigo_situacao] when 'N' then (0) else (1) end, (0)))
  alter table dbo.venda
    add transferido as (convert([bit], case [codigo_situacao] when 'T' then (1) else (0) end, 0))
end
go

alter table dbo.venda alter column modo_venda_id smallint not null
go

if dbo.fn_existe('dbo.venda.ticket') = 0
  alter table dbo.venda
    add ticket as (
      case [modo_venda_id]
        when 1 then 'balcão '
        when 2 then 'entrega '
        when 3 then 'mesa '
        when 4 then 'ficha ' else
      'ticket ' end + [codigo_ticket]
  )
go

/* venda_geral  */
exec sp_renomear 'dbo.headervendageral', 'venda_geral'
go

if dbo.fn_existe('dbo.venda_geral.ticket') = 1
  exec ('alter table dbo.venda_geral drop column ticket')
go

if dbo.fn_existe('dbo.venda_geral.bn_importado') = 1
  exec ('alter table dbo.venda_geral drop column bn_importado')
go

exec sp_renomear 'dbo.venda_geral.st_tipovenda',  'modo_venda_id', 'column'
exec sp_renomear 'dbo.venda_geral.nu_fechamento',  'qtd_fechamentos', 'column'
exec sp_renomear 'dbo.venda_geral.nu_chamada',  'numero_chamada', 'column'
exec sp_renomear 'dbo.venda_geral.dt_ultimacons',  'dt_ultimo_consumo', 'column'
exec sp_renomear 'dbo.venda_geral.codigoDoTicket',  'codigo_ticket', 'column'
exec sp_renomear 'dbo.venda_geral.numero_da_venda',  'numero_venda', 'column'
exec sp_renomear 'dbo.venda_geral.operacao_id_origem',  'operacao_origem_id', 'column'
exec sp_renomear 'dbo.venda_geral.atendente_id',  'func_atendeu_id', 'column'
go

if dbo.fn_existe('dbo.venda_geral.st_cancelado') = 1
begin
  exec sp_apagar_campo 'dbo.venda_geral', 'cancelado'
  exec sp_apagar_campo 'dbo.venda_geral', 'transferido'
end
go

if dbo.fn_existe('dbo.venda_geral.st_cancelado') = 1
  exec sp_renomear 'dbo.venda_geral.st_cancelado',  'codigo_situacao', 'column'
go

if dbo.fn_existe('dbo.venda_geral.situacao') = 0
begin
  alter table dbo.venda_geral
    add situacao as (case codigo_situacao
        when 'N' then 'normal'
        when 'E' then 'estornada'
        when 'C' then 'cancelada'
        when 'T' then 'transferida'
      else 'desconhecida'
      end)
  alter table dbo.venda_geral
    add cancelado as (convert([bit], case [codigo_situacao] when 'N' then (0) else (1) end, (0)))
  alter table dbo.venda_geral
    add transferido as (convert([bit], case [codigo_situacao] when 'T' then (1) else (0) end, 0))
end
go

alter table dbo.venda_geral alter column modo_venda_id smallint not null
go

if dbo.fn_existe('dbo.venda_geral.ticket') = 0
  alter table dbo.venda_geral
    add ticket as (
      case [modo_venda_id]
        when 1 then 'balcão '
        when 2 then 'entrega '
        when 3 then 'mesa '
        when 4 then 'ficha ' else
        'ticket ' end + [codigo_ticket]
    )
go
/* historico_cliente */
exec sp_renomear 'dbo.historicocliente', 'historico_cliente'
go

exec sp_renomear 'dbo.historico_cliente.hist_id', 'historico_id', 'column'
exec sp_renomear 'dbo.historico_cliente.nm_historico', 'historico', 'column'
exec sp_renomear 'dbo.historico_cliente.func_id', 'func_logado_id', 'column'
exec sp_renomear 'dbo.historico_cliente.dt_data', 'dt_hora', 'column'
go

/* historico_operacao */
exec sp_renomear 'dbo.historicooperacao', 'historico_operacao'
go

exec sp_renomear 'dbo.historico_operacao.dataHora',  'dt_hora', 'column'
exec sp_renomear 'dbo.historico_operacao.func_id',  'func_logado_id', 'column'
exec sp_renomear 'dbo.historico_operacao.func_id_autoriz',  'func_autorizou_id', 'column'
go

/* historico_operacao */
exec sp_renomear 'dbo.historicooperacaogeral', 'historico_operacao_geral'
go

exec sp_renomear 'dbo.historico_operacao_geral.dataHora',  'dt_hora', 'column'
exec sp_renomear 'dbo.historico_operacao_geral.func_id',  'func_logado_id', 'column'
exec sp_renomear 'dbo.historico_operacao_geral.func_id_autoriz',  'func_autorizou_id', 'column'
go

/* venda_item */
exec sp_renomear 'dbo.itemvenda', 'venda_item'
go
exec sp_renomear 'dbo.venda_item.st_tipovenda', 'modo_venda_id', 'column'
go
exec ('alter table dbo.venda_item alter column modo_venda_id smallint not null')
go
exec sp_renomear 'dbo.venda_item.pontovenda_id', 'ponto_venda_id', 'column'
exec sp_renomear 'dbo.venda_item.nu_praca', 'praca_id', 'column'
exec sp_renomear 'dbo.venda_item.func_cancela', 'func_cancelou_id', 'column'
exec sp_renomear 'dbo.venda_item.func_transfere', 'func_transferiu_id', 'column'
go
exec sp_renomear 'dbo.venda_item.func_lanca', 'func_lancou_id', 'column'
exec sp_renomear 'dbo.venda_item.vl_precooriginal', 'vl_preco_original', 'column'
go
exec sp_renomear 'dbo.venda_item.nu_motivocanc', 'motivo_cancelamento_id', 'column'
exec sp_renomear 'dbo.venda_item.bn_exportou', 'exportado', 'column'
exec sp_renomear 'dbo.venda_item.func_autorizou', 'func_autorizou_id', 'column'
exec sp_renomear 'dbo.venda_item.bn_baixaefetuada', 'baixa_efetuada', 'column'
exec sp_renomear 'dbo.venda_item.localDeEntrega', 'local_entrega', 'column'
exec sp_renomear 'dbo.venda_item.perfilimpressao_id', 'perfil_impressao_id', 'column'
exec sp_renomear 'dbo.venda_item.desconto_valor', 'vl_desconto', 'column'
exec sp_renomear 'dbo.venda_item.local_producao', 'local_producao_id', 'column'
exec sp_renomear 'dbo.venda_item.classe_rodizio', 'classe_rodizio_id', 'column'
exec sp_renomear 'dbo.venda_item.funcionario_id', 'func_logado_id', 'column'
go

if dbo.fn_existe('dbo.venda_item.st_cancelado') = 1
begin
  exec sp_apagar_campo 'dbo.venda_item', 'cancelado'
  exec sp_apagar_campo 'dbo.venda_item', 'valido'
  exec sp_apagar_campo 'dbo.venda_item', 'hr_lanc'
  exec sp_apagar_campo 'dbo.venda_item', 'vl_tot'
end
go

if dbo.fn_existe('dbo.venda_item.st_cancelado') = 1
  exec sp_renomear 'dbo.venda_item.st_cancelado', 'codigo_situacao', 'column'
go

if dbo.fn_existe('dbo.venda_item.situacao') = 0
begin
  alter table dbo.venda_item
    add situacao as (case codigo_situacao
        when 'N' then 'normal'
        when 'A' then 'cancelado antes da produção'
        when 'T' then 'transferido'
        when 'D' then 'cancelado depois da produção'
      else 'desconhecida'
      end
    )
  exec sp_renomear 'dbo.venda_item.dt_lanc', 'dt_lancamento', 'column'
  exec sp_renomear 'dbo.venda_item.nu_quantidade', 'qtd', 'column'
end
go

if (dbo.fn_existe('dbo.venda_item.situacao') = 1) and (dbo.fn_existe('dbo.venda_item.cancelado') = 0)
  alter table dbo.venda_item
    add cancelado as (convert([bit], case [codigo_situacao] when 'N' then (0) when 'T' then (0) else (1) end, 0))
go

if (dbo.fn_existe('dbo.venda_item.cancelado') = 1) and (dbo.fn_existe('dbo.venda_item.hr_lancamento') = 0)
begin
  alter table dbo.venda_item
    add hr_lancamento as (convert([time], [dt_lancamento], 0))
  alter table dbo.venda_item
    add valido as (convert([bit], case when [codigo_situacao] <> ('N') or [transferido] = (1) then (0) else (1) end, 0))
  alter table dbo.venda_item
    add vl_total as (convert([money], [qtd] * [vl_preco] + isnull([arredondamento], 0), (0)))
end
go

/* venda_item_geral */
exec sp_renomear 'dbo.itemvendageral', 'venda_item_geral'
go
exec sp_renomear 'dbo.venda_item_geral.st_tipovenda', 'modo_venda_id', 'column'
go
exec ('alter table dbo.venda_item_geral alter column modo_venda_id smallint not null')
go
exec sp_renomear 'dbo.venda_item_geral.pontovenda_id', 'ponto_venda_id', 'column'
exec sp_renomear 'dbo.venda_item_geral.nu_praca', 'praca_id', 'column'
exec sp_renomear 'dbo.venda_item_geral.func_cancela', 'func_cancelou_id', 'column'
exec sp_renomear 'dbo.venda_item_geral.func_transfere', 'func_transferiu_id', 'column'
go
exec sp_renomear 'dbo.venda_item_geral.func_lanca', 'func_lancou_id', 'column'
exec sp_renomear 'dbo.venda_item_geral.vl_precooriginal', 'vl_preco_original', 'column'
go
exec sp_renomear 'dbo.venda_item_geral.nu_motivocanc', 'motivo_cancelamento_id', 'column'
exec sp_renomear 'dbo.venda_item_geral.bn_exportou', 'exportado', 'column'
exec sp_renomear 'dbo.venda_item_geral.func_autorizou', 'func_autorizou_id', 'column'
exec sp_renomear 'dbo.venda_item_geral.bn_baixaefetuada', 'baixa_efetuada', 'column'
exec sp_renomear 'dbo.venda_item_geral.localDeEntrega', 'local_entrega', 'column'
exec sp_renomear 'dbo.venda_item_geral.perfilimpressao_id', 'perfil_impressao_id', 'column'
exec sp_renomear 'dbo.venda_item_geral.desconto_valor', 'vl_desconto', 'column'
exec sp_renomear 'dbo.venda_item_geral.local_producao', 'local_producao_id', 'column'
exec sp_renomear 'dbo.venda_item_geral.classe_rodizio', 'classe_rodizio_id', 'column'
exec sp_renomear 'dbo.venda_item_geral.funcionario_id', 'func_logado_id', 'column'
go

if dbo.fn_existe('dbo.venda_item_geral.st_cancelado') = 1
begin
  exec sp_apagar_campo 'dbo.venda_item_geral', 'cancelado'
  exec sp_apagar_campo 'dbo.venda_item_geral', 'valido'
  exec sp_apagar_campo 'dbo.venda_item_geral', 'hr_lanc'
  exec sp_apagar_campo 'dbo.venda_item_geral', 'vl_tot'
end
go

if dbo.fn_existe('dbo.venda_item_geral.st_cancelado') = 1
  exec sp_renomear 'dbo.venda_item_geral.st_cancelado', 'codigo_situacao', 'column'
go

if dbo.fn_existe('dbo.venda_item_geral.situacao') = 0
begin
  alter table dbo.venda_item_geral
    add situacao as (case codigo_situacao
        when 'N' then 'normal'
        when 'A' then 'cancelado antes da produção'
        when 'T' then 'transferido'
        when 'D' then 'cancelado depois da produção'
      else 'desconhecida'
      end
    )
  exec sp_renomear 'dbo.venda_item_geral.dt_lanc', 'dt_lancamento', 'column'
  exec sp_renomear 'dbo.venda_item_geral.nu_quantidade', 'qtd', 'column'
end
go

if (dbo.fn_existe('dbo.venda_item_geral.situacao') = 1) and (dbo.fn_existe('dbo.venda_item_geral.cancelado') = 0)
  alter table dbo.venda_item_geral
    add cancelado as (convert([bit], case [codigo_situacao] when 'N' then (0) when 'T' then (0) else (1) end, 0))
go

if (dbo.fn_existe('dbo.venda_item_geral.cancelado') = 1) and (dbo.fn_existe('dbo.venda_item_geral.hr_lancamento') = 0)
begin
  alter table dbo.venda_item_geral
    add hr_lancamento as (convert([time], [dt_lancamento], 0))
  alter table dbo.venda_item_geral
    add valido as (convert([bit], case when [codigo_situacao] <> ('N') or [transferido] = (1) then (0) else (1) end, 0))
  alter table dbo.venda_item_geral
    add vl_total as (convert([money], [qtd] * [vl_preco] + isnull([arredondamento], 0), (0)))
end
go
/* cliente */
exec sp_renomear 'dbo.cliente.cliente_id', 'id', 'column';
exec sp_renomear 'dbo.cliente.nu_identificacao', 'identificacao', 'column';
exec sp_renomear 'dbo.cliente.tipocliente_id', 'tipo_id', 'column';
exec sp_renomear 'dbo.cliente.nm_nome', 'nome', 'column';
exec sp_renomear 'dbo.cliente.nm_sexo', 'sexo', 'column';
exec sp_renomear 'dbo.cliente.nu_cnpjcpf', 'cnpj_cpf', 'column';
exec sp_renomear 'dbo.cliente.nu_inscrg', 'ie_rg', 'column';
exec sp_renomear 'dbo.cliente.nm_endereco', 'endereco', 'column';
exec sp_renomear 'dbo.cliente.nu_numero', 'numero', 'column';
exec sp_renomear 'dbo.cliente.nm_complementoendereco', 'complemento', 'column';
exec sp_renomear 'dbo.cliente.nm_referencia', 'referencia', 'column';
exec sp_renomear 'dbo.cliente.nu_cep', 'cep', 'column';
exec sp_renomear 'dbo.cliente.nm_cidade', 'cidade', 'column';
exec sp_renomear 'dbo.cliente.sg_estado', 'estado', 'column';
go
exec sp_renomear 'dbo.cliente.nu_telefone', 'telefone', 'column';
exec sp_renomear 'dbo.cliente.nm_email', 'email', 'column';
exec sp_renomear 'dbo.cliente.nu_fax', 'fax', 'column';
exec sp_renomear 'dbo.cliente.dt_validadedesconto', 'dt_validade_desconto', 'column';
exec sp_renomear 'dbo.cliente.vl_limitecartao', 'limite_cartao', 'column';
exec sp_renomear 'dbo.cliente.dt_validadecartao', 'dt_validade_cartao', 'column';
exec sp_renomear 'dbo.cliente.nu_taxaentrega', 'taxa_entrega', 'column';
exec sp_renomear 'dbo.cliente.dt_primeiracompra', 'dt_primeira_compra', 'column';
exec sp_renomear 'dbo.cliente.dt_datacadastro', 'dt_cadastro', 'column';
exec sp_renomear 'dbo.cliente.bn_ativo', 'ativo', 'column';
exec sp_renomear 'dbo.cliente.bn_conta', 'conta', 'column';
exec sp_renomear 'dbo.cliente.dt_validadeconta', 'dt_validade_conta', 'column';
exec sp_renomear 'dbo.cliente.vl_limiteconta', 'limite_conta', 'column';
exec sp_renomear 'dbo.cliente.dt_ultimacompra', 'dt_ultima_compra', 'column';
go

/* midia */
exec sp_renomear 'dbo.midia.nm_midia', 'nome', 'column'
go

/* modo_venda */
exec sp_renomear 'dbo.mododevenda', 'modo_venda'
go

/* modulo */
exec sp_renomear 'dbo.modulo.nm_descricao', 'nome', 'column'
exec sp_renomear 'dbo.modulo.st_tipo', 'tipo', 'column'
go

/* movimento_caixa */
exec sp_renomear 'dbo.movimentocaixa', 'movimento_caixa'
exec sp_renomear 'dbo.movimento_caixa.func_recebeu', 'func_recebeu_id', 'column'
exec sp_renomear 'dbo.movimento_caixa.func_cancelou', 'func_cancelou_id', 'column'
exec sp_renomear 'dbo.movimento_caixa.func_autorizou', 'func_autorizou_id', 'column'
exec sp_renomear 'dbo.movimento_caixa.movimentocaixa_id', 'movimento_caixa_id', 'column'
exec sp_renomear 'dbo.movimento_caixa.meiorecebimento_id', 'meio_pagamento_id', 'column'
go

/* pre_pagamento */
exec sp_renomear 'dbo.prepagamento', 'pre_pagamento'
exec sp_renomear 'dbo.pre_pagamento.func_recebeu', 'func_recebeu_id', 'column'
exec sp_renomear 'dbo.pre_pagamento.func_cancelou', 'func_cancelou_id', 'column'
exec sp_renomear 'dbo.pre_pagamento.func_autorizou', 'func_autorizou_id', 'column'
exec sp_renomear 'dbo.pre_pagamento.movimentocaixa_id', 'movimento_caixa_id', 'column'
exec sp_renomear 'dbo.pre_pagamento.meiorecebimento_id', 'meio_pagamento_id', 'column'

go

/* movimento_caixa_geral */
exec sp_renomear 'dbo.movimentocaixageral', 'movimento_caixa_geral'
exec sp_renomear 'dbo.movimento_caixa_geral.func_recebeu', 'func_recebeu_id', 'column'
exec sp_renomear 'dbo.movimento_caixa_geral.func_cancelou', 'func_cancelou_id', 'column'
exec sp_renomear 'dbo.movimento_caixa_geral.func_autorizou', 'func_autorizou_id', 'column'
exec sp_renomear 'dbo.movimento_caixa_geral.movimentocaixa_id', 'movimento_caixa_id', 'column'
exec sp_renomear 'dbo.movimento_caixa_geral.meiorecebimento_id', 'meio_pagamento_id', 'column'

go

/* promocao_item */
exec sp_renomear 'dbo.movpromocao', 'promocao_item'
go

/* operacao */
exec sp_renomear 'dbo.operacao.funcionario_id', 'func_logado_id', 'column'
exec sp_renomear 'dbo.operacao.func_cancelou', 'func_cancelou_id', 'column'
exec sp_renomear 'dbo.operacao.func_autorizou', 'func_autorizou_id', 'column'
go

/* operacao_geral */
exec sp_renomear 'dbo.operacaogeral', 'operacao_geral'
exec sp_renomear 'dbo.operacao_geral.funcionario_id', 'func_logado_id', 'column'
exec sp_renomear 'dbo.operacao_geral.func_cancelou', 'func_cancelou_id', 'column'
exec sp_renomear 'dbo.operacao_geral.func_autorizou', 'func_autorizou_id', 'column'
go

/* operacao_venda */
exec sp_renomear 'dbo.operacaodevenda', 'operacao_venda'
exec sp_renomear 'dbo.operacao_venda.mododevenda_id', 'modo_venda_id', 'column'
exec sp_renomear 'dbo.operacao_venda.func_expedicao', 'func_expediu_id', 'column'
exec sp_renomear 'dbo.operacao_venda.entregador', 'func_entregou_id', 'column'
exec sp_renomear 'dbo.operacao_venda.nm_desconto', 'desconto', 'column'
exec sp_renomear 'dbo.operacao_venda.maquina_encerrou', 'maquina_encerrou_id', 'column'
exec sp_renomear 'dbo.operacao_venda.func_encerrou', 'func_encerrou_id', 'column'
exec sp_renomear 'dbo.operacao_venda.nu_pessoas', 'qtd_pessoas', 'column'
go

/* operacao_venda_geral */
exec sp_renomear 'dbo.operacaodevendageral', 'operacao_venda_geral'
exec sp_renomear 'dbo.operacao_venda_geral.mododevenda_id', 'modo_venda_id', 'column'
exec sp_renomear 'dbo.operacao_venda_geral.func_expedicao', 'func_expediu_id', 'column'
exec sp_renomear 'dbo.operacao_venda_geral.entregador', 'func_entregou_id', 'column'
exec sp_renomear 'dbo.operacao_venda_geral.nm_desconto', 'desconto', 'column'
exec sp_renomear 'dbo.operacao_venda_geral.maquina_encerrou', 'maquina_encerrou_id', 'column'
exec sp_renomear 'dbo.operacao_venda_geral.func_encerrou', 'func_encerrou_id', 'column'
exec sp_renomear 'dbo.operacao_venda_geral.nu_pessoas', 'qtd_pessoas', 'column'
go

/* parametro_modo */
exec sp_renomear 'dbo.parametroxmodo', 'parametro_modo'
exec sp_renomear 'dbo.parametro_modo.modovenda_id', 'modo_venda_id', 'column'
go

/* perfil */
exec sp_renomear 'dbo.perfil.nm_nome', 'nome', 'column'
exec sp_renomear 'dbo.perfil.nm_descricao', 'descricao', 'column'
exec sp_renomear 'dbo.perfil.bn_ativo', 'ativo', 'column'
exec sp_renomear 'dbo.perfil.nu_codigo', 'codigo', 'column'
go

/* plugin */
exec sp_renomear 'dbo.plugins', 'plugin'
exec sp_renomear 'dbo.plugin.caminhoDoPlugin', 'pasta', 'column'
go

/* plugin_config */
exec sp_apagar_tabela 'plugin_config'
exec sp_renomear 'dbo.plugins_config', 'plugin_config'
go

/* plugin_maquina */
exec sp_renomear 'dbo.pluginxmaquina', 'plugin_maquina'
go

/* promocao */
exec sp_renomear 'dbo.promocao.bn_ativo', 'ativo', 'column'
exec sp_renomear 'dbo.promocao.nm_periodo', 'periodo', 'column'
exec sp_renomear 'dbo.promocao.nm_descricao', 'descricao', 'column'
exec sp_renomear 'dbo.promocao.bn_domingo', 'domingo', 'column'
exec sp_renomear 'dbo.promocao.bn_segunda', 'segunda', 'column'
exec sp_renomear 'dbo.promocao.bn_terca', 'terca', 'column'
exec sp_renomear 'dbo.promocao.bn_quarta', 'quarta', 'column'
exec sp_renomear 'dbo.promocao.bn_quinta', 'quinta', 'column'
exec sp_renomear 'dbo.promocao.bn_sexta', 'sexta', 'column'
exec sp_renomear 'dbo.promocao.bn_sabado', 'sabado', 'column'
exec sp_renomear 'dbo.promocao.bn_balcao', 'balcao', 'column'
exec sp_renomear 'dbo.promocao.bn_mesa', 'mesa', 'column'
exec sp_renomear 'dbo.promocao.bn_entrega', 'entrega', 'column'
exec sp_renomear 'dbo.promocao.bn_ficha', 'ficha', 'column'
exec sp_renomear 'dbo.promocao.bn_promo_especial', 'promo_especial', 'column'
go

/* regiao */
exec sp_renomear 'dbo.regiao.nm_regiao', 'regiao', 'column'
exec sp_renomear 'dbo.regiao.nu_taxa', 'taxa', 'column'
exec sp_renomear 'dbo.regiao.nm_porta', 'porta', 'column'
go

/* tipo_cliente */
exec sp_renomear 'dbo.tipocliente', 'tipo_cliente'
exec sp_renomear 'dbo.tipo_cliente.tipocliente_id', 'tipo_cliente_id', 'column'
exec sp_renomear 'dbo.tipo_cliente.nm_tipocliente', 'nome', 'column'
go

/* meio_pagamento */
exec sp_renomear 'dbo.tipo_recebimento', 'meio_pagamento'
go

/* valor_conferido */
exec sp_renomear 'dbo.valorconferido', 'turno_conferencia'
exec sp_renomear 'dbo.turno_conferencia.tiporecebimento_id', 'meio_pagamento_id', 'column'
exec sp_renomear 'dbo.turno_conferencia.movcaixa_id', 'turno_id', 'column'
go

if dbo.fn_existe('dbo.turno_conferencia.valor_digitado') = 1
begin
  exec ('alter table dbo.turno_conferencia add vl_digitado numeric (15,2) not null default (0)')
  exec ('update dbo.turno_conferencia set vl_digitado = valor_digitado')
end
go
exec sp_apagar_campo 'turno_conferencia', 'valor_digitado'
go

/* ticket */
exec sp_renomear 'dbo.ticket.modo_venda', 'modo_venda_id', 'column'
go

/* perfil_impressao */
exec sp_renomear 'dbo.perfil_impressao.modo_venda', 'modo_venda_id', 'column'
go

/* comanda */
exec sp_apagar_campo 'comanda', 'loja_id'
exec sp_renomear 'dbo.comanda.nu_comanda', 'numero', 'column'
exec sp_renomear 'dbo.comanda.st_tipovenda', 'modo_venda_id', 'column'
exec sp_renomear 'dbo.comanda.pontovenda_id', 'ponto_venda_id', 'column'
go

/* combo */
exec sp_renomear 'dbo.combo.local_producao', 'local_producao_id', 'column'
go

/* layout_touch */
exec sp_renomear 'dbo.layout_touch.tipo_venda', 'modo_venda_id', 'column'
go
