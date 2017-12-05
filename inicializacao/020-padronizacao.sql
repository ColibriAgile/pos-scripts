begin try
  exec sp_padronizar_primary_keys
end try
begin catch
  print 'Erro ao padronizar todos as primary keys:
   '  +  error_message()
end catch
go
begin try
  exec sp_padronizar_defaults 
end try
begin catch
  print 'Erro ao padronizar todos os defaults:
   '  +  error_message()
end catch
go
begin try
  exec sp_padronizar_indices
end try
begin catch
  print 'Erro ao padronizar todos os indices:
   '  +  error_message()
end catch

begin try
  exec sp_padronizar_foreign_keys
end try
begin catch
  print 'Erro ao padronizar todas as chaves estrangeiras:
   '  +  error_message()
end catch
go