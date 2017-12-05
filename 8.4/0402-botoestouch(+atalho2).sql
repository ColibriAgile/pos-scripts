if dbo.fn_existe('dbo.botoestouch') = 1
exec('
if exists(select * from syscolumns where id = object_id(''botoestouch'') and name = ''atalho2'') return

alter table botoestouch add
  atalho2 varchar(20) null  

alter table botoestouch alter column
  atalho varchar(20) null
')
go