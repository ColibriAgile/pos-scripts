/*
  Converte uma base colibri para o modelo utilizado pelo cadastro web

  ATENÇÃO: Este script não esta protegido contra múltiplas execuções.
*/
set numeric_roundabort off
go

set ansi_padding, ansi_warnings, concat_null_yields_null, arithabort, quoted_identifier, ansi_nulls on
go

exec dbo.sp_apagar_relacionamentos 'codigodebarras'
go
exec dbo.sp_apagar_relacionamentos 'comboslot'
go
exec dbo.sp_apagar_relacionamentos 'configuratouch'
go
exec dbo.sp_apagar_relacionamentos 'cliente'
go
exec dbo.sp_apagar_relacionamentos 'desconto'
go
exec dbo.sp_apagar_relacionamentos 'funcionario'
go
exec dbo.sp_apagar_relacionamentos 'itemvendageral'
go
exec dbo.sp_apagar_relacionamentos 'maquina'
go
exec dbo.sp_apagar_relacionamentos 'configurabotoestouch'
go
exec dbo.sp_apagar_relacionamentos 'classe_grupo'
go
exec dbo.sp_apagar_relacionamentos 'material'
go
exec dbo.sp_apagar_relacionamentos 'materialxobs'
go
exec dbo.sp_apagar_relacionamentos 'impressoraxrelatorio'
go
exec dbo.sp_apagar_relacionamentos 'itemvenda'
go
exec dbo.sp_apagar_relacionamentos 'pluginxmaquina'
go
exec dbo.sp_apagar_relacionamentos 'reitens'
go
exec dbo.sp_apagar_relacionamentos 'receitas'
go
exec dbo.sp_apagar_relacionamentos 'movimentocaixa'
go
exec dbo.sp_apagar_relacionamentos 'movimentocaixageral'
go
exec dbo.sp_apagar_relacionamentos 'prepagamento'
go
exec dbo.sp_apagar_relacionamentos 'valorconferido'
go

if object_id('pk_codigodebarras') is not null
  alter table [codigodebarras] drop constraint [pk_codigodebarras]
go

if object_id('ix_codigodebarras') is not null
  alter table [codigodebarras] drop constraint [uk_codigodebarras]
go

if object_id('pk_classe') is not null
  alter table [classe] drop constraint [pk_classe]
go

if object_id('df_classe$loja_id') is not null
  alter table [classe] drop constraint [df_classe$loja_id]
go

if object_id('df_classe$nm_descricaotouch') is not null
  alter table [classe] drop constraint [df_classe$nm_descricaotouch]
go

if object_id('df_classe$nm_descricaotouch2') is not null
  alter table [classe] drop constraint [df_classe$nm_descricaotouch2]
go

if object_id('df_classe$nm_imagem') is not null
  alter table [classe] drop constraint [df_classe$nm_imagem]
go

if object_id('df_classe$bn_ordemalfabetica') is not null
  alter table [classe] drop constraint [df_classe$bn_ordemalfabetica]
go

if object_id('df_classe$bn_girarlugar') is not null
  alter table [classe] drop constraint [df_classe$bn_girarlugar]
go

if object_id('df_classe$dt_alt') is not null
  alter table [classe] drop constraint [df_classe$dt_alt]
go

if object_id('pk_combo') is not null
  alter table [combo] drop constraint [pk_combo]
go

if object_id('df_combo$dt_alt') is not null
  alter table [combo] drop constraint [df_combo$dt_alt]
go

if object_id('df_combo$bn_requerobs') is not null
  alter table [combo] drop constraint [df_combo$bn_requerobs]
go

if object_id('df_combo$ativo') is not null
  alter table [combo] drop constraint [df_combo$ativo]
go

if object_id('df_combo$bn_vendenaweb') is not null
  alter table [combo] drop constraint [df_combo$bn_vendenaweb]
go

if object_id('pk_precificador') is not null
  alter table [comboprecificador] drop constraint [pk_precificador]
go

if object_id('df_comboprecificador$dt_alt') is not null
  alter table [comboprecificador] drop constraint [df_comboprecificador$dt_alt]
go

if object_id('pk_quantificador') is not null
  alter table [comboquantificador] drop constraint [pk_quantificador]
go

if object_id('df_comboquantificador$dt_alt') is not null
  alter table [comboquantificador] drop constraint [df_comboquantificador$dt_alt]
go
if object_id('pk_slot') is not null
  alter table [comboslot] drop constraint [pk_slot]
go
if object_id('df_comboslot$dt_alt') is not null
  alter table [comboslot] drop constraint [df_comboslot$dt_alt]
go
if object_id('desc_pk_id') is not null
  alter table [desconto] drop constraint [desc_pk_id]
go
if object_id('df_desconto$desconto_id') is not null
  alter table [desconto] drop constraint [df_desconto$desconto_id]
go
if object_id('df_desconto$nm_desconto') is not null
  alter table [desconto] drop constraint [df_desconto$nm_desconto]
go
if object_id('df_desconto$vl_desconto') is not null
  alter table [desconto] drop constraint [df_desconto$vl_desconto]
go
if object_id('df_desconto$nu_codigo') is not null
  alter table [desconto] drop constraint [df_desconto$nu_codigo]
go
if object_id('df_desconto$dt_alt') is not null
  alter table [desconto] drop constraint [df_desconto$dt_alt]
go
if object_id('df_desconto$pode_alterar') is not null
  alter table [desconto] drop constraint [df_desconto$pode_alterar]
go
if object_id('pk_funcoes') is not null
  alter table [funcoes] drop constraint [pk_funcoes]
go
if object_id('df_funcoes$funcao_id') is not null
  alter table [funcoes] drop constraint [df_funcoes$funcao_id]
go
if object_id('df_funcoes$nm_funcao') is not null
  alter table [funcoes] drop constraint [df_funcoes$nm_funcao]
go
if object_id('df_funcoes$dt_alt') is not null
  alter table [funcoes] drop constraint [df_funcoes$dt_alt]
go
if object_id('pk_funcionario') is not null
  alter table [funcionario] drop constraint [pk_funcionario]
go
if object_id('df_funcionario$funcionario_id') is not null
  alter table [funcionario] drop constraint [df_funcionario$funcionario_id]
go
if object_id('df_funcionario$nu_senha') is not null
  alter table [funcionario] drop constraint [df_funcionario$nu_senha]
go
if object_id('df_funcionario$grupofunc_id') is not null
  alter table [funcionario] drop constraint [df_funcionario$grupofunc_id]
go
if object_id('df_funcionario$funcao_id') is not null
  alter table [funcionario] drop constraint [df_funcionario$funcao_id]
go
if object_id('df_funcionario$nm_nome') is not null
  alter table [funcionario] drop constraint [df_funcionario$nm_nome]
go
if object_id('df_funcionario$nm_endereco') is not null
  alter table [funcionario] drop constraint [df_funcionario$nm_endereco]
go
if object_id('df_funcionario$nm_bairro') is not null
  alter table [funcionario] drop constraint [df_funcionario$nm_bairro]
go
if object_id('df_funcionario$nm_cidade') is not null
  alter table [funcionario] drop constraint [df_funcionario$nm_cidade]
go
if object_id('df_funcionario$nu_cep') is not null
  alter table [funcionario] drop constraint [df_funcionario$nu_cep]
go
if object_id('df_funcionario$nu_fone') is not null
  alter table [funcionario] drop constraint [df_funcionario$nu_fone]
go
if object_id('df_funcionario$nm_usuario') is not null
  alter table [funcionario] drop constraint [df_funcionario$nm_usuario]
go
if object_id('df_funcionario$nu_funcionario') is not null
  alter table [funcionario] drop constraint [df_funcionario$nu_funcionario]
go
if object_id('df_funcionario$lm_vl_entrega') is not null
  alter table [funcionario] drop constraint [df_funcionario$lm_vl_entrega]
go
if object_id('df_funcionario$bn_ativo') is not null
  alter table [funcionario] drop constraint [df_funcionario$bn_ativo]
go
if object_id('df_funcionario$dt_alt') is not null
  alter table [funcionario] drop constraint [df_funcionario$dt_alt]
go
if object_id('df_funcionario$lote_id') is not null
  alter table [funcionario] drop constraint [df_funcionario$lote_id]
go
if object_id('df_funcionario$status') is not null
  alter table [funcionario] drop constraint [df_funcionario$status]
go
if object_id('pk_layouttouch') is not null
  alter table [layouttouch] drop constraint [pk_layouttouch]
go
if object_id('df_layouttouch$dt_alt') is not null
  alter table [layouttouch] drop constraint [df_layouttouch$dt_alt]
go
if object_id('gmat_pk_id') is not null
  alter table [grupomaterial] drop constraint [gmat_pk_id]
go
if object_id('df_grupomaterial$loja_id') is not null
  alter table [grupomaterial] drop constraint [df_grupomaterial$loja_id]
go
if object_id('df_grupomaterial$grupo_id') is not null
  alter table [grupomaterial] drop constraint [df_grupomaterial$grupo_id]
go
if object_id('df_grupomaterial$tipodespesa_id') is not null
  alter table [grupomaterial] drop constraint [df_grupomaterial$tipodespesa_id]
go
if object_id('df_grupomaterial$nu_codigo') is not null
  alter table [grupomaterial] drop constraint [df_grupomaterial$nu_codigo]
go
if object_id('df_grupomaterial$bn_alcoolico') is not null
  alter table [grupomaterial] drop constraint [df_grupomaterial$bn_alcoolico]
go
if object_id('df_grupomaterial$dt_alt') is not null
  alter table [grupomaterial] drop constraint [df_grupomaterial$dt_alt]
go
if object_id('df_grupomaterial$bn_habitue') is not null
  alter table [grupomaterial] drop constraint [df_grupomaterial$bn_habitue]
