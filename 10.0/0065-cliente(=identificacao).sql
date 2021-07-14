if exists (select * from sys.indexes where name = 'ix_cliente$identificacao')
  drop index ix_cliente$identificacao on dbo.cliente
go

alter table dbo.cliente 
alter column identificacao varchar(50) not null
go