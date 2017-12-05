/**********************************************
 *** Schema dbo
 **********************************************/
exec sp_descricao_schema 'dbo', 'Esquema das tabelas para catálogos e operacionais'

/**********************************************
 *** tabela acao_touch
 **********************************************/
exec sp_descricao_campo  'acao_touch', 'acao_id', '---', 'dbo'
exec sp_descricao_campo  'acao_touch', 'atalho', '---', 'dbo'
exec sp_descricao_campo  'acao_touch', 'atalho2', '---', 'dbo'
exec sp_descricao_campo  'acao_touch', 'balcao', '---', 'dbo'
exec sp_descricao_campo  'acao_touch', 'caption', '---', 'dbo'
exec sp_descricao_campo  'acao_touch', 'entrega', '---', 'dbo'
exec sp_descricao_campo  'acao_touch', 'ficha', '---', 'dbo'
exec sp_descricao_campo  'acao_touch', 'imagem', '---', 'dbo'
exec sp_descricao_campo  'acao_touch', 'mesa', '---', 'dbo'
exec sp_descricao_campo  'acao_touch', 'transicao', '---', 'dbo'
go

/**********************************************
 *** tabela acesso
 **********************************************/
exec sp_descricao_campo  'acesso', 'bloco_id', 'GUID da funcionalidade', 'dbo'
exec sp_descricao_campo  'acesso', 'dt_alt', 'Data/hora da alteração', 'dbo'
exec sp_descricao_campo  'acesso', 'grupo_id', 'Identificador do grupo', 'dbo'
exec sp_descricao_campo  'acesso', 'modo_venda_id', 'Modo de venda', 'dbo'
exec sp_descricao_campo  'acesso', 'descricao', 'Descricao do acesso', 'dbo'
exec sp_descricao_campo  'acesso', 'status', 'Status do acesso', 'dbo'
go

/**********************************************
 *** tabela atendente_praca
 **********************************************/
exec sp_descricao_campo  'atendente_praca', 'func_id', 'ID do funcionário que atende a praça', 'dbo'
exec sp_descricao_campo  'atendente_praca', 'praca_id', '---', 'dbo'
go

/**********************************************
 *** tabela auth_group
 **********************************************/
exec sp_descricao_campo  'auth_group', 'id', '---', 'dbo'
exec sp_descricao_campo  'auth_group', 'name', '---', 'dbo'
go

/**********************************************
 *** tabela auth_group_modulo
 **********************************************/
exec sp_descricao_campo  'auth_group_modulo', 'alterar', '---', 'dbo'
exec sp_descricao_campo  'auth_group_modulo', 'excluir', '---', 'dbo'
exec sp_descricao_campo  'auth_group_modulo', 'grupo_id', '---', 'dbo'
exec sp_descricao_campo  'auth_group_modulo', 'id', '---', 'dbo'
exec sp_descricao_campo  'auth_group_modulo', 'incluir', '---', 'dbo'
exec sp_descricao_campo  'auth_group_modulo', 'modulo_id', '---', 'dbo'
go

/**********************************************
 *** tabela auth_group_permissions
 **********************************************/
exec sp_descricao_campo  'auth_group_permissions', 'group_id', '---', 'dbo'
exec sp_descricao_campo  'auth_group_permissions', 'id', '---', 'dbo'
exec sp_descricao_campo  'auth_group_permissions', 'permission_id', '---', 'dbo'
go

/**********************************************
 *** tabela auth_permission
 **********************************************/
exec sp_descricao_campo  'auth_permission', 'codename', '---', 'dbo'
exec sp_descricao_campo  'auth_permission', 'content_type_id', '---', 'dbo'
exec sp_descricao_campo  'auth_permission', 'id', '---', 'dbo'
exec sp_descricao_campo  'auth_permission', 'name', '---', 'dbo'
go

/**********************************************
 *** tabela auth_user
 **********************************************/
exec sp_descricao_campo  'auth_user', 'date_joined', '---', 'dbo'
exec sp_descricao_campo  'auth_user', 'email', '---', 'dbo'
exec sp_descricao_campo  'auth_user', 'first_name', '---', 'dbo'
exec sp_descricao_campo  'auth_user', 'id', '---', 'dbo'
exec sp_descricao_campo  'auth_user', 'is_active', '---', 'dbo'
exec sp_descricao_campo  'auth_user', 'is_staff', '---', 'dbo'
exec sp_descricao_campo  'auth_user', 'is_superuser', '---', 'dbo'
exec sp_descricao_campo  'auth_user', 'last_login', '---', 'dbo'
exec sp_descricao_campo  'auth_user', 'last_name', '---', 'dbo'
exec sp_descricao_campo  'auth_user', 'password', '---', 'dbo'
exec sp_descricao_campo  'auth_user', 'username', '---', 'dbo'
go

/**********************************************
 *** tabela auth_user_groups
 **********************************************/
exec sp_descricao_campo  'auth_user_groups', 'group_id', '---', 'dbo'
exec sp_descricao_campo  'auth_user_groups', 'id', '---', 'dbo'
exec sp_descricao_campo  'auth_user_groups', 'user_id', '---', 'dbo'
go

/**********************************************
 *** tabela auth_user_user_permissions
 **********************************************/
exec sp_descricao_campo  'auth_user_user_permissions', 'id', '---', 'dbo'
exec sp_descricao_campo  'auth_user_user_permissions', 'permission_id', '---', 'dbo'
exec sp_descricao_campo  'auth_user_user_permissions', 'user_id', '---', 'dbo'
go

/**********************************************
 *** tabela balanca_material
 **********************************************/
exec sp_descricao_tabela 'balanca_material', 'Utilizada na importação de materiais no colibriBal.exe', 'dbo'
exec sp_descricao_campo  'balanca_material', 'cabec_balanca_depto', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'cod_especial', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'cod_fornec', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'cod_imagem', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'cod_img_cabec', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'cod_img_rod', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'cod_inform_extra', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'cod_inform_nutric', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'desc1_material', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'desc1_receita', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'desc2_material', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'desc2_receita', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'desc3_receita', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'desc4_receita', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'desc5_receita', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'dias_validade', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'etiq_depto', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'imp_embalagem', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'imp_validade', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'indice', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'inform_extra', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'lote', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'material_id', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'rod_balanca_depto', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'tecla_assoc', '---', 'dbo'
exec sp_descricao_campo  'balanca_material', 'versao_preco', '---', 'dbo'
go

/**********************************************
 *** tabela bandeira
 **********************************************/
exec sp_descricao_campo  'bandeira', 'aliases', '---', 'dbo'
exec sp_descricao_campo  'bandeira', 'id', '---', 'dbo'
exec sp_descricao_campo  'bandeira', 'nome', '---', 'dbo'
exec sp_descricao_campo  'bandeira', 'tipo', '---', 'dbo'
go

/**********************************************
 *** tabela biometria
 **********************************************/
exec sp_descricao_campo  'biometria', 'assinatura', '---', 'dbo'
exec sp_descricao_campo  'biometria', 'identificacao', '---', 'dbo'
exec sp_descricao_campo  'biometria', 'valor', '---', 'dbo'
go

/**********************************************
 *** tabela classe
 **********************************************/
exec sp_descricao_campo  'classe', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'classe', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'classe', 'descricao_touch', '---', 'dbo'
exec sp_descricao_campo  'classe', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'classe', 'id', '---', 'dbo'
exec sp_descricao_campo  'classe', 'imagem', '---', 'dbo'
exec sp_descricao_campo  'classe', 'loja_id', '---', 'dbo'
exec sp_descricao_campo  'classe', 'ordem_alfabetica', '---', 'dbo'
exec sp_descricao_campo  'classe', 'permite_combinado', '---', 'dbo'
exec sp_descricao_campo  'classe', 'rede_id', '---', 'dbo'
exec sp_descricao_campo  'classe', 'sub_rede_id', '---', 'dbo'
go

/**********************************************
 *** tabela classe_grupo
 **********************************************/
exec sp_descricao_tabela 'classe_grupo', 'Grupos que pertencem à uma classe. Serve para facilitar a associação de vários materiais à uma classe.', 'dbo'
exec sp_descricao_campo  'classe_grupo', 'classe_id', 'Identificador da classe.', 'dbo'
exec sp_descricao_campo  'classe_grupo', 'dt_alt', 'Data/hora da ultima alteração', 'dbo'
exec sp_descricao_campo  'classe_grupo', 'grupo_id', 'Identificador do grupo.', 'dbo'
exec sp_descricao_campo  'classe_grupo', 'loja_id', 'Identificador da loja.', 'dbo'
exec sp_descricao_campo  'classe_grupo', 'ordem', 'Ordem de exibição do grupo nas telas.', 'dbo'
go

/**********************************************
 *** tabela cliente
 **********************************************/
