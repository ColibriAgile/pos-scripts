if dbo.fn_existe('dbo.venda_item.origem')=0
  alter table dbo.venda_item
  add origem nvarchar(50) null
go

if dbo.fn_existe('dbo.venda_item_geral.origem')=0
  alter table dbo.venda_item_geral
  add origem nvarchar(50) null
go
