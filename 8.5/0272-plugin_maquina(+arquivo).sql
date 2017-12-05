if dbo.fn_existe('dbo.plugin_maquina.arquivo') = 0
  alter table plugin_maquina
  add arquivo varchar(50) null 
go

if dbo.fn_existe('dbo.plugin') = 0
  return

exec('
update plugin_maquina 
set arquivo = x.arquivo 
from plugin x where x.nome = plugin_maquina.nome
')
go
exec sp_apagar_tabela 'plugin'
