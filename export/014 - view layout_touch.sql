if object_id(N'export.layout_touch', N'V') is not null
	drop view export.layout_touch
go

create view [export].[layout_touch]
as
select
  l.id,
  l.ativo,
  descricao = substring(l.descricao, 1, 60),
  l.modo_venda_id
from dbo.layout_touch l
go