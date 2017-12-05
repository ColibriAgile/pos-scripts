update headervendageral
set dt_contabil = o.dt_contabil
from operacaogeral as o
where o.operacao_id = headervendageral.operacao_id
go

update itemvendageral
set dt_contabil = h2.dt_contabil
from headervendageral as h2
where h2.venda_id = itemvendageral.venda_id
go
