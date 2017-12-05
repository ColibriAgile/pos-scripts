if (object_id('sp_habilitar_constraints') is not null)
  drop procedure sp_habilitar_constraints
go

create procedure sp_habilitar_constraints (@tabela varchar(100))  
as
begin
  if (@tabela <> '[dbo].[bloqueio]')
    exec('alter table ' + @tabela + ' with check check constraint all')
end
go

if (object_id('sp_desabilitar_constraints') is not null)
  drop procedure sp_desabilitar_constraints
go

create procedure sp_desabilitar_constraints (@tabela varchar(100))  
as
begin
  if (@tabela <> '[dbo].[bloqueio]')
    exec('alter table ' + @tabela + ' nocheck constraint all')
end
go
