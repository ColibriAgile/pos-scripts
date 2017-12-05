declare
  @ponto_venda_nenhum int = (select min(id) from ponto_venda)
  
update dbo.venda_item
set ponto_venda_id = @ponto_venda_nenhum
where ponto_venda_id = 0

update dbo.venda_item_geral
set ponto_venda_id = @ponto_venda_nenhum
where ponto_venda_id = 0