go
if object_id('df_grupomaterial$lote_id') is not null
  alter table [grupomaterial] drop constraint [df_grupomaterial$lote_id]
go
if object_id('df_grupomaterial$status') is not null
  alter table [grupomaterial] drop constraint [df_grupomaterial$status]
go
if object_id('pk_movclasse') is not null
  alter table [movclasse] drop constraint [pk_movclasse]
go
if object_id('df_movclasse$movclasse_id') is not null
  alter table [movclasse] drop constraint [df_movclasse$movclasse_id]
go
if object_id('df_movclasse$loja_id') is not null
  alter table [movclasse] drop constraint [df_movclasse$loja_id]
go
if object_id('df_movclasse$bn_classe') is not null
  alter table [movclasse] drop constraint [df_movclasse$bn_classe]
go
if object_id('df_movclasse$classe_id') is not null
  alter table [movclasse] drop constraint [df_movclasse$classe_id]
go
if object_id('df_movclasse$it_classe') is not null
  alter table [movclasse] drop constraint [df_movclasse$it_classe]
go
if object_id('df_movclasse$it_material') is not null
  alter table [movclasse] drop constraint [df_movclasse$it_material]
go
if object_id('df_movclasse$nu_ordem') is not null
  alter table [movclasse] drop constraint [df_movclasse$nu_ordem]
go
if object_id('df_movclasse$dt_alt') is not null
  alter table [movclasse] drop constraint [df_movclasse$dt_alt]
go
if object_id('pk_loja') is not null
  alter table [loja] drop constraint [pk_loja]
go
if object_id('df_loja$loja_id') is not null
  alter table [loja] drop constraint [df_loja$loja_id]
go
if object_id('df_loja$bn_central') is not null
  alter table [loja] drop constraint [df_loja$bn_central]
go
if object_id('df_loja$dt_alt') is not null
  alter table [loja] drop constraint [df_loja$dt_alt]
go
if object_id('df_loja$lote_id') is not null
  alter table [loja] drop constraint [df_loja$lote_id]
go
if object_id('df_loja$status') is not null
  alter table [loja] drop constraint [df_loja$status]
go
if object_id('pk_maquina') is not null
  alter table [maquina] drop constraint [pk_maquina]
go
if object_id('df_maquina$maquina_id') is not null
  alter table [maquina] drop constraint [df_maquina$maquina_id]
go
if object_id('df_maquina$pontobalcao_id') is not null
  alter table [maquina] drop constraint [df_maquina$pontobalcao_id]
go
if object_id('df_maquina$pontomesa_id') is not null
  alter table [maquina] drop constraint [df_maquina$pontomesa_id]
go
if object_id('df_maquina$pontoentrega_id') is not null
  alter table [maquina] drop constraint [df_maquina$pontoentrega_id]
go
if object_id('df_maquina$nm_maquina') is not null
  alter table [maquina] drop constraint [df_maquina$nm_maquina]
go
if object_id('df_maquina$bn_exibeatalhos') is not null
  alter table [maquina] drop constraint [df_maquina$bn_exibeatalhos]
go
if object_id('df_maquina$nm_caminho') is not null
  alter table [maquina] drop constraint [df_maquina$nm_caminho]
go
if object_id('df_maquina$nu_serieprotetor') is not null
  alter table [maquina] drop constraint [df_maquina$nu_serieprotetor]
go
if object_id('df_maquina$bn_peganumgarco') is not null
  alter table [maquina] drop constraint [df_maquina$bn_peganumgarcon]
go
if object_id('df_maquina$func_lock') is not null
  alter table [maquina] drop constraint [df_maquina$func_lock]
go
if object_id('df_maquina$nu_modelotouchmesa') is not null
  alter table [maquina] drop constraint [df_maquina$nu_modelotouchmesa]
go
if object_id('df_maquina$nu_modelotouchentrega') is not null
  alter table [maquina] drop constraint [df_maquina$nu_modelotouchentrega]
go
if object_id('df_maquina$nu_modelotouchbalcao') is not null
  alter table [maquina] drop constraint [df_maquina$nu_modelotouchbalcao]
go
if object_id('df_maquina$dt_alt') is not null
  alter table [maquina] drop constraint [df_maquina$dt_alt]
go
if object_id('df_maquina$nu_abregaveta') is not null
  alter table [maquina] drop constraint [df_maquina$nu_abregaveta]
go
if object_id('df_maquina$pontoficha_id') is not null
  alter table [maquina] drop constraint [df_maquina$pontoficha_id]
go
if object_id('df_maquina$bn_garcomnaabertura') is not null
  alter table [maquina] drop constraint [df_maquina$bn_garcomnaabertura]
go
if object_id('df_maquina$nu_modelotouchficha') is not null
  alter table [maquina] drop constraint [df_maquina$nu_modelotouchficha]
go
if object_id('df_maquina$bn_biometria') is not null
  alter table [maquina] drop constraint [df_maquina$bn_biometria]
go
if object_id('df_maquina$bn_senha') is not null
  alter table [maquina] drop constraint [df_maquina$bn_senha]
go
if object_id('df_maquina$areadetrabalhoextendida') is not null
  alter table [maquina] drop constraint [df_maquina$areadetrabalhoextendida]
go
if object_id('df_maquina$perm_para_sair_ticket') is not null
  alter table [maquina] drop constraint [df_maquina$perm_para_sair_ticket]
go
if object_id('df_maquina$terminalcaixa') is not null
  alter table [maquina] drop constraint [df_maquina$terminalcaixa]
go
if object_id('df_maquina$autopagamento') is not null
  alter table [maquina] drop constraint [df_maquina$autopagamento]
go
if object_id('df_maquina$inicia_autopagamento') is not null
  alter table [maquina] drop constraint [df_maquina$inicia_autopagamento]
go
if object_id('id_mc') is not null
  alter table [motivocanc] drop constraint [id_mc]
go
if object_id('df_motivocanc$dt_alt') is not null
  alter table [motivocanc] drop constraint [df_motivocanc$dt_alt]
go
if object_id('df_motivocanc$lote_id') is not null
  alter table [motivocanc] drop constraint [df_motivocanc$lote_id]
go
if object_id('df_motivocanc$status') is not null
  alter table [motivocanc] drop constraint [df_motivocanc$status]
go
if object_id('mat_pk_id') is not null
  alter table [material] drop constraint [mat_pk_id]
go
if object_id('df_material$bn_vendenocombo') is not null
  alter table [material] drop constraint [df_material$bn_vendenocombo]
go
if object_id('pk_ptv') is not null
  alter table [pontovenda] drop constraint [pk_ptv]
go
if object_id('df_pontovenda$dt_alt') is not null
  alter table [pontovenda] drop constraint [df_pontovenda$dt_alt]
go
if object_id('pk_observacao') is not null
  alter table [observacao] drop constraint [pk_observacao]
go
if object_id('df_observacao$loja_id') is not null
  alter table [observacao] drop constraint [df_observacao$loja_id]
go
if object_id('df_observacao$observacao_id') is not null
  alter table [observacao] drop constraint [df_observacao$observacao_id]
go
if object_id('df_observacao$nm_observacao') is not null
  alter table [observacao] drop constraint [df_observacao$nm_observacao]
go
if object_id('df_observacao$nu_codigo') is not null
  alter table [observacao] drop constraint [df_observacao$nu_codigo]
go
if object_id('df_observacao$dt_alt') is not null
  alter table [observacao] drop constraint [df_observacao$dt_alt]
go
if object_id('pk_ponto_fiscal') is not null
  alter table [ponto_fiscal] drop constraint [pk_ponto_fiscal]
go
if object_id('uk_ponto_fiscal_nome') is not null
  alter table [ponto_fiscal] drop constraint [uk_ponto_fiscal_nome]
go
if object_id('pk_tiporecebimento') is not null
  alter table [tiporecebimento] drop constraint [pk_tiporecebimento]
go
if object_id('df_tiporecebimento$loja_id') is not null
  alter table [tiporecebimento] drop constraint [df_tiporecebimento$loja_id]
go
if object_id('df_tiporecebimento$nu_diaspgto') is not null
  alter table [tiporecebimento] drop constraint [df_tiporecebimento$nu_diaspgto]
go
if object_id('df_tiporecebimento$bn_multiplo') is not null
  alter table [tiporecebimento] drop constraint [df_tiporecebimento$bn_multiplo]
go
if object_id('df_tiporecebimento$bn_ativo') is not null
  alter table [tiporecebimento] drop constraint [df_tiporecebimento$bn_ativo]
go
if object_id('df_tiporecebimento$bn_dinheiro') is not null
  alter table [tiporecebimento] drop constraint [df_tiporecebimento$bn_dinheiro]
go
if object_id('df_tiporecebimento$bn_repique') is not null
  alter table [tiporecebimento] drop constraint [df_tiporecebimento$bn_repique]
go
if object_id('df_tiporecebimento$bn_contravale') is not null
  alter table [tiporecebimento] drop constraint [df_tiporecebimento$bn_contravale]
go
if object_id('df_tiporecebimento$bn_tef') is not null
  alter table [tiporecebimento] drop constraint [df_tiporecebimento$bn_tef]
go
if object_id('df_tiporecebimento$nu_codigo') is not null
  alter table [tiporecebimento] drop constraint [df_tiporecebimento$nu_codigo]
go
if object_id('df_tiporecebimento$dt_alt') is not null
  alter table [tiporecebimento] drop constraint [df_tiporecebimento$dt_alt]
go
if object_id('df_tiporecebimento$ordem') is not null
  alter table [tiporecebimento] drop constraint [df_tiporecebimento$ordem]
go
if object_id('pk_botoestouch') is not null
  alter table [botoestouch] drop constraint [pk_botoestouch]
go
if object_id('df_botoestouch$botao_id') is not null
  alter table [botoestouch] drop constraint [df_botoestouch$botao_id]
