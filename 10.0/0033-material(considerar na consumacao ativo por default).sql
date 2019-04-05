update dbo.material
  set consumacao=1
go

alter table dbo.material
  add constraint df_material$consumacao 
  default 1 for consumacao
go
