declare @turnos table (mov_id int, turno_id int)

insert @turnos
select 
  m.movimento_caixa_id,
  isnull(c.turno_id, -1)
from (
  select
    c.movimento_caixa_id,
    c.dt_hr_pagamento,
    c.func_recebeu_id
  from dbo.movimento_caixa c 
  where c.turno_id is null
  union
  select
    c.movimento_caixa_id,
    c.dt_hr_pagamento,
    c.func_recebeu_id
  from dbo.pre_pagamento c 
  where c.turno_id is null
  union
  select 
    c.movimento_caixa_id,
    c.dt_hr_pagamento,
    c.func_recebeu_id
  from dbo.movimento_caixa_geral c
  where c.turno_id is null
) m
left join turno c on c.func_id = m.func_recebeu_id 
  and m.dt_hr_pagamento between c.dt_hr_abertura and isnull(c.dt_hr_fechamento, getdate())


update dbo.movimento_caixa set
  turno_id = t.turno_id
from @turnos t
where t.mov_id = movimento_caixa.movimento_caixa_id 

update dbo.pre_pagamento set
  turno_id = t.turno_id
from @turnos t
where t.mov_id = pre_pagamento.movimento_caixa_id 

update dbo.movimento_caixa_geral set
  turno_id = t.turno_id
from @turnos t
where t.mov_id = movimento_caixa_geral.movimento_caixa_id

alter table dbo.movimento_caixa 
  alter column turno_id int not null

alter table dbo.movimento_caixa_geral
  alter column turno_id int not null

alter table dbo.pre_pagamento
  alter column turno_id int not null




