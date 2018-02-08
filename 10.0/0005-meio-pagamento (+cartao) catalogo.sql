if dbo.fn_existe('dbo.meio_pagamento.cartao')=0
  alter table dbo.meio_pagamento add cartao bit
go