exec sp_descricao_tabela 'cliente', 'Clientes cadastrados no sistema.', 'dbo'
exec sp_descricao_campo  'cliente', 'ativo', 'Cliente ativo ou não. 0-inativo 1-ativo', 'dbo'
exec sp_descricao_campo  'cliente', 'bairro', 'Bairro do cliente.', 'dbo'
exec sp_descricao_campo  'cliente', 'cep', 'CEP da rua.', 'dbo'
exec sp_descricao_campo  'cliente', 'cidade', 'Cidade onde reside o cliente.', 'dbo'
exec sp_descricao_campo  'cliente', 'cnpj_cpf', 'CNPJ (pessoa jurídica) ou CPF (pessoa física).', 'dbo'
exec sp_descricao_campo  'cliente', 'complemento', 'Complemento do endereço.', 'dbo'
exec sp_descricao_campo  'cliente', 'conta', 'Cliente possui conta assinada ativa no estabelecimento.', 'dbo'
exec sp_descricao_campo  'cliente', 'desconto_id', 'Identificador do desconto associado ao cliente.', 'dbo'
exec sp_descricao_campo  'cliente', 'dt_alt', 'Data/hora da ultima alteração.', 'dbo'
exec sp_descricao_campo  'cliente', 'dt_cadastro', 'Data do cadastro do cliente.', 'dbo'
exec sp_descricao_campo  'cliente', 'dt_hr_primeira_compra', 'Data da 1ª compra no estabelecimento.', 'dbo'
exec sp_descricao_campo  'cliente', 'dt_hr_ultima_compra', '---', 'dbo'
exec sp_descricao_campo  'cliente', 'dt_nascimento', '---', 'dbo'
exec sp_descricao_campo  'cliente', 'dt_validade_conta', 'Data de validade da conta assinada.', 'dbo'
exec sp_descricao_campo  'cliente', 'dt_validade_desconto', 'Data de validade do desconto.', 'dbo'
exec sp_descricao_campo  'cliente', 'email', 'Email do cliente.', 'dbo'
exec sp_descricao_campo  'cliente', 'endereco', 'Endereço do cliente.', 'dbo'
exec sp_descricao_campo  'cliente', 'estado', 'Unidade da federação.', 'dbo'
exec sp_descricao_campo  'cliente', 'fax', 'Nº do fax.', 'dbo'
exec sp_descricao_campo  'cliente', 'foto', 'Foto do cliente.', 'dbo'
exec sp_descricao_campo  'cliente', 'id', 'Identificador unico de cliente.', 'dbo'
exec sp_descricao_campo  'cliente', 'id_externo', 'Código externo para integração com outros aplicativos.', 'dbo'
exec sp_descricao_campo  'cliente', 'identificacao', 'Identificação do cliente (telefone, CPF, RG, etc). Definido por configuração.', 'dbo'
exec sp_descricao_campo  'cliente', 'ie_rg', 'Inscrição estadual (pessoa jurídica) ou RG (pessoa física).', 'dbo'
exec sp_descricao_campo  'cliente', 'limite_conta', 'Valor limite da conta assinada.', 'dbo'
exec sp_descricao_campo  'cliente', 'lote_id', 'Nº do lote de envio para o BI.', 'dbo'
exec sp_descricao_campo  'cliente', 'midia_id', 'Identificador sobre qual midia o cliente soube do estabelecimento.', 'dbo'
exec sp_descricao_campo  'cliente', 'nome', 'Nome do cliente.', 'dbo'
exec sp_descricao_campo  'cliente', 'numero', 'Nº da residência do cliente.', 'dbo'
exec sp_descricao_campo  'cliente', 'referencia', 'Ponto de referência para o endereço.', 'dbo'
exec sp_descricao_campo  'cliente', 'regiao_id', 'Identificador da região do cliente.', 'dbo'
exec sp_descricao_campo  'cliente', 'sexo', 'Sexo do cliente. (M)asculino (F)eminimo', 'dbo'
exec sp_descricao_campo  'cliente', 'status', 'Status do envio para o BI.', 'dbo'
exec sp_descricao_campo  'cliente', 'telefone', 'Nº do telefone.', 'dbo'
exec sp_descricao_campo  'cliente', 'tipo_id', 'Identificador do tipo de cliente.', 'dbo'
go

/**********************************************
 *** tabela codigo_barra
 **********************************************/
exec sp_descricao_campo  'codigo_barra', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'codigo_barra', 'id', '---', 'dbo'
exec sp_descricao_campo  'codigo_barra', 'loja_id', '---', 'dbo'
exec sp_descricao_campo  'codigo_barra', 'material_id', '---', 'dbo'
exec sp_descricao_campo  'codigo_barra', 'rede_id', '---', 'dbo'
exec sp_descricao_campo  'codigo_barra', 'sub_rede_id', '---', 'dbo'
go

/**********************************************
 *** tabela combo
 **********************************************/
exec sp_descricao_campo  'combo', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'combo', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'combo', 'descricao_prod', '---', 'dbo'
exec sp_descricao_campo  'combo', 'descricao_touch', '---', 'dbo'
exec sp_descricao_campo  'combo', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'combo', 'id', '---', 'dbo'
exec sp_descricao_campo  'combo', 'imagem', '---', 'dbo'
exec sp_descricao_campo  'combo', 'local_producao_id', '---', 'dbo'
exec sp_descricao_campo  'combo', 'loja_id', '---', 'dbo'
exec sp_descricao_campo  'combo', 'rede_id', '---', 'dbo'
exec sp_descricao_campo  'combo', 'requer_obs', '---', 'dbo'
exec sp_descricao_campo  'combo', 'sub_rede_id', '---', 'dbo'
exec sp_descricao_campo  'combo', 'vende_web', '---', 'dbo'
exec sp_descricao_campo  'combo', 'grupo_id', '---', 'dbo'
go

/**********************************************
 *** tabela combo_precificador
 **********************************************/
exec sp_descricao_campo  'combo_precificador', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'combo_precificador', 'classe', '---', 'dbo'
exec sp_descricao_campo  'combo_precificador', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'combo_precificador', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'combo_precificador', 'id', '---', 'dbo'
go

/**********************************************
 *** tabela combo_quantificador
 **********************************************/
exec sp_descricao_campo  'combo_quantificador', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'combo_quantificador', 'classe', '---', 'dbo'
exec sp_descricao_campo  'combo_quantificador', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'combo_quantificador', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'combo_quantificador', 'id', '---', 'dbo'
go

/**********************************************
 *** tabela combo_slot
 **********************************************/
exec sp_descricao_campo  'combo_slot', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'combo_slot', 'classe_id', '---', 'dbo'
exec sp_descricao_campo  'combo_slot', 'combo_id', '---', 'dbo'
exec sp_descricao_campo  'combo_slot', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'combo_slot', 'id', '---', 'dbo'
exec sp_descricao_campo  'combo_slot', 'local_producao_id', '---', 'dbo'
exec sp_descricao_campo  'combo_slot', 'material_id', '---', 'dbo'
exec sp_descricao_campo  'combo_slot', 'maximo', '---', 'dbo'
exec sp_descricao_campo  'combo_slot', 'minimo', '---', 'dbo'
exec sp_descricao_campo  'combo_slot', 'ordem', '---', 'dbo'
exec sp_descricao_campo  'combo_slot', 'precificador_id', '---', 'dbo'
exec sp_descricao_campo  'combo_slot', 'preco', '---', 'dbo'
exec sp_descricao_campo  'combo_slot', 'quantificador_id', '---', 'dbo'
go

/**********************************************
 *** tabela config_touch
 **********************************************/
exec sp_descricao_campo  'config_touch', 'cor_botao', 'Cor de fundo do botão', 'dbo'
exec sp_descricao_campo  'config_touch', 'cor_fonte', 'Cor da letra do botão', 'dbo'
exec sp_descricao_campo  'config_touch', 'id', 'ID único do botão', 'dbo'
exec sp_descricao_campo  'config_touch', 'item_id', '---', 'dbo'
exec sp_descricao_campo  'config_touch', 'layout_id', 'Layout ao qual o botão pertence', 'dbo'
exec sp_descricao_campo  'config_touch', 'ordem', 'Posição do botão', 'dbo'
exec sp_descricao_campo  'config_touch', 'tipo', '---', 'dbo'
exec sp_descricao_campo  'config_touch', 'tipo_item_id', '---', 'dbo'
go

/**********************************************
 *** tabela credenciadora
 **********************************************/
exec sp_descricao_campo  'credenciadora', 'aliases', '---', 'dbo'
exec sp_descricao_campo  'credenciadora', 'id', '---', 'dbo'
exec sp_descricao_campo  'credenciadora', 'nome', '---', 'dbo'
go

/**********************************************
 *** tabela desconto
 **********************************************/
exec sp_descricao_campo  'desconto', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'desconto', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'desconto', 'desconto_estrategia_id', '---', 'dbo'
exec sp_descricao_campo  'desconto', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'desconto', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'desconto', 'id', '---', 'dbo'
exec sp_descricao_campo  'desconto', 'pode_alterar', '---', 'dbo'
exec sp_descricao_campo  'desconto', 'valor', '---', 'dbo'
go

/**********************************************
 *** tabela desconto_estrategia
 **********************************************/
exec sp_descricao_tabela 'desconto_estrategia', 'Estratégias de descontos disponíveis.', 'dbo'
exec sp_descricao_campo  'desconto_estrategia', 'aceita_desconto', 'Se o item aceita desconto.', 'dbo'
exec sp_descricao_campo  'desconto_estrategia', 'descricao', 'Descrição da estratégia de desconto.', 'dbo'
exec sp_descricao_campo  'desconto_estrategia', 'dt_alt', 'Data/hora de alteração da estratégia.', 'dbo'
exec sp_descricao_campo  'desconto_estrategia', 'id', 'Identificador único da estratégia de desconto.', 'dbo'
go

/**********************************************
 *** tabela desconto_estrategia_item
 **********************************************/
exec sp_descricao_tabela 'desconto_estrategia_item', 'Item de regra da estratégia de desconto.', 'dbo'
exec sp_descricao_campo  'desconto_estrategia_item', 'desconto_estrategia_id', 'Identificador único da estratégia de desconto.', 'dbo'
exec sp_descricao_campo  'desconto_estrategia_item', 'dt_alt', 'Data/hora de alteração da estratégia.', 'dbo'
exec sp_descricao_campo  'desconto_estrategia_item', 'id', '---', 'dbo'
exec sp_descricao_campo  'desconto_estrategia_item', 'item_id', 'ID do item, conforme o Tipo', 'dbo'
exec sp_descricao_campo  'desconto_estrategia_item', 'tipo_item_id', '---', 'dbo'
go

/**********************************************
 *** tabela django_admin_log
 **********************************************/
exec sp_descricao_campo  'django_admin_log', 'action_flag', '---', 'dbo'
exec sp_descricao_campo  'django_admin_log', 'action_time', '---', 'dbo'
exec sp_descricao_campo  'django_admin_log', 'change_message', '---', 'dbo'
exec sp_descricao_campo  'django_admin_log', 'content_type_id', '---', 'dbo'
exec sp_descricao_campo  'django_admin_log', 'id', '---', 'dbo'
exec sp_descricao_campo  'django_admin_log', 'object_id', '---', 'dbo'
exec sp_descricao_campo  'django_admin_log', 'object_repr', '---', 'dbo'
exec sp_descricao_campo  'django_admin_log', 'user_id', '---', 'dbo'
go

/**********************************************
 *** tabela django_content_type
 **********************************************/
