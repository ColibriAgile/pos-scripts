if (dbo.fn_existe('dbo.operacao_venda.hr_encerramento') = 1)
  return

alter table dbo.operacao_venda add
	dt_encerramento as cast(dt_hr_encerramento as date) persisted,
	hr_encerramento as cast(dt_hr_encerramento as time) persisted

go
----------------------------------------------
if (dbo.fn_existe('dbo.operacao_venda_geral.hr_encerramento') = 1)
  return

alter table dbo.operacao_venda_geral add
	dt_encerramento as cast(dt_hr_encerramento as date) persisted,
	hr_encerramento as cast(dt_hr_encerramento as time) persisted

go
