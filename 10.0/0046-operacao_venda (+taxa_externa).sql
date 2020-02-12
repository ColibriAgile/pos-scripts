if dbo.fn_existe('dbo.operacao_venda.taxa_externa') = 0
  alter table dbo.operacao_venda 
  add taxa_externa money null

if dbo.fn_existe('dbo.operacao_venda_geral.taxa_externa') = 0
  alter table dbo.operacao_venda_geral 
  add taxa_externa money null


