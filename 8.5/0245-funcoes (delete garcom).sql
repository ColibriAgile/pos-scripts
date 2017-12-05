update dbo.funcionario 
set funcao_id = 4 
where funcao_id = 3
go

update dbo.grupo_funcionario 
set nome = 'ATENDENTE'
where nome = 'GARÇOM'
go

delete dbo.funcao 
where nome = 'GARÇOM'
go
