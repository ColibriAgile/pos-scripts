update dbo.pendura
set dt_contabil = o.dt_contabil
from dbo.operacao o 
where o.operacao_id = pendura.operacao_id
  and pendura.dt_contabil < '20000101'
go

update dbo.pendura
set dt_contabil = o.dt_contabil
from dbo.operacao_geral o 
where o.operacao_id = pendura.operacao_id
  and pendura.dt_contabil < '20000101'
go