exec sp_descricao_campo  'django_content_type', 'app_label', '---', 'dbo'
exec sp_descricao_campo  'django_content_type', 'id', '---', 'dbo'
exec sp_descricao_campo  'django_content_type', 'model', '---', 'dbo'
go

/**********************************************
 *** tabela django_migrations
 **********************************************/
exec sp_descricao_campo  'django_migrations', 'app', '---', 'dbo'
exec sp_descricao_campo  'django_migrations', 'applied', '---', 'dbo'
exec sp_descricao_campo  'django_migrations', 'id', '---', 'dbo'
exec sp_descricao_campo  'django_migrations', 'name', '---', 'dbo'
go

/**********************************************
 *** tabela django_session
 **********************************************/
exec sp_descricao_campo  'django_session', 'expire_date', '---', 'dbo'
exec sp_descricao_campo  'django_session', 'session_data', '---', 'dbo'
exec sp_descricao_campo  'django_session', 'session_key', '---', 'dbo'
go

/**********************************************
 *** tabela estado
 **********************************************/
exec sp_descricao_tabela 'estado', 'Lista das unidades da federação.', 'dbo'
exec sp_descricao_campo  'estado', 'dt_alt', 'Data/hora da alteração', 'dbo'
exec sp_descricao_campo  'estado', 'nome', 'Nome do Estado', 'dbo'
exec sp_descricao_campo  'estado', 'sigla', 'Sigla do Estado (UF)', 'dbo'
go

/**********************************************
 *** tabela funcao
 **********************************************/
exec sp_descricao_campo  'funcao', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'funcao', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'funcao', 'id', '---', 'dbo'
exec sp_descricao_campo  'funcao', 'nome', '---', 'dbo'
go

/**********************************************
 *** tabela funcionario
 **********************************************/
exec sp_descricao_campo  'funcionario', 'acesso_sistema', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'bairro', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'cep', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'cidade', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'endereco', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'estado', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'funcao_id', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'grupo_id', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'id', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'nome', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'senha', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'telefone', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'usuario', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'usuario_app_id', '---', 'dbo'
exec sp_descricao_campo  'funcionario', 'vl_entrega', '---', 'dbo'
go

/**********************************************
 *** tabela grupo_funcionario
 **********************************************/
exec sp_descricao_campo  'grupo_funcionario', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'grupo_funcionario', 'grupo_id', '---', 'dbo'
exec sp_descricao_campo  'grupo_funcionario', 'nome', '---', 'dbo'
exec sp_descricao_campo  'grupo_funcionario', 'sistema', '---', 'dbo'
go

/**********************************************
 *** tabela grupo_material
 **********************************************/
exec sp_descricao_campo  'grupo_material', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'grupo_material', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'grupo_material', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'grupo_material', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'grupo_material', 'id', '---', 'dbo'
exec sp_descricao_campo  'grupo_material', 'level', '---', 'dbo'
exec sp_descricao_campo  'grupo_material', 'lft', '---', 'dbo'
exec sp_descricao_campo  'grupo_material', 'parent_id', '---', 'dbo'
exec sp_descricao_campo  'grupo_material', 'rede_id', '---', 'dbo'
exec sp_descricao_campo  'grupo_material', 'rght', '---', 'dbo'
exec sp_descricao_campo  'grupo_material', 'tipo', '---', 'dbo'
exec sp_descricao_campo  'grupo_material', 'tree_id', '---', 'dbo'
go

/**********************************************
 *** tabela historico_cliente
 **********************************************/
exec sp_descricao_tabela 'historico_cliente', 'Dados sobre o histórico do cliente no estabelecimento.', 'dbo'
exec sp_descricao_campo  'historico_cliente', 'cliente_id', 'Identificador único de cliente.', 'dbo'
exec sp_descricao_campo  'historico_cliente', 'dt_hora', 'data e hora', 'dbo'
exec sp_descricao_campo  'historico_cliente', 'func_logado_id', '---', 'dbo'
exec sp_descricao_campo  'historico_cliente', 'historico', 'Descrição', 'dbo'
exec sp_descricao_campo  'historico_cliente', 'historico_id', '---', 'dbo'
exec sp_descricao_campo  'historico_cliente', 'ocorrencia_id', 'Identificador da ocorrência', 'dbo'
go

/**********************************************
 *** tabela historico_operacao
 **********************************************/
exec sp_descricao_campo  'historico_operacao', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao', 'dt_hora', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao', 'func_autorizou_id', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao', 'func_logado_id', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao', 'maquina_id', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao', 'operacao_id', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao', 'venda_id', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao', 'versao', '---', 'dbo'
go

/**********************************************
 *** tabela historico_operacao_geral
 **********************************************/
exec sp_descricao_campo  'historico_operacao_geral', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao_geral', 'dt_hora', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao_geral', 'func_autorizou_id', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao_geral', 'func_logado_id', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao_geral', 'maquina_id', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao_geral', 'operacao_id', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao_geral', 'venda_id', '---', 'dbo'
exec sp_descricao_campo  'historico_operacao_geral', 'versao', '---', 'dbo'
go

/**********************************************
 *** tabela impressao
 **********************************************/
exec sp_descricao_campo  'impressao', 'balcao', '---', 'dbo'
exec sp_descricao_campo  'impressao', 'entrega', '---', 'dbo'
exec sp_descricao_campo  'impressao', 'ficha', '---', 'dbo'
exec sp_descricao_campo  'impressao', 'id', '---', 'dbo'
exec sp_descricao_campo  'impressao', 'mesa', '---', 'dbo'
exec sp_descricao_campo  'impressao', 'nenhum', '---', 'dbo'
exec sp_descricao_campo  'impressao', 'nome', '---', 'dbo'
exec sp_descricao_campo  'impressao', 'pasta', '---', 'dbo'
exec sp_descricao_campo  'impressao', 'template', '---', 'dbo'
go

/**********************************************
 *** tabela impressao_fechamento
 **********************************************/
exec sp_descricao_campo  'impressao_fechamento', 'arquivo_sql', '---', 'dbo'
exec sp_descricao_campo  'impressao_fechamento', 'arquivo_template', '---', 'dbo'
exec sp_descricao_campo  'impressao_fechamento', 'imprimir', '---', 'dbo'
exec sp_descricao_campo  'impressao_fechamento', 'nome', '---', 'dbo'
exec sp_descricao_campo  'impressao_fechamento', 'ordem', '---', 'dbo'
exec sp_descricao_campo  'impressao_fechamento', 'sistema', '---', 'dbo'
exec sp_descricao_campo  'impressao_fechamento', 'tipo', '---', 'dbo'
go

/**********************************************
 *** tabela impressora
 **********************************************/
exec sp_descricao_campo  'impressora', 'barcode', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'colunas', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'comprimido', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'cor', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'cortador', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'descomprimido', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'desenfatizado', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'desexpandido', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'desliga_autenticacao', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'dispositivo_id', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'eject', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'enfatizado', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'expandido', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'fim', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'fimbarcode', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'fimqrcode', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'foto', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'gaveta', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'id', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'inicio', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'liga_autenticacao', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'marca', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'modelo', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'nome', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'normal', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'qrcode', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'salto', '---', 'dbo'
exec sp_descricao_campo  'impressora', 'sistema', '---', 'dbo'
go

/**********************************************
 *** tabela item_classe
 **********************************************/
exec sp_descricao_campo  'item_classe', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'item_classe', 'classe_id', '---', 'dbo'
exec sp_descricao_campo  'item_classe', 'classe_item_id', '---', 'dbo'
exec sp_descricao_campo  'item_classe', 'combo_item_id', '---', 'dbo'
exec sp_descricao_campo  'item_classe', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'item_classe', 'id', '---', 'dbo'
exec sp_descricao_campo  'item_classe', 'material_item_id', '---', 'dbo'
exec sp_descricao_campo  'item_classe', 'ordem', '---', 'dbo'
exec sp_descricao_campo  'item_classe', 'tipo', '---', 'dbo'
go

/**********************************************
 *** tabela item_preco
 **********************************************/
exec sp_descricao_campo  'item_preco', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'item_preco', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'item_preco', 'id', '---', 'dbo'
exec sp_descricao_campo  'item_preco', 'material_id', '---', 'dbo'
exec sp_descricao_campo  'item_preco', 'preco', '---', 'dbo'
exec sp_descricao_campo  'item_preco', 'tabela_id', '---', 'dbo'
go


/**********************************************
 *** tabela layout_touch
 **********************************************/
exec sp_descricao_campo  'layout_touch', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'layout_touch', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'layout_touch', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'layout_touch', 'id', '---', 'dbo'
exec sp_descricao_campo  'layout_touch', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'layout_touch', 'rede_id', '---', 'dbo'
go

/**********************************************
 *** tabela local_producao
 **********************************************/
exec sp_descricao_campo  'local_producao', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'local_producao', 'id', '---', 'dbo'
exec sp_descricao_campo  'local_producao', 'nome', '---', 'dbo'
go

/**********************************************
 *** tabela loja
 **********************************************/
exec sp_descricao_campo  'loja', 'loja_id', '---', 'dbo'
exec sp_descricao_campo  'loja', 'nome', '---', 'dbo'
exec sp_descricao_campo  'loja', 'rede_id', '---', 'dbo'
go

/**********************************************
 *** tabela maquina
 **********************************************/
exec sp_descricao_campo  'maquina', 'ativa_auto_pagamento', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'caminho', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'display_lcd', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'exibe_atalhos', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'atendente_abertura', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'inicia_auto_pagamento', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'layout_balcao_id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'layout_entrega_id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'layout_ficha_id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'layout_mesa_id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'login_biometria', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'login_senha', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'nome', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'perfil_balcao_id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'perfil_entrega_id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'perfil_ficha_id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'perfil_mesa_id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'perfil_nenhum_id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'perm_sair_ticket', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'ponto_balcao_id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'ponto_entrega_id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'ponto_ficha_id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'ponto_mesa_id', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'solicita_atendente', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'terminal_caixa', '---', 'dbo'
exec sp_descricao_campo  'maquina', 'usa_tef', '---', 'dbo'
go

/**********************************************
 *** tabela material
 **********************************************/
