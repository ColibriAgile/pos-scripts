if object_id(N'export.item_preco', N'V') is not null
	drop view export.item_preco
go

create view [export].[item_preco]
as
select
	id=id,
	ativo=ativo,
	preco=preco,
	material_id=material_id,
	tabela_id=tabela_id
from [dbo].[item_preco] 
go
