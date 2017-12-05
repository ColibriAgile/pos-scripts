if dbo.fn_existe('dbo.movimento_caixa.api_key')=0
  alter table dbo.movimento_caixa add api_key varchar(50)
go
if dbo.fn_existe('dbo.movimento_caixa_geral.api_key')=0
  alter table dbo.movimento_caixa_geral add api_key varchar(50)
go
if dbo.fn_existe('dbo.pre_pagamento.api_key')=0
  alter table dbo.pre_pagamento add api_key varchar(50)
go
