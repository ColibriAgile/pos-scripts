if dbo.fn_existe('dbo.layout_touch.cloud')=0
  alter table dbo.layout_touch add cloud bit
go

if dbo.fn_existe('dbo.desconto.cloud')=0
  alter table dbo.desconto add cloud bit
go

if dbo.fn_existe('ix_desconto$codigo')=1
  alter table dbo.desconto drop constraint ix_desconto$codigo
go

if dbo.fn_existe('ix_desconto$codigo$cloud')=0
  alter table dbo.desconto add constraint ix_desconto$codigo$cloud unique nonclustered (codigo, cloud)
go

if dbo.fn_existe('dbo.desconto_estrategia.cloud')=0
  alter table dbo.desconto_estrategia add cloud bit
go

if dbo.fn_existe('dbo.promocao.cloud')=0
  alter table dbo.promocao add cloud bit
go

if dbo.fn_existe('dbo.perfil.cloud')=0
  alter table dbo.perfil add cloud bit
go

if dbo.fn_existe('dbo.meio_pagamento.cloud')=0
  alter table dbo.meio_pagamento add cloud bit
go
