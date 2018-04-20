if object_id(N'export.observacao', N'V') is not null
	drop view export.observacao
go

create view [export].[observacao]
as
select
	id=id,
	nome=nome,
	ativo=1
from [dbo].[observacao]
GO
