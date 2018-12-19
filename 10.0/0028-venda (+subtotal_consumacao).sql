if dbo.fn_existe('dbo.venda.vl_subtotal_para_consumacao') = 0
  alter table dbo.venda 
  add vl_subtotal_para_consumacao money not null default(0)

if dbo.fn_existe('dbo.venda_geral.vl_subtotal_para_consumacao') = 0
  alter table dbo.venda_geral 
  add vl_subtotal_para_consumacao money not null default(0)


