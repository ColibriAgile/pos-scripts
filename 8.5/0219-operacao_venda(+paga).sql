if dbo.fn_existe('dbo.operacao_venda.paga') = 1 return

alter table dbo.operacao_venda
add paga bit not null default(0)

exec ('update operacao_venda set paga = encerrada')
go

if dbo.fn_existe('dbo.operacao_venda_geral.paga') = 1 return

alter table dbo.operacao_venda_geral
add paga bit not null default(0)

exec ('update operacao_venda_geral set paga = encerrada')
go