go
if object_id('df_botoestouch$bn_mesa') is not null
  alter table [botoestouch] drop constraint [df_botoestouch$bn_mesa]
go
if object_id('df_botoestouch$bn_entrega') is not null
  alter table [botoestouch] drop constraint [df_botoestouch$bn_entrega]
go
if object_id('df_botoestouch$bn_balcao') is not null
  alter table [botoestouch] drop constraint [df_botoestouch$bn_balcao]
go
if object_id('df_botoestouch$bn_ficha') is not null
  alter table [botoestouch] drop constraint [df_botoestouch$bn_ficha]
go
if object_id('df_configuratouch$nu_ordem') is not null
  alter table [configuratouch] drop constraint [df_configuratouch$nu_ordem]
go
if object_id('df_materialxobs$nu_posicao') is not null
  alter table [materialxobs] drop constraint [df_materialxobs$nu_posicao]
go
if object_id('df_materialxobs$material_id') is not null
  alter table [materialxobs] drop constraint [df_materialxobs$material_id]
go
if object_id('df_materialxobs$observacao_id') is not null
  alter table [materialxobs] drop constraint [df_materialxobs$observacao_id]
go
if object_id('df_materialxobs$dt_alt') is not null
  alter table [materialxobs] drop constraint [df_materialxobs$dt_alt]
go

if exists(select * from sys.indexes where name = 'ix_layouttouch$descr')
  drop index [ix_layouttouch$descr] on [layouttouch]
go

if exists(select * from sys.indexes where name = 'ix_material$codigo')
  drop index [ix_material$codigo] on [material]
go

exec sp_rename '[configuratouch]','config_touch','object'
go

exec sp_rename '[grupomaterial]','grupo_material','object'
go

exec sp_rename '[codigodebarras]','codigo_barra','object'
go

exec sp_rename '[comboslot]','combo_slot','object'
go

exec sp_rename '[comboprecificador]','combo_precificador','object'
go

exec sp_rename '[comboquantificador]','combo_quantificador','object'
go

exec sp_rename '[layouttouch]','layout_touch','object'
go

exec sp_rename '[funcoes]','funcao','object'
go

exec sp_rename '[movclasse]','item_classe','object'
go

exec sp_rename '[pontovenda]','ponto_venda','object'
go

exec sp_rename '[materialxobs]','material_obs','object'
go

exec sp_rename '[motivocanc]','motivo_cancelamento','object'
go

exec sp_rename '[tiporecebimento]','tipo_recebimento','object'
go

exec sp_rename '[botoestouch]','acao_touch','object'
go

create table [tmp_rg_xx_config_touch]
(
  [id] [int] not null identity(1, 1),
  [tipo] [int] not null,
  [item_id] [int] not null,
  [cor_botao] [nvarchar] (20) collate latin1_general_ci_ai null,
  [cor_fonte] [nvarchar] (20) collate latin1_general_ci_ai null,
  [ordem] [int] not null,
  [layout_id] [int] not null,
  [tipo_item_id] [int] not null
)
go

insert into [tmp_rg_xx_config_touch]([tipo],[tipo_item_id], [item_id], [cor_botao], [cor_fonte], [ordem], [layout_id])
select
  case st_tipobotao
    when 'L' then 2
    when 'N' then 3
    when 'C' then 4
  else 1
  end,
  case st_tipobotao
    when 'L' then (select id from django_content_type where model = 'classe')
    when 'N' then (select id from django_content_type where model = 'material')
    when 'C' then (select id from django_content_type where model = 'combo')
    else (select id from django_content_type where model = 'acaotouch')
  end,
  [botao_id], [nm_corbotao], [nm_corletra], [nu_ordem], [layout_id]
from [config_touch]
go

insert into [tmp_rg_xx_config_touch]([tipo],[tipo_item_id], [item_id],  [cor_botao], [cor_fonte], [ordem], [layout_id])
select
   1,
   (select id from django_content_type where model = 'acaotouch'),
  [botao_id], [cor_botao], [cor_letra], [nu_order], [layout_id]
from [configurabotoestouch]
go

drop table [config_touch]
go

exec sp_rename '[tmp_rg_xx_config_touch]', 'config_touch'
go

alter table [config_touch] add constraint [pk__config_t__3213e83fdd1fbf0e] primary key clustered  ([id])
go
create nonclustered index [config_touch_72bc1be0] on [config_touch] ([layout_id])
go
create nonclustered index [config_touch_0bc53d1e] on [config_touch] ([tipo_item_id])
go

create table [tmp_rg_xx_grupo_material]
(
  [id] [int] not null identity(1, 1),
  [ativo] [bit] not null default 1,
  [dt_alt] [datetime] not null,
  [codigo] [int] not null,
  [descricao] [nvarchar] (30) collate latin1_general_ci_ai null,
  [tipo] [nvarchar] (2) collate latin1_general_ci_ai not null,
  [lft] [int] not null,
  [rght] [int] not null,
  [tree_id] [int] not null,
  [level] [int] not null,
  [parent_id] [int] null,
  [rede_id] [bigint] not null
)
go

set identity_insert [tmp_rg_xx_grupo_material] on
go

insert into [tmp_rg_xx_grupo_material]([id], [dt_alt], [codigo], [descricao], [tipo], [ativo], [rede_id], [lft], [rght], [tree_id], [level])
select [grupo_id], [dt_alt], [nu_codigo], [nm_descricao], isnull([tp_grupo],'al'), 1, 1, 1, 2, [grupo_id], 0
from [grupo_material]
go

set identity_insert [tmp_rg_xx_grupo_material] off
go

drop table [grupo_material]
go
exec sp_rename '[tmp_rg_xx_grupo_material]', 'grupo_material'
go
alter table [grupo_material] add constraint [pk__grupo_ma__3213e83f97f55e2a] primary key clustered  ([id])
go
create nonclustered index [grupo_material_caf7cc51] on [grupo_material] ([lft])
go
create nonclustered index [grupo_material_3cfbd988] on [grupo_material] ([rght])
go
create nonclustered index [grupo_material_656442a0] on [grupo_material] ([tree_id])
go
create nonclustered index [grupo_material_c9e9a848] on [grupo_material] ([level])
go
create nonclustered index [grupo_material_6be37982] on [grupo_material] ([parent_id])
go
create nonclustered index [grupo_material_c7c38b2a] on [grupo_material] ([rede_id])
go

create table [tmp_rg_xx_loja]
(
  [loja_id] [bigint] not null,
  [nome] [nvarchar] (100) collate latin1_general_ci_ai not null,
  [rede_id] [bigint] not null
)
go

insert into [tmp_rg_xx_loja]([loja_id], [nome], [rede_id])
select [loja_id], [nm_descricao], 1
from [loja]
go

drop table [loja]
go
exec sp_rename '[tmp_rg_xx_loja]', 'loja'
go
alter table [loja] add constraint [pk__loja__d9f2a666217043ed] primary key clustered  ([loja_id])
go
create nonclustered index [loja_c7c38b2a] on [loja] ([rede_id])
go

create table [tmp_rg_xx_classe]
(
  [id] [int] not null identity(1, 1),
  [ativo] [bit] not null default 1,
  [dt_alt] [datetime] not null,
  [codigo] [int] not null,
  [descricao] [nvarchar] (20) collate latin1_general_ci_ai not null,
  [descricao_touch] [nvarchar] (40) collate latin1_general_ci_ai null,
  [permite_combinado] [bit] not null,
  [ordem_alfabetica] [bit] not null,
  [imagem] [nvarchar] (80) collate latin1_general_ci_ai null,
  [loja_id] [bigint] null,
  [rede_id] [bigint] not null,
  [sub_rede_id] [bigint] null
)
go

set identity_insert [tmp_rg_xx_classe] on
go

insert into [tmp_rg_xx_classe]
(
  [id], 
  [codigo], 
  [dt_alt], 
  [descricao], 
  [descricao_touch], 
  [ordem_alfabetica], 
  [imagem], 
  [loja_id], 
  [ativo], 
  [permite_combinado], 
  [rede_id]
)
select 
  [classe_id], 
  [classe_id], 
  [dt_alt], 
  [nm_descricao], 
  [nm_descricaotouch]+isnull(' '+nm_descricaotouch2,'') + isnull(' '+nm_descricaotouch3,'') + isnull(' '+nm_descricaotouch4,''), 
  [bn_ordemalfabetica], 
  [nm_imagem], 
  [loja_id], 
  1, 
  0, 
  1
from [classe]
go

set identity_insert [tmp_rg_xx_classe] off
go

drop table [classe]
go

exec sp_rename '[tmp_rg_xx_classe]', 'classe'
go

alter table [classe] add constraint [pk__classe__3213e83feb641d13] primary key clustered  ([id])
go
create nonclustered index [classe_d133041f] on [classe] ([loja_id])
go
create nonclustered index [classe_c7c38b2a] on [classe] ([rede_id])
go
create nonclustered index [classe_b135e7bc] on [classe] ([sub_rede_id])
go

