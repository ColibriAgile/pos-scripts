if object_id(N'export.grupo_material', N'V') is not null
	drop view export.grupo_material
go

create view [export].[grupo_material]
as
select
	id=id,
	parent_id=parent_id,
	descricao=descricao,
	tipo=upper(case when tipo = '' then 'AL' else tipo end),
	ativo=1
from [dbo].[grupo_material]
GO