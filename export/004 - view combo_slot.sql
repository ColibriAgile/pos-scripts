if object_id(N'export.item_combo', N'V') is not null
	drop view export.item_combo
go
if object_id(N'export.combo_slot', N'V') is not null
	drop view export.combo_slot
go
create view [export].[combo_slot]
as
select
	id=id,
	combo_id=combo_id,
	ordem=ordem,
	material_id=material_id,
	classe_id=classe_id,
	quantificador_id=quantificador_id,
	precificador_id=precificador_id,
	minimo=minimo,
	maximo=maximo,
	preco=preco,
	local_producao=local_producao_id,
	ativo=1
from [dbo].[combo_slot]
GO
