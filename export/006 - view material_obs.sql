if object_id(N'export.material_obs', N'V') is not null
	drop view export.material_obs
go

create view [export].[material_obs]
as
select
  id=row_number() over (order by material_id,observacao_id,combo_id),
  material_id=material_id,
  combo_id=combo_id,
  observacao_id=observacao_id,
  posicao=posicao
from [dbo].[material_obs]
GO
