if object_id(N'export.motivo_cancelamento', N'V') is not null
	drop view export.motivo_cancelamento
go

create view [export].[motivo_cancelamento]
as
select
	id=id,
	ativo=1,
	codigo=codigo,
	nome=nome,
	baixa_estoque=baixa_estoque
from [dbo].[motivo_cancelamento]
GO
