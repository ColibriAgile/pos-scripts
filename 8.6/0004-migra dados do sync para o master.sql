if object_id('sync.parametro') is null
  return

if not exists(select * from sys.databases where name = 'colibri-master')
  return;

if not exists(select * from [colibri-master].sys.schemas where name = 'sync')
  return

exec
('
delete [colibri-master].sync.parametro
where local = ''loja''
  
insert [colibri-master].sync.parametro
(
  tipo, 
  local, 
  dados, 
  recepcao 
)
select 
  tipo, 
  ''loja'', 
  dados, 
  case id 
    when 0 then 1 
    else 0 
  end
from sync.parametro
')

exec sp_apagar_tabela 'sync.parametro' 
