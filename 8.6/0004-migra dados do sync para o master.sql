if object_id('sync.parametro') is null
  return

exec('
  delete [colibri-master].sync.parametro
  where local = ''loja''
  
  insert [colibri-master].sync.parametro
        ( tipo, local, dados, recepcao )
  select tipo, ''loja'', dados, case id when 0 then 1 else 0 end
  from sync.parametro
')

exec sp_apagar_tabela 'sync.parametro' 
