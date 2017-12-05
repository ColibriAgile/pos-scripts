if exists (select * from syscolumns where id=object_id('itemvenda') and name='perfilimpressao_id')
  return

alter table itemvenda
add perfilimpressao_id integer null
go

if exists (select * from syscolumns where id=object_id('itemvendageral') and name='perfilimpressao_id')
  return

alter table itemvendageral
add perfilimpressao_id integer null
go