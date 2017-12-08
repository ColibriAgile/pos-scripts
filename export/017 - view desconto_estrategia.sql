if object_id(N'export.desconto_estrategia', N'V') is not null
	drop view export.desconto_estrategia
go

create view [export].[desconto_estrategia]
as
select
  e.id,
  descricao = substring(e.descricao, 1, 100),
  e.aceita_desconto,
  e.loja_id
from dbo.desconto_estrategia e
go