create table [rede]
(
  [rede_id] [bigint] not null,
  [nome] [nvarchar] (100) collate latin1_general_ci_ai not null,
  [rede_pai_id] [bigint] null
)
go
alter table [rede] add constraint [pk__rede__5dd8a701020fd665] primary key clustered  ([rede_id])
go
insert into [rede]([rede_id], [nome]) values (1, 'local')
go
create nonclustered index [rede_379d34a5] on [rede] ([rede_pai_id])
go
create table [tmp_rg_xx_codigo_barra]
(
  [id] [int] not null identity(1, 1),
  [codigo] [nvarchar] (30) collate latin1_general_ci_ai not null,
  [material_id] [int] not null,
  [rede_id] [bigint] not null,
  [loja_id] [bigint] null,
  [sub_rede_id] [bigint] null
)
go
insert into [tmp_rg_xx_codigo_barra]([codigo], [material_id], [rede_id])
select [codigodebarras], [material_id], 1
from [codigo_barra]
go
drop table [codigo_barra]
go
exec sp_rename '[tmp_rg_xx_codigo_barra]', 'codigo_barra'
go
alter table [codigo_barra] add constraint [pk__codigo_b__3213e83f13f9f522] primary key clustered  ([id])
go
create nonclustered index [codigo_barra_eb4b9aaa] on [codigo_barra] ([material_id])
go
create nonclustered index [codigo_barra_c7c38b2a] on [codigo_barra] ([rede_id])
go
create nonclustered index [codigo_barra_d133041f] on [codigo_barra] ([loja_id])
go
create nonclustered index [codigo_barra_b135e7bc] on [codigo_barra] ([sub_rede_id])
go
create table [item_preco]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null default getdate(),
[preco] [numeric] (15, 2) null,
[material_id] [int] not null,
[tabela_id] [int] not null
)
go
insert into [item_preco] ([preco], [material_id], [tabela_id] )
select [vl_precovenda], [material_id], 1
from [material]
go
alter table [item_preco] add constraint [pk__item_pre__3213e83f0c0dbbdb] primary key clustered  ([id])
go
create nonclustered index [item_preco_eb4b9aaa] on [item_preco] ([material_id])
go
create nonclustered index [item_preco_f53e3feb] on [item_preco] ([tabela_id])
go
create table [tmp_rg_xx_material]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null,
[codigo] [nvarchar] (20) collate latin1_general_ci_ai not null,
[descricao] [nvarchar] (30) collate latin1_general_ci_ai not null,
[descricao_touch] [nvarchar] (60) collate latin1_general_ci_ai null,
[descricao_producao] [nvarchar] (50) collate latin1_general_ci_ai null,
[tecla] [nvarchar] (1) collate latin1_general_ci_ai null,
[tecla_prog] [int] null,
[imagem] [nvarchar] (80) collate latin1_general_ci_ai null,
[cod_externo] [nvarchar] (30) collate latin1_general_ci_ai null,
[unidade] [nvarchar] (6) collate latin1_general_ci_ai null,
[venda] [bit] not null,
[servico] [bit] not null,
[requer_obs] [bit] not null,
[qtde_frac] [bit] not null,
[fabricacao_propria] [bit] not null,
[balanca] [bit] not null,
[consumacao] [bit] not null,
[vende_combo] [bit] not null,
[vende_web] [bit] not null,
[tipomaterial] [nvarchar] (1) collate latin1_general_ci_ai null,
[grupo_id] [int] not null,
[local_impressao_id] [int] null,
[loja_id] [bigint] null,
[rede_id] [bigint] not null,
[sub_rede_id] [bigint] null
)
go
set identity_insert [tmp_rg_xx_material] on
go
insert into [tmp_rg_xx_material]
(
  [id], 
  [ativo], 
  [dt_alt], 
  [codigo], 
  [descricao], 
  [descricao_touch], 
  [descricao_producao], 
  [tecla], 
  [tecla_prog], 
  [imagem],
  [cod_externo], 
  [unidade], 
  [venda], 
  [requer_obs], 
  [qtde_frac], 
  [fabricacao_propria], 
  [balanca], 
  [consumacao], 
  [servico], 
  [vende_combo],
  [vende_web], 
  [grupo_id], 
  [local_impressao_id], 
  [loja_id], 
  [rede_id]
)
select
  [material_id], 
  [bn_ativo], 
  isnull([dt_alt],getdate()), 
  [nu_codigo], 
  [nm_descricao], 
  [nm_descricaotouch] + isnull(' '+nm_descricaotouch2,'') + isnull(' '+nm_descricaotouch3,'') + isnull(' '+nm_descricaotouch4,''),
  [nm_descricaoproducao], 
  [nm_tecla], 
  [nm_teclaprog], 
  [nm_figura], 
  [cod_externo], 
  rtrim(isnull([unid_venda],'UN')), 
  isnull([bn_venda],0), 
  isnull([bn_requerobs], 0),
  isnull([bn_qtdefrac],0), 
  isnull([bn_fabricacaopropria],0), 
  isnull([bn_balanca],0), 
  isnull([bn_consumacao],0), 
  isnull([bn_servico], 0),
  isnull([bn_vendenocombo],0), 
  isnull([vendanaweb],0), 
  [grupo_id], 
  [st_localimpressao], 
  [loja_id], 
  1
from [material]
go
set identity_insert [tmp_rg_xx_material] off
go
drop table [material]
go
exec sp_rename '[tmp_rg_xx_material]', 'material'
go
alter table [material] add constraint [pk__material__3213e83f811a5759] primary key clustered  ([id])
go
create nonclustered index [material_acaeb2d6] on [material] ([grupo_id])
go
create nonclustered index [material_0360269b] on [material] ([local_impressao_id])
go
create nonclustered index [material_d133041f] on [material] ([loja_id])
go
create nonclustered index [material_c7c38b2a] on [material] ([rede_id])
go
create nonclustered index [material_b135e7bc] on [material] ([sub_rede_id])
go
create table [tmp_rg_xx_combo]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null,
[codigo] [nvarchar] (20) collate latin1_general_ci_ai not null,
[descricao_touch] [nvarchar] (20) collate latin1_general_ci_ai not null,
[descricao_prod] [nvarchar] (20) collate latin1_general_ci_ai not null,
[imagem] [nvarchar] (80) collate latin1_general_ci_ai null,
[local_producao] [int] null,
[requer_obs] [bit] not null,
[vende_web] [bit] not null,
[loja_id] [bigint] null,
[rede_id] [bigint] not null,
[sub_rede_id] [bigint] null
)
go
set identity_insert [tmp_rg_xx_combo] on
go
insert into [tmp_rg_xx_combo]
(
  [id], 
  [ativo], 
  [dt_alt], 
  [codigo], 
  [descricao_touch], 
  [descricao_prod], 
  [imagem], 
  [local_producao], 
  [requer_obs], 
  [vende_web], 
  [rede_id]
)
select 
  [combo_id], 
  [ativo], 
  [dt_alt], 
  [codigo], 
  [descricao_touch], 
  [descricao_prod], 
  [imagem], 
  [local_producao], 
  [bn_requerobs], 
  [bn_vendenaweb], 
  1
