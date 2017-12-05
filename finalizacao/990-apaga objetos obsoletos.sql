/**************************************
 *** Tabelas
 **************************************/
execute sp_apagar_tabela 'config_acao_touch'
go
execute sp_apagar_tabela 'scr_scripts'
go
execute sp_apagar_tabela 'tipoocorrencia'
go
execute sp_apagar_tabela 'configurabotoestouch'
go
execute sp_apagar_tabela 'aliquota' 
go
execute sp_apagar_tabela 'acessomenu '
go
execute sp_apagar_tabela 'acessorel'
go
execute sp_apagar_tabela 'ctit_carttit'
go
execute sp_apagar_tabela 'nivel'
go
execute sp_apagar_tabela '010010'
go
execute sp_apagar_tabela '010100'
go
execute sp_apagar_tabela '010101'
go
execute sp_apagar_tabela '100101'
go
execute sp_apagar_tabela 'headervendabak'
go
execute sp_apagar_tabela 'headervendageralbak'
go
execute sp_apagar_tabela 'agrupamentovenda'
go
execute sp_apagar_tabela 'agrupamentovendageral'
go
execute sp_apagar_tabela 'cartaohabitue'
go
execute sp_apagar_tabela 'cartaoassociado'
go
execute sp_apagar_tabela 'cartaocredito'
go
execute sp_apagar_tabela 'comandatemp'
go
execute sp_apagar_tabela 'rmetcard'
go
execute sp_apagar_tabela 'movcaixa'
go
execute sp_apagar_tabela 'movcaixageral'
go
execute sp_apagar_tabela 'movcaixaitem'
go
execute sp_apagar_tabela 'movcaixaitemgeral'
go
execute sp_apagar_tabela 'semaforo'
go
execute sp_apagar_tabela 'recebimentovenda'
go
execute sp_apagar_tabela 'recebimentovendageral'
go
execute sp_apagar_tabela 'controlevendaremota'
go
execute sp_apagar_tabela 'sinal'
go
execute sp_apagar_tabela 'sinalgeral'
go
execute sp_apagar_tabela 'observacaovenda'
go
execute sp_apagar_tabela 'observacaovendageral'
go
execute sp_apagar_tabela 'dispositivoEcfModelo'
go
execute sp_apagar_tabela 'tmp_operacaoorigem'
go
execute sp_apagar_tabela 'gpar_grupoparam'
go
execute sp_apagar_tabela 'par_param'
go
execute sp_apagar_tabela 'periodocanc'
go
execute sp_apagar_tabela 'pman_dispositivos'
go
execute sp_apagar_tabela 'relatdiretoriatemp'
go
execute sp_apagar_tabela 'usuarioxlayout'
go
execute sp_apagar_tabela 'str_setorproducao'
go
execute sp_apagar_tabela 'desc_grp'
go
execute sp_apagar_tabela 'fechamentofuncionario'
go
execute sp_apagar_tabela 'filadelivery'
go
execute sp_apagar_tabela 'garcomcomanda'
go
execute sp_apagar_tabela 'garcommesa'
go
execute sp_apagar_tabela 'lockvenda'
go
execute sp_apagar_tabela 'loj_tabpreco'
go
execute sp_apagar_tabela 'pafr06'
go
execute sp_apagar_tabela 'protetornota'
go
execute sp_apagar_tabela 'regiao_pontovenda'
go
execute sp_apagar_tabela 'numrua'
go
execute sp_apagar_tabela 'rua'
go
execute sp_apagar_tabela 'sin_sinalizador'
go
execute sp_apagar_tabela 'tabpreco'
go
execute sp_apagar_tabela 'taxaxfuncionario'
go
execute sp_apagar_tabela 'classexcomanda'
go
execute sp_apagar_tabela 'microterminalxrelatorios'
go
execute sp_apagar_tabela 'comprovantexoperacao'
go
execute sp_apagar_tabela 'comprovantexoperacaogeral'
go
execute sp_apagar_tabela 'consumidorxoperacao'
go
execute sp_apagar_tabela 'composto'
go
execute sp_apagar_tabela 'fechamento'
go
execute sp_apagar_tabela 'tmp_movcaixaxoperacao'
go
execute sp_apagar_tabela 'tmp_reitens'
go
execute sp_apagar_tabela 'assinaturasPAF'
go
execute sp_apagar_tabela 'consumidordados'
go
execute sp_apagar_tabela 'bloqueio'
go
execute sp_apagar_tabela 'bloqueiocliente'
go
execute sp_apagar_tabela 'bloqueiorecebimento'
go
execute sp_apagar_tabela 'cartaovenda'
go
execute sp_apagar_tabela 'cartaovendageral'
go
execute sp_apagar_tabela 'colibri'
go
execute sp_apagar_tabela 'comanda'
go
execute sp_apagar_tabela 'comandaxrelatorios'
go
execute sp_apagar_tabela 'compostovenda'
go
execute sp_apagar_tabela 'compostovendageral'
go
execute sp_apagar_tabela 'est_estoque'
go
execute sp_apagar_tabela 'fidrequisicao'
go
execute sp_apagar_tabela 'fidrequisicaoitem'
go
execute sp_apagar_tabela 'fidresposta'
go
execute sp_apagar_tabela 'logfile'
go
execute sp_apagar_tabela 'seq_sequencia'
go
execute sp_apagar_tabela 'reitens' --so utilizada no PAF
go
execute sp_apagar_tabela 'receitas' 
go
execute sp_apagar_tabela 'configio' 
go
execute sp_apagar_tabela 'listaioxmododevenda' 
go
execute sp_apagar_tabela 'maparelatorio' 
go
execute sp_apagar_tabela 'perfilimpressaodetalhe' 
go
execute sp_apagar_tabela 'listaio' 
go
execute sp_apagar_tabela 'periferico' 
go
execute sp_apagar_tabela 'equipamento' 
go
execute sp_apagar_tabela 'relatorioxmodulo' 
go
execute sp_apagar_tabela 'tipoequipamento' 
go
execute sp_apagar_tabela 'tipoio' 
go
execute sp_apagar_tabela 'gruporelatorios' 
go
execute sp_apagar_tabela 'impressoraxrelatorio' 
go
execute sp_apagar_tabela 'perfilimpressao' 
go
execute sp_apagar_tabela 'dispositivo' 
go
execute sp_apagar_tabela 'cvs_ctrlversion'
go
execute sp_apagar_tabela 'local_impressao'
go
execute sp_apagar_tabela 'template'
go
execute sp_apagar_tabela 'scr_scripts'
go
execute sp_apagar_tabela 'licenca'
go
execute sp_apagar_tabela 'plugin'
go
if object_id('log') is not null  -- a sp_apagar_tabela da erro ao tentar apagar a tabela de log
  exec('drop table log')         -- por isso usei um drop table 
