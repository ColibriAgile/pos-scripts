if object_id('tU_MOVCLASSE') is not null 
  drop trigger dbo.tU_MOVCLASSE
go

if object_id('movclasse') is not null
execute('
update movclasse
set it_material = null
where it_material = 0

update movclasse
set it_classe = null
where it_classe = 0

update movclasse
set it_combo = null
where it_combo = 0
')
go