exec sp_descricao_campo  'material', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'material', 'balanca', '---', 'dbo'
exec sp_descricao_campo  'material', 'cod_externo', '---', 'dbo'
exec sp_descricao_campo  'material', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'material', 'consumacao', '---', 'dbo'
exec sp_descricao_campo  'material', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'material', 'descricao_producao', '---', 'dbo'
exec sp_descricao_campo  'material', 'descricao_touch', '---', 'dbo'
exec sp_descricao_campo  'material', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'material', 'fabricacao_propria', '---', 'dbo'
exec sp_descricao_campo  'material', 'grupo_id', '---', 'dbo'
exec sp_descricao_campo  'material', 'id', '---', 'dbo'
exec sp_descricao_campo  'material', 'imagem', '---', 'dbo'
exec sp_descricao_campo  'material', 'local_producao_id', '---', 'dbo'
exec sp_descricao_campo  'material', 'loja_id', '---', 'dbo'
exec sp_descricao_campo  'material', 'qtde_frac', '---', 'dbo'
exec sp_descricao_campo  'material', 'rede_id', '---', 'dbo'
exec sp_descricao_campo  'material', 'requer_obs', '---', 'dbo'
exec sp_descricao_campo  'material', 'servico', '---', 'dbo'
exec sp_descricao_campo  'material', 'sub_rede_id', '---', 'dbo'
exec sp_descricao_campo  'material', 'tecla_prog', '---', 'dbo'
exec sp_descricao_campo  'material', 'unidade', '---', 'dbo'
exec sp_descricao_campo  'material', 'venda', '---', 'dbo'
exec sp_descricao_campo  'material', 'vende_combo', '---', 'dbo'
exec sp_descricao_campo  'material', 'vende_web', '---', 'dbo'
go

/**********************************************
 *** tabela material_obs
 **********************************************/
exec sp_descricao_campo  'material_obs', 'combo_id', '---', 'dbo'
exec sp_descricao_campo  'material_obs', 'id', '---', 'dbo'
exec sp_descricao_campo  'material_obs', 'material_id', '---', 'dbo'
exec sp_descricao_campo  'material_obs', 'observacao_id', '---', 'dbo'
exec sp_descricao_campo  'material_obs', 'posicao', '---', 'dbo'
go

/**********************************************
 *** tabela meio_pagamento
 **********************************************/
exec sp_descricao_campo  'meio_pagamento', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'cor', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'id', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'imagem', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'loja_id', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'multiplo', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'ordem', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'rede_id', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'sub_rede_id', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'tef', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'tipo_tef', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'troco_contravale', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'troco_dinheiro', '---', 'dbo'
exec sp_descricao_campo  'meio_pagamento', 'troco_repique', '---', 'dbo'
go

/**********************************************
 *** tabela midia
 **********************************************/
exec sp_descricao_tabela 'midia', 'Lista dos tipos de mídia cadastradas no sistema. Utilizado pelo cadastro de materiais para indicar como o cliente tomou conhecimento do estabelecimento.', 'dbo'
exec sp_descricao_campo  'midia', 'dt_alt', 'Data e hora de alteração', 'dbo'
exec sp_descricao_campo  'midia', 'midia_id', 'Identificador da midia', 'dbo'
exec sp_descricao_campo  'midia', 'nome', 'Descrição da mídia', 'dbo'
go

/**********************************************
 *** tabela modo_venda
 **********************************************/
exec sp_descricao_tabela 'modo_venda', 'Modos de venda disponíveis no sistema', 'dbo'
exec sp_descricao_campo  'modo_venda', 'codigo', 'Código do modo de venda', 'dbo'
exec sp_descricao_campo  'modo_venda', 'id', 'Identificador do modo de venda', 'dbo'
exec sp_descricao_campo  'modo_venda', 'nome', 'Nome amigável do modo de venda', 'dbo'
go

/**********************************************
 *** tabela motivo_cancelamento
 **********************************************/
exec sp_descricao_campo  'motivo_cancelamento', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'motivo_cancelamento', 'baixa_estoque', '---', 'dbo'
exec sp_descricao_campo  'motivo_cancelamento', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'motivo_cancelamento', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'motivo_cancelamento', 'id', '---', 'dbo'
exec sp_descricao_campo  'motivo_cancelamento', 'loja_id', '---', 'dbo'
exec sp_descricao_campo  'motivo_cancelamento', 'nome', '---', 'dbo'
exec sp_descricao_campo  'motivo_cancelamento', 'rede_id', '---', 'dbo'
exec sp_descricao_campo  'motivo_cancelamento', 'sub_rede_id', '---', 'dbo'
go

/**********************************************
 *** tabela movimento_caixa
 **********************************************/
exec sp_descricao_tabela 'movimento_caixa', 'Armazena os recebimentos de uma operação.', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'autorizacao', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'bandeira', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'cancelado', 'se o movimentocaixageral está cancelado -> 1.', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'cliente_id', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'credenciadora', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'dt_alt', 'data de cadastro/última alteração.', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'dt_hr_cancelamento', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'dt_hr_pagamento', 'Data efetiva do movimento.', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'func_autorizou_id', 'ID do funcionario que autorizou o cancelamento.', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'func_cancelou_id', 'ID do funcionario que cancelou', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'func_recebeu_id', 'ID do funcionario que recebeu', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'identificacao', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'maquina_id', 'ID da maquina onde foi feito o recebimento.', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'meio_pagamento_id', 'ID do meio de recebimento.', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'movimento_caixa_id', 'identificador.', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'operacao_id', 'ID da operacao.', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'versao', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa', 'vl_recebido', 'valor do recebimento.', 'dbo'
go

/**********************************************
 *** tabela movimento_caixa_geral
 **********************************************/
exec sp_descricao_tabela 'movimento_caixa_geral', 'Armazena os recebimentos de uma operação.', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'autorizacao', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'bandeira', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'cancelado', 'se o movimentocaixageral está cancelado -> 1.', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'cliente_id', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'credenciadora', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'dt_alt', 'data de cadastro/última alteração.', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'dt_hr_cancelamento', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'dt_hr_pagamento', 'Data efetiva do movimento.', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'func_autorizou_id', 'ID do funcionario que autorizou o cancelamento.', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'func_cancelou_id', 'ID do funcionario que cancelou', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'func_recebeu_id', 'ID do funcionario que recebeu', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'identificacao', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'maquina_id', 'ID da maquina onde foi feito o recebimento.', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'meio_pagamento_id', 'ID do meio de recebimento.', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'movimento_caixa_id', 'identificador.', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'operacao_id', 'ID da operacao.', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'versao', '---', 'dbo'
exec sp_descricao_campo  'movimento_caixa_geral', 'vl_recebido', 'valor do recebimento.', 'dbo'
go

/**********************************************
 *** tabela observacao
 **********************************************/
exec sp_descricao_campo  'observacao', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'observacao', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'observacao', 'id', '---', 'dbo'
exec sp_descricao_campo  'observacao', 'loja_id', '---', 'dbo'
exec sp_descricao_campo  'observacao', 'nome', '---', 'dbo'
exec sp_descricao_campo  'observacao', 'rede_id', '---', 'dbo'
exec sp_descricao_campo  'observacao', 'sub_rede_id', '---', 'dbo'
go

/**********************************************
 *** tabela operacao
 **********************************************/
exec sp_descricao_campo  'operacao', 'cancelada', 'Operação cancelada (0) não (1) sim', 'dbo'
exec sp_descricao_campo  'operacao', 'comprovante', '---', 'dbo'
exec sp_descricao_campo  'operacao', 'comprovante_chave', '---', 'dbo'
exec sp_descricao_campo  'operacao', 'comprovante_ressalva', '---', 'dbo'
exec sp_descricao_campo  'operacao', 'comprovante_status', '---', 'dbo'
exec sp_descricao_campo  'operacao', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'operacao', 'dt_alt', 'Data/hora de alteração.', 'dbo'
exec sp_descricao_campo  'operacao', 'dt_contabil', 'Data contabil.', 'dbo'
exec sp_descricao_campo  'operacao', 'dt_hr_cancelamento', '---', 'dbo'
exec sp_descricao_campo  'operacao', 'func_autorizou_id', '---', 'dbo'
exec sp_descricao_campo  'operacao', 'func_cancelou_id', '---', 'dbo'
exec sp_descricao_campo  'operacao', 'func_logado_id', '---', 'dbo'
exec sp_descricao_campo  'operacao', 'maquina_id', 'ID da máquina onde a operação foi criada.', 'dbo'
exec sp_descricao_campo  'operacao', 'operacao_id', 'Identificador da operação.', 'dbo'
exec sp_descricao_campo  'operacao', 'tipo', 'Tipo de operacao (venda, conta assinada, sangria, suprimento).', 'dbo'
exec sp_descricao_campo  'operacao', 'vl_total', 'Valor total da operação.', 'dbo'
go

/**********************************************
 *** tabela operacao_geral
 **********************************************/
exec sp_descricao_campo  'operacao_geral', 'cancelada', 'Diz se a operacaogeral foi cancelada.', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'comprovante', '---', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'comprovante_chave', '---', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'comprovante_ressalva', '---', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'comprovante_status', '---', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'dt_alt', 'Data/hora de alteração.', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'dt_contabil', 'Data contabil.', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'dt_hr_cancelamento', '---', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'func_autorizou_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'func_cancelou_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'func_logado_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'maquina_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'operacao_id', 'Identificador.', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'tipo', 'Tipo de operacaogeral (Venda, Conta assinada).', 'dbo'
exec sp_descricao_campo  'operacao_geral', 'vl_total', 'Valor total da conta', 'dbo'
go

/**********************************************
 *** tabela operacao_venda
 **********************************************/
