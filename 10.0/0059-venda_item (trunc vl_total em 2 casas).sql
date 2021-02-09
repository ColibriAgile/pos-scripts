
alter table dbo.venda_item_geral
drop column vl_total
go 

alter table dbo.venda_item_geral
add vl_total as round(convert(money,qtd*vl_preco+isnull(arredondamento,0),0), 2, 1)
go

alter table dbo.venda_item
drop column vl_total
go 

alter table dbo.venda_item
add vl_total as round(convert(money,qtd*vl_preco+isnull(arredondamento,0),0), 2, 1)
go
