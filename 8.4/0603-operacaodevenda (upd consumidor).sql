update operacaodevenda
set consumidor = '(nao informado)'
where consumidor = '*nao informado*'
go

update operacaodevendageral
set consumidor = '(nao informado)'
where consumidor = '*nao informado*'
go