exec sp_descricao_campo  'operacao_venda', 'consumidor', 'ID do consumidor.', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'desconto', 'Descrição do desconto.', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'desconto_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'dt_alt', 'data/hora de alteração.', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'dt_hr_encerramento', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'dt_hr_expedicao', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'encerrada', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'func_encerrou_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'func_entregou_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'func_expediu_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'maquina_encerrou_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'modo_venda_id', 'identificador do modo de venda.', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'operacao_id', 'identificador e referência a operacao.', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'paga', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'pct_desconto', 'Percentual do desconto.', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'pct_servico', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'qtd_pessoas', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_acrescimo', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_consumacao', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_consumacao_maxima', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_desconto', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_diferenca_consumacao', 'Valor de consumação que excedeu o total consumido.', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_entrada', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_entrada_maxima', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_outros', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_servico', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_servico_informado', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_subtotal_itens', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_subtotal_para_desconto', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_subtotal_para_servico', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_taxa_de_entrega', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_taxa_de_entrega_calculada', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda', 'vl_taxa_de_entrega_informada', '---', 'dbo'
go

/**********************************************
 *** tabela operacao_venda_geral
 **********************************************/
exec sp_descricao_campo  'operacao_venda_geral', 'consumidor', 'ID do consumidor.', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'desconto', 'Descrição do desconto.', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'desconto_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'dt_alt', 'data/hora de alteração.', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'dt_hr_encerramento', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'dt_hr_expedicao', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'encerrada', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'func_encerrou_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'func_entregou_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'func_expediu_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'maquina_encerrou_id', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'modo_venda_id', 'identificador do modo de venda.', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'operacao_id', 'identificador e referência a operacao.', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'paga', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'pct_desconto', 'Percentual do desconto.', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'pct_servico', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'qtd_pessoas', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_acrescimo', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_consumacao', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_consumacao_maxima', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_desconto', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_diferenca_consumacao', 'Valor de consumação que excedeu o total consumido.', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_entrada', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_entrada_maxima', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_outros', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_servico', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_servico_informado', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_subtotal_itens', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_subtotal_para_desconto', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_subtotal_para_servico', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_taxa_de_entrega', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_taxa_de_entrega_calculada', '---', 'dbo'
exec sp_descricao_campo  'operacao_venda_geral', 'vl_taxa_de_entrega_informada', '---', 'dbo'
go

/**********************************************
 *** tabela parametro
 **********************************************/
exec sp_descricao_campo  'parametro', 'altera_com_periodo_aberto', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'categoria', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'descr', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'detalhes', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'dll', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'list_sql', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'lista', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'mascara', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'subcategoria', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'tipo_param', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'tipo_valor', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'valor', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'valor_default', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'valor_max', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'valor_min', '---', 'dbo'
exec sp_descricao_campo  'parametro', 'visivel', '---', 'dbo'
go

/**********************************************
 *** tabela parametro_modo
 **********************************************/
exec sp_descricao_campo  'parametro_modo', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'parametro_modo', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'parametro_modo', 'valor', '---', 'dbo'
exec sp_descricao_campo  'parametro_modo', 'visivel', '---', 'dbo'
go

/**********************************************
 *** tabela pendura
 **********************************************/
exec sp_descricao_tabela 'pendura', 'Extrato de conta assinada. Armazena todos os lançamentos de conta assinada a débito ou crédito.', 'dbo'
exec sp_descricao_campo  'pendura', 'cancelado', '---', 'dbo'
exec sp_descricao_campo  'pendura', 'cliente_id', 'Identificador único de cliente.', 'dbo'
exec sp_descricao_campo  'pendura', 'dt_contabil', 'Data contábil do movimento.', 'dbo'
exec sp_descricao_campo  'pendura', 'dt_hr_pendura', 'Data e hora da pendura', 'dbo'
exec sp_descricao_campo  'pendura', 'movimento_id', '---', 'dbo'
exec sp_descricao_campo  'pendura', 'obs', 'Observação', 'dbo'
exec sp_descricao_campo  'pendura', 'operacao_id', 'Identificador da operacao associada ao lançamento. ', 'dbo'
exec sp_descricao_campo  'pendura', 'pendura_id', 'Identificador da pendura', 'dbo'
exec sp_descricao_campo  'pendura', 'saldo', 'Saldo diário do cliente', 'dbo'
exec sp_descricao_campo  'pendura', 'vl_total', 'Valor do lançamento na conta corrente. Positivo se crédito, negativo se débito.', 'dbo'
go

/**********************************************
 *** tabela perfil
 **********************************************/
exec sp_descricao_tabela 'perfil', 'Lista de perfis disponíveis para o estabelecimento. O perfil é utilizado no módulo ficha para definir rapidamente no checkin os valores de entrada e consumação.', 'dbo'
exec sp_descricao_campo  'perfil', 'ativo', 'Indica se está ativo', 'dbo'
exec sp_descricao_campo  'perfil', 'codigo', 'Código do perfil', 'dbo'
exec sp_descricao_campo  'perfil', 'descricao', 'Descrição do perfil', 'dbo'
exec sp_descricao_campo  'perfil', 'loja_id', 'Identificador da loja', 'dbo'
exec sp_descricao_campo  'perfil', 'nome', 'Nome do perfil', 'dbo'
exec sp_descricao_campo  'perfil', 'id', 'Identificador do perfil', 'dbo'
exec sp_descricao_campo  'perfil', 'protegido', '---', 'dbo'
exec sp_descricao_campo  'perfil', 'exceto', 'Dias e horarios de exceção', 'dbo'
exec sp_descricao_campo  'perfil', 'sexo', '---', 'dbo'
exec sp_descricao_campo  'perfil', 'vl_consumacao', 'Valor da consumação', 'dbo'
exec sp_descricao_campo  'perfil', 'vl_entrada', 'Valor da entrada', 'dbo'
exec sp_descricao_campo  'perfil', 'vl_limite', 'Valor de gasto limite', 'dbo'
go

/**********************************************
 *** tabela perfil_impressao
 **********************************************/
exec sp_descricao_campo  'perfil_impressao', 'adiar_remota', '---', 'dbo'
exec sp_descricao_campo  'perfil_impressao', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'perfil_impressao', 'id', '---', 'dbo'
exec sp_descricao_campo  'perfil_impressao', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'perfil_impressao', 'nome', '---', 'dbo'
exec sp_descricao_campo  'perfil_impressao', 'sistema', '---', 'dbo'
go

/**********************************************
 *** tabela perfil_impressao_detalhe
 **********************************************/
exec sp_descricao_campo  'perfil_impressao_detalhe', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'perfil_impressao_detalhe', 'impressao_id', '---', 'dbo'
exec sp_descricao_campo  'perfil_impressao_detalhe', 'local_producao_id', '---', 'dbo'
exec sp_descricao_campo  'perfil_impressao_detalhe', 'perfil_id', '---', 'dbo'
exec sp_descricao_campo  'perfil_impressao_detalhe', 'ponto_impressao_id', '---', 'dbo'
exec sp_descricao_campo  'perfil_impressao_detalhe', 'tipo', '---', 'dbo'
go

/**********************************************
 *** tabela periodo
 **********************************************/
exec sp_descricao_tabela 'periodo', 'Dados sobre a abertura e fechamento do período.', 'dbo'
exec sp_descricao_campo  'periodo', 'dt_contabil', 'Data contábil', 'dbo'
exec sp_descricao_campo  'periodo', 'dt_hr_abertura', 'Data e hora da abertura', 'dbo'
exec sp_descricao_campo  'periodo', 'dt_hr_fechamento', 'Data e hora de fechamento', 'dbo'
exec sp_descricao_campo  'periodo', 'func_abriu_id', 'Funcionario que abriu o periodo', 'dbo'
exec sp_descricao_campo  'periodo', 'func_fechou_id', 'Funcionário que fechou o periodo', 'dbo'
go

/**********************************************
 *** tabela plugin
 **********************************************/
exec sp_descricao_tabela 'plugin', 'Plugins do sistema.', 'dbo'
exec sp_descricao_campo  'plugin', 'arquivo', 'Nome do arquivo do plugin.', 'dbo'
exec sp_descricao_campo  'plugin', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'plugin', 'dt_criacao', 'Data de criacao do plugin.', 'dbo'
exec sp_descricao_campo  'plugin', 'nome', 'Nome do plugin.', 'dbo'
exec sp_descricao_campo  'plugin', 'pasta', 'Caminho do plugin.', 'dbo'
exec sp_descricao_campo  'plugin', 'versao', 'Versao do plugin.', 'dbo'
go

/**********************************************
 *** tabela plugin_config
 **********************************************/
exec sp_descricao_campo  'plugin_config', 'configuracao', '---', 'dbo'
exec sp_descricao_campo  'plugin_config', 'maquina_id', '---', 'dbo'
exec sp_descricao_campo  'plugin_config', 'plugin', '---', 'dbo'
exec sp_descricao_campo  'plugin_config', 'valor', '---', 'dbo'
go

/**********************************************
 *** tabela plugin_maquina
 **********************************************/
exec sp_descricao_tabela 'plugin_maquina', 'Plugin x maquina.', 'dbo'
exec sp_descricao_campo  'plugin_maquina', 'ativo', 'Se o plugin esta ativo.', 'dbo'
exec sp_descricao_campo  'plugin_maquina', 'maquina_id', 'ID da maquina.', 'dbo'
exec sp_descricao_campo  'plugin_maquina', 'nome', 'Nome do plugin.', 'dbo'
go

/**********************************************
 *** tabela ponto_impressao
 **********************************************/
exec sp_descricao_campo  'ponto_impressao', 'id', '---', 'dbo'
exec sp_descricao_campo  'ponto_impressao', 'impressora_backup_id', '---', 'dbo'
exec sp_descricao_campo  'ponto_impressao', 'impressora_id', '---', 'dbo'
exec sp_descricao_campo  'ponto_impressao', 'nome', '---', 'dbo'
exec sp_descricao_campo  'ponto_impressao', 'porta', '---', 'dbo'
exec sp_descricao_campo  'ponto_impressao', 'porta_backup', '---', 'dbo'
go

/**********************************************
 *** tabela ponto_venda
 **********************************************/
exec sp_descricao_campo  'ponto_venda', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'ponto_venda', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'ponto_venda', 'id', '---', 'dbo'
exec sp_descricao_campo  'ponto_venda', 'nome', '---', 'dbo'
go

/**********************************************
 *** tabela praca
 **********************************************/
exec sp_descricao_campo  'praca', 'id', '---', 'dbo'
exec sp_descricao_campo  'praca', 'nome', '---', 'dbo'
go