from [combo]
go
set identity_insert [tmp_rg_xx_combo] off
go
drop table [combo]
go
exec sp_rename '[tmp_rg_xx_combo]', 'combo'
go
alter table [combo] add constraint [pk__combo__3213e83f77563384] primary key clustered  ([id])
go
create nonclustered index [combo_d133041f] on [combo] ([loja_id])
go
create nonclustered index [combo_c7c38b2a] on [combo] ([rede_id])
go
create nonclustered index [combo_b135e7bc] on [combo] ([sub_rede_id])
go
create table [tmp_rg_xx_combo_slot]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null,
[ordem] [int] not null,
[minimo] [int] null,
[maximo] [int] null,
[preco] [numeric] (15, 2) null,
[classe_id] [int] null,
[combo_id] [int] not null,
[local_producao_id] [int] null,
[material_id] [int] null,
[precificador_id] [int] not null,
[quantificador_id] [int] not null
)
go
insert into [tmp_rg_xx_combo_slot]([dt_alt], [ordem], [minimo], [maximo], [preco], [classe_id], [combo_id], [local_producao_id], [material_id], [precificador_id], [quantificador_id], [ativo])
select [dt_alt], [ordem], [minimo], [maximo], [preco], [classe_id], [combo_id], [local_producao], [material_id], [precificador_id], [quantificador_id], 1
from [combo_slot]
go
set identity_insert [tmp_rg_xx_combo_slot] off
go
drop table [combo_slot]
go
exec sp_rename '[tmp_rg_xx_combo_slot]', 'combo_slot'
go
alter table [combo_slot] add constraint [pk__combo_sl__3213e83fc85e7d37] primary key clustered  ([id])
go
create nonclustered index [combo_slot_889ff0f8] on [combo_slot] ([classe_id])
go
create nonclustered index [combo_slot_a09ee62f] on [combo_slot] ([combo_id])
go
create nonclustered index [combo_slot_d15b9143] on [combo_slot] ([local_producao_id])
go
create nonclustered index [combo_slot_eb4b9aaa] on [combo_slot] ([material_id])
go
create nonclustered index [combo_slot_c3d860ae] on [combo_slot] ([precificador_id])
go
create nonclustered index [combo_slot_e6cb75e2] on [combo_slot] ([quantificador_id])
go
create table [local_impressao]
(
[id] [int] not null identity(0, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null default getdate(),
[codigo] [int] not null,
[descricao] [nvarchar] (30) collate latin1_general_ci_ai not null,
[loja_id] [bigint] null,
[rede_id] [bigint] not null,
[sub_rede_id] [bigint] null
)
go
alter table [local_impressao] add constraint [pk__local_im__3213e83f048a3802] primary key clustered  ([id])
go
insert into [local_impressao] (descricao, codigo, rede_id)
select nome, codigo, rede = 1
from  (
  select nome = '(nenhum)', codigo = 0
  union all
  select nome = nm_localproducao1, codigo = 1 from colibri
  union all
  select nome = nm_localproducao2, codigo = 2 from colibri
  union all
  select nome = nm_localproducao3, codigo = 3 from colibri
  union all
  select nome = nm_localproducao4, codigo = 4 from colibri
  union all
  select nome = nm_localproducao5, codigo = 5 from colibri
  union all
  select nome = nm_localproducao6, codigo = 6 from colibri
  union all
  select nome = nm_localproducao7, codigo = 7 from colibri
  union all
  select nome = nm_localproducao8, codigo = 8 from colibri
  union all
  select nome = nm_localproducao9, codigo = 9 from colibri
  union all
  select nome = nm_localproducao10, codigo = 10 from colibri
  union all
  select nome = nm_localproducao11, codigo = 11 from colibri
  union all
  select nome = nm_localproducao12, codigo = 12 from colibri
  union all
  select nome = nm_localproducao13, codigo = 13 from colibri
  union all
  select nome = nm_localproducao14, codigo = 14 from colibri
  union all
  select nome = nm_localproducao15, codigo = 15 from colibri
  union all
  select nome = nm_localproducao16, codigo = 16 from colibri
  union all
  select nome = nm_localproducao17, codigo = 17 from colibri
  union all
  select nome = nm_localproducao18, codigo = 18 from colibri
  union all
  select nome = nm_localproducao19, codigo = 19 from colibri
  union all
  select nome = nm_localproducao20, codigo = 20 from colibri
) x
go
create nonclustered index [local_impressao_d133041f] on [local_impressao] ([loja_id])
go
create nonclustered index [local_impressao_c7c38b2a] on [local_impressao] ([rede_id])
go
create nonclustered index [local_impressao_b135e7bc] on [local_impressao] ([sub_rede_id])
go
create table [tmp_rg_xx_combo_precificador]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null,
[descricao] [nvarchar] (20) collate latin1_general_ci_ai not null,
[classe] [nvarchar] (100) collate latin1_general_ci_ai null
)
go
set identity_insert [tmp_rg_xx_combo_precificador] on
go
insert into [tmp_rg_xx_combo_precificador]([id], [dt_alt], [descricao], [classe], [ativo])
select [precificador_id], [dt_alt], [descricao], [classe], 1
from [combo_precificador]
go
set identity_insert [tmp_rg_xx_combo_precificador] off
go
drop table [combo_precificador]
go
exec sp_rename '[tmp_rg_xx_combo_precificador]', 'combo_precificador'
go
alter table [combo_precificador] add constraint [pk__combo_pr__3213e83f2fe614b1] primary key clustered  ([id])
go
create table [tmp_rg_xx_combo_quantificador]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null,
[descricao] [nvarchar] (20) collate latin1_general_ci_ai not null,
[classe] [nvarchar] (100) collate latin1_general_ci_ai null
)
go
set identity_insert [tmp_rg_xx_combo_quantificador] on
go
insert into [tmp_rg_xx_combo_quantificador]([id], [dt_alt], [descricao], [classe], [ativo])
select [quantificador_id], [dt_alt], [descricao], [classe],1
from [combo_quantificador]
go
set identity_insert [tmp_rg_xx_combo_quantificador] off
go
drop table [combo_quantificador]
go
exec sp_rename '[tmp_rg_xx_combo_quantificador]', 'combo_quantificador'
go
alter table [combo_quantificador] add constraint [pk__combo_qu__3213e83f9aa4a6db] primary key clustered  ([id])
go
create table [tmp_rg_xx_layout_touch]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null,
[descricao] [nvarchar] (60) collate latin1_general_ci_ai not null,
[tipo_venda] [int] not null,
[rede_id] [bigint] not null
)
go
set identity_insert [tmp_rg_xx_layout_touch] on
go
insert into [tmp_rg_xx_layout_touch]([id], [dt_alt], [descricao], [tipo_venda], [rede_id], [ativo])
select [layout_id], [dt_alt], [descr], [nu_tipovenda], 1, 1
from [layout_touch]
go
set identity_insert [tmp_rg_xx_layout_touch] off
go
drop table [layout_touch]
go
exec sp_rename '[tmp_rg_xx_layout_touch]', 'layout_touch'
go
alter table [layout_touch] add constraint [pk__layout_t__3213e83f78909ce0] primary key clustered  ([id])
go
create nonclustered index [layout_touch_c7c38b2a] on [layout_touch] ([rede_id])
go
create table [tmp_rg_xx_funcao]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null default getdate(),
[nome] [nvarchar] (20) collate latin1_general_ci_ai null
)
go
set identity_insert [tmp_rg_xx_funcao] on
go
insert into [tmp_rg_xx_funcao]([id], [dt_alt], [nome], [ativo])
select [funcao_id], [dt_alt], [nm_funcao], 1
from [funcao]
go
set identity_insert [tmp_rg_xx_funcao] off
go
drop table [funcao]
go
exec sp_rename '[tmp_rg_xx_funcao]', 'funcao'
go
alter table [funcao] add constraint [pk__funcao__3213e83f5a6e4c26] primary key clustered  ([id])
go
create table [tmp_rg_xx_funcionario]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null default getdate(),
[nome] [nvarchar] (40) collate latin1_general_ci_ai not null,
[codigo] [smallint] not null,
[senha] [nvarchar] (64) collate latin1_general_ci_ai not null,
[estado] [nvarchar] (2) collate latin1_general_ci_ai null,
[usuario] [nvarchar] (10) collate latin1_general_ci_ai null,
[endereco] [nvarchar] (48) collate latin1_general_ci_ai null,
[bairro] [nvarchar] (25) collate latin1_general_ci_ai null,
[cidade] [nvarchar] (25) collate latin1_general_ci_ai null,
[cep] [nvarchar] (10) collate latin1_general_ci_ai null,
[telefone] [nvarchar] (15) collate latin1_general_ci_ai null,
[vl_entrega] [numeric] (15, 2) null,
[funcao_id] [int] not null,
[grupo_id] [int] not null,
[usuario_app_id] [int] null
)
go
set identity_insert [tmp_rg_xx_funcionario] on
go
insert into [tmp_rg_xx_funcionario]([id], [ativo], [dt_alt], [nome], [codigo], [senha], [estado], [usuario], [endereco], [bairro], [cidade], [cep], [telefone], [vl_entrega], [funcao_id], [grupo_id])
select [funcionario_id], [bn_ativo], [dt_alt], [nm_nome], [nu_funcionario], [nu_senha], [sg_estado], [nm_usuario], [nm_endereco], [nm_bairro], [nm_cidade], [nu_cep], [nu_fone], [lm_vl_entrega], [funcao_id], [grupofunc_id] from [funcionario]
go
set identity_insert [tmp_rg_xx_funcionario] off
go
drop table [funcionario]
go
exec sp_rename '[tmp_rg_xx_funcionario]', 'funcionario'
go
alter table [funcionario] add constraint [pk__funciona__3213e83f9be38bfc] primary key clustered  ([id])
go
create nonclustered index [funcionario_031eb33e] on [funcionario] ([funcao_id])
go
create nonclustered index [funcionario_acaeb2d6] on [funcionario] ([grupo_id])
go
create table [tmp_rg_xx_item_classe]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null,
[tipo] [nvarchar] (2) collate latin1_general_ci_ai not null,
[ordem] [smallint] not null,
[classe_id] [int] not null,
[classe_item_id] [int] null,
[combo_item_id] [int] null,
[material_item_id] [int] null
)
go
insert into [tmp_rg_xx_item_classe]([dt_alt], [ordem], [classe_id], [classe_item_id], [combo_item_id], [material_item_id], [tipo])
select [dt_alt], [nu_ordem], [classe_id],
  case [it_classe] when 0 then null else [it_classe] end,
  case [it_combo] when 0 then null else [it_combo] end,
  case [it_material] when 0 then null else [it_material] end,
  case
    when it_classe > 0 then 'cl'
    when it_material > 0 then 'ma'
    when it_combo > 0 then 'co'
  end
from [item_classe]
go
set identity_insert [tmp_rg_xx_item_classe] off
go
drop table [item_classe]
go
exec sp_rename '[tmp_rg_xx_item_classe]', 'item_classe'
go
alter table [item_classe] add constraint [pk__item_cla__3213e83fdfa5e138] primary key clustered  ([id])
go
create nonclustered index [item_classe_889ff0f8] on [item_classe] ([classe_id])
go
create nonclustered index [item_classe_44f057a0] on [item_classe] ([classe_item_id])
go
create nonclustered index [item_classe_061189e8] on [item_classe] ([combo_item_id])
go
create nonclustered index [item_classe_6d0bc98b] on [item_classe] ([material_item_id])
go
create table [tabela_preco]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null default getdate(),
[nome] [nvarchar] (40) collate latin1_general_ci_ai not null,
[dt_vigencia] [date] not null,
[loja_id] [bigint] not null
)
go
insert into [tabela_preco] ([nome], [dt_vigencia], [loja_id])
values ( 'tabela padrão', '20000101', (select top 1 loja_id from loja) )
go
alter table [tabela_preco] add constraint [pk__tabela_p__3213e83f257d20f9] primary key clustered  ([id])
go
create nonclustered index [tabela_preco_d133041f] on [tabela_preco] ([loja_id])
go
create table [tmp_rg_xx_maquina]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null default getdate(),
[nome] [nvarchar] (20) collate latin1_general_ci_ai not null,
[caminho] [nvarchar] (50) collate latin1_general_ci_ai not null,
[exibe_atalhos] [bit] null,
[solicita_garcom] [bit] null,
[garcom_abertura] [bit] null,
[usa_tef] [bit] null,
[login_biometria] [bit] null,
[login_senha] [bit] not null default 1,
[display_lcd] [bit] null,
[perm_sair_ticket] [bit] null,
[terminal_caixa] [bit] null,
[ativa_auto_pagamento] [bit] null,
[inicia_auto_pagamento] [bit] null,
[layout_balcao_id] [int] null,
[layout_entrega_id] [int] null,
[layout_ficha_id] [int] null,
[layout_mesa_id] [int] null,
[ponto_balcao_id] [int] not null,
[ponto_entrega_id] [int] not null,
[ponto_ficha_id] [int] not null,
[ponto_fiscal_id] [int] null,
[ponto_mesa_id] [int] not null
)
go
set identity_insert [tmp_rg_xx_maquina] on
go
insert into [tmp_rg_xx_maquina]
  ([id], [ativo], [dt_alt], [nome], [caminho], [exibe_atalhos], [solicita_garcom], [garcom_abertura], [usa_tef], [login_biometria],
   [login_senha], [display_lcd], [perm_sair_ticket], [terminal_caixa], [ativa_auto_pagamento], [inicia_auto_pagamento],
   [layout_balcao_id], [layout_entrega_id], [layout_ficha_id], [layout_mesa_id], [ponto_balcao_id], [ponto_entrega_id],
   [ponto_ficha_id], [ponto_fiscal_id], [ponto_mesa_id])
