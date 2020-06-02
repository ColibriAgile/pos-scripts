alter table dbo.material
  drop column codigo_num
go

if exists (select * from sys.indexes where name = N'ix_material$rede_id$sub_rede_id$loja_id$codigo')
  alter table dbo.material 
  drop constraint ix_material$rede_id$sub_rede_id$loja_id$codigo
go

if exists (select * from sys.indexes where name = N'material_rede_id_6d4a9052_uniq')
  alter table dbo.material 
  drop constraint material_rede_id_6d4a9052_uniq
go

if exists (select * from sys.indexes where name = N'ix_material$codigo')
  drop index ix_material$codigo on dbo.material
go

exec dbo.sp_padronizar_collation @nome_com_schema = 'dbo.material'
go

alter table dbo.material
  add codigo_num as (convert(decimal(20,0), codigo, 0))
go