if dbo.fn_existe('dbo.operacao_venda.vl_taxa_externa') = 0
  alter table dbo.operacao_venda 
  add vl_taxa_externa money null

if dbo.fn_existe('dbo.operacao_venda_geral.vl_taxa_externa') = 0
  alter table dbo.operacao_venda_geral 
  add vl_taxa_externa money null


