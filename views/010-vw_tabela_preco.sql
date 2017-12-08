if object_id ('vw_tabela_preco') is not null
  drop view vw_tabela_preco
go

create view vw_tabela_preco
as
select 
  id = t.id,
  nome = t.nome,
  t.dt_vigencia,
  modo_venda = isnull(m.nome, '(geral)'),
  situacao =   case  
    when t.dt_vigencia = t2.dt_vigencia then 'vigente'
    when t.dt_vigencia > getdate() then 'futura'
    else 'expirada'
  end
from tabela_preco t
left join modo_venda m on m.id = t.modo_venda
join 
(
  select 
    modo_venda_id = isnull(modo_venda,0), 
    dt_vigencia = max(dt_vigencia)
  from tabela_preco
  where dt_vigencia <= getdate()
  group by modo_venda
) t2 ON
  t2.modo_venda_id = isnull(t.modo_venda, 0)
go

