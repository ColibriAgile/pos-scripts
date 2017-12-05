exec sp_apagar_campo 'material', 'tecla'
go
exec sp_apagar_campo 'material', 'tipomaterial'
go

if dbo.fn_existe('dbo.material.tecla_prog') = 1
  alter table dbo.material alter column tecla_prog varchar(1)
go