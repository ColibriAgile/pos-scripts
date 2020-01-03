if dbo.fn_existe('dbo.movimento_caixa.dados_adicionais') = 1
  return

alter table movimento_caixa
add dados_adicionais varchar(1000) null
go

if dbo.fn_existe('dbo.movimento_caixa_geral.dados_adicionais') = 1
  return

alter table movimento_caixa_geral
add dados_adicionais varchar(1000) null
go 
