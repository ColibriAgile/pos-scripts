if object_id(N'dbo.cliente_u', 'TR') is not null
  exec('drop trigger dbo.cliente_u')
go

set quoted_identifier, ansi_nulls on
go

if object_id(N'dbo.cliente_u', 'TR') is null
  exec(
'
create trigger dbo.cliente_u on cliente
after update as
begin
  set nocount on

  update cliente
  set dt_alt = getdate()
  from inserted i
  where cliente.id = i.id

  set nocount off
end
')

go