go

/**************************************
 *** Chaves primárias indesejadas
 **************************************/

execute sp_apagar_constraint 'pk_fechamento'
go
execute sp_apagar_constraint 'assinaturasPAF_pk_tabela$data'
go
execute sp_apagar_constraint 'ri_combo_slot_classe'
go
execute sp_apagar_constraint 'ri_combo_slot_material'
go
execute sp_apagar_constraint 'pk_headerfechamento'
go

/**************************************
 *** Indices
 **************************************/
execute sp_apagar_indice 'venda_item', 'initem02'
go
execute sp_apagar_constraint 'ix_observacao$rede_id$sub_rede_id$loja_id$codigo'
go
execute sp_apagar_constraint 'ix_classe$rede_id$sub_rede_id$loja_id$codigo'
go
execute sp_apagar_constraint 'classe_rede_id_6addaab2_uniq'
go
execute sp_apagar_constraint 'observacao_rede_id_705f28e0_uniq'
go

/**************************************
 *** Campos
 **************************************/
execute sp_apagar_campo 'aliquota', 'loja_id'
go
execute sp_apagar_campo 'classe', 'bn_permitecombinado'
go
execute sp_apagar_campo 'classe', 'permitecombinado'
go
execute sp_apagar_campo 'classe', 'codigo'
go
execute sp_apagar_campo 'cliente', 'limite_cartao'
go
execute sp_apagar_campo 'cliente', 'dt_validade_cartao'
go
execute sp_apagar_campo 'cliente', 'taxa_entrega'
go
execute sp_apagar_campo 'combo', 'sufixo'
go
execute sp_apagar_campo 'combo_slot', 'sufixo'
go
execute sp_apagar_campo 'comprovante', 'consumidordados_id'
go
execute sp_apagar_campo 'desconto_estrategia', 'ativo'
go
execute sp_apagar_campo 'mapa_ecf', 'nu_num_mapa'
go
execute sp_apagar_campo 'maquina', 'bn_clicadobalcao'
go
execute sp_apagar_campo 'maquina', 'bn_clicadoentrega'
go
execute sp_apagar_campo 'maquina', 'bn_clicadoficha'
go
execute sp_apagar_campo 'maquina', 'bn_clicadomesa'
go
execute sp_apagar_campo 'maquina', 'loja_id'
go
execute sp_apagar_campo 'maquina', 'nu_botaotouchbalcao'
go
execute sp_apagar_campo 'maquina', 'nu_botaotouchentrega'
go
execute sp_apagar_campo 'maquina', 'nu_botaotouchficha'
go
execute sp_apagar_campo 'maquina', 'nu_botaotouchmesa'
go
execute sp_apagar_campo 'maquina', 'nu_linhatouchbalcao'
go
execute sp_apagar_campo 'maquina', 'nu_linhatouchentrega'
go
execute sp_apagar_campo 'maquina', 'nu_linhatouchficha'
go
execute sp_apagar_campo 'maquina', 'nu_linhatouchmesa'
go
execute sp_apagar_campo 'maquina', 'separa_troco_pre_pgto'
go
execute sp_apagar_campo 'maquina', 'log_detalhado'
go
execute sp_apagar_campo 'material', 'h1'
go
execute sp_apagar_campo 'material', 'h2'
go
execute sp_apagar_campo 'material', 'nm_descricaoproducao2'
go
execute sp_apagar_campo 'material', 'prd_tipo'
go
execute sp_apagar_campo 'material', 'st_tipomaterial'
go
execute sp_apagar_campo 'meio_pagamento', 'banco_id'
go
execute sp_apagar_campo 'meio_pagamento', 'bn_deposita'
go
execute sp_apagar_campo 'meio_pagamento', 'bn_favorito'
go
execute sp_apagar_campo 'meio_pagamento', 'bn_recebimentoexterno'
go
execute sp_apagar_campo 'meio_pagamento', 'cc_nome'
go
execute sp_apagar_campo 'meio_pagamento', 'cc_taxa'
go
execute sp_apagar_campo 'meio_pagamento', 'conta'
go
execute sp_apagar_campo 'meio_pagamento', 'convenio_tef'
go
execute sp_apagar_campo 'meio_pagamento', 'lote_id'
go
execute sp_apagar_campo 'meio_pagamento', 'nu_desconto'
go
execute sp_apagar_campo 'meio_pagamento', 'nu_diasdeposito'
go
execute sp_apagar_campo 'meio_pagamento', 'status'
go
execute sp_apagar_campo 'meio_pagamento', 'st_lancamento'
go
execute sp_apagar_campo 'meio_pagamento', 'st_recebimentoexterno'
go
execute sp_apagar_campo 'meio_pagamento', 'tipopgto'
go
execute sp_apagar_campo 'meio_pagamento', 'tiporeceita_id'
go
execute sp_apagar_campo 'meio_pagamento', 'vl_taxaadm'
go
execute sp_apagar_campo 'movimento_caixa', 'dt_fechamento'
go
execute sp_apagar_campo 'movimento_caixa_geral', 'dt_fechamento'
go
execute sp_apagar_campo 'observacao', 'codigo'
go
execute sp_apagar_campo 'operacao', 'dt_cancelamento'
go
execute sp_apagar_campo 'operacao', 'dt_hr_encerramento'
go
execute sp_apagar_campo 'operacao', 'encerrada'
go
execute sp_apagar_campo 'operacao', 'func_encerrou'
go
execute sp_apagar_campo 'operacao', 'maquina_encerrou'
go
execute sp_apagar_campo 'operacao_geral', 'dt_cancelamento'
go
execute sp_apagar_campo 'operacao_geral', 'dt_hr_encerramento'
go
execute sp_apagar_campo 'operacao_geral', 'encerrada'
go
execute sp_apagar_campo 'operacao_geral', 'func_encerrou'
go
execute sp_apagar_campo 'operacao_geral', 'maquina_encerrou'
go
execute sp_apagar_campo 'operacao_venda', 'coo_conferencia'
go
execute sp_apagar_campo 'operacao_venda', 'ecf_conferencia'
go
execute sp_apagar_campo 'operacao_venda_geral', 'coo_conferencia'
go
execute sp_apagar_campo 'operacao_venda_geral', 'ecf_conferencia'
go
execute sp_apagar_campo 'plugin', 'pasta'
go
execute sp_apagar_campo 'plugin', 'dt_criacao'
go
execute sp_apagar_campo 'plugin', 'dt_alt'
go
execute sp_apagar_campo 'periodo', 'dt_alt'
go
execute sp_apagar_campo 'periodo', 'loja_id'
go
execute sp_apagar_campo 'ticket', 'consumidordados_id'
go
execute sp_apagar_campo 'turno', 'loja_id'
go
execute sp_apagar_campo 'turno', 'loja_id'
go
execute sp_apagar_campo 'turno_conferencia', 'loja_id'
go
execute sp_apagar_campo 'turno_conferencia', 'loja_id'
go
execute sp_apagar_campo 'venda', 'bn_importado'
go
execute sp_apagar_campo 'venda', 'nu_sequencia'
go
execute sp_apagar_campo 'venda', 'nu_subconta'
go
execute sp_apagar_campo 'venda', 'st_cancelado'
go
execute sp_apagar_campo 'venda', 'st_mesa'
go
execute sp_apagar_campo 'venda_geral', 'bn_fechamento'
go
execute sp_apagar_campo 'venda_geral', 'bn_importado'
go
execute sp_apagar_campo 'venda_geral', 'nu_sequencia'
go
execute sp_apagar_campo 'venda_geral', 'nu_subconta'
go
execute sp_apagar_campo 'venda_geral', 'st_cancelado'
go
execute sp_apagar_campo 'venda_geral', 'st_mesa'
go
execute sp_apagar_campo 'venda_item', 'bn_impresso'
go
execute sp_apagar_campo 'venda_item', 'mesa_dest'
go
execute sp_apagar_campo 'venda_item', 'nu_sequencia'
go
execute sp_apagar_campo 'venda_item', 'nu_subconta'
go
execute sp_apagar_campo 'venda_item', 'seq_dest'
go
execute sp_apagar_campos 'venda_item', 'nu_comanda', 'nu_assento', 'st_tipomaterial'
go
execute sp_apagar_campos 'venda_item_geral', 'nu_comanda', 'nu_assento', 'st_tipomaterial'
go
execute sp_apagar_campo 'venda_item_geral', 'bn_impresso'
go
execute sp_apagar_campo 'venda_item_geral', 'mesa_dest'
go
execute sp_apagar_campo 'venda_item_geral', 'nu_sequencia'
go
execute sp_apagar_campo 'venda_item_geral', 'nu_subconta'
go
execute sp_apagar_campo 'venda_item_geral', 'seq_dest'
go

