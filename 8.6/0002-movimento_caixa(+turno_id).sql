if dbo.fn_existe('dbo.movimento_caixa.turno_id') > 0 return
  alter table dbo.movimento_caixa 
    add turno_id int null

  alter table dbo.movimento_caixa add 
    constraint ri_movimento_caixa$turno_id__turno$turno_id
      foreign key (turno_id) references dbo.turno (turno_id)
go

if dbo.fn_existe('dbo.movimento_caixa_geral.turno_id') > 0 return
  alter table dbo.movimento_caixa_geral 
    add turno_id int null
go

if dbo.fn_existe('dbo.pre_pagamento.turno_id') > 0 return
  alter table dbo.pre_pagamento 
    add turno_id int null
go



