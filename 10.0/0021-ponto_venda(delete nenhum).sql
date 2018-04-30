declare @ids table (pdv_id integer)

insert @ids
(pdv_id)
select id 
from ponto_venda 
where lower(nome) = 'nenhum'

update maquina 
set ponto_balcao_id = null
where ponto_balcao_id in (select pdv_id from @ids)

update maquina 
set ponto_entrega_id = null 
where ponto_entrega_id in (select pdv_id from @ids)

update maquina 
set ponto_mesa_id = null
where ponto_mesa_id in (select pdv_id from @ids)

update maquina 
set ponto_ficha_id = null 
where ponto_ficha_id in (select pdv_id from @ids)

update venda_item 
set ponto_venda_id = null 
where ponto_venda_id in (select pdv_id from @ids)

update venda_item_geral 
set ponto_venda_id = null 
where ponto_venda_id in (select pdv_id from @ids)

delete ponto_venda 
where nome = 'nenhum'