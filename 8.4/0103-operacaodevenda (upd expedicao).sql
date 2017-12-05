update operacaodevendageral
set 
  dt_expedicao = null,
  func_expedicao = null,
  entregador = null
where isnull(func_expedicao,0) = 0
go

update operacaodevenda
set 
  dt_expedicao = null,
  func_expedicao = null,
  entregador = null
where isnull(func_expedicao,0) = 0
go