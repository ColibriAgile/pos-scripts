if exists(
  select * 
  from sys.indexes 
  where name = 'ix_itemvendageral$dt_contabil$pdv'
) return

create nonclustered index ix_itemvendageral$dt_contabil$pdv on dbo.itemvendageral
(
  dt_contabil,
  pontovenda_id
) with( statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]

