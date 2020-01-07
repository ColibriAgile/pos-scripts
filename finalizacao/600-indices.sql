/*-------------------------------------------------------------
 material
 -------------------------------------------------------------*/
if exists (select object_id from sys.indexes where name = 'ix_material$ativo$venda')
  drop index ix_material$ativo$venda on dbo.material

create nonclustered index ix_material$ativo$venda
on dbo.material 
(
  ativo,
  venda
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
  drop index ix_operacao_geral$dt_contabil on dbo.operacao_geral

create clustered index ix_operacao_geral$dt_contabil 
on dbo.operacao_geral
(
  dt_contabil ASC
) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go


/*-------------------------------------------------------------
 historico_operacao_geral 
 -------------------------------------------------------------*/
if exists (select object_id from sys.indexes where name = 'ix_historico_operacao_geral$operacao_id')
  drop index ix_historico_operacao_geral$operacao_id on dbo.historico_operacao_geral

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
  drop index ix_movimento_caixa$turno_id on dbo.movimento_caixa

create nonclustered index ix_movimento_caixa$turno_id 
on dbo.movimento_caixa
(
  turno_id ASC
) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

/*-------------------------------------------------------------
 movimento_caixa_geral 
 -------------------------------------------------------------*/
if exists (select object_id from sys.indexes where name = 'ix_movimento_caixa_geral$operacao_id')
  drop index ix_movimento_caixa_geral$operacao_id on dbo.movimento_caixa_geral

create nonclustered index ix_movimento_caixa_geral$operacao_id 
on dbo.movimento_caixa_geral
(
  operacao_id 
) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

if exists (select object_id from sys.indexes where name = 'ix_movimento_caixa_geral$turno_id')
  drop index ix_movimento_caixa_geral$turno_id on dbo.movimento_caixa_geral

create nonclustered index ix_movimento_caixa_geral$turno_id 
on dbo.movimento_caixa_geral
(
  turno_id ASC
) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

/*-------------------------------------------------------------
 turno
 -------------------------------------------------------------*/
if exists (select object_id from sys.indexes where name = 'ix_turno$dt_contabil')
  drop index ix_turno$dt_contabil on dbo.turno

create clustered index ix_turno$dt_contabil 
on dbo.turno
(
  dt_contabil asc
) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

