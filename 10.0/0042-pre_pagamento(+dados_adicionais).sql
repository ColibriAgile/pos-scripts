if dbo.fn_existe('dbo.pre_pagamento.dados_adicionais') = 1
  return

alter table pre_pagamento
add dados_adicionais varchar(1000) null
go