/**********************************************
 *** tabela pre_pagamento
 **********************************************/
exec sp_descricao_tabela 'pre_pagamento', 'Armazena os pré-pagamentos, que serão utilizados para popular um movimento de caixa', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'autorizacao', '---', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'bandeira', '---', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'cancelado', 'se o movimentocaixageral está cancelado -> 1.', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'cliente_id', '---', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'credenciadora', '---', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'dt_alt', 'data de cadastro/última alteração.', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'dt_hr_cancelamento', '---', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'dt_hr_pagamento', 'Data efetiva do movimento.', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'func_autorizou_id', 'ID do funcionario que autorizou o cancelamento.', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'func_cancelou_id', 'ID do funcionario que cancelou', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'func_recebeu_id', 'ID do funcionario que recebeu', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'identificacao', '---', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'maquina_id', 'ID da maquina onde foi feito o recebimento.', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'meio_pagamento_id', 'ID do meio de recebimento.', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'movimento_caixa_id', 'identificador.', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'operacao_id', 'ID da operacao.', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'versao', '---', 'dbo'
exec sp_descricao_campo  'pre_pagamento', 'vl_recebido', 'valor do recebimento.', 'dbo'
go

/**********************************************
 *** tabela promocao
 **********************************************/
exec sp_descricao_tabela 'promocao', 'Lista das promoções disponíveis no estabelecimento. Cada promoção pode ser configurada para um período do dia e para alguns dias na semana.', 'dbo'
exec sp_descricao_campo  'promocao', 'ativo', 'Indica se a promoção está ativa.', 'dbo'
exec sp_descricao_campo  'promocao', 'balcao', 'Promoção válida para balcão.', 'dbo'
exec sp_descricao_campo  'promocao', 'dt_fim', 'Data de término da promoção.', 'dbo'
exec sp_descricao_campo  'promocao', 'dt_inicio', 'Data de início da promoção.', 'dbo'
exec sp_descricao_campo  'promocao', 'descricao', 'Descrição detalhada da promoção.', 'dbo'
exec sp_descricao_campo  'promocao', 'dt_alt', 'Data/hora da última alteração.', 'dbo'
exec sp_descricao_campo  'promocao', 'entrega', 'Promoção válida para entrega.', 'dbo'
exec sp_descricao_campo  'promocao', 'ficha', 'Promoção válida para ficha.', 'dbo'
exec sp_descricao_campo  'promocao', 'loja_id', 'Identificador da loja.', 'dbo'
exec sp_descricao_campo  'promocao', 'mesa', 'Promoção válida para mesa.', 'dbo'

go

/**********************************************
 *** tabela promocao_item
 **********************************************/
exec sp_descricao_tabela 'promocao_item', 'Lista dos materias ou grupos presentes em cada uma das promoções cadastradas no sistema. ', 'dbo'
exec sp_descricao_campo  'promocao_item', 'tipo_item', 'Tipo GR (grupo) ou MA (material)', 'dbo'
exec sp_descricao_campo  'promocao_item', 'tipo_promocao', 'Perc (percentual) ou (Fixo) preço fixo', 'dbo'
exec sp_descricao_campo  'promocao_item', 'item_id', 'Identificador do item', 'dbo'
exec sp_descricao_campo  'promocao_item', 'valor', 'Valor da promocao', 'dbo'
go

/**********************************************
 *** tabela promocao_dia
 **********************************************/
exec sp_descricao_tabela 'promocao_dia', 'Lista dos dias e horários definidos para uma promocao ', 'dbo'
exec sp_descricao_campo  'promocao_dia', 'dia_semana', 'Inteiro correspondente ao dia da semana 1-Domingo', 'dbo'
exec sp_descricao_campo  'promocao_dia', 'hr_inicio', 'Hora inicio da promoção', 'dbo'
exec sp_descricao_campo  'promocao_dia', 'hr_fim', 'Hora fim da promoção', 'dbo'
go

/**********************************************
 *** tabela rede
 **********************************************/
exec sp_descricao_campo  'rede', 'nome', '---', 'dbo'
exec sp_descricao_campo  'rede', 'rede_id', '---', 'dbo'
exec sp_descricao_campo  'rede', 'rede_pai_id', '---', 'dbo'
go

/**********************************************
 *** tabela regiao
 **********************************************/
exec sp_descricao_tabela 'regiao', 'Lista das regiões cadastradas no sistema. Utilizada pelo módulo de entrega para calcular o valor da taxa de entrega.', 'dbo'
exec sp_descricao_campo  'regiao', 'dt_alt', 'Data e hora da última alteração', 'dbo'
exec sp_descricao_campo  'regiao', 'nome', 'Nome', 'dbo'
exec sp_descricao_campo  'regiao', 'id', 'Identificador da regiao', 'dbo'
exec sp_descricao_campo  'regiao', 'taxa', 'Quantidade de taxas a cobrar', 'dbo'
go

/**********************************************
 *** tabela script
 **********************************************/
exec sp_descricao_campo  'script', 'dt_exec', '---', 'dbo'
exec sp_descricao_campo  'script', 'script', '---', 'dbo'
exec sp_descricao_campo  'script', 'versao', '---', 'dbo'
go

/**********************************************
 *** tabela tabela_preco
 **********************************************/
exec sp_descricao_campo  'tabela_preco', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'tabela_preco', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'tabela_preco', 'dt_vigencia', '---', 'dbo'
exec sp_descricao_campo  'tabela_preco', 'id', '---', 'dbo'
exec sp_descricao_campo  'tabela_preco', 'loja_id', '---', 'dbo'
exec sp_descricao_campo  'tabela_preco', 'nome', '---', 'dbo'
go

/**********************************************
 *** tabela ticket
 **********************************************/
exec sp_descricao_tabela 'ticket', 'Lista de tickets utilizados pelo estabelecimento (balão, mesa, ficha, pedidos).', 'dbo'
exec sp_descricao_campo  'ticket', 'apelido', '---', 'dbo'
exec sp_descricao_campo  'ticket', 'apelido_origem', '---', 'dbo'
exec sp_descricao_campo  'ticket', 'ativo', 'Se o ticket está ativo ou não.', 'dbo'
exec sp_descricao_campo  'ticket', 'cliente_id', 'ID do cliente associado ao ticket.', 'dbo'
exec sp_descricao_campo  'ticket', 'codigo', 'Código do ticket.', 'dbo'
exec sp_descricao_campo  'ticket', 'codigo_pai', '---', 'dbo'
exec sp_descricao_campo  'ticket', 'dt_alt', 'Data de alteração.', 'dbo'
exec sp_descricao_campo  'ticket', 'dt_hr_abertura', '---', 'dbo'
exec sp_descricao_campo  'ticket', 'estado', 'Estado do ticket.', 'dbo'
exec sp_descricao_campo  'ticket', 'limite_consumo', '---', 'dbo'
exec sp_descricao_campo  'ticket', 'modo_venda_id', 'Código do tipo da venda.', 'dbo'
exec sp_descricao_campo  'ticket', 'pct_servico', 'Percentual de serviço.', 'dbo'
exec sp_descricao_campo  'ticket', 'perfil_id', '---', 'dbo'
exec sp_descricao_campo  'ticket', 'praca_id', 'Identificacao da praça.', 'dbo'
exec sp_descricao_campo  'ticket', 'ticket_id', 'Identificador.', 'dbo'
exec sp_descricao_campo  'ticket', 'ticket_pai_id', '---', 'dbo'
exec sp_descricao_campo  'ticket', 'venda_id', 'ID do consumo relacionado ao ticket.', 'dbo'
go

/**********************************************
 *** tabela tipo_cliente
 **********************************************/
exec sp_descricao_tabela 'tipo_cliente', 'Tipos de cliente cadastrados no sistema. Serve como classificação para um cliente.', 'dbo'
exec sp_descricao_campo  'tipo_cliente', 'dt_alt', 'Data/hora da última alteração.', 'dbo'
exec sp_descricao_campo  'tipo_cliente', 'lote_id', 'Nº do lote de envio para o BI.', 'dbo'
exec sp_descricao_campo  'tipo_cliente', 'nome', 'Descrição do tipo de cliente.', 'dbo'
exec sp_descricao_campo  'tipo_cliente', 'status', 'Status do envio para o BI.', 'dbo'
exec sp_descricao_campo  'tipo_cliente', 'id', 'Identificador do tipo de cliente.', 'dbo'
go

/**********************************************
 *** tabela transaclog
 **********************************************/
exec sp_descricao_tabela 'transaclog', 'Log de conexão do aplicativo transact.', 'dbo'
exec sp_descricao_campo  'transaclog', 'data', 'Data da transação', 'dbo'
exec sp_descricao_campo  'transaclog', 'transacao', 'Descrição do log de transação', 'dbo'
go

/**********************************************
 *** tabela turno
 **********************************************/
exec sp_descricao_tabela 'turno', 'Tabela utilizada para a conferência do caixa, durante o fechamento de caixa.', 'dbo'
exec sp_descricao_campo  'turno', 'dt_contabil', 'Data contábil', 'dbo'
exec sp_descricao_campo  'turno', 'dt_hr_abertura', 'Data/hora de abertura do caixa', 'dbo'
exec sp_descricao_campo  'turno', 'dt_hr_fechamento', 'Data/hora de fechamento do caixa', 'dbo'
exec sp_descricao_campo  'turno', 'func_id', 'Identificador do funcionário', 'dbo'
exec sp_descricao_campo  'turno', 'turno_id', 'Identificador do movimento', 'dbo'
go

/**********************************************
 *** tabela turno_conferencia
 **********************************************/
exec sp_descricao_tabela 'turno_conferencia', 'Valores de caixa conferidos durante o fechamento do operador.', 'dbo'
exec sp_descricao_campo  'turno_conferencia', 'meio_pagamento_id', 'Identificador do tipo de recebimento', 'dbo'
exec sp_descricao_campo  'turno_conferencia', 'turno_id', 'Identificador do movimento do caixa', 'dbo'
exec sp_descricao_campo  'turno_conferencia', 'vl_digitado', '---', 'dbo'
go

/**********************************************
 *** tabela usuario
 **********************************************/
