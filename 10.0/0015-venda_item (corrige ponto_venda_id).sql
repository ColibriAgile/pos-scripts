declare @id int

select @id = min(id) 
from dbo.ponto_venda

update dbo.venda_item
set ponto_venda_id = @id
where ponto_venda_id is null
   or ponto_venda_id not in (select id from dbo.ponto_venda)

update dbo.venda_item_geral
set ponto_venda_id = @id
where ponto_venda_id is null
   or ponto_venda_id not in (select id from dbo.ponto_venda)