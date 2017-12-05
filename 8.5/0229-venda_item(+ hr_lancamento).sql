if dbo.fn_existe('dbo.venda_item.hr_lancamento') = 0
  alter table dbo.venda_item
    add hr_lancamento as (convert([time], [dt_hr_lancamento], (0)))
go

if dbo.fn_existe('dbo.venda_item_geral.hr_lancamento') = 0
  alter table dbo.venda_item_geral
    add hr_lancamento as (convert([time], [dt_hr_lancamento], (0)))
go
