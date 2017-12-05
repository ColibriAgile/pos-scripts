
alter table movimento_caixa 
alter column meio_pagamento_id int
go

if (object_id('ri_movimento_caixa$meio_pagamento') is null)
  alter table movimento_caixa 
  add constraint ri_movimento_caixa$meio_pagamento foreign key
  (
    meio_pagamento_id
  ) 
  references dbo.meio_pagamento
  (
    id
  )
go

alter table movimento_caixa_geral
alter column meio_pagamento_id int
go

if (object_id('ri_movimento_caixa_geral$meio_pagamento') is null)
  alter table movimento_caixa_geral 
  add constraint ri_movimento_caixa_geral$meio_pagamento foreign key
  (
    meio_pagamento_id
  ) 
  references dbo.meio_pagamento
  (
    id
  )
go

