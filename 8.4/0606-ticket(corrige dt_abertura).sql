update dbo.ticket
set dt_abertura = headervenda.dt_abertura
from dbo.headervenda 
where headervenda.venda_id = ticket.venda_id
  and dbo.headervenda.dt_abertura <> dbo.ticket.dt_abertura