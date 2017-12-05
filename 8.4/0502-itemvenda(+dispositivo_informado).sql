if exists(select * from syscolumns where id = object_id('itemvenda') and name = 'dispositivo_utilizado') return

alter table itemvenda add
  dispositivo_utilizado varchar(40) null
go            

if exists(select * from syscolumns where id = object_id('itemvendageral') and name = 'dispositivo_utilizado') return

alter table itemvendageral add
  dispositivo_utilizado varchar(40) null
go            
