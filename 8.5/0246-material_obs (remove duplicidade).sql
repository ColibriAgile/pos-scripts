if object_id('tempdb..##temp_matobs') is not null
  drop table ##temp_matobs
go

select
  posicao, 
  material_id, 
  observacao_id, 
  combo_id
into ##temp_matobs
from dbo.material_obs
group by 
  posicao, 
  material_id, 
  observacao_id, 
  combo_id

delete dbo.material_obs

insert dbo.material_obs 
(
  posicao, material_id, observacao_id, combo_id
)
select 
  posicao, material_id, observacao_id, combo_id
from ##temp_matobs

drop table ##temp_matobs
go

if object_Id('materialxobs_ix_observacao_id$material_id$combo_id') is null
  alter table dbo.material_obs
  add constraint materialxobs_ix_observacao_id$material_id$combo_id unique
  (
    observacao_id,
    material_id,
    combo_id
  )
go
