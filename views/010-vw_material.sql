if object_id('dbo.vw_material') is not null
  drop view dbo.vw_material
go

create view dbo.vw_material
as 
select 
   m.id,
   m.ativo,
   m.dt_alt,
   m.codigo,
   m.descricao,
   m.descricao_touch,
   m.descricao_producao,
   m.tecla_prog,
   m.imagem,
   m.cod_externo,
   m.unidade,
   m.venda,
   m.servico,
   m.requer_obs,
   m.qtde_frac,
   m.balanca,
   m.consumacao,
   m.vende_combo,
   m.vende_web,
   m.grupo_id,
   m.local_producao_id,
   m.loja_id,
   m.rede_id,
   m.sub_rede_id,   
   grupo_ativo = g.ativo,
   grupo_dt_alt = g.dt_alt,
   grupo_codigo = g.codigo,
   grupo_descricao = g.descricao,
   grupo_tipo = g.tipo,   
   ip.preco,   
   ip.tabela_id   
from dbo.material m with (nolock)
join dbo.grupo_material g on g.id = m.grupo_id
left join item_preco ip on m.id = ip.material_id
go

