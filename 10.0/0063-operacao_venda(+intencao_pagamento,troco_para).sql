if dbo.fn_existe('dbo.operacao_venda.intencao_pagamento') = 1
  return

alter table operacao_venda add 
intencao_pagamento int null,
troco_para numeric(8,2) null
go

if dbo.fn_existe('dbo.operacao_venda_geral.intencao_pagamento') = 1
  return

alter table operacao_venda_geral add 
intencao_pagamento int null,
troco_para numeric(8,2) null
go

