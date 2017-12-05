if not exists(select * from syscolumns where name = 'ordem' and id = object_id('pendura'))
  alter table dbo.pendura add ordem int identity not null