/**************************************
 *** Triggers
 **************************************/

execute sp_apagar 'trigger', 'ti_movclasse'
go
execute sp_apagar 'trigger', 'tu_movclasse'
go
execute sp_apagar 'trigger', 'td_tiporecebimento'
go
execute sp_apagar 'trigger', 'tu_tiporecebimento'
go
execute sp_apagar 'trigger', 'tr_upd_cancelado'
go
execute sp_apagar 'trigger', 'alterObterassinaturaNoUpdate_iu'
go
execute sp_apagar 'trigger', 'alterObterassinaturaNoInsert_iu'
go
execute sp_apagar 'trigger', 'td_dispositivo'
go
execute sp_apagar 'trigger', 'tu_classe'
go
execute sp_apagar 'trigger', 'td_classe'
go
execute sp_apagar 'trigger', 'tu_observacao'
go
execute sp_apagar 'trigger', 'td_observacao'
go
execute sp_apagar 'trigger', 'ti_fechamento'
go
execute sp_apagar 'trigger', 'tu_fechamento'
go
execute sp_apagar 'trigger', 'tI_MATERIALxOBS'
go
execute sp_apagar 'trigger', 'mat_u'
go
execute sp_apagar 'trigger', 'mat_d'
go
execute sp_apagar 'trigger', 'upd_tmp_reitens'
go
execute sp_apagar 'trigger', 'tu_modulo'
go
execute sp_apagar 'trigger', 'td_modulo'
go
execute sp_apagar 'trigger', 'tD_MIDIA'
go
execute sp_apagar 'trigger', 'tU_MIDIA'
go
execute sp_apagar 'trigger', 'tD_GRUPOFUNCIONARIO'
go
execute sp_apagar 'trigger', 'tU_GRUPOFUNCIONARIO'
go
execute sp_apagar 'trigger', 'tD_ESTADO'
go
execute sp_apagar 'trigger', 'tU_ESTADO'
go

