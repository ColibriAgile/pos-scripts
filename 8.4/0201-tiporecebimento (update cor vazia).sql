if dbo.fn_existe('tiporecebimento') = 1
  exec('
  update tiporecebimento set 
    cor = ''Padrão'' 
    where isnull(cor, '''') = ''''
  ')