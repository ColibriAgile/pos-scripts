
if dbo.fn_existe('dbo.operacao_venda.vl_subtotal_para_consumacao') = 1
begin   
  exec sp_apagar_defaults 'operacao_venda', 'vl_subtotal_para_consumacao'
  alter table dbo.operacao_venda 
  drop column vl_subtotal_para_consumacao
end
go

alter table dbo.operacao_venda 
add vl_subtotal_para_consumacao numeric(15,2) not null default(0)

if dbo.fn_existe('dbo.operacao_venda_geral.vl_subtotal_para_consumacao') = 1
begin   
  exec sp_apagar_defaults 'operacao_venda_geral', 'vl_subtotal_para_consumacao'
  alter table dbo.operacao_venda_geral 
  drop column vl_subtotal_para_consumacao
end
go

if dbo.fn_existe('dbo.operacao_venda_geral.vl_subtotal_para_consumacao') = 0
  alter table dbo.operacao_venda_geral 
  add vl_subtotal_para_consumacao numeric(15,2) not null default(0)