/**************************************
 *** Views
 **************************************/

execute sp_apagar 'view', 'vw_perfil'
go
execute sp_apagar 'view', 'vw_configio'
go
execute sp_apagar 'view', 'vw_configiodispositivo'
go
execute sp_apagar 'view', 'vw_comandostouch'
go
execute sp_apagar 'view', 'v_componentesbotoes'
go
execute sp_apagar 'view', 'v_botoesprincipaltouch'
go
execute sp_apagar 'view', 'vw_movimentodetalhe'
go
execute sp_apagar 'view', 'vw_movimento_detalhe'
go
execute sp_apagar 'view', 'vw_movimento'
go
execute sp_apagar 'view', 'vw_operacao_detalhe'
go
execute sp_apagar 'view', 'vw_operacaodetalhe'
go
execute sp_apagar 'view', 'entregavenda'
go
execute sp_apagar 'view', 'header'
go
execute sp_apagar 'view', 'imp_configuracoes_comanda'
go
execute sp_apagar 'view', 'imp_configuracoes_terminal'
go
execute sp_apagar 'view', 'mapamesas'
go
execute sp_apagar 'view', 'mesavenda'
go
execute sp_apagar 'view', 'v_classecombinada'
go
execute sp_apagar 'view', 'v_componentes'
go
execute sp_apagar 'view', 'v_compostocomponentes'
go
execute sp_apagar 'view', 'v_extratocompleto'
go
execute sp_apagar 'view', 'v_fichas'
go
execute sp_apagar 'view', 'v_itensreldiretoria'
go
execute sp_apagar 'view', 'v_materialcomposto'
go
execute sp_apagar 'view', 'v_matobs'
go
execute sp_apagar 'view', 'v_mesas'
go
execute sp_apagar 'view', 'v_pedidosentrega'
go
execute sp_apagar 'view', 'v_penduraclientediaria'
go
execute sp_apagar 'view', 'v_penduraextratocompleto'
go
execute sp_apagar 'view', 'v_processosabertoscomanda'
go
execute sp_apagar 'view', 'v_processosbloqueadoscomanda'
go
execute sp_apagar 'view', 'v_qtcomposto'
go
execute sp_apagar 'view', 'v_qtdecombinado'
go
execute sp_apagar 'view', 'v_qtdecombinadogeral'
go
execute sp_apagar 'view', 'v_qtdevenda'
go
execute sp_apagar 'view', 'v_qtdevendageral'
go
execute sp_apagar 'view', 'v_relatorioscomanda'
go
execute sp_apagar 'view', 'v_relatoriosMicroterminal'
go
execute sp_apagar 'view', 'v_totitemvenda'
go
execute sp_apagar 'view', 'v_totitemvendageral'
go
execute sp_apagar 'view', 'vw_assentos'
go
execute sp_apagar 'view', 'vw_assinaturas'
go
execute sp_apagar 'view', 'vw_atrasoEntrega'
go
execute sp_apagar 'view', 'vw_cliente'
go
execute sp_apagar 'view', 'vw_comprovante'
go
execute sp_apagar 'view', 'vw_comprovantedetalhe'
go
execute sp_apagar 'view', 'vw_comprovantemeios'
go
execute sp_apagar 'view', 'vw_confcaixa'
go
execute sp_apagar 'view', 'vw_configuracaocontravale'
go
execute sp_apagar 'view', 'vw_configuracaotouch'
go
execute sp_apagar 'view', 'vw_dispositivosdefechamento'
go
execute sp_apagar 'view', 'vw_entrega'
go
execute sp_apagar 'view', 'vw_faixaArredond'
go
execute sp_apagar 'view', 'vw_identificacaodeecf'
go
execute sp_apagar 'view', 'vw_impfisc'
go
execute sp_apagar 'view', 'vw_itempendura'
go
execute sp_apagar 'view', 'vw_itemvenda'
go
execute sp_apagar 'view', 'vw_localdeproducao'
go
execute sp_apagar 'view', 'vw_localdeproducaocomanda'
go
execute sp_apagar 'view', 'vw_mapa'
go
execute sp_apagar 'view', 'vw_materialsimples'
go
execute sp_apagar 'view', 'vw_mesavenda'
go
execute sp_apagar 'view', 'vw_modelosdeecf'
go
execute sp_apagar 'view', 'vw_numeroaleatorio'
go
execute sp_apagar 'view', 'vw_permissao'
go
execute sp_apagar 'view', 'vw_sexo'
go
execute sp_apagar 'view', 'vw_slotsdocomposto'
go
execute sp_apagar 'view', 'vw_ticket'
go
execute sp_apagar 'view', 'vw_ticketsimples'
go
execute sp_apagar 'view', 'vw_vendas'
go
execute sp_apagar 'view', 'vw_vendascolibri'
go
execute sp_apagar 'view', 'vw_vendascolibribi'
go
execute sp_apagar 'view', 'ficha'
go
execute sp_apagar 'view', 'mesa'
go
execute sp_apagar 'view', 'v_botoesconfiguratouch'
go
execute sp_apagar 'view', 'v_clientependura'
go
execute sp_apagar 'view', 'vw_configiodispositivoNFCe'
go
execute sp_apagar 'view', 'vw_estoque'  
go
execute sp_apagar 'view', 'vw_receitas'  
go
execute sp_apagar 'view', 'vw_localproducaonome'  
go
execute sp_apagar 'view', 'imp_configuracoes'
go
execute sp_apagar 'view', 'vw_perfilimpressao'
go
execute sp_apagar 'view', 'vw_perfilimpressaoDispositivo'
go
execute sp_apagar 'view', 'vw_paramCateia'
go
execute sp_apagar 'view', 'vw_configio'
go
execute sp_apagar 'view', 'vw_configiodispositivo'
go
execute sp_apagar 'view', 'vw_operacaodetalhe'
go
execute sp_apagar 'view', 'vw_movimentodetalhe'
go

