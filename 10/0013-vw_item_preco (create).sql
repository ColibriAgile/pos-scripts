if object_id ('vw_item_preco') is not null
  drop view vw_item_preco
go

create view [dbo].[vw_item_preco]
as
select 
  t.id,
  t.nome,
  t.dt_vigencia,
  t.modo_venda_id,
  t.modo_venda,
  t.situacao,
  i.material_id,
  i.preco
from vw_tabela_preco t
join item_preco i on i.tabela_id = t.id
where situacao = 'vigente'
go


