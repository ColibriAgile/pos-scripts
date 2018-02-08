if dbo.fn_existe('dbo.movimento_caixa.nsu') = 1
  return

alter table dbo.movimento_caixa add 
  nsu varchar(20) null,
  tipo_cartao varchar(20) null
GO

if dbo.fn_existe('dbo.movimento_caixa_geral.nsu') = 1
  return

alter table dbo.movimento_caixa_geral add 
  nsu varchar(20) null,
  tipo_cartao varchar(20) null
GO

if dbo.fn_existe('dbo.pre_pagamento.nsu') = 1
  return

alter table dbo.pre_pagamento add 
  nsu varchar(20) null,
  tipo_cartao varchar(20) null
GO
