if (object_id('vw_botoes_touch') is not null)
  drop view vw_botoes_touch
go

create view vw_botoes_touch as
--materiais
select
  layout_id = t.layout_id,
  id = m.id,
  codigo = m.codigo collate Latin1_General_CI_AI,
  cor_botao = t.cor_botao collate Latin1_General_CI_AI,
  cor_fonte = t.cor_fonte collate Latin1_General_CI_AI,
  ordem = t.ordem,
  img = m.imagem collate Latin1_General_CI_AI,
  tipo_botao = cast(t.tipo as varchar(1)) collate Latin1_General_CI_AI,
  tipo_botao_descr = 'material' collate Latin1_General_CI_AI,
  descricao_touch = m.descricao_touch collate Latin1_General_CI_AI,
  venda = m.venda
from config_touch as t
join material as m on t.item_id = m.id
where t.tipo = 3
  and m.ativo = 1

union
--combos
select
  t.layout_id,
  id = c.id,
  cast(c.codigo as varchar(20)) collate Latin1_General_CI_AI,
  t.cor_botao collate Latin1_General_CI_AI,
  t.cor_fonte collate Latin1_General_CI_AI,
  t.ordem,
  img = c.imagem collate Latin1_General_CI_AI,
  tipo_botao = cast(t.tipo as varchar(1)) collate Latin1_General_CI_AI,
  tipo_botao_descr = 'combo' collate Latin1_General_CI_AI,
  c.descricao_touch collate Latin1_General_CI_AI,
  venda = 1
from config_touch as t
join combo as c on t.item_id = c.id
where t.tipo = 4
  and c.ativo = 1

union
--classes
select
  t.layout_id,
  id = c.id,
  cast(c.id as varchar(20)) collate Latin1_General_CI_AI,
  t.cor_botao collate Latin1_General_CI_AI,
  t.cor_fonte collate Latin1_General_CI_AI,
  t.ordem,
  img = c.imagem collate Latin1_General_CI_AI,
  tipo_botao = cast(t.tipo as varchar(1)) collate Latin1_General_CI_AI,
  tipo_botao_descr = 'classe' collate Latin1_General_CI_AI,
  descricao_touch collate Latin1_General_CI_AI,
  venda = 1
from config_touch as t
join classe as c on t.item_id = c.id
where t.tipo = 2
  and c.ativo = 1
