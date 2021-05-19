update venda set 
  retirada = 1,
  obs = replace(obs, '
#############################
## ATENCÃO! NÃO EXPEDIR!
## Será retirado no balcão
#############################', '')
from venda v
join ticket t on v.venda_id = t.venda_id
where obs like '
#############################
## ATENCÃO! NÃO EXPEDIR!
## Será retirado no balcão
#############################%'
and t.estado in ('consumindo', 'pago')

update ticket 
set retirada = 1 
where venda_id in 
  (select venda_id 
   from venda 
   where retirada = 1)
