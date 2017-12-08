if object_id(N'export.desconto_estrategia_item', N'V') is not null
	drop view export.desconto_estrategia_item
go

create view [export].[desconto_estrategia_item]
as
select 
  i.desconto_estrategia_id,
  i.id,
  i.item_id,
  tipo = case i.tipo_item_id 
   when 19 then 'material'
   when 15 then 'combo'
   when 10 then 'grupo'
     else 'material'
  end
from dbo.desconto_estrategia_item i
go