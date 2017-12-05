/**************************
 *** DJango auth_permission 
 **************************/

declare @temp_auth_permission table 
(
  id int not null,
  name nvarchar(255) collate LATIN1_GENERAL_CI_AI not null,
  content_type_id int not null,
  codename nvarchar(100) collate LATIN1_GENERAL_CI_AI not null
)

insert into @temp_auth_permission 
(id, name, content_type_id, codename) values
(1, N'Can add content type', 1, N'add_contenttype'),
(2, N'Can change content type', 1, N'change_contenttype'),
(3, N'Can delete content type', 1, N'delete_contenttype'),
(4, N'Can add log entry', 2, N'add_logentry'),
(5, N'Can change log entry', 2, N'change_logentry'),
(6, N'Can delete log entry', 2, N'delete_logentry'),
(7, N'Can add permission', 5, N'add_permission'),
(8, N'Can change permission', 5, N'change_permission'),
(9, N'Can delete permission', 5, N'delete_permission'),
(10, N'Can add group', 3, N'add_group'),
(11, N'Can change group', 3, N'change_group'),
(12, N'Can delete group', 3, N'delete_group'),
(13, N'Can add user', 4, N'add_user'),
(14, N'Can change user', 4, N'change_user'),
(15, N'Can delete user', 4, N'delete_user'),
(16, N'Can add session', 6, N'add_session'),
(17, N'Can change session', 6, N'change_session'),
(18, N'Can delete session', 6, N'delete_session'),
(19, N'Can add usuario', 7, N'add_usuario'),
(20, N'Can change usuario', 7, N'change_usuario'),
(21, N'Can delete usuario', 7, N'delete_usuario'),
(22, N'Can add rede', 8, N'add_rede'),
(23, N'Can change rede', 8, N'change_rede'),
(24, N'Can delete rede', 8, N'delete_rede'),
(25, N'Can add loja', 9, N'add_loja'),
(26, N'Can change loja', 9, N'change_loja'),
(27, N'Can delete loja', 9, N'delete_loja'),
(28, N'Can add grupo material', 10, N'add_grupomaterial'),
(29, N'Can change grupo material', 10, N'change_grupomaterial'),
(30, N'Can delete grupo material', 10, N'delete_grupomaterial'),
(31, N'Can add local impressao', 11, N'add_localimpressao'),
(32, N'Can change local impressao', 11, N'change_localimpressao'),
(33, N'Can delete local impressao', 11, N'delete_localimpressao'),
(34, N'Can add combo', 15, N'add_combo'),
(35, N'Can change combo', 15, N'change_combo'),
(36, N'Can delete combo', 15, N'delete_combo'),
(37, N'Can add combo precificador', 14, N'add_comboprecificador'),
(38, N'Can change combo precificador', 14, N'change_comboprecificador'),
(39, N'Can delete combo precificador', 14, N'delete_comboprecificador'),
(40, N'Can add combo quantificador', 12, N'add_comboquantificador'),
(41, N'Can change combo quantificador', 12, N'change_comboquantificador'),
(42, N'Can delete combo quantificador', 12, N'delete_comboquantificador'),
(43, N'Can add combo slot', 13, N'add_comboslot'),
(44, N'Can change combo slot', 13, N'change_comboslot'),
(45, N'Can delete combo slot', 13, N'delete_comboslot'),
(46, N'Can add material', 19, N'add_material'),
(47, N'Can change material', 19, N'change_material'),
(48, N'Can delete material', 19, N'delete_material'),
(49, N'Can add observacao', 20, N'add_observacao'),
(50, N'Can change observacao', 20, N'change_observacao'),
(51, N'Can delete observacao', 20, N'delete_observacao'),
(52, N'Can add material obs', 18, N'add_materialobs'),
(53, N'Can change material obs', 18, N'change_materialobs'),
(54, N'Can delete material obs', 18, N'delete_materialobs'),
(55, N'Can add classe', 17, N'add_classe'),
(56, N'Can change classe', 17, N'change_classe'),
(57, N'Can delete classe', 17, N'delete_classe'),
(58, N'Can add item classe', 21, N'add_itemclasse'),
(59, N'Can change item classe', 21, N'change_itemclasse'),
(60, N'Can delete item classe', 21, N'delete_itemclasse'),
(61, N'Can add codi barras', 16, N'add_codibarras'),
(62, N'Can change codi barras', 16, N'change_codibarras'),
(63, N'Can delete codi barras', 16, N'delete_codibarras'),
(64, N'Can add motivo canc', 22, N'add_motivocanc'),
(65, N'Can change motivo canc', 22, N'change_motivocanc'),
(66, N'Can delete motivo canc', 22, N'delete_motivocanc'),
(67, N'Can add tipo recebimento', 23, N'add_tiporecebimento'),
(68, N'Can change tipo recebimento', 23, N'change_tiporecebimento'),
(69, N'Can delete tipo recebimento', 23, N'delete_tiporecebimento'),
(70, N'Can add layout touch', 24, N'add_layouttouch'),
(71, N'Can change layout touch', 24, N'change_layouttouch'),
(72, N'Can delete layout touch', 24, N'delete_layouttouch'),
(73, N'Can add acao touch', 25, N'add_acaotouch'),
(74, N'Can change acao touch', 25, N'change_acaotouch'),
(75, N'Can delete acao touch', 25, N'delete_acaotouch'),
(76, N'Can add config touch', 26, N'add_configtouch'),
(77, N'Can change config touch', 26, N'change_configtouch'),
(78, N'Can delete config touch', 26, N'delete_configtouch'),
(79, N'Can add tabela preco', 27, N'add_tabelapreco'),
(80, N'Can change tabela preco', 27, N'change_tabelapreco'),
(81, N'Can delete tabela preco', 27, N'delete_tabelapreco'),
(82, N'Can add item preco', 28, N'add_itempreco'),
(83, N'Can change item preco', 28, N'change_itempreco'),
(84, N'Can delete item preco', 28, N'delete_itempreco'),
(85, N'Can add modulo grupo', 29, N'add_modulogrupo'),
(86, N'Can change modulo grupo', 29, N'change_modulogrupo'),
(87, N'Can delete modulo grupo', 29, N'delete_modulogrupo'),
(88, N'Can add funcao', 30, N'add_funcao'),
(89, N'Can change funcao', 30, N'change_funcao'),
(90, N'Can delete funcao', 30, N'delete_funcao'),
(91, N'Can add funcionario', 31, N'add_funcionario'),
(92, N'Can change funcionario', 31, N'change_funcionario'),
(93, N'Can delete funcionario', 31, N'delete_funcionario'),
(94, N'Can add ponto venda', 32, N'add_pontovenda'),
(95, N'Can change ponto venda', 32, N'change_pontovenda'),
(96, N'Can delete ponto venda', 32, N'delete_pontovenda'),
(97, N'Can add ponto fiscal', 33, N'add_pontofiscal'),
(98, N'Can change ponto fiscal', 33, N'change_pontofiscal'),
(99, N'Can delete ponto fiscal', 33, N'delete_pontofiscal'),
(100, N'Can add maquina', 34, N'add_maquina'),
(101, N'Can change maquina', 34, N'change_maquina'),
(102, N'Can delete maquina', 34, N'delete_maquina'),
(103, N'Can add desconto', 35, N'add_desconto'),
(104, N'Can change desconto', 35, N'change_desconto'),
(105, N'Can delete desconto', 35, N'delete_desconto')

