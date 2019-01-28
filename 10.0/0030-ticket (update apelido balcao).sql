update ticket with (rowlock) set 
  apelido = nome, 
  apelido_origem = nome
from maquina m with (nolock)
where m.id = ticket.codigo
and ticket.modo_venda_id = 1