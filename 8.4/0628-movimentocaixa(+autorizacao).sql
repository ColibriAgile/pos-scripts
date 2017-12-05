if exists(
  select * 
  from syscolumns 
  where name = 'autorizacao' 
    and id = object_id('movimentocaixa')
) return 

alter table dbo.movimentocaixa add 
  autorizacao int null,
  credenciadora varchar(50) null,
  bandeira varchar(50) null
go

if exists(
  select * 
  from syscolumns 
  where name = 'autorizacao' 
    and id = object_id('movimentocaixageral')
) return 

alter table dbo.movimentocaixageral add 
  autorizacao int null,
  credenciadora varchar(50) null,
  bandeira varchar(50) null
go
