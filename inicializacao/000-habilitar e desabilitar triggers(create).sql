if (object_id('sp_habilitar_triggers') is not null)
  drop procedure sp_habilitar_triggers
go

create procedure sp_habilitar_triggers (@tabela varchar(100))  
as
begin
  if (@tabela <> '[dbo].[bloqueio]')
    exec('enable trigger all on ' + @tabela)
end
go

if (object_id('sp_desabilitar_triggers') is not null)
  drop procedure sp_desabilitar_triggers
go

create procedure sp_desabilitar_triggers (@tabela varchar(100))  
as
begin
  if (@tabela <> '[dbo].[bloqueio]')
    exec('disable trigger all on ' + @tabela)
end
go
