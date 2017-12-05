exec sp_apagar_constraint 'tabela_preco_loja_id_5a964e5c_uniq' 
go
exec sp_apagar_constraint 'ix_tabela_preco$loja_id$dt_vigencia'
go
alter table [tabela_preco] add modo_venda int null
go
alter table [tabela_preco] add constraint [ix_tabela_preco$loja_id$modo_venda$dt_vigencia] unique nonclustered ([loja_id], [modo_venda], [dt_vigencia])
go 