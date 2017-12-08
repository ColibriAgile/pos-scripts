if object_id(N'export.promocao_item', N'V') is not null
	drop view export.promocao_item
go

create view [export].[promocao_item]
as
select
  i.id,
  i.tipo_item,
  i.item_id,
  i.tipo_promocao,
  i.valor,
  i.promocao_id
from dbo.promocao_item i
go