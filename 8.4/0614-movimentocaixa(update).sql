/* correção de possiveis inconsistencias */   
  update dbo.movimentocaixa
  set cancelado = 1
  where cancelado = 0 
    and operacao_id in 
    (
	 select operacao_id 
	 from dbo.operacao 
	 where cancelada = 1
	)

  update dbo.movimentocaixageral 
  set cancelado = 1
  where cancelado = 0 
    and operacao_id in 
    (
	 select operacao_id 
	 from dbo.operacaogeral 
	 where cancelada = 1
	)