select
  [maquina_id], isnull([bn_ativa],1), [dt_alt], [nm_maquina], [nm_caminho], [bn_exibeatalhos], [bn_peganumgarcon], [bn_garcomnaabertura],
  [usatef], [bn_biometria], [bn_senha], [areadetrabalhoextendida], [perm_para_sair_ticket], [terminalcaixa], [autopagamento], [inicia_autopagamento],
  [layoutbalcao_id], [layoutentrega_id], [layoutficha_id], [layoutmesa_id], [pontobalcao_id], [pontoentrega_id],
  [pontoficha_id], [ponto_fiscal_id], [pontomesa_id]
from [maquina]
go
set identity_insert [tmp_rg_xx_maquina] off
go
drop table [maquina]
go
exec sp_rename '[tmp_rg_xx_maquina]', 'maquina'
go
alter table [maquina] add constraint [pk__maquina__3213e83fffdfc6ed] primary key clustered  ([id])
go
create nonclustered index [maquina_e894c7ca] on [maquina] ([layout_balcao_id])
go
create nonclustered index [maquina_eb71951f] on [maquina] ([layout_entrega_id])
go
create nonclustered index [maquina_4d6bbaab] on [maquina] ([layout_ficha_id])
go
create nonclustered index [maquina_e5ae58d8] on [maquina] ([layout_mesa_id])
go
create nonclustered index [maquina_d2b3f069] on [maquina] ([ponto_balcao_id])
go
create nonclustered index [maquina_085c5b85] on [maquina] ([ponto_entrega_id])
go
create nonclustered index [maquina_4a0a4f19] on [maquina] ([ponto_ficha_id])
go
create nonclustered index [maquina_e593cc30] on [maquina] ([ponto_fiscal_id])
go
create nonclustered index [maquina_53473617] on [maquina] ([ponto_mesa_id])
go
create table [tmp_rg_xx_ponto_venda]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null,
[nome] [nvarchar] (20) collate latin1_general_ci_ai not null
)
go
set identity_insert [tmp_rg_xx_ponto_venda] on
go
insert into [tmp_rg_xx_ponto_venda]([id], [dt_alt], [nome], [ativo])
select [pontovenda_id], [dt_alt], [nm_pontovenda], 1
from [ponto_venda]
go
set identity_insert [tmp_rg_xx_ponto_venda] off
go
drop table [ponto_venda]
go
exec sp_rename '[tmp_rg_xx_ponto_venda]', 'ponto_venda'
go
alter table [ponto_venda] add constraint [pk__ponto_ve__3213e83f2f599e29] primary key clustered  ([id])
go
create table [tmp_rg_xx_ponto_fiscal]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null default getdate(),
[nome] [nvarchar] (20) collate latin1_general_ci_ai not null
)
go
set identity_insert [tmp_rg_xx_ponto_fiscal] on
go
insert into [tmp_rg_xx_ponto_fiscal]([id], [nome], [ativo])
select [ponto_fiscal_id], [nome], 1
from [ponto_fiscal]
go
set identity_insert [tmp_rg_xx_ponto_fiscal] off
go
drop table [ponto_fiscal]
go
exec sp_rename '[tmp_rg_xx_ponto_fiscal]', 'ponto_fiscal'
go
alter table [ponto_fiscal] add constraint [pk__ponto_fi__3213e83f83659441] primary key clustered  ([id])
go
create table [tmp_rg_xx_material_obs]
(
[id] [int] not null identity(1, 1),
[posicao] [int] not null,
[combo_id] [int] null,
[material_id] [int] null,
[observacao_id] [int] not null
)
go
insert into [tmp_rg_xx_material_obs]([posicao], [combo_id], [material_id], [observacao_id])
select [nu_posicao], [combo_id], [material_id], [observacao_id]
from [material_obs]
go
drop table [material_obs]
go
exec sp_rename '[tmp_rg_xx_material_obs]', 'material_obs'
go
alter table [material_obs] add constraint [pk__material__3213e83f6ac867cf] primary key clustered  ([id])
go
create nonclustered index [material_obs_a09ee62f] on [material_obs] ([combo_id])
go
create nonclustered index [material_obs_eb4b9aaa] on [material_obs] ([material_id])
go
create nonclustered index [material_obs_2c543064] on [material_obs] ([observacao_id])
go
create table [tmp_rg_xx_observacao]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null,
[codigo] [int] not null,
[nome] [nvarchar] (20) collate latin1_general_ci_ai not null,
[loja_id] [bigint] null,
[rede_id] [bigint] not null,
[sub_rede_id] [bigint] null
)
go
set identity_insert [tmp_rg_xx_observacao] on
go
insert into [tmp_rg_xx_observacao]([id], [dt_alt], [codigo], [nome], [loja_id], [rede_id])
select [observacao_id], [dt_alt], [nu_codigo], [nm_observacao], [loja_id], 1
from [observacao]
go
set identity_insert [tmp_rg_xx_observacao] off
go
drop table [observacao]
go
exec sp_rename '[tmp_rg_xx_observacao]', 'observacao'
go
alter table [observacao] add constraint [pk__observac__3213e83ffed2a675] primary key clustered  ([id])
go
create nonclustered index [observacao_d133041f] on [observacao] ([loja_id])
go
create nonclustered index [observacao_c7c38b2a] on [observacao] ([rede_id])
go
create nonclustered index [observacao_b135e7bc] on [observacao] ([sub_rede_id])
go
create table [tmp_rg_xx_motivo_cancelamento]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null,
[codigo] [int] not null,
[nome] [nvarchar] (50) collate latin1_general_ci_ai not null,
[baixa_estoque] [bit] not null,
[loja_id] [bigint] null,
[rede_id] [bigint] not null,
[sub_rede_id] [bigint] null
)
go
set identity_insert [tmp_rg_xx_motivo_cancelamento] on
go
insert into [tmp_rg_xx_motivo_cancelamento]([id], [dt_alt], [codigo], [nome], [baixa_estoque], [loja_id], [rede_id])
select [motivo_id], [dt_alt], [nu_codigo], [nm_motivo], [bn_estoque], [loja_id], 1
from [motivo_cancelamento]
go
set identity_insert [tmp_rg_xx_motivo_cancelamento] off
go
drop table [motivo_cancelamento]
go
exec sp_rename '[tmp_rg_xx_motivo_cancelamento]', 'motivo_cancelamento'
go
alter table [motivo_cancelamento] add constraint [pk__motivo_c__3213e83f53ae367f] primary key clustered  ([id])
go
create nonclustered index [motivo_cancelamento_d133041f] on [motivo_cancelamento] ([loja_id])
go
create nonclustered index [motivo_cancelamento_c7c38b2a] on [motivo_cancelamento] ([rede_id])
go
create nonclustered index [motivo_cancelamento_b135e7bc] on [motivo_cancelamento] ([sub_rede_id])
go
create table [tmp_rg_xx_tipo_recebimento]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null,
[codigo] [int] not null,
[descricao] [nvarchar] (20) collate latin1_general_ci_ai not null,
[imagem] [nvarchar] (80) collate latin1_general_ci_ai null,
[convenio_tef] [smallint] null,
[troco_dinheiro] [bit] not null,
[troco_repique] [bit] not null,
[troco_contravale] [bit] not null,
[tef] [bit] not null,
[tipo_tef] [nvarchar] (1) collate latin1_general_ci_ai null,
[multiplo] [bit] not null,
[ordem] [int] not null,
[cor] [nvarchar] (10) null,
[loja_id] [bigint] null,
[rede_id] [bigint] not null,
[sub_rede_id] [bigint] null
)
go
set identity_insert [tmp_rg_xx_tipo_recebimento] on
go
--corrige o trigger
alter trigger [tiporecebimento_u] on [tipo_recebimento]
after update as
begin
  set nocount on

  update [tipo_recebimento]
  set
    dt_alt = getdate()
  from inserted i
  where [tipo_recebimento].tiporecebimento_id = i.tiporecebimento_id

  set nocount off
