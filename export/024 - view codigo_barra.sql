if object_id(N'export.codigo_barra', N'V') is not null
	drop view export.codigo_barra
go

create view [export].[codigo_barra]
as
select
  c.id,
  c.codigo,
  c.material_id
from dbo.codigo_barra c
go