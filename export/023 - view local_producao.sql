if object_id(N'export.local_producao', N'V') is not null
	drop view export.local_producao
go

create view [export].[local_producao]
as
select
  l.id,
  nome = substring(l.nome, 1, 100),
  l.loja_id
from dbo.local_producao l
go