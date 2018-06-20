if exists(
  select * from 
  sysindexes
  where name = 'ix_operacao_geral$dt_contabil'
) return 

create clustered index [ix_operacao_geral$dt_contabil] on [dbo].[operacao_geral]
(
	[dt_contabil] ASC
)with (pad_index = off, statistics_norecompute = off, sort_in_tempdb = off, drop_existing = off, online = off, allow_row_locks = on, allow_page_locks = on)

go