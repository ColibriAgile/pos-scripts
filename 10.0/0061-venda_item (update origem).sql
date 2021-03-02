update dbo.venda_item
set origem = v.origem
from dbo.venda v 
where v.venda_id = venda_item.venda_id
go

update dbo.venda_item_geral
set origem = v.origem
from dbo.venda_geral v 
where v.venda_id = venda_item_geral.venda_id
go
