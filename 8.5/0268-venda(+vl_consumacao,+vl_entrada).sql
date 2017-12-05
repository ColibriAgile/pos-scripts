--venda

if dbo.fn_existe('dbo.venda.vl_consumacao') = 0
  alter table dbo.venda add
    vl_consumacao money not null default 0
    
if dbo.fn_existe('dbo.venda.vl_entrada') = 0
  alter table dbo.venda add
    vl_entrada money not null default 0

go
--venda_geral

if dbo.fn_existe('dbo.venda_geral.vl_consumacao') = 0
  alter table dbo.venda_geral add
    vl_consumacao money not null default 0

if dbo.fn_existe('dbo.venda_geral.vl_entrada') = 0
  alter table dbo.venda_geral add
    vl_entrada money not null default 0

go
  