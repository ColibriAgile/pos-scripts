if dbo.fn_existe('dbo.venda.origem') = 0
  alter table dbo.venda 
  add origem varchar(20)

if dbo.fn_existe('dbo.venda_geral.origem') = 0
  alter table dbo.venda_geral 
  add origem varchar(20)


