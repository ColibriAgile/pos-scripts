if object_id(N'export.item_classe', N'V') is not null
	drop view export.item_classe
go

create view [export].[item_classe]
as
select
	ativo=1,
	tipo=case 
		when isnull(classe_item_id, 0) > 0 then 'cl' 
		when isnull(combo_item_id, 0) > 0 then 'co'
		else 'ma'
	end,
	ordem=ordem,
	classe_id=classe_id,
	classe_item_id=nullif(classe_item_id, 0),
	combo_item_id=nullif(combo_item_id, 0),
	material_item_id=nullif(material_item_id, 0)
from [dbo].[item_classe] i
left join dbo.material m on m.id = i.material_item_id
left join dbo.combo c on c.id = i.combo_item_id
where (i.material_item_id is null or m.id is not null)
  or (i.combo_item_id is null or c.id is not null)
GO
