if object_id(N'export.loja', N'V') is not null
	drop view export.loja
go

create view [export].[loja]
as
select
	id=loja_id,
	nome=nome
from [dbo].[loja]
GO

