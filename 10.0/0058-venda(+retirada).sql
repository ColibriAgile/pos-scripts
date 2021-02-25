if (dbo.fn_existe('dbo.venda.retirada') = 1)
  return

alter table dbo.venda add
  retirada bit not null default 0
go