end
go
--corrige os tipos de recebimento com codigo duplicados
update [tipo_recebimento]
set nu_codigo = (select max(nu_codigo) from [tipo_recebimento]) + tiporecebimento_id
where tiporecebimento_id in (
  select
    id = tiporecebimento_id
  from [tipo_recebimento]
  where nu_codigo in (
    select
      nu_codigo
    from [tipo_recebimento]
    group by nu_codigo
    having count(*) > 1
  ) and tiporecebimento_id not in (
    select
      min(tiporecebimento_id)
    from [tipo_recebimento]
    where nu_codigo in (
      select
        nu_codigo
      from [tipo_recebimento]
      group by nu_codigo
      having count(*) > 1
   )
   group by nu_codigo
  )
)
go
insert into [tmp_rg_xx_tipo_recebimento]([id], [ativo], [dt_alt], [codigo], [descricao], [imagem], [troco_dinheiro], [troco_repique], [troco_contravale], [tef], [tipo_tef], [multiplo], [ordem], [cor], [loja_id], [rede_id])
select [tiporecebimento_id], [bn_ativo], [dt_alt], [nu_codigo], [nm_descricao], [nm_imagem], [bn_dinheiro], [bn_repique], [bn_contravale], [bn_tef], [tipotef], [bn_multiplo], [ordem], [cor], [loja_id], 1
from [tipo_recebimento]
go
set identity_insert [tmp_rg_xx_tipo_recebimento] off
go
drop table [tipo_recebimento]
go
exec sp_rename '[tmp_rg_xx_tipo_recebimento]', 'tipo_recebimento'
go
alter table [tipo_recebimento] add constraint [pk__tipo_rec__3213e83f21f66342] primary key clustered  ([id])
go
create nonclustered index [tipo_recebimento_d133041f] on [tipo_recebimento] ([loja_id])
go
create nonclustered index [tipo_recebimento_c7c38b2a] on [tipo_recebimento] ([rede_id])
go
create nonclustered index [tipo_recebimento_b135e7bc] on [tipo_recebimento] ([sub_rede_id])
go
create table [usuario]
(
[id] [int] not null identity(1, 1),
[password] [nvarchar] (128) collate latin1_general_ci_ai not null,
[last_login] [datetime] null,
[login] [nvarchar] (32) collate latin1_general_ci_ai not null,
[is_active] [bit] not null,
[is_admin] [bit] not null
)
go
alter table [usuario] add constraint [pk__usuario__3213e83fec2b85e7] primary key clustered  ([id])
go
create table [tmp_rg_xx_desconto]
(
[id] [int] not null identity(1, 1),
[ativo] [bit] not null default 1,
[dt_alt] [datetime] not null,
[codigo] [smallint] not null,
[descricao] [nvarchar] (30) collate latin1_general_ci_ai not null,
[valor] [numeric] (5, 2) not null,
[desconto_estrategia_id] [int] null,
[pode_alterar] [bit] null
)
go
set identity_insert [tmp_rg_xx_desconto] on
go
insert into [tmp_rg_xx_desconto]([id], [ativo], [dt_alt], [codigo], [descricao], [valor], [desconto_estrategia_id], [pode_alterar])
select [desconto_id], isnull([bn_ativo],1), [dt_alt], [nu_codigo], [nm_desconto], [vl_desconto], [desconto_estrategia_id], [pode_alterar]
from [desconto]
go
set identity_insert [tmp_rg_xx_desconto] off
go
drop table [desconto]
go
exec sp_rename '[tmp_rg_xx_desconto]', 'desconto'
go
alter table [desconto] add constraint [pk__desconto__3213e83fa501b1b5] primary key clustered  ([id])
go
create table [tmp_rg_xx_acao_touch]
(
[acao_id] [int] not null,
[imagem] [nvarchar] (50) collate latin1_general_ci_ai null,
[caption] [nvarchar] (40) collate latin1_general_ci_ai null,
[mesa] [bit] not null,
[entrega] [bit] not null,
[balcao] [bit] not null,
[ficha] [bit] not null,
[transicao] [nvarchar] (60) collate latin1_general_ci_ai null,
[atalho] [nvarchar] (20) collate latin1_general_ci_ai null,
[atalho2] [nvarchar] (20) collate latin1_general_ci_ai null
)
go
insert into [tmp_rg_xx_acao_touch]([acao_id], [imagem], [caption], [mesa], [entrega], [balcao], [ficha], [transicao], [atalho], [atalho2])
select [botao_id], [nm_img], [nm_caption], [bn_mesa], [bn_entrega], [bn_balcao], [bn_ficha], [transicao], [atalho] , [atalho2]
from [acao_touch]
go
drop table [acao_touch]
go
exec sp_rename '[tmp_rg_xx_acao_touch]', 'acao_touch'
go
alter table [acao_touch] add constraint [pk__acao_tou__38963bb78c563f2a] primary key clustered  ([acao_id])
go
alter table [config_touch] add constraint [config_touch_item_id_40d90a37_check] check (([item_id]>=(0)))
go
alter table [grupo_material] add constraint [grupo_material_lft_3ecad519_check] check (([lft]>=(0)))
go
alter table [grupo_material] add constraint [grupo_material_rght_3955de69_check] check (([rght]>=(0)))
go
alter table [grupo_material] add constraint [grupo_material_tree_id_6cf720b3_check] check (([tree_id]>=(0)))
go
alter table [grupo_material] add constraint [grupo_material_level_3bc96bbd_check] check (([level]>=(0)))
go
alter table [grupo_material] add constraint [grupo_material_rede_id_64503999_uniq] unique nonclustered  ([rede_id], [id])
go
alter table [codigo_barra] add constraint [codigo_barra_rede_id_7e0cbf3f_uniq] unique nonclustered  ([rede_id], [sub_rede_id], [loja_id], [codigo])
go
alter table [classe] add constraint [classe_rede_id_6addaab2_uniq] unique nonclustered  ([rede_id], [sub_rede_id], [loja_id], [codigo])
go
alter table [combo] add constraint [combo_rede_id_20d88f96_uniq] unique nonclustered  ([rede_id], [sub_rede_id], [loja_id], [codigo])
go
alter table [desconto] add constraint [uq__desconto__40f9a2065f64dfe5] unique nonclustered  ([codigo])
go
alter table [funcionario] add constraint [uq__funciona__40f9a20618a0eb54] unique nonclustered  ([codigo])
go
/* em algumas bases pode dar erro ao criar esta chave
alter table [funcionario] add constraint [uq__funciona__d8d98e82cca7b541] unique nonclustered  ([senha])
go
*/
alter table [item_preco] add constraint [item_preco_tabela_id_4acda839_uniq] unique nonclustered  ([tabela_id], [material_id])
go
alter table [local_impressao] add constraint [local_impressao_rede_id_3231234d_uniq] unique nonclustered  ([rede_id], [sub_rede_id], [loja_id], [codigo])
go
/*Apaga as duplicadas da tabela de item_classe*/
delete item_classe
from item_classe
left outer join (
  select
    id = max(id), classe_id, material_item_id
  from item_classe
  where tipo = 'ma'
  group by classe_id, material_item_id
) x on item_classe.id = x.id
where x.id is null
  and item_classe.tipo = 'ma'
go

delete item_classe
from item_classe
left outer join (
  select
    id = max(id), classe_id, classe_item_id
  from item_classe
  where tipo = 'cl'
  group by classe_id, classe_item_id
) x on item_classe.id = x.id
where x.id is null
  and item_classe.tipo = 'cl'
go

delete item_classe
from item_classe
left outer join (
  select
    id = max(id), classe_id, combo_item_id
  from item_classe
  where tipo = 'co'
  group by classe_id, combo_item_id
) x on item_classe.id = x.id
where x.id is null
  and item_classe.tipo = 'co'
go
alter table [item_classe] add constraint [item_classe_classe_id_55e04c2b_uniq] unique nonclustered  ([classe_id], [material_item_id], [classe_item_id], [combo_item_id])
go
delete material_obs
from material_obs
left outer join (
  select
    id = max(id), material_id, observacao_id
  from material_obs
  where combo_id is null
  group by material_id, observacao_id
) x on material_obs.id = x.id
where x.id is null
  and combo_id is null
go
alter table [material_obs] add constraint [material_obs_material_id_1711d387_uniq] unique nonclustered  ([material_id], [observacao_id], [combo_id])
go
alter table [motivo_cancelamento] add constraint [motivo_cancelamento_rede_id_399431ff_uniq] unique nonclustered  ([rede_id], [sub_rede_id], [codigo])
go
alter table [material] add constraint [material_rede_id_6d4a9052_uniq] unique nonclustered  ([rede_id], [sub_rede_id], [loja_id], [codigo])
go
alter table [usuario] add constraint [uq__usuario__7838f272bd94b0a8] unique nonclustered  ([login])
go
alter table [observacao] add constraint [observacao_rede_id_705f28e0_uniq] unique nonclustered  ([rede_id], [sub_rede_id], [loja_id], [codigo])
go
alter table [tabela_preco] add constraint [tabela_preco_loja_id_5a964e5c_uniq] unique nonclustered  ([loja_id], [dt_vigencia])
go
alter table [tipo_recebimento] add constraint [tipo_recebimento_rede_id_5ef86eff_uniq] unique nonclustered  ([rede_id], [sub_rede_id], [codigo])
go
alter table [funcionario] add constraint [funcionario_usuario_app_id_3b045417_fk_auth_user_id] foreign key ([usuario_app_id]) references [auth_user] ([id])
--alter table [funcionario] add constraint [funcionario_grupo_id_18bba782_fk_auth_group_id] foreign key ([grupo_id]) references [auth_group] ([id])
alter table [funcionario] add constraint [funcionario_funcao_id_3054530c_fk_funcao_id] foreign key ([funcao_id]) references [funcao] ([id])
go
alter table [codigo_barra] add constraint [codigo_barra_material_id_1d63aae9_fk_material_id] foreign key ([material_id]) references [material] ([id])
alter table [codigo_barra] add constraint [codigo_barra_rede_id_4c6944a4_fk_rede_rede_id] foreign key ([rede_id]) references [rede] ([rede_id])
alter table [codigo_barra] add constraint [codigo_barra_loja_id_1fb83d0a_fk_loja_loja_id] foreign key ([loja_id]) references [loja] ([loja_id])
alter table [codigo_barra] add constraint [codigo_barra_sub_rede_id_49577f4f_fk_rede_rede_id] foreign key ([sub_rede_id]) references [rede] ([rede_id])
go
-- Apago registros perdidos
delete from [combo_slot] where classe_id not in (select id from [classe])
go
alter table [combo_slot] add constraint [combo_slot_classe_id_1f9d3842_fk_classe_id] foreign key ([classe_id]) references [classe] ([id])
alter table [combo_slot] add constraint [combo_slot_combo_id_78b59c6_fk_combo_id] foreign key ([combo_id]) references [combo] ([id])
alter table [combo_slot] add constraint [combo_slot_precificador_id_46ff2c8a_fk_combo_precificador_id] foreign key ([precificador_id]) references [combo_precificador] ([id])
alter table [combo_slot] add constraint [combo_slot_quantificador_id_21458cf8_fk_combo_quantificador_id] foreign key ([quantificador_id]) references [combo_quantificador] ([id])
alter table [combo_slot] add constraint [combo_slot_local_producao_id_5948fdc0_fk_local_impressao_id] foreign key ([local_producao_id]) references [local_impressao] ([id])
alter table [combo_slot] add constraint [combo_slot_material_id_57da541e_fk_material_id] foreign key ([material_id]) references [material] ([id])
go
delete from item_classe where classe_id is not null and classe_id not in (select id from classe)
delete from item_classe where classe_item_id is not null and classe_item_id not in (select id from classe)
delete from item_classe where material_item_id is not null and material_item_id not in (select id from material)
delete from item_classe where combo_item_id is not null and combo_item_id not in (select id from combo)
go

