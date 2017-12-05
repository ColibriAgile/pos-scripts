if dbo.fn_existe('dbo.venda_item.dt_hr_lancamento') = 0
  alter table venda_item
  drop column hr_lancamento
go

if dbo.fn_existe('dbo.venda_item.dt_hr_lancamento') = 0
  exec sp_renomear 'dbo.venda_item.dt_lancamento','dt_hr_lancamento', 'column'
go

if dbo.fn_existe('dbo.venda_item.hr_lancamento') = 0
  alter table dbo.venda_item
  add hr_lancamento as (convert([time], [dt_hr_lancamento], (0)))
go

if dbo.fn_existe('dbo.venda_item_geral.dt_hr_lancamento') = 0
  alter table venda_item_geral
  drop column hr_lancamento
go

if dbo.fn_existe('dbo.venda_item_geral.dt_hr_lancamento') = 0
  exec sp_renomear 'dbo.venda_item_geral.dt_lancamento','dt_hr_lancamento', 'column'
go

if dbo.fn_existe('dbo.venda_item_geral.hr_lancamento') = 0
  alter table dbo.venda_item_geral
  add hr_lancamento as (convert([time], [dt_hr_lancamento], (0)))
go
