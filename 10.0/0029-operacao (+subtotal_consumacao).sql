if dbo.fn_existe('dbo.operacao_venda.vl_subtotal_para_consumacao') = 0
  alter table dbo.operacao_venda 
  add vl_subtotal_para_consumacao money not null default(0)

if dbo.fn_existe('dbo.operacao_venda_geral.vl_subtotal_para_consumacao') = 0
  alter table dbo.operacao_venda_geral 
  add vl_subtotal_para_consumacao money not null default(0)