if exists(
  select * from syscolumns
  where name = 'slot_indice'
    and id = object_id('itemvenda')
) return


alter table dbo.itemvenda
add slot_indice smallint null
go

if exists(
  select * from syscolumns
  where name = 'slot_indice'
    and id = object_id('itemvendageral')
) return


alter table dbo.itemvendageral
add slot_indice smallint null
go