/**************************************
 *** Functions / Procedures
 **************************************/

execute sp_apagar 'function', 'fn_gettipomat'
go
execute sp_apagar 'function', 'fn_diadasemana'
go
execute sp_apagar 'function', 'fn_numerochamada'
go
execute sp_apagar 'function', 'fn_observacaovenda'
go
execute sp_apagar 'function', 'fn_obterassinatura'
go
execute sp_apagar 'function', 'fn_sequenciasDaOperacao'
go
execute sp_apagar 'function', 'fn_validarAssinaturaPAF'
go
execute sp_apagar 'function', 'fn_verificarAssinaturasPAF'
go
execute sp_apagar 'function', 'fn_gettipomat'
go
execute sp_apagar 'procedure', 'sp_gravaconfigtouch'
go
execute sp_apagar 'procedure', 'sp_gravaconfigbotao'
go
execute sp_apagar 'procedure', 'sp_increl'
go
execute sp_apagar 'procedure', 'sp_ajustaconfigio'
go
execute sp_apagar 'procedure', 'sp_ajustar_dispositivos'
go
execute sp_apagar 'procedure', 'sp_addpermissao'
go
execute sp_apagar 'procedure', 'sp_abremov'
go
execute sp_apagar 'procedure', 'sp_acertadtconsumacao'
go
execute sp_apagar 'procedure', 'sp_aliquota'
go
execute sp_apagar 'procedure', 'sp_alteracomandarel'
go
execute sp_apagar 'procedure', 'sp_alteracontadoritem'
go
execute sp_apagar 'procedure', 'sp_alteramicroterminal'
go
execute sp_apagar 'procedure', 'sp_alterasubcontavenda'
go
execute sp_apagar 'procedure', 'sp_assinar_operacao'
go
execute sp_apagar 'procedure', 'sp_assinatura'
go
execute sp_apagar 'procedure', 'sp_assinaturasPAF'
go
execute sp_apagar 'procedure', 'sp_atualizapermissao'
go
execute sp_apagar 'procedure', 'sp_atualizarassinaturas'
go
execute sp_apagar 'procedure', 'sp_atualizaservico'
go
execute sp_apagar 'procedure', 'sp_cancelaheader'
go
execute sp_apagar 'procedure', 'sp_cancelaitemvenda'
go
execute sp_apagar 'procedure', 'sp_cartaocredito'
go
execute sp_apagar 'procedure', 'sp_col_cancelaimprimemesa'
go
execute sp_apagar 'procedure', 'sp_col_cancelaimprimemesa'
go
execute sp_apagar 'procedure', 'sp_col_cancelaitemmesa'
go
execute sp_apagar 'procedure', 'sp_col_cancelaitemmesa'
go
execute sp_apagar 'procedure', 'sp_col_complzero'
go
execute sp_apagar 'procedure', 'sp_col_complzero'
go
execute sp_apagar 'procedure', 'sp_col_criaheadervenda'
go
execute sp_apagar 'procedure', 'sp_col_criaheadervenda'
go
execute sp_apagar 'procedure', 'sp_col_criaheadervendamesa'
go
execute sp_apagar 'procedure', 'sp_col_criaheadervendamesa'
go
execute sp_apagar 'procedure', 'sp_col_criaitemvenda'
go
execute sp_apagar 'procedure', 'sp_col_criaitemvendamesa'
go
execute sp_apagar 'procedure', 'sp_col_criaitemvendamesatransf'
go
execute sp_apagar 'procedure', 'sp_col_criapendura'
go
execute sp_apagar 'procedure', 'sp_col_fechamesa'
go
execute sp_apagar 'procedure', 'sp_col_fechavenda'
go
execute sp_apagar 'procedure', 'sp_col_getacesso'
go
execute sp_apagar 'procedure', 'sp_col_getfuncmesa'
go
execute sp_apagar 'procedure', 'sp_col_getitems'
go
execute sp_apagar 'procedure', 'sp_col_getitemsgeral'
go
execute sp_apagar 'procedure', 'sp_col_getlock'
go
execute sp_apagar 'procedure', 'sp_col_getlockmesa'
go
execute sp_apagar 'procedure', 'sp_col_getmaterial'
go
execute sp_apagar 'procedure', 'sp_col_getmesa'
go
execute sp_apagar 'procedure', 'sp_col_getprintcfg_comanda'
go
execute sp_apagar 'procedure', 'sp_col_getprintcfg_desktop'
go
execute sp_apagar 'procedure', 'sp_col_getprintcfg_microterm'
go
execute sp_apagar 'procedure', 'sp_col_gravalog'
go
execute sp_apagar 'procedure', 'sp_col_inserecomp'
go
execute sp_apagar 'procedure', 'sp_col_inserecompmesa'
go
execute sp_apagar 'procedure', 'sp_col_insereitemmesa'
go
execute sp_apagar 'procedure', 'sp_col_insereobs'
go
execute sp_apagar 'procedure', 'sp_col_insereobsmesa'
go
execute sp_apagar 'procedure', 'sp_col_lock'
go
execute sp_apagar 'procedure', 'sp_col_lockmesa'
go
execute sp_apagar 'procedure', 'sp_col_logtransfitemmesa'
go
execute sp_apagar 'procedure', 'sp_col_recebemesa'
go
execute sp_apagar 'procedure', 'sp_col_recebevenda'
go
execute sp_apagar 'procedure', 'sp_col_transfereitemmesa'
go
execute sp_apagar 'procedure', 'sp_col_updateheadervendamesa'
go
execute sp_apagar 'procedure', 'sp_col_validafunc'
go
execute sp_apagar 'procedure', 'sp_composto'
go
execute sp_apagar 'procedure', 'sp_dadoscontabilidade'
go
execute sp_apagar 'procedure', 'sp_delcredito'
go
execute sp_apagar 'procedure', 'sp_deletaheaderigual'
go
execute sp_apagar 'procedure', 'sp_delheadervenda'
go
execute sp_apagar 'procedure', 'sp_delloja'
go
execute sp_apagar 'procedure', 'sp_eng_cancelitem'
go
execute sp_apagar 'procedure', 'sp_eng_checkpermissao'
go
execute sp_apagar 'procedure', 'sp_eng_delete_headervenda'
go
execute sp_apagar 'procedure', 'sp_eng_fechavenda'
go
execute sp_apagar 'procedure', 'sp_eng_getlock'
go
execute sp_apagar 'procedure', 'sp_eng_getprintcfg_comanda'
go
execute sp_apagar 'procedure', 'sp_eng_getprintcfg_desktop'
go
execute sp_apagar 'procedure', 'sp_eng_getprintcfg_microterm'
go
execute sp_apagar 'procedure', 'sp_eng_gravalog'
go
execute sp_apagar 'procedure', 'sp_eng_impagrupar'
go
execute sp_apagar 'procedure', 'sp_eng_lock'
go
execute sp_apagar 'procedure', 'sp_eng_newcomp'
go
execute sp_apagar 'procedure', 'sp_eng_newficha'
go
execute sp_apagar 'procedure', 'sp_eng_newheadervenda'
go
execute sp_apagar 'procedure', 'sp_eng_newitemvenda'
go
execute sp_apagar 'procedure', 'sp_eng_newobs'
go
execute sp_apagar 'procedure', 'sp_eng_newpendura'
go
execute sp_apagar 'procedure', 'sp_eng_recebevenda'
go
execute sp_apagar 'procedure', 'sp_eng_set_status_headervenda'
go
execute sp_apagar 'procedure', 'sp_eng_set_valor_headervenda'
go
execute sp_apagar 'procedure', 'sp_eng_settransf'
go
execute sp_apagar 'procedure', 'sp_eng_somavalores'
go
execute sp_apagar 'procedure', 'sp_eng_validafunc'
go
execute sp_apagar 'procedure', 'sp_estornovenda'
go
execute sp_apagar 'procedure', 'sp_extratocontaassinada'
go
execute sp_apagar 'procedure', 'sp_fechamentodiario'
go
execute sp_apagar 'procedure', 'sp_funcionarioxmesa'
go
execute sp_apagar 'procedure', 'sp_garcommesa'
go
execute sp_apagar 'procedure', 'sp_gravacaocomposto'
go
execute sp_apagar 'procedure', 'sp_gravafechamentovenda'
go
execute sp_apagar 'procedure', 'sp_gravalockheader'
go
execute sp_apagar 'procedure', 'sp_gravalockmaq'
go
execute sp_apagar 'procedure', 'sp_gravasuspenso'
go
execute sp_apagar 'procedure', 'sp_header'
go
execute sp_apagar 'procedure', 'sp_headervenda'
go
execute sp_apagar 'procedure', 'sp_incluimensagemcomanda'
go
execute sp_apagar 'procedure', 'sp_incpermrel'
go
execute sp_apagar 'procedure', 'sp_increlmt'
go
execute sp_apagar 'procedure', 'sp_increlxmod'
go
execute sp_apagar 'procedure', 'sp_itemvenda'
go
execute sp_apagar 'procedure', 'sp_lockheadervenda'
go
execute sp_apagar 'procedure', 'sp_loja'
go
execute sp_apagar 'procedure', 'sp_mapaecf'
go
execute sp_apagar 'procedure', 'sp_mapamesa'
go
execute sp_apagar 'procedure', 'sp_maqxdisp_altera'
go
execute sp_apagar 'procedure', 'sp_microterminalimp'
go
execute sp_apagar 'procedure', 'sp_movpendura'
go
execute sp_apagar 'procedure', 'sp_nextval'
go
execute sp_apagar 'procedure', 'sp_novoregistrocomandaxrelatorios'
go
execute sp_apagar 'procedure', 'sp_numeropessoas'
go
execute sp_apagar 'procedure', 'sp_numrua'
go
execute sp_apagar 'procedure', 'sp_obsvenda'
go
execute sp_apagar 'procedure', 'sp_obtemitems'
go
execute sp_apagar 'procedure', 'sp_paf_anexo6_e1'
go
execute sp_apagar 'procedure', 'sp_paf_anexo6_e2'
go
execute sp_apagar 'procedure', 'sp_paf_anexo6_e9'
go
execute sp_apagar 'procedure', 'sp_paf_anexo6_r00'
go
execute sp_apagar 'procedure', 'sp_paf_anexo6_r01'
go
execute sp_apagar 'procedure', 'sp_paf_anexo6_r02'
go
execute sp_apagar 'procedure', 'sp_paf_anexo6_r03'
go
execute sp_apagar 'procedure', 'sp_paf_anexo6_r04'
go
execute sp_apagar 'procedure', 'sp_paf_anexo6_r05'
go
execute sp_apagar 'procedure', 'sp_paf_anexo6_r06'
go
execute sp_apagar 'procedure', 'sp_paf_anexo6_r07'
go
execute sp_apagar 'procedure', 'sp_paf_anexo6_r99'
go
execute sp_apagar 'procedure', 'sp_pesquisaclasse'
go
execute sp_apagar 'procedure', 'sp_pesquisacliente'
go
execute sp_apagar 'procedure', 'sp_pesquisaestado'
go
execute sp_apagar 'procedure', 'sp_pesquisamaterial'
go
execute sp_apagar 'procedure', 'sp_pesquisamovimento'
go
execute sp_apagar 'procedure', 'sp_pesquisaobservacao'
go
execute sp_apagar 'procedure', 'sp_pman_getbkpprinter'
go
execute sp_apagar 'procedure', 'sp_proximaSequenciaVenda'
go
execute sp_apagar 'procedure', 'sp_recalcservicoitem'
go
execute sp_apagar 'procedure', 'sp_recebimentovenda'
go
execute sp_apagar 'procedure', 'sp_recebimentovendasepaco'
go
execute sp_apagar 'procedure', 'sp_reldiariodiretoria'
go
execute sp_apagar 'procedure', 'sp_rua'
go
execute sp_apagar 'procedure', 'sp_saldocliente'
go
execute sp_apagar 'procedure', 'sp_sinal'
go
execute sp_apagar 'procedure', 'sp_transfereitemvenda'
go
execute sp_apagar 'procedure', 'sp_transfereitemvendacancelado'
go
execute sp_apagar 'procedure', 'sp_transferemesacomanda'
go
execute sp_apagar 'procedure', 'sp_verlockheader'
go
execute sp_apagar 'procedure', 'sp_verlockheader'
go
execute sp_apagar 'procedure', 'sp_vinculahotel'
go
execute sp_apagar 'procedure', 'sp_classe'
go
execute sp_apagar 'procedure', 'sp_cliente'
go
execute sp_apagar 'procedure', 'sp_codieBarras'
go
execute sp_apagar 'procedure', 'sp_colibri'
go
execute sp_apagar 'procedure', 'sp_comandaxrelatorios'
go
execute sp_apagar 'procedure', 'sp_copiaconfigtouch'
go
execute sp_apagar 'procedure', 'sp_desconto'
go
execute sp_apagar 'procedure', 'sp_estado'
go
execute sp_apagar 'procedure', 'sp_ficha'
go
execute sp_apagar 'procedure', 'sp_formapaga'
go
execute sp_apagar 'procedure', 'sp_movclasse'
go
execute sp_apagar 'procedure', 'sp_matobs'
go
execute sp_apagar 'procedure', 'sp_funcionario'
go
execute sp_apagar 'procedure', 'sp_grupofuncionario'
go
execute sp_apagar 'procedure', 'sp_grupomat'
go
execute sp_apagar 'procedure', 'sp_increlcomanda'
go
execute sp_apagar 'procedure', 'sp_localproducao'
go
execute sp_apagar 'procedure', 'sp_maquina'
go
execute sp_apagar 'procedure', 'sp_maqxdisp'
go
execute sp_apagar 'procedure', 'sp_mesa'
go
execute sp_apagar 'procedure', 'sp_ficha'
go
execute sp_apagar 'procedure', 'sp_motivocanc'
go
execute sp_apagar 'procedure', 'sp_obs'
go
execute sp_apagar 'procedure', 'sp_perfil'
go
execute sp_apagar 'procedure', 'sp_pontofiscal'
go
execute sp_apagar 'procedure', 'sp_pontovenda'
go
execute sp_apagar 'procedure', 'sp_promocao'
go
execute sp_apagar 'procedure', 'sp_regiao'
go
execute sp_apagar 'procedure', 'sp_tipocliente'
go
execute sp_apagar 'procedure', 'sp_tipoocorrencia'
go
execute sp_apagar 'procedure', 'sp_copiaperfiltouch'
go
execute sp_apagar 'procedure', 'sp_dispositivo'
go
execute sp_apagar 'procedure', 'sp_gravalog'
go
execute sp_apagar 'procedure', 'sp_histcliente'
go
execute sp_apagar 'procedure', 'sp_gravalog'
go
execute sp_apagar 'procedure', 'spx_t4fpl1'
go
execute sp_apagar 'procedure', 'spx_t4fpl2'
go
execute sp_apagar 'procedure', 'spx_t4fpl4'
go
execute sp_apagar 'procedure', 'spx_t4fpl6'
go
execute sp_apagar 'procedure', 'sp_incluirRelatorio'
go
execute sp_apagar 'procedure', 'sp_gravaconfigtouch'
go
execute sp_apagar 'procedure', 'sp_gravaconfigbotao'
go
execute sp_apagar 'procedure', 'sp_increl'
go
execute sp_apagar 'procedure', 'sp_ajustaconfigio'
go

