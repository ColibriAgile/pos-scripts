if object_id('operacao_venda') is null return

  alter table operacao_venda alter column consumidor varchar(1000) null

  update operacao_venda set consumidor = '{"cpf": "'+ consumidor+ '"}'
  where consumidor is not null
  
go
if object_id('operacao_venda_geral') is null return

  alter table operacao_venda_geral alter column consumidor varchar(1000) null

  update operacao_venda_geral set consumidor = '{"cpf": "'+ consumidor+ '"}'
  where consumidor is not null
go  
if object_id('operacaodevenda') is null return 
  
  alter table operacaodevenda alter column consumidor varchar(1000) null

  update operacaodevenda set consumidor = '{"cpf": "'+ consumidor+ '"}'
  where consumidor is not null
go
if object_id('operacaodevendageral') is null return 
  
  alter table operacaodevendageral alter column consumidor varchar(1000) null

  update operacaodevendageral set consumidor = '{"cpf": "'+ consumidor+ '"}'
  where consumidor is not null




