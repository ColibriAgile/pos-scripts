if exists(
  select * 
  from syscolumns 
  where name = 'autorizacao' 
    and id = object_id('prepagamento')
) return 

alter table dbo.prepagamento add 
  autorizacao int null,
  credenciadora varchar(50) null,
  bandeira varchar(50) null
go