/**************************************
 Tipos de usuario
 ***************************************/

execute sp_apagar 'type', 'bool'
go
execute sp_apagar 'type', 'caracter'
go
execute sp_apagar 'type', 'cgc'
go
execute sp_apagar 'type', 'cod_alfa_2'
go
execute sp_apagar 'type', 'cod_alfa_3'
go
execute sp_apagar 'type', 'cod_alfa_4'
go
execute sp_apagar 'type', 'cod_alfa_5'
go
execute sp_apagar 'type', 'cod_alfa_6'
go
execute sp_apagar 'type', 'cod_alfa_7'
go
execute sp_apagar 'type', 'cod_alfa_8'
go
execute sp_apagar 'type', 'cod_num_3'
go
execute sp_apagar 'type', 'cod_num_4'
go
execute sp_apagar 'type', 'cod_num_5'
go
execute sp_apagar 'type', 'cod_num_6'
go
execute sp_apagar 'type', 'cod_num_7'
go
execute sp_apagar 'type', 'cod_num_8'
go
execute sp_apagar 'type', 'complemento'
go
execute sp_apagar 'type', 'cpf'
go
execute sp_apagar 'type', 'data'
go
execute sp_apagar 'type', 'data_hora'
go
execute sp_apagar 'type', 'descricao'
go
execute sp_apagar 'type', 'dinheiro'
go
execute sp_apagar 'type', 'EAN'
go
execute sp_apagar 'type', 'email'
go
execute sp_apagar 'type', 'estado'
go
execute sp_apagar 'type', 'filename'
go
execute sp_apagar 'type', 'fone'
go
execute sp_apagar 'type', 'hora'
go
execute sp_apagar 'type', 'ident'
go
execute sp_apagar 'type', 'imagem'
go
execute sp_apagar 'type', 'inteiro'
go
execute sp_apagar 'type', 'inteiro_small'
go
execute sp_apagar 'type', 'inteiro_tiny'
go
execute sp_apagar 'type', 'lista_guid'
go
execute sp_apagar 'type', 'logradouro'
go
execute sp_apagar 'type', 'moeda'
go
execute sp_apagar 'type', 'nome_10'
go
execute sp_apagar 'type', 'nome_15'
go
execute sp_apagar 'type', 'nome_20'
go
execute sp_apagar 'type', 'nome_30'
go
execute sp_apagar 'type', 'nome_60'
go
execute sp_apagar 'type', 'numero'
go
execute sp_apagar 'type', 'observacao'
go
execute sp_apagar 'type', 'pais'
go
execute sp_apagar 'type', 'percentual'
go
execute sp_apagar 'type', 'porcento'
go
execute sp_apagar 'type', 'quantidade'
go
execute sp_apagar 'type', 'sim_nao'
go
execute sp_apagar 'type', 'som'
go
execute sp_apagar 'type', 'tempo'
go
execute sp_apagar 'type', 'texto'
go
execute sp_apagar 'type', 'valor'
go
execute sp_apagar 'type', 'www'
go

/**************************************
 Defaults
 ***************************************/
execute sp_apagar 'default', 'traço'
go
execute sp_apagar 'default', 'um'
go
execute sp_apagar 'default', 'zero'
go

execute sp_apagar_defaults 'maquina', 'perfil_nenhum_id'
go
execute sp_apagar_defaults 'maquina', 'perfil_balcao_id'
go
execute sp_apagar_defaults 'maquina', 'perfil_entrega_id'
go
execute sp_apagar_defaults 'maquina', 'perfil_mesa_id'
go
execute sp_apagar_defaults 'maquina', 'perfil_ficha_id'
go
