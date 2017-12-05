if exists(select * from syscolumns where id = object_id('cliente') and name = 'dt_ultimacompra') return

alter table cliente add
  dt_ultimacompra data_hora null
go            

update cliente
set dt_primeiracompra = null
where (dt_primeiracompra = 0)
   or (dt_primeiracompra = '18991230')
go

with datas as (
  select 
    h.cliente_id,
    dt_primeiracompra = dateadd(minute, datediff(minute, 0, min(h.dt_abertura)), 0),
    dt_ultimacompra = dateadd(minute, datediff(minute, 0, max(h.dt_abertura)), 0)
  from headervendageral h
  group by h.cliente_id
)
update cliente
set 
  dt_primeiracompra = d.dt_primeiracompra,
  dt_ultimacompra = d.dt_ultimacompra,
  dt_datacadastro = case 
    when isnull(dt_datacadastro, '18991230') = '18991230' then d.dt_primeiracompra 
    else cliente.dt_datacadastro 
  end
from datas d
where cliente.cliente_id = d.cliente_id

update cliente
set dt_datacadastro =  dateadd(minute, datediff(minute, 0, dt_alt), 0)
where (isnull(dt_datacadastro, '18991230') = '18991230')  
go
