update maquina 
set ponto_balcao_id = null
where ponto_balcao_id in (0, -1)
go

update maquina 
set ponto_entrega_id = null 
where ponto_entrega_id in (0, -1)
go

update maquina 
set ponto_mesa_id = null
where ponto_mesa_id in (0, -1)
go

update maquina 
set ponto_ficha_id = null 
where ponto_ficha_id in (0, -1)
go

update venda_item 
set ponto_venda_id = null 
where ponto_venda_id in (0, -1)
go

update venda_item_geral 
set ponto_venda_id = null 
where ponto_venda_id in (0, -1)
go

delete ponto_venda 
where id in (0, -1)
go
