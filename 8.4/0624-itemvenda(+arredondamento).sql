if exists (select * from sys.syscolumns s where s.name = 'arredondamento' and s.id = object_id('itemvenda'))
  return

alter table itemvenda
  add arredondamento numeric(15,2) null
go

if exists (select * from sys.syscolumns s where s.name = 'arredondamento' and s.id = object_id('itemvendageral'))
  return

alter table itemvendageral
  add arredondamento numeric(15,2) null
go

