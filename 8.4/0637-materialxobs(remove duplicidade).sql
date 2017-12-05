
if object_id('material_obs') is not null
  return

if object_id('tempdb..##temp_matobs') is not null
  drop table ##temp_matobs
go

if object_id('material_obs') is not null
  return

select
  nu_posicao, 
  material_id, 
  observacao_id, 
  combo_id
into ##temp_matobs
from dbo.materialxobs
group by 
  nu_posicao, 
  material_id, 
  observacao_id, 
  combo_id

delete dbo.materialxobs

insert dbo.materialxobs 
(
  nu_posicao, material_id, observacao_id, combo_id, dt_alt
)
select 
  nu_posicao, material_id, observacao_id, combo_id, getdate()
from ##temp_matobs

drop table ##temp_matobs
go

if object_id('material_obs') is not null
  return

alter table dbo.materialxobs
add constraint materialxobs_ix_observacao_id$material_id$combo_id unique
(
  observacao_id,
  material_id,
  combo_id
)
go