exec sp_descricao_campo  'usuario', 'id', '---', 'dbo'
exec sp_descricao_campo  'usuario', 'is_active', '---', 'dbo'
exec sp_descricao_campo  'usuario', 'is_admin', '---', 'dbo'
exec sp_descricao_campo  'usuario', 'last_login', '---', 'dbo'
exec sp_descricao_campo  'usuario', 'login', '---', 'dbo'
exec sp_descricao_campo  'usuario', 'password', '---', 'dbo'
go

/**********************************************
 *** tabela venda
 **********************************************/
exec sp_descricao_tabela 'venda', 'Dados gerais do consumo (somente do dia).', 'dbo'
exec sp_descricao_campo  'venda', 'cancelado', '---', 'dbo'
exec sp_descricao_campo  'venda', 'cliente_id', 'Identificador do cliente associado à venda.', 'dbo'
exec sp_descricao_campo  'venda', 'codigo_situacao', '(N) Não cancelado (D)epois da produção (A)ntes da produção', 'dbo'
exec sp_descricao_campo  'venda', 'codigo_ticket', 'Codigo do ticket que contém ou continha a venda', 'dbo'
exec sp_descricao_campo  'venda', 'dt_alt', 'Data/hora da última alteração.', 'dbo'
exec sp_descricao_campo  'venda', 'dt_contabil', 'Data contábil do sistema.', 'dbo'
exec sp_descricao_campo  'venda', 'dt_hr_abertura', '---', 'dbo'
exec sp_descricao_campo  'venda', 'dt_hr_ultimo_consumo', '---', 'dbo'
exec sp_descricao_campo  'venda', 'func_atendeu_id', '---', 'dbo'
exec sp_descricao_campo  'venda', 'maquina_id', 'Identificador da máquina onde a venda foi aberta.', 'dbo'
exec sp_descricao_campo  'venda', 'modo_venda_id', 'Modo de venda (1) balcão (2) entrega (3) mesa (4) ficha', 'dbo'
exec sp_descricao_campo  'venda', 'numero_chamada', 'Nº aleatório de chamada no balcão', 'dbo'
exec sp_descricao_campo  'venda', 'numero_venda', 'Numero único para identificar a venda no dia', 'dbo'
exec sp_descricao_campo  'venda', 'obs', '---', 'dbo'
exec sp_descricao_campo  'venda', 'operacao_id', 'Identificador da operação final', 'dbo'
exec sp_descricao_campo  'venda', 'operacao_origem_id', 'Identificador da operação origem antes do agrupamento', 'dbo'
exec sp_descricao_campo  'venda', 'perfil_id', 'Identificador do perfil aplicado à venda.', 'dbo'
exec sp_descricao_campo  'venda', 'qtd_fechamentos', 'Nº de vezes que a conta foi fechada', 'dbo'
exec sp_descricao_campo  'venda', 'situacao', '---', 'dbo'
exec sp_descricao_campo  'venda', 'ticket', '---', 'dbo'
exec sp_descricao_campo  'venda', 'transferido', '---', 'dbo'
exec sp_descricao_campo  'venda', 'venda_id', 'Identificador único da venda', 'dbo'
exec sp_descricao_campo  'venda', 'vl_limite', '---', 'dbo'
exec sp_descricao_campo  'venda', 'vl_subtotal_itens', '---', 'dbo'
exec sp_descricao_campo  'venda', 'vl_subtotal_para_desconto', '---', 'dbo'
exec sp_descricao_campo  'venda', 'vl_subtotal_para_servico', '---', 'dbo'
go

/**********************************************
 *** tabela venda_geral
 **********************************************/
exec sp_descricao_tabela 'venda_geral', 'Dados gerais do consumo.', 'dbo'
exec sp_descricao_campo  'venda_geral', 'cancelado', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'cliente_id', 'Identificador do cliente associado à venda', 'dbo'
exec sp_descricao_campo  'venda_geral', 'codigo_situacao', '(N) não cancelado (D) depois da produção (A) antes da produção', 'dbo'
exec sp_descricao_campo  'venda_geral', 'codigo_ticket', 'Codigo do ticket que continha a venda', 'dbo'
exec sp_descricao_campo  'venda_geral', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'dt_contabil', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'dt_hr_abertura', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'dt_hr_ultimo_consumo', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'func_atendeu_id', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'maquina_id', 'Identificador da máquina onde a venda foi aberta', 'dbo'
exec sp_descricao_campo  'venda_geral', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'numero_chamada', 'Nº aleatório de chamada no balcão', 'dbo'
exec sp_descricao_campo  'venda_geral', 'numero_venda', 'Numero unico para identificar a venda no dia', 'dbo'
exec sp_descricao_campo  'venda_geral', 'obs', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'operacao_id', 'Identificador da operação final', 'dbo'
exec sp_descricao_campo  'venda_geral', 'operacao_origem_id', 'Identificador da operação origem antes do agrupamento', 'dbo'
exec sp_descricao_campo  'venda_geral', 'perfil_id', 'Identificador do perfil utilizado na venda', 'dbo'
exec sp_descricao_campo  'venda_geral', 'qtd_fechamentos', 'Nº de vezes que a conta foi fechada', 'dbo'
exec sp_descricao_campo  'venda_geral', 'situacao', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'ticket', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'transferido', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'venda_id', 'identificador único da venda', 'dbo'
exec sp_descricao_campo  'venda_geral', 'vl_limite', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'vl_subtotal_itens', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'vl_subtotal_para_desconto', '---', 'dbo'
exec sp_descricao_campo  'venda_geral', 'vl_subtotal_para_servico', '---', 'dbo'
go

/**********************************************
 *** tabela venda_item
 **********************************************/
exec sp_descricao_tabela 'venda_item', 'Itens consumidos (somente do dia).', 'dbo'
exec sp_descricao_campo  'venda_item', 'api_key', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'arredondamento', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'baixa_efetuada', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'bn_fechamento', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'cancelado', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'classe_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'classe_rodizio_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'codigo_situacao', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'combo_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'combo_obs', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'contador_item', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'desconto_estrategia', 'Descrição da estratégia de desconto aplicada no item.', 'dbo'
exec sp_descricao_campo  'venda_item', 'desconto_id', 'ID do desconto utilizado na venda.', 'dbo'
exec sp_descricao_campo  'venda_item', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'dispositivo_utilizado', 'Descrição do dispositivo utilizado na venda.', 'dbo'
exec sp_descricao_campo  'venda_item', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'dt_contabil', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'dt_hr_cancelamento', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'dt_hr_lancamento', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'exportado', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'func_autorizou_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'func_cancelou_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'func_lancou_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'func_logado_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'func_transferiu_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'hr_lancamento', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'imprimiu', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'indice', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'item_id', 'ID identificador do item. É mantido nas transferências', 'dbo'
exec sp_descricao_campo  'venda_item', 'local_entrega', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'local_producao_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'loja_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'lote_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'maquina_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'marchado', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'material_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'motivo_cancelamento_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'observacoes', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'perfil_impressao_id', 'ID do perfil de impressão usado na venda.', 'dbo'
exec sp_descricao_campo  'venda_item', 'ponto_venda_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'praca_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'qtd', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'situacao', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'slot_indice', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'status', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'ticket_origem', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'transferido', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'valido', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'venda_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'venda_origem', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'versao', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'vl_desconto', 'Valor calculado do desconto aplicado no item.', 'dbo'
exec sp_descricao_campo  'venda_item', 'vl_preco', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'vl_preco_original', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'vl_servico_calculado', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'vl_servico_informado', '---', 'dbo'
exec sp_descricao_campo  'venda_item', 'vl_total', '---', 'dbo'
go

/**********************************************
 *** tabela venda_item_geral
 **********************************************/
exec sp_descricao_tabela 'venda_item_geral', 'Itens consumidos.', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'api_key', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'arredondamento', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'baixa_efetuada', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'bn_fechamento', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'cancelado', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'classe_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'classe_rodizio_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'codigo_situacao', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'combo_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'combo_obs', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'contador_item', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'desconto_estrategia', 'Descrição da estratégia de desconto aplicada no item.', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'desconto_id', 'ID do desconto utilizado na venda.', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'dispositivo_utilizado', 'Descrição do dispositivo utilizado na venda.', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'dt_contabil', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'dt_hr_cancelamento', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'dt_hr_lancamento', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'exportado', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'func_autorizou_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'func_cancelou_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'func_lancou_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'func_logado_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'func_transferiu_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'hr_lancamento', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'imprimiu', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'indice', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'item_id', 'ID identificador do item. É mantido nas transferências', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'local_entrega', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'local_producao_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'loja_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'lote_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'maquina_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'material_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'motivo_cancelamento_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'observacoes', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'perfil_impressao_id', 'ID do perfil de impressão usado na venda.', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'ponto_venda_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'praca_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'qtd', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'situacao', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'slot_indice', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'status', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'ticket_origem', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'transferido', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'valido', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'venda_id', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'venda_origem', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'versao', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'vl_desconto', 'Valor calculado do desconto aplicado no item.', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'vl_preco', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'vl_preco_original', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'vl_servico_calculado', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'vl_servico_informado', '---', 'dbo'
exec sp_descricao_campo  'venda_item_geral', 'vl_total', '---', 'dbo'
go

/**********************************************
 *** view vw_acoes_touch
 **********************************************/
exec sp_descricao_campo  'vw_acoes_touch', 'atalho', '---', 'dbo'
exec sp_descricao_campo  'vw_acoes_touch', 'atalho2', '---', 'dbo'
exec sp_descricao_campo  'vw_acoes_touch', 'cmd_id', '---', 'dbo'
exec sp_descricao_campo  'vw_acoes_touch', 'descr', '---', 'dbo'
exec sp_descricao_campo  'vw_acoes_touch', 'imagem', '---', 'dbo'
exec sp_descricao_campo  'vw_acoes_touch', 'layout_id', '---', 'dbo'
exec sp_descricao_campo  'vw_acoes_touch', 'ordem', '---', 'dbo'
exec sp_descricao_campo  'vw_acoes_touch', 'transicao', '---', 'dbo'
go

/**********************************************
 *** view vw_botoes_touch
 **********************************************/
