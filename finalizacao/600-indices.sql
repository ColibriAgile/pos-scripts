
/*-------------------------------------------------------------
 operacao_geral 
 -------------------------------------------------------------*/
if not exists
(
  select * 
  from sysindexes
  where name = 'ix_operacao_geral$dt_contabil'
) 
  create clustered index ix_operacao_geral$dt_contabil 
  on dbo.operacao_geral
  (
    dt_contabil ASC
  ) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

/*-------------------------------------------------------------
 movimento_caixa
 -------------------------------------------------------------*/
if not exists
(
  select * 
  from sysindexes
  where name = 'ix_movimento_caixa$turno_id'
) 
  create nonclustered index ix_movimento_caixa$turno_id 
  on dbo.movimento_caixa
  (
    turno_id ASC
  ) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

/*-------------------------------------------------------------
 movimento_caixa_geral 
 -------------------------------------------------------------*/
if not exists
(
  select * 
  from sysindexes
  where name = 'ix_movimento_caixa_geral$operacao_id'
) 
  create nonclustered index ix_movimento_caixa_geral$operacao_id 
  on dbo.movimento_caixa_geral
  (
    operacao_id 
  ) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

if not exists
(
  select * 
  from sysindexes
  where name = 'ix_movimento_caixa_geral$turno_id'
) 
  create nonclustered index ix_movimento_caixa_geral$turno_id 
  on dbo.movimento_caixa_geral
  (
    turno_id ASC
  ) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

/*-------------------------------------------------------------
 turno
 -------------------------------------------------------------*/
if not exists
(
  select * 
  from sysindexes
  where name = 'ix_turno$dt_contabil'
) 
  create clustered index ix_turno$dt_contabil 
  on dbo.turno
  (
    dt_contabil asc
  ) with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)
go

