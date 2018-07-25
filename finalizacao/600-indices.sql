/*-------------------------------------------------------------
 material
 -------------------------------------------------------------*/
drop index if exists 
  ix_material$ativo$venda on dbo.material

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
drop index if exists 
  ix_item_preco$tabela_id on dbo.item_preco

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
drop index if exists 
  ix_operacao_geral$dt_contabil on dbo.operacao_geral

create clustered index ix_operacao_geral$dt_contabil 
on dbo.operacao_geral
(
  dt_contabil ASC
) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

/*-------------------------------------------------------------
 movimento_caixa
 -------------------------------------------------------------*/
drop index if exists 
  ix_movimento_caixa$turno_id on dbo.movimento_caixa

create nonclustered index ix_movimento_caixa$turno_id 
on dbo.movimento_caixa
(
  turno_id ASC
) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

/*-------------------------------------------------------------
 movimento_caixa_geral 
 -------------------------------------------------------------*/
drop index if exists 
  ix_movimento_caixa_geral$operacao_id on dbo.movimento_caixa_geral,
  ix_movimento_caixa_geral$turno_id on dbo.movimento_caixa_geral

create nonclustered index ix_movimento_caixa_geral$operacao_id 
on dbo.movimento_caixa_geral
(
  operacao_id 
) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)

create nonclustered index ix_movimento_caixa_geral$turno_id 
on dbo.movimento_caixa_geral
(
  turno_id ASC
) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

/*-------------------------------------------------------------
 turno
 -------------------------------------------------------------*/
drop index if exists 
  ix_turno$dt_contabil on dbo.turno

create clustered index ix_turno$dt_contabil 
on dbo.turno
(
  dt_contabil asc
) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

