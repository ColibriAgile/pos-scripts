if dbo.fn_existe('comboprecificador') = 1
exec('
if not exists( select * from dbo.comboprecificador where descricao = ''Rodizio'' )

  insert comboprecificador 
  (descricao, classe, dt_alt) values 
  (''Rodizio'', Null, Getdate())
')
go