declare @id int = (select id from ponto_venda where nome = 'nenhum')
update maquina set ponto_balcao_id = null where ponto_balcao_id = @id
update maquina set ponto_entrega_id = null where ponto_entrega_id = @id
update maquina set ponto_mesa_id = null where ponto_mesa_id = @id
update maquina set ponto_ficha_id = null where ponto_ficha_id = @id
update venda_item set ponto_venda_id = null where ponto_venda_id = @id
update venda_item_geral set ponto_venda_id = null where ponto_venda_id = @id
delete ponto_venda where nome = 'nenhum'