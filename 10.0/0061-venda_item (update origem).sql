update item
set item.origem = venda.origem 
from dbo.venda_item as item
  inner join dbo.venda as venda
    on item.venda_id=venda.venda_id
go

update item
set item.origem = venda.origem 
from dbo.venda_item_geral as item
  inner join dbo.venda_geral as venda
    on item.venda_id=venda.venda_id
go