alter table [item_classe] add constraint [item_classe_classe_id_60ebcdbf_fk_classe_id] foreign key ([classe_id]) references [classe] ([id])
alter table [item_classe] add constraint [item_classe_classe_item_id_6a6ab6c2_fk_classe_id] foreign key ([classe_item_id]) references [classe] ([id])
alter table [item_classe] add constraint [item_classe_combo_item_id_739d5232_fk_combo_id] foreign key ([combo_item_id]) references [combo] ([id])
alter table [item_classe] add constraint [item_classe_material_item_id_cf07ab2_fk_material_id] foreign key ([material_item_id]) references [material] ([id])
go
alter table [classe] add constraint [classe_loja_id_7b5053b7_fk_loja_loja_id] foreign key ([loja_id]) references [loja] ([loja_id])
alter table [classe] add constraint [classe_rede_id_2071ea09_fk_rede_rede_id] foreign key ([rede_id]) references [rede] ([rede_id])
alter table [classe] add constraint [classe_sub_rede_id_4c12aa2_fk_rede_rede_id] foreign key ([sub_rede_id]) references [rede] ([rede_id])
go
delete from [material_obs] where observacao_id not in (select id from observacao)
go
alter table [material_obs] add constraint [material_obs_combo_id_7ec5e8cb_fk_combo_id] foreign key ([combo_id]) references [combo] ([id])
alter table [material_obs] add constraint [material_obs_material_id_7bc89f39_fk_material_id] foreign key ([material_id]) references [material] ([id])
alter table [material_obs] add constraint [material_obs_observacao_id_2c0d4e41_fk_observacao_id] foreign key ([observacao_id]) references [observacao] ([id])
go
alter table [combo] add constraint [combo_loja_id_1ef49e65_fk_loja_loja_id] foreign key ([loja_id]) references [loja] ([loja_id])
alter table [combo] add constraint [combo_rede_id_53c4f7ed_fk_rede_rede_id] foreign key ([rede_id]) references [rede] ([rede_id])
alter table [combo] add constraint [combo_sub_rede_id_43fd37a6_fk_rede_rede_id] foreign key ([sub_rede_id]) references [rede] ([rede_id])
go
alter table [config_touch] add constraint [config_touch_layout_id_3bada8a4_fk_layout_touch_id] foreign key ([layout_id]) references [layout_touch] ([id])
alter table [config_touch] add constraint [config_touch_tipo_item_id_675d9e99_fk_django_content_type_id] foreign key ([tipo_item_id]) references [django_content_type] ([id])
go
alter table [item_preco] add constraint [item_preco_material_id_6630a7a_fk_material_id] foreign key ([material_id]) references [material] ([id])
alter table [item_preco] add constraint [item_preco_tabela_id_2a22a108_fk_tabela_preco_id] foreign key ([tabela_id]) references [tabela_preco] ([id])
go
update dbo.maquina set ponto_balcao_id = 0
where ponto_balcao_id not in (select id from dbo.ponto_venda)
update dbo.maquina set ponto_mesa_id = 0
where ponto_mesa_id not in (select id from dbo.ponto_venda)
update dbo.maquina set ponto_ficha_id = 0
where ponto_entrega_id not in (select id from dbo.ponto_venda)
update dbo.maquina set ponto_entrega_id = 0
where ponto_entrega_id not in (select id from dbo.ponto_venda)
go
alter table [maquina] add constraint [maquina_layout_balcao_id_50544fdb_fk_layout_touch_id] foreign key ([layout_balcao_id]) references [layout_touch] ([id])
alter table [maquina] add constraint [maquina_layout_entrega_id_48fef8ea_fk_layout_touch_id] foreign key ([layout_entrega_id]) references [layout_touch] ([id])
alter table [maquina] add constraint [maquina_layout_ficha_id_20f605cb_fk_layout_touch_id] foreign key ([layout_ficha_id]) references [layout_touch] ([id])
alter table [maquina] add constraint [maquina_layout_mesa_id_3a483741_fk_layout_touch_id] foreign key ([layout_mesa_id]) references [layout_touch] ([id])
alter table [maquina] add constraint [maquina_ponto_balcao_id_611dca58_fk_ponto_venda_id] foreign key ([ponto_balcao_id]) references [ponto_venda] ([id])
alter table [maquina] add constraint [maquina_ponto_entrega_id_52b2b1e7_fk_ponto_venda_id] foreign key ([ponto_entrega_id]) references [ponto_venda] ([id])
alter table [maquina] add constraint [maquina_ponto_ficha_id_402c3bce_fk_ponto_venda_id] foreign key ([ponto_ficha_id]) references [ponto_venda] ([id])
alter table [maquina] add constraint [maquina_ponto_fiscal_id_ea15c3e_fk_ponto_fiscal_id] foreign key ([ponto_fiscal_id]) references [ponto_fiscal] ([id])
alter table [maquina] add constraint [maquina_ponto_mesa_id_42d60aac_fk_ponto_venda_id] foreign key ([ponto_mesa_id]) references [ponto_venda] ([id])
go
alter table [layout_touch] add constraint [layout_touch_rede_id_386924de_fk_rede_rede_id] foreign key ([rede_id]) references [rede] ([rede_id])
go
alter table [grupo_material] add constraint [grupo_material_parent_id_49409bf9_fk_grupo_material_id] foreign key ([parent_id]) references [grupo_material] ([id])
alter table [grupo_material] add constraint [grupo_material_rede_id_296a464d_fk_rede_rede_id] foreign key ([rede_id]) references [rede] ([rede_id])
go
alter table [material] add constraint [material_grupo_id_751367d3_fk_grupo_material_id] foreign key ([grupo_id]) references [grupo_material] ([id])
alter table [material] add constraint [material_local_impressao_id_7055f101_fk_local_impressao_id] foreign key ([local_impressao_id]) references [local_impressao] ([id])
alter table [material] add constraint [material_loja_id_5497aea9_fk_loja_loja_id] foreign key ([loja_id]) references [loja] ([loja_id])
alter table [material] add constraint [material_rede_id_2ec143a9_fk_rede_rede_id] foreign key ([rede_id]) references [rede] ([rede_id])
alter table [material] add constraint [material_sub_rede_id_3326d7be_fk_rede_rede_id] foreign key ([sub_rede_id]) references [rede] ([rede_id])
go
alter table [local_impressao] add constraint [local_impressao_loja_id_751c6b82_fk_loja_loja_id] foreign key ([loja_id]) references [loja] ([loja_id])
alter table [local_impressao] add constraint [local_impressao_rede_id_70bded30_fk_rede_rede_id] foreign key ([rede_id]) references [rede] ([rede_id])
alter table [local_impressao] add constraint [local_impressao_sub_rede_id_abca93d_fk_rede_rede_id] foreign key ([sub_rede_id]) references [rede] ([rede_id])
go
alter table [motivo_cancelamento] add constraint [motivo_cancelamento_loja_id_1ceb74f4_fk_loja_loja_id] foreign key ([loja_id]) references [loja] ([loja_id])
alter table [motivo_cancelamento] add constraint [motivo_cancelamento_rede_id_631cacd2_fk_rede_rede_id] foreign key ([rede_id]) references [rede] ([rede_id])
alter table [motivo_cancelamento] add constraint [motivo_cancelamento_sub_rede_id_7bcc5519_fk_rede_rede_id] foreign key ([sub_rede_id]) references [rede] ([rede_id])
go
alter table [observacao] add constraint [observacao_loja_id_705bbfdb_fk_loja_loja_id] foreign key ([loja_id]) references [loja] ([loja_id])
alter table [observacao] add constraint [observacao_rede_id_23430403_fk_rede_rede_id] foreign key ([rede_id]) references [rede] ([rede_id])
alter table [observacao] add constraint [observacao_sub_rede_id_3ead9a70_fk_rede_rede_id] foreign key ([sub_rede_id]) references [rede] ([rede_id])
go
alter table [tabela_preco] add constraint [tabela_preco_loja_id_1bc26e6d_fk_loja_loja_id] foreign key ([loja_id]) references [loja] ([loja_id])
go
alter table [tipo_recebimento] add constraint [tipo_recebimento_loja_id_5a0d8a72_fk_loja_loja_id] foreign key ([loja_id]) references [loja] ([loja_id])
alter table [tipo_recebimento] add constraint [tipo_recebimento_rede_id_31f6e16c_fk_rede_rede_id] foreign key ([rede_id]) references [rede] ([rede_id])
alter table [tipo_recebimento] add constraint [tipo_recebimento_sub_rede_id_62069fe7_fk_rede_rede_id] foreign key ([sub_rede_id]) references [rede] ([rede_id])
go
alter table [loja] add constraint [loja_rede_id_2a3cac28_fk_rede_rede_id] foreign key ([rede_id]) references [rede] ([rede_id])
go
alter table [rede] add constraint [rede_rede_pai_id_300e8f7d_fk_rede_rede_id] foreign key ([rede_pai_id]) references [rede] ([rede_id])
go