exec sp_descricao_campo  'vw_botoes_touch', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'vw_botoes_touch', 'cor_botao', '---', 'dbo'
exec sp_descricao_campo  'vw_botoes_touch', 'cor_fonte', '---', 'dbo'
exec sp_descricao_campo  'vw_botoes_touch', 'descricao_touch', '---', 'dbo'
exec sp_descricao_campo  'vw_botoes_touch', 'id', '---', 'dbo'
exec sp_descricao_campo  'vw_botoes_touch', 'img', '---', 'dbo'
exec sp_descricao_campo  'vw_botoes_touch', 'layout_id', '---', 'dbo'
exec sp_descricao_campo  'vw_botoes_touch', 'ordem', '---', 'dbo'
exec sp_descricao_campo  'vw_botoes_touch', 'tipo_botao', '---', 'dbo'
exec sp_descricao_campo  'vw_botoes_touch', 'venda', '---', 'dbo'
go

/**********************************************
 *** view vw_consumo
 **********************************************/
exec sp_descricao_campo  'vw_consumo', 'agrupado', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'apelido', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'atendente_nome', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'cancelado', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'cliente', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'cliente_id', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'codigo_pai', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'consumidor', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'dt_contabil', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'dt_hr_abertura', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'dt_hr_encerramento', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'dt_hr_expedicao', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'dt_hr_ultimo_consumo', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'encerrada', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'entregador', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'estado', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'func_atendeu_id', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'func_entregou_id', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'limite_consumo', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'numero_venda', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'operacao_id', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'ordem', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'paga', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'pct_servico', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'perfil', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'perfil_id', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'praca_id', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'qtd_fechamentos', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'qtd_pessoas', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'qtd_subtickets', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'regiao_id', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'sexo', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'situacao', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'ticket_id', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'ticket_pai_id', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'vl_acrescimo', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'vl_consumacao', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'vl_desconto', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'vl_diferenca_consumacao', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'vl_entrada', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'vl_limite', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'vl_recebido', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'vl_servico', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'vl_subtotal_itens', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'vl_subtotal_para_desconto', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'vl_subtotal_para_servico', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'vl_taxa_de_entrega', '---', 'dbo'
exec sp_descricao_campo  'vw_consumo', 'vl_total', '---', 'dbo'
go

/**********************************************
 *** view vw_itens_touch
 **********************************************/
exec sp_descricao_campo  'vw_itens_touch', 'classe', '---', 'dbo'
exec sp_descricao_campo  'vw_itens_touch', 'classe_item_id', '---', 'dbo'
exec sp_descricao_campo  'vw_itens_touch', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'vw_itens_touch', 'combo_item_id', '---', 'dbo'
exec sp_descricao_campo  'vw_itens_touch', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'vw_itens_touch', 'id', '---', 'dbo'
exec sp_descricao_campo  'vw_itens_touch', 'img', '---', 'dbo'
exec sp_descricao_campo  'vw_itens_touch', 'ordem', '---', 'dbo'
exec sp_descricao_campo  'vw_itens_touch', 'principal_id', '---', 'dbo'
exec sp_descricao_campo  'vw_itens_touch', 'tipo', '---', 'dbo'
exec sp_descricao_campo  'vw_itens_touch', 'vende_combo', '---', 'dbo'
go

/**********************************************
 *** view vw_loja
 **********************************************/
exec sp_descricao_campo  'vw_loja', 'loj_id', '---', 'dbo'
exec sp_descricao_campo  'vw_loja', 'loj_num', '---', 'dbo'
exec sp_descricao_campo  'vw_loja', 'loj_tipo', '---', 'dbo'
exec sp_descricao_campo  'vw_loja', 'nome', '---', 'dbo'
exec sp_descricao_campo  'vw_loja', 'num', '---', 'dbo'
exec sp_descricao_campo  'vw_loja', 'num_nome', '---', 'dbo'
go

/**********************************************
 *** view vw_material
 **********************************************/
exec sp_descricao_campo  'vw_material', 'ativo', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'balanca', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'cod_externo', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'consumacao', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'descricao_producao', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'descricao_touch', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'fabricacao_propria', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'grupo_ativo', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'grupo_codigo', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'grupo_descricao', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'grupo_dt_alt', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'grupo_id', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'grupo_tipo', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'id', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'imagem', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'local_producao_id', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'loja_id', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'preco', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'qtde_frac', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'rede_id', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'requer_obs', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'servico', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'sub_rede_id', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'tabela_id', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'tecla_prog', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'unidade', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'venda', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'vende_combo', '---', 'dbo'
exec sp_descricao_campo  'vw_material', 'vende_web', '---', 'dbo'
go

/**********************************************
 *** view vw_movimento_caixa
 **********************************************/
exec sp_descricao_campo  'vw_movimento_caixa', 'cancelada', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'desconto', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'desconto_id', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'dt_contabil', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'dt_hr_pagamento', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'func_recebeu_id', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'func_recebeu_nome', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'maquina_id', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'modo_venda', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'movimento_dia', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'operacao_id', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'ponto_venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'ponto_venda_nome', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'tipo', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'vl_consumacao', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'vl_consumacao_maxima', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'vl_desconto', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'vl_diferenca_consumacao', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'vl_entrada', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'vl_entrada_maxima', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'vl_servico', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'vl_servico_informado', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'vl_subtotal_itens', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'vl_total', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa', 'vl_total_recebido', '---', 'dbo'
go

/**********************************************
 *** view vw_movimento_caixa_item
 **********************************************/
exec sp_descricao_campo  'vw_movimento_caixa_item', 'cancelado', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'descricao', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'dt_contabil', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'dt_hr_pagamento', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'func_id', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'func_nome', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'maquina_caminho', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'maquina_id', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'maquina_nome', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'meio_cod', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'meio_id', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'meio_nome', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'modo_venda', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'movimento_caixa_id', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'operacao_id', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'ponto_venda', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'tipo', '---', 'dbo'
exec sp_descricao_campo  'vw_movimento_caixa_item', 'vl_recebido', '---', 'dbo'
go

/**********************************************
 *** view vw_operacao
 **********************************************/
exec sp_descricao_campo  'vw_operacao', 'cancelada', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'desconto_id', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'dt_contabil', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'estornada', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'func_recebeu_id', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'modo_venda_nome', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'movimento_dia', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'operacao_id', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'qtd_pessoas', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'tipo', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'valor', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'vl_consumacao', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'vl_consumacao_maxima', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'vl_desconto', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'vl_entrada', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'vl_entrada_maxima', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'vl_servico', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'vl_subtotal_itens', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'vl_subtotal_para_desconto', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'vl_subtotal_para_servico', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'vl_total', '---', 'dbo'
exec sp_descricao_campo  'vw_operacao', 'vl_total_recebido', '---', 'dbo'
go

/**********************************************
 *** view vw_parametro
 **********************************************/
exec sp_descricao_campo  'vw_parametro', 'codigo', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro', 'valor', '---', 'dbo'
go

/**********************************************
 *** view vw_parametro_cadastro
 **********************************************/
exec sp_descricao_campo  'vw_parametro_cadastro', 'altera_com_periodo_aberto', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'categ', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'cod', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'descr', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'detalhes', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'dll', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'list_sql', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'lista', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'mascara', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'sub_categ', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'tipo_param', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'tipo_valor', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'valor', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'valor_default', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'valor_max', '---', 'dbo'
exec sp_descricao_campo  'vw_parametro_cadastro', 'valor_min', '---', 'dbo'
go

/**********************************************
 *** view vw_perfil_impressao
 **********************************************/
exec sp_descricao_campo  'vw_perfil_impressao', 'adiar_remota', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'id', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'impressao', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'impressao_id', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'impressora', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'impressora_backup', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'impressora_backup_id', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'impressora_id', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'modo_venda_nome', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'nome', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'nome_tipo', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'ponto_impressao', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'ponto_impressao_id', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'porta', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'porta_backup', '---', 'dbo'
exec sp_descricao_campo  'vw_perfil_impressao', 'tipo', '---', 'dbo'
go

/**********************************************
 *** view vw_venda_item_unificada
 **********************************************/
exec sp_descricao_campo  'vw_venda_item_unificada', 'cancelado', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'codigo_situacao', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'dt_contabil', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'dt_hr_cancelamento', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'dt_hr_lancamento', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'func_autorizou_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'func_cancelou_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'func_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'func_lancou_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'func_transferiu_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'grupo_descr', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'grupo_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'hr_lancamento', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'imprimiu', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'item_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'loja_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'maquina_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'material_cod', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'material_cod_num', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'material_descr', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'material_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'modo_venda_descr', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'motivo_canc', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'motivo_canc_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'nao_geral', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'numero_venda', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'ponto_venda', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'ponto_venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'qtd', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'situacao', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'ticket_cod', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'ticket_estado', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'ticket_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'ticket_modo_venda', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'ticket_origem', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'transferido', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'valido', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'venda_origem', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'vl_servico_calculado', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'vl_servico_informado', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'vl_total', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_item_unificada', 'vl_unit', '---', 'dbo'
go

/**********************************************
 *** view vw_venda_unificada
 **********************************************/
exec sp_descricao_campo  'vw_venda_unificada', 'cancelado', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'cliente_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'codigo_situacao', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'dt_alt', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'dt_contabil', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'dt_hr_abertura', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'dt_hr_ultimo_consumo', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'encerrada', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'funcionario_iniciou_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'funcionario_terminou_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'garcom_iniciou_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'garcom_terminou_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'maquina_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'modo_venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'modo_venda_nome', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'movimento_dia', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'numero_chamada', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'numero_venda', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'operacao_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'operacao_origem_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'pct_servico', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'perfil_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'ponto_venda', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'ponto_venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'qtd_fechamentos', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'qtd_pessoas', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'situacao', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'ticket_ativo', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'ticket_codigo', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'ticket_estado', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'ticket_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'ticket_pai_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'ticket_praca', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'transferido', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'venda_id', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'vl_consumacao', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'vl_desconto', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'vl_entrada', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'vl_limite', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'vl_servico', '---', 'dbo'
exec sp_descricao_campo  'vw_venda_unificada', 'vl_subtotal_itens', '---', 'dbo'
go
