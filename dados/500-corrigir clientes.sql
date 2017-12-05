update venda
set cliente_id = null
where cliente_id not in 
(
  select cliente_id 
  from cliente
)
---------------------------------------------------------
update ticket
set cliente_id = null
where cliente_id not in (
  select cliente_id 
  from cliente
)
---------------------------------------------------------

