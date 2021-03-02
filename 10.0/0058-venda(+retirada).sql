if (dbo.fn_existe('dbo.venda.retirada') = 1)
  return

alter table dbo.venda add
  retirada bit not null default 0

alter table dbo.venda_geral add
  retirada bit not null default 0

alter table dbo.ticket add
  retirada bit not null default 0
