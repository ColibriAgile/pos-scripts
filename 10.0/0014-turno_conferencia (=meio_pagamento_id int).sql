exec sp_apagar_pk turno_conferencia

alter table turno_conferencia
  alter column meio_pagamento_id int not null

alter table dbo.turno_conferencia add constraint
  pk_turno_conferencia primary key clustered 
  (
  turno_id,
  meio_pagamento_id,
  bandeira
  ) with( statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]

