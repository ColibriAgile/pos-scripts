/*-------------------------------------------------------------
 classe
 -------------------------------------------------------------*/
if exists (select * from sys.indexes where name = N'ix_classe$descricao')
  alter table dbo.classe
  drop constraint ix_classe$descricao
go
  
alter table dbo.classe 
add  constraint ix_classe$descricao unique nonclustered 
(
  descricao asc
)
go

/*-------------------------------------------------------------
 material
 -------------------------------------------------------------*/
if exists (select object_id from sys.indexes where name = N'ix_material$ativo$venda')
  drop index ix_material$ativo$venda on dbo.material

create nonclustered index ix_material$ativo$venda
on dbo.material 
(
  ativo,
  venda
)
go

if exists (select * from sys.indexes where name = N'ix_material$rede_id$sub_rede_id$loja_id$codigo')
  alter table dbo.material 
  drop constraint ix_material$rede_id$sub_rede_id$loja_id$codigo
go

alter table dbo.material 
add  constraint ix_material$rede_id$sub_rede_id$loja_id$codigo unique nonclustered 
(
  rede_id asc,
  sub_rede_id asc,
  loja_id asc,
  codigo asc
) 
go

/*-------------------------------------------------------------
 combo
 -------------------------------------------------------------*/
if  exists (select * from sys.indexes where name = N'ix_combo$rede_id$sub_rede_id$loja_id$codigo')
  alter table dbo.combo 
  drop constraint ix_combo$rede_id$sub_rede_id$loja_id$codigo
go

alter table dbo.combo 
add  constraint ix_combo$rede_id$sub_rede_id$loja_id$codigo unique nonclustered 
(
  rede_id asc,
  sub_rede_id asc,
  loja_id asc,
  codigo asc
)
go

/*-------------------------------------------------------------
 item_preco
 -------------------------------------------------------------*/
if exists (select object_id from sys.indexes where name = 'ix_item_preco$tabela_id')
  drop index ix_item_preco$tabela_id on dbo.item_preco

create nonclustered index ix_item_preco$tabela_id
on dbo.item_preco 
(
  tabela_id
) include 
(
  preco,
  material_id
)
go

/*-------------------------------------------------------------
 operacao_geral 
 -------------------------------------------------------------*/
if exists (select object_id from sys.indexes where name = 'ix_operacao_geral$dt_contabil')
  drop index ix_operacao_geral$dt_contabil 
  on dbo.operacao_geral

create clustered index ix_operacao_geral$dt_contabil 
on dbo.operacao_geral
(
  dt_contabil ASC
) 
go

/*-------------------------------------------------------------
 operacao_venda_geral 
 -------------------------------------------------------------*/
if exists (select object_id from sys.indexes where name = 'ix_operacao_geral$transf_encerramento')
  drop index ix_operacao_geral$transf_encerramento 
  on dbo.operacao_venda_geral

create nonclustered index ix_operacao_geral$transf_encerramento 
on dbo.operacao_venda_geral
(
  transferida, 
  dt_hr_encerramento, 
  hr_encerramento
)
include 
(
  modo_venda_id, 
  maquina_encerrou_id, 
  func_encerrou_id, 
  dt_encerramento
)
go

/*-------------------------------------------------------------
 comprovante_geral 
 -------------------------------------------------------------*/
if exists (select object_id from sys.indexes where name = 'ix_comprovante_geral$operacao_id')
  drop index ix_comprovante_geral$operacao_id 
  on dbo.comprovante_geral

create nonclustered index ix_comprovante_geral$operacao_id
on dbo.comprovante_geral
(
  operacao_id
)
include 
(
  consumidor, 
  numero, 
  chave, 
  status, 
  ressalva
)
go

/*-------------------------------------------------------------
 historico_operacao_geral 
 -------------------------------------------------------------*/
if exists (select object_id from sys.indexes where name = 'ix_historico_operacao_geral$operacao_id')
  drop index ix_historico_operacao_geral$operacao_id 
  on dbo.historico_operacao_geral

create nonclustered index ix_historico_operacao_geral$operacao_id
on dbo.historico_operacao_geral
(
  operacao_id ASC
) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

/*-------------------------------------------------------------
 movimento_caixa
 -------------------------------------------------------------*/
if exists (select object_id from sys.indexes where name = 'ix_movimento_caixa$turno_id')
  drop index ix_movimento_caixa$turno_id on 
  dbo.movimento_caixa

create nonclustered index ix_movimento_caixa$turno_id 
on dbo.movimento_caixa
(
  turno_id ASC
) 
go

/*-------------------------------------------------------------
 movimento_caixa_geral 
 -------------------------------------------------------------*/
if exists (select object_id from sys.indexes where name = 'ix_movimento_caixa_geral$operacao_id')
  drop index ix_movimento_caixa_geral$operacao_id 
  on dbo.movimento_caixa_geral

create nonclustered index ix_movimento_caixa_geral$operacao_id 
on dbo.movimento_caixa_geral
(
  operacao_id 
) 
go

if exists (select object_id from sys.indexes where name = 'ix_movimento_caixa_geral$turno_id')
  drop index ix_movimento_caixa_geral$turno_id 
  on dbo.movimento_caixa_geral

create nonclustered index ix_movimento_caixa_geral$turno_id 
on dbo.movimento_caixa_geral
(
  turno_id ASC
) 
go

/*-------------------------------------------------------------
 turno
 -------------------------------------------------------------*/
if exists (select object_id from sys.indexes where name = 'ix_turno$dt_contabil')
  drop index ix_turno$dt_contabil 
  on dbo.turno

create clustered index ix_turno$dt_contabil 
on dbo.turno
(
  dt_contabil asc
) 
go

