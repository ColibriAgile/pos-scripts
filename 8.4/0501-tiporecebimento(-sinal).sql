update dbo.movimentocaixa set meiorecebimento_id = 1 where meiorecebimento_id = 98
update dbo.movimentocaixageral set meiorecebimento_id = 1 where meiorecebimento_id = 98
update dbo.prepagamento set meiorecebimento_id = 1 where meiorecebimento_id = 98
delete dbo.valorconferido where tiporecebimento_id = 98

delete from dbo.tiporecebimento where nu_codigo = 98