if (object_id('vw_itens_touch') is not null)
  drop view vw_itens_touch
go

create view vw_itens_touch as
--material
  select distinct
    principal_id = cast (v.classe_id as int),
    id = v.material_item_id,
    codigo = m.codigo collate Latin1_General_CI_AI,
    descricao = m.descricao_touch collate Latin1_General_CI_AI,
    img = m.imagem collate Latin1_General_CI_AI,
    classe = 0,
    v.classe_item_id,
    tipo = 3,
    v.ordem,
    v.combo_item_id,
    vende_combo =  m.vende_combo
  from item_classe as v
  join classe as c on c.id = v.classe_id
  join material as m on v.material_item_id = m.id
  where m.venda = 1
    and m.ativo = 1

  union
--classe
  select distinct
    principal_id = cast(v.classe_id as int),
    id = m.id,
    codigo = null,
    descricao = descricao_touch collate Latin1_General_CI_AI,
    img = m.imagem collate Latin1_General_CI_AI,
    classe = 1,
    v.classe_item_id,
    tipo = 2,
    v.ordem,
    v.combo_item_id,
    vende_combo = cast(0 as bit)
  from item_classe as v
  join classe as m on v.classe_item_id = m.id
  where v.classe_item_id > 1

  union
--combo
  select distinct
    principal_id = v.classe_id,
    id = v.combo_item_id,
    codigo = c.codigo collate Latin1_General_CI_AI,
    descricao = c.descricao_touch collate Latin1_General_CI_AI,
    img = c.imagem collate Latin1_General_CI_AI,
    classe = 0,
    v.classe_item_id,
    tipo = 4,
    v.ordem,
    v.combo_item_id,
    vende_combo = cast(0 as bit)
  from item_classe as v
  join combo as c on c.id = v.combo_item_id
go
