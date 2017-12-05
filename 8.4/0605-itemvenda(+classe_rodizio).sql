if exists(select * from syscolumns where name='classe_rodizio' and id=object_id('itemvenda'))
  return 

alter table itemvenda add
  classe_rodizio int null
go

if exists(select * from syscolumns where name='classe_rodizio' and id=object_id('itemvendageral'))
  return 

alter table itemvendageral add
  classe_rodizio int null
go

