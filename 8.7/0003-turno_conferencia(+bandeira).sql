if dbo.fn_existe('dbo.turno_conferencia.bandeira') = 1
  return

alter table dbo.turno_conferencia 
add bandeira varchar(20) not null default ''

exec dbo.sp_apagar_pk @table_name = 'turno_conferencia'

alter table [dbo].[turno_conferencia] 
add constraint [pk_turno_conferencia] 
primary key clustered  ([turno_id], [meio_pagamento_id], [bandeira]) 
on [primary]
