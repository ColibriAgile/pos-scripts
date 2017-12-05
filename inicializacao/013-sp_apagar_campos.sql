if (object_id('sp_apagar_campos') is not null)
  drop procedure sp_apagar_campos
go
--------------------------------------------------------------------------------------------
create procedure sp_apagar_campos(@tabela varchar(100)='', @campo varchar(100) = '', @campo2 varchar(100) = '', @campo3 varchar(100) = '', @campo4 varchar(100) = '')
as
begin
  exec sp_apagar_campo @tabela, @campo

  if (@campo2 <> '')
	  exec sp_apagar_campo @tabela, @campo2

  if (@campo3 <> '')
	  exec sp_apagar_campo @tabela, @campo3

  if (@campo4 <> '')
	  exec sp_apagar_campo @tabela, @campo4
end
