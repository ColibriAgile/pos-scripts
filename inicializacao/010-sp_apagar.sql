if object_id('sp_apagar') is not null   
  drop procedure sp_apagar
go

create procedure sp_apagar (@objeto varchar(20), @nome varchar(200))
as
begin
  declare @sql nvarchar(1000)
  
  if ((lower(@objeto) = 'type') and (type_id(@nome) is null)) or 
     ((lower(@objeto) <> 'type') and (object_id(@nome) is null)) begin
    print @objeto+' ' +@nome+' não encontrado(a).'
    return
  end

  set @sql = 'drop '+ @objeto + ' ' +@nome  
  print @sql
  begin try
      execute sp_executesql @sql
  end try
  begin catch
      print 'Falha ao apagar ' + @objeto + ' ' + @nome + '.' 
      print error_message()
  end catch
end

go