set identity_insert dbo.auth_permission on 

merge dbo.auth_permission target
using
(
  select 
    id, 
    name, 
    content_type_id, 
    codename
  from @temp_auth_permission
) as source
on target.id = source.id
when matched then
  update set 
    target.name = source.name,
    target.content_type_id = source.content_type_id,
    target.codename = source.codename
when not matched by target then
  insert 
  (
    id, 
    name, 
    content_type_id, 
    codename
  ) values 
  (
    source.id, 
    source.name, 
    source.content_type_id, 
    source.codename
  );

set identity_insert dbo.auth_permission off
go

/**************************
 *** DJango content_type
 **************************/

declare @temp_content_type table (
  id int not null,
  app_label nvarchar(100) collate LATIN1_GENERAL_CI_AI not null,
  model nvarchar(100) collate LATIN1_GENERAL_CI_AI not null
)

insert @temp_content_type 
(id, app_label, model) values 
(2, N'admin', N'logentry'),
(7, N'autenticacao_base', N'usuario'),
(3, N'auth', N'group'),
(5, N'auth', N'permission'),
(4, N'auth', N'user'),
(15, N'combo', N'combo'),
(14, N'combo', N'comboprecificador'),
(12, N'combo', N'comboquantificador'),
(13, N'combo', N'comboslot'),
(1, N'contenttypes', N'contenttype'),
(35, N'desconto', N'desconto'),
(30, N'funcao', N'funcao'),
(31, N'funcionario', N'funcionario'),
(10, N'grupo_material', N'grupomaterial'),
(25, N'layout_touch', N'acaotouch'),
(26, N'layout_touch', N'configtouch'),
(24, N'layout_touch', N'layouttouch'),
(11, N'local_impressao', N'localimpressao'),
(9, N'loja', N'loja'),
(34, N'maquina', N'maquina'),
(17, N'mat_obs_classe', N'classe'),
(16, N'mat_obs_classe', N'codibarras'),
(21, N'mat_obs_classe', N'itemclasse'),
(19, N'mat_obs_classe', N'material'),
(18, N'mat_obs_classe', N'materialobs'),
(20, N'mat_obs_classe', N'observacao'),
(22, N'motivo_cancelamento', N'motivocanc'),
(29, N'permissao', N'modulogrupo'),
(33, N'ponto_fiscal', N'pontofiscal'),
(32, N'ponto_venda', N'pontovenda'),
(8, N'rede', N'rede'),
(6, N'sessions', N'session'),
(28, N'tabela_preco', N'itempreco'),
(27, N'tabela_preco', N'tabelapreco'),
(23, N'tipo_recebimento', N'tiporecebimento')

set identity_insert dbo.django_content_type on 

merge dbo.django_content_type target
using
(
  select 
    id, 
    app_label, 
    model
  from @temp_content_type
) as source
on target.id = source.id
when matched then
  update set 
    target.app_label = source.app_label,
    target.model = source.model
when not matched by target then
  insert 
  (
    id, 
    app_label, 
    model
  ) values 
  (
    source.id, 
    source.app_label, 
    source.model
  );

set identity_insert dbo.django_content_type off
go

