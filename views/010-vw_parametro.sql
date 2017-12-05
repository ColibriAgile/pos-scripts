if object_id('vw_parametro') is not null
  drop view vw_parametro
go


create view vw_parametro
as 

select 
  x.codigo, 
  x.modo_venda_id, 
  valor = isnull(pm.valor, x.valor)
from 
(
  select 
    p.codigo, 
    modo_venda_id = id,
    valor = case ltrim(isnull(p.valor,'')) when '' then p.valor_default else p.valor end
  from parametro p   
  cross join modo_venda m
) x
left join parametro_modo pm on 
  x.codigo = pm.codigo and 
  pm.modo_venda_id = x.modo_venda_id

