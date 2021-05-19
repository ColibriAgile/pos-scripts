update venda set 
  retirada = 1,
  obs = replace(obs, '
#############################
## ATENC�O! N�O EXPEDIR!
## Ser� retirado no balc�o
#############################', '')
from venda v
join ticket t on v.venda_id = t.venda_id
where obs like '
#############################
## ATENC�O! N�O EXPEDIR!
## Ser� retirado no balc�o
#############################%'
and t.estado in ('consumindo', 'pago')

update ticket 
set retirada = 1 
where venda_id in 
  (select venda_id 
   from venda 
   where retirada = 1)
