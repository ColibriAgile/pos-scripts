exec sp_apagar_defaults 'venda_item', 'ponto_venda_id'
alter table venda_item
  alter column ponto_venda_id int null
go
exec sp_apagar_defaults 'venda_item_geral', 'ponto_venda_id'
alter table venda_item_geral
  alter column ponto_venda_id int null
go