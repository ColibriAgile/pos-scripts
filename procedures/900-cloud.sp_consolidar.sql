if not exists (select  schema_name from  information_schema.schemata where schema_name = 'cloud' ) 
begin
  exec sp_executesql N'CREATE SCHEMA cloud'
end
go

if object_id('cloud.sp_consolidar_v1_0') is not null 
  drop procedure cloud.sp_consolidar_v1_0
go

create procedure cloud.sp_consolidar_v1_0
as
 
declare 
  @loja_id int, 
  @rede_id int,
  @tipo_acao int,
  @tipo_material int,
  @tipo_combo int,
  @tipo_classe int,
  @tipo_grupo int

select 
  @loja_id = loja_id, 
  @rede_id = rede_id 
from dbo.loja

select @tipo_acao = id 
from dbo.django_content_type 
where model = 'acaotouch' 

select @tipo_classe = id 
from dbo.django_content_type 
where model = 'classe'

select @tipo_material = id 
from dbo.django_content_type 
where model = 'material' 

select @tipo_combo = id 
from dbo.django_content_type 
where model = 'combo' 

select @tipo_grupo = id 
from dbo.django_content_type 
where model = 'grupomaterial' 

/* grupo material */
set identity_insert dbo.grupo_material on 
  
merge dbo.grupo_material as target 
using cloud_v1_0.grupo_material as source with (nolock) on target.id = source.cliente_id
when matched then
  update set 
    descricao = source.descricao,
	  dt_alt = source.dt_alt,
	  ativo = source.ativo, 
	  tipo = source.tipo
when not matched by target then
  insert 
  (
    id,
    ativo,
    dt_alt,
    codigo,
    descricao,
    tipo,
    lft,
    rght,
    tree_id,
    level,
    rede_id
  ) values
  (
    source.cliente_id, 
    1,
    source.dt_alt,
    source.codigo,
    source.descricao,
    source.tipo,
    0,
    0,
    0,
    0,
    @rede_id
  )
when not matched by source then
  update set target.ativo = 0;

set identity_insert dbo.grupo_material off

/* local producao */
set identity_insert dbo.local_producao on

merge dbo.local_producao as target 
using cloud_v1_0.local_producao as source with (nolock) on target.id = source.cliente_id
when matched then
  update set 
    nome = source.descricao,
	  dt_alt = source.dt_alt ,
    loja_id = @loja_id
when not matched by target then
  insert 
  (
   id,
   nome,
   dt_alt,
   loja_id,
   rede_id
  ) 
  values
  (
   source.cliente_id,
   source.descricao,
   source.dt_alt,
   @loja_id,
   @rede_id
   );

set identity_insert dbo.local_producao off

/* material */
set identity_insert dbo.material on
   
merge dbo.material as target 
using (select grupo.cliente_id grupo_id, l.cliente_id local_id, mat.* 
	  from cloud_v1_0.material mat 
	  join cloud_v1_0.grupo_material grupo on
	  mat.grupo = grupo.id
	  left join cloud_v1_0.local_producao l on 
	  l.id = mat.local_producao)  as source on target.id = source.cliente_id
when matched then
  update set 
    ativo = source.ativo,
    dt_alt = source.dt_alt,
    codigo = source.codigo,
    descricao = source.descricao,
    descricao_touch = source.descricao_touch,
    descricao_producao = source.descricao_producao,
    tecla_prog = source.tecla_prog,
    imagem = source.imagem,
    cod_externo = source.cod_Externo,
    unidade = source.unidade,
    venda = source.venda,
    servico = source.servico,
    requer_obs = source.requer_obs,
    qtde_frac = source.qtde_frac,
    fabricacao_propria = isnull(source.fabricacao_propria,0),
    balanca = source.balanca,
    consumacao = source.consumacao,
    vende_web = source.vende_web,
    vende_combo = source.vende_combo,
    grupo_id = source.grupo_id,
    local_producao_id = source.local_id
when not matched by target then
  insert
  (
    id,
    ativo,
    dt_alt,
    codigo,
    descricao,
    descricao_touch,
    descricao_producao,
    tecla_prog,
    imagem,
    cod_externo,
    unidade,
    venda,
    servico,
    requer_obs,
    qtde_frac,
    fabricacao_propria,
    balanca,
    consumacao,
    vende_combo,
    vende_web,
    grupo_id,
    local_producao_id,
    loja_id,
    rede_id
  ) values
  (
    source.cliente_id, 
    source.ativo, 
    source.dt_alt, 
    source.codigo, 
    source.descricao, 
    source.descricao_touch, 
    source.descricao_producao, 
    source.tecla_prog, 
    source.imagem, 
    source.codigo,
    source.unidade, 
    source.venda, 
    source.servico, 
    source.requer_obs, 
    source.qtde_frac, 
    isNull(source.fabricacao_propria,0),
    source.balanca, 
    source.consumacao, 
    source.vende_combo, 
    source.vende_web, 
    source.grupo,
    source.local_producao,
    @loja_id, 
    @rede_id
  )
when not matched by source then
  update set target.ativo = 0;

set identity_insert dbo.material OFF  

/* codigodebarras */ 
merge dbo.codigo_barra as target 
using cloud_v1_0.codigo_barra as source with (nolock) on target.codigo = source.codigo collate Latin1_General_CI_AI 
when matched then
  update set material_id = source.material
when not matched by target then
  insert
  (
    codigo, 
    material_id, 
    rede_id, 
    loja_id
  ) values
  (
    source.codigo, 
    source.material, 
    @rede_id, 
    @loja_id
  )
when not matched by source then
  delete;

   
/* classe */
set identity_insert dbo.classe on

merge dbo.classe as target 
using cloud_v1_0.classe as source with (nolock) on target.id = source.cliente_id
when matched then
  update set
    descricao = source.descricao,
    descricao_touch = source.descricao_touch,
    ordem_alfabetica = source.ordem_alfabetica,
    imagem = source.imagem,
    dt_alt = source.dt_alt,
    ativo = source.ativo
when not matched by target then
  insert
  (
    id,
    ativo,
    dt_alt,
    descricao,
    descricao_touch,
    ordem_alfabetica,
    permite_combinado,
    loja_id,
    rede_id
  ) values
  (
    source.cliente_id,
    1, 
    source.dt_alt, 
    source.descricao, 
    source.descricao_touch, 
    source.ordem_alfabetica, 
    0,
    @loja_id, 
    @rede_id
  ) 
when not matched by source then
  update set target.ativo = 0;

set identity_insert dbo.classe off


/* combo */ 
set identity_insert dbo.combo on

merge dbo.combo as target 
using (select l.cliente_id local_id, combo.* 
       from cloud_v1_0.combo combo
       left join cloud_v1_0.local_producao l
       on l.id = combo.local_producao_id) as source on target.id = source.cliente_id
when matched then
  update set
    codigo = source.codigo,
    descricao_touch = source.descricao_touch,
    descricao_prod = source.descricao_prod,
    requer_obs = source.requer_obs,
    ativo = source.ativo,
    imagem = source.imagem,
    vende_web = source.vende_web,
    local_producao_id = source.local_id
when not matched by target then
  insert
  (
    id,
    ativo,
    dt_alt,
    codigo,
    descricao_touch,
    descricao_prod,
    requer_obs,
    vende_web,
    imagem,
    local_producao_id,
    loja_id,
    rede_id
  ) values
  (
    source.cliente_id, 
    source.ativo, 
    source.dt_alt, 
    source.codigo, 
    source.descricao_touch, 
    source.descricao_prod, 
    source.requer_obs,
    source.vende_web,
    source.imagem, 
    source.local_producao_id,
    @loja_id, 
    @rede_id
  )
when not matched by source then
  update set target.ativo = 0;   

set identity_insert dbo.combo off

/* comboslot */ 
set identity_insert dbo.combo_slot on

merge dbo.combo_slot as target 
using  (select combo.cliente_id combo_id, l.cliente_id local_id, slot.*
        from cloud_v1_0.combo_slot slot
        join cloud_v1_0.combo combo on
        combo.id = slot.combo
        left join cloud_v1_0.local_producao l on
        l.id = slot.local_producao_id) as source on target.id = source.id
when matched then
  update set
    ordem = source.ordem,
    minimo = source.minimo,
    maximo = source.maximo,
    preco = source.preco,
    classe_id = source.classe,
    combo_id = source.combo,
    local_producao_id = source.local_id,
    material_id = source.material,
    precificador_id = source.precificador,
    quantificador_id = source.quantificador
when not matched by target then
  insert
  (
    id,
    ativo,
    dt_alt,
    ordem,
    minimo,
    maximo,
    preco,
    classe_id,
    combo_id,
    local_producao_id,
    material_id,
    precificador_id,
    quantificador_id
  ) values
  (
    source.id, 
    1,
    source.dt_alt,
    source.ordem,
    source.minimo,
    source.maximo,
    source.preco,
    source.classe,
    source.combo_id,
    source.local_producao_id,
    source.material,
    source.precificador,
    source.quantificador
  )
when not matched by source then
  update set target.ativo = 0;

set identity_insert dbo.combo_slot off


/* item classe */ 
merge dbo.item_classe as target 
using (select c.cliente_id classe_id, ci.cliente_id classe_item_id, m.cliente_id material_item_id, 
       co.cliente_id combo_item_id, item.*
       from cloud_v1_0.item_classe item
       join cloud_v1_0.classe c on
       c.id = item.classe 
       left join cloud_v1_0.classe ci on
       ci.id = item.classe_item
       left join cloud_v1_0.material m on
       m.id = item.material_item
       left join cloud_v1_0.combo co on
       co.id = combo_item) as source  on 
      (target.classe_id = source.classe_id) and 
      (target.classe_item_id = source.classe_item_id or target.material_item_id = source.material_item_id or target.combo_item_id = source.combo_item_id)
when matched then
  update set
    ordem = source.ordem,
    classe_item_id = source.classe_item_id,
    material_item_id = source.material_item_id,
    combo_item_id = source.combo_item_id
when not matched by target then
  insert
  (
    ativo,
    dt_alt,
    tipo, 
    ordem, 
    classe_id,
    classe_item_id,
    combo_item_id,
    material_item_id
  ) values
  (
    1, 
    source.dt_alt, 
    source.tipo,
    source.ordem, 
    source.classe_id, 
    source.classe_item_id, 
    source.combo_item_id, 
    source.material_item_id
  ) 
when not matched by source then
  delete;
   
/* observacao */ 
set identity_insert dbo.observacao on

merge dbo.observacao as target 
using cloud_v1_0.observacao as source with (nolock) on target.id = source.cliente_id
when matched then
  update set 
    nome = source.nome,
    dt_alt = source.dt_alt,
    ativo = source.ativo
when not matched by target then
  insert
  (
    id,
    ativo,
    dt_alt,
    nome,
    loja_id,
    rede_id
  ) values
  (
    source.cliente_id, 
    1, 
    source.dt_alt,  
    source.nome, 
    @loja_id, 
    @rede_id
  ) 
when not matched by source then
  update set target.ativo = 0;

set identity_insert dbo.observacao off
  
/* material_obs */ 
merge dbo.material_obs as target 
using (select obs.cliente_id observacao_id, mat.cliente_id material_id, co.cliente_id combo_id, mat_obs.*
       from cloud_v1_0.material_obs mat_obs 
       join cloud_v1_0.observacao obs on
       obs.id = mat_obs.observacao 
       left join cloud_v1_0.material mat on
       mat.id = mat_obs.material
       left join cloud_v1_0.combo co on
       co.id = mat_obs.combo) as source on 
       (target.observacao_id = source.observacao_id) and 
       (target.material_id = source.material_id or target.combo_id = source.combo_id)
when matched then
  update set posicao = source.posicao
when not matched by target then
  insert
  (
    posicao, 
    combo_id, 
    material_id, 
    observacao_id
  ) values
  (
    source.posicao, 
    source.combo_id, 
    source.material_id, 
    source.observacao_id
  ) 
when not matched by source then
  delete;

/* motivocanc */ 
set identity_insert dbo.motivo_cancelamento on

merge dbo.motivo_cancelamento as target 
using cloud_v1_0.motivo_cancelamento as source with (nolock) on target.id = source.cliente_id
when matched then
  update set 
    codigo = source.codigo,
    nome = source.nome,
    baixa_estoque = source.baixa_estoque,
	  ativo = source.ativo,
	  dt_alt = source.dt_alt
when not matched by target then
  insert
  (
    id,
    ativo, 
    dt_alt, 
    codigo, 
    nome, 
    baixa_estoque, 
    loja_id, 
    rede_id
  ) values
  (
    source.cliente_id,
    1, 
    source.dt_alt, 
    source.codigo, 
    source.nome, 
    source.baixa_estoque, 
    @loja_id, 
    @rede_id
  ) 
when not matched by source then
     update set target.ativo = 0;

set identity_insert dbo.motivo_cancelamento off

/* meio_pagamento */ 
set identity_insert dbo.meio_pagamento on

merge dbo.meio_pagamento as target 
using cloud_v1_0.meio_pagamento as source with (nolock) on target.id = source.cliente_id
when matched then
  update set 
    codigo = source.codigo,
    descricao = source.descricao,
    imagem = source.imagem,
    troco_dinheiro = source.troco_dinheiro,
    troco_contravale = source.troco_contravale,
    troco_repique = source.troco_repique,
    tef = source.tef,
    multiplo = source.multiplo,
    ordem = source.ordem,
    tipo_tef = source.tipo_tef,
    ativo = source.ativo,
    dt_alt = source.dt_alt
when not matched by target then
  insert
  (
    id,
    ativo,
    dt_alt,
    codigo,
    descricao,
    imagem,
    troco_dinheiro,
    troco_repique,
    troco_contravale,
    tef,
    tipo_tef,
    multiplo,
    ordem,
    cor,
    loja_id,
    rede_id
  ) values
  (
    source.cliente_id,
    1, 
    source.dt_alt, 
    source.codigo, 
    source.descricao, 
    source.imagem, 
    source.troco_dinheiro, 
    source.troco_repique, 
    source.troco_contravale, 
    source.tef, 
    source.tipo_tef, 
    source.multiplo, 
    source.ordem, 
    'Padrão', 
    @loja_id, 
    @rede_id
  ) 
when not matched by source then
  update set target.ativo = 0;   

set identity_insert dbo.meio_pagamento off

/* tab_preco */
merge dbo.tabela_preco as target
using cloud_v1_0.tabela_preco as source with (nolock) on target.nome = source.nome collate Latin1_General_CI_AI
when matched then
  update set 
    target.dt_vigencia = source.dt_vigencia,
    target.modo_venda = case source.modo_venda 
    when 0 then null 
      else source.modo_venda 
    end
when not matched by target then 
  insert 
  (
    ativo, 
    dt_alt, 
    nome, 
    dt_vigencia, 
    loja_id, 
    modo_venda
  ) values 
  (
    1, 
    source.dt_alt, 
    source.nome, 
    source.dt_vigencia, 
    @loja_id, 
    case source.modo_venda 
      when 0 then null 
      else source.modo_venda 
    end
  )
when not matched by source then 
  update set ativo = 0;

/* item_preco */
merge dbo.item_preco as target
using (
  select tp.id tab_id, mat.cliente_id material_id, item.* 
  from cloud_v1_0.item_preco item
  join cloud_v1_0.tabela_preco temp_tabela on
  item.tabela = temp_tabela.id
  join cloud_v1_0.material mat on
  mat.id = item.material
  join dbo.tabela_preco tp on tp.nome = temp_tabela.nome collate Latin1_General_CI_AI
) as source on 
  target.tabela_id = source.tab_id and 
  target.material_id = source.material_id
when matched then
  update set target.preco = source.preco
when not matched by target then 
  insert 
  (
    ativo, 
    dt_alt, 
    preco, 
    material_id, 
    tabela_id
  ) values 
  (
    1, 
    source.dt_alt, 
    source.preco, 
    source.material_id, 
    source.tab_id
  )
when not matched by source then 
  delete;


/* layout_touch */
set identity_insert dbo.layout_touch on

merge dbo.layout_touch as target 
using cloud_v1_0.layout_touch as source with (nolock) on target.id = source.cliente_id
when matched then
  update set
    ativo = source.ativo,
    dt_alt = source.dt_alt,
    descricao = source.descricao,
    modo_venda_id = source.tipo_venda
when not matched by target then
  insert  
  ( 
    id,
    ativo,
    dt_alt,
    descricao,
    modo_venda_id,
    rede_id
   ) values
   (
    source.cliente_id,
    1,
    source.dt_alt,
    source.descricao,
    source.tipo_venda,
    @rede_id
   )
when not matched by source then 
  update set ativo = 0;

set identity_insert dbo.layout_touch off

/* config touch */
merge dbo.config_touch as target 
using (select l.cliente_id layout_id, config.*
       from cloud_v1_0.config_touch config 
       join cloud_v1_0.layout_touch l on
       l.id = config.layout) as source on 
  target.layout_id = source.layout_id and 
  target.tipo = source.tipo and 
  target.item_id = source.item_id
when matched then
  update set
    cor_botao = source.cor_botao,
    cor_fonte = source.cor_fonte,
    ordem = source.ordem
when not matched then
  insert
  (
    tipo,
    item_id,
    cor_botao,
    cor_fonte,
    ordem,
    layout_id,
    tipo_item_id
  ) values
  (
    source.tipo,
    source.item_id,
    source.cor_botao,
    source.cor_fonte,
    source.ordem,
    source.layout_id,
    case source.tipo 
      when 1 then (@tipo_acao)  
      when 2 then (@tipo_classe)
      when 3 then (@tipo_material)
      when 4 then (@tipo_combo)
    end
   )
when not matched by source then 
  delete;

/* perfil */
set identity_insert dbo.perfil on

merge dbo.perfil as target 
using cloud_v1_0.perfil as source with (nolock) on target.id = source.cliente_id
when matched then
  update set
    dt_alt = source.dt_alt,
    ativo = source.ativo,
    codigo = source.codigo,
    nome = source.nome,
    descricao = source.descricao,
    vl_consumacao = source.vl_consumacao,
    vl_entrada = source.vl_entrada,
    vl_limite = source.vl_limite,
    protegido = source.protegido,
    exceto = source.exceto,
    sexo = source.sexo
when not matched then
  insert
  (
    id,
    dt_alt,
    codigo,
    nome,
    descricao,
    vl_consumacao,
    vl_entrada,
    vl_limite,
    protegido,
    exceto,
    sexo,
    loja_id,
    rede_id
   ) values
   (
     source.cliente_id,
     source.dt_alt,
     source.codigo,
     source.nome,
     source.descricao,
     source.vl_consumacao,
     source.vl_entrada,
     source.vl_limite,
     source.protegido,
     source.exceto,
     source.sexo,
     @loja_id,
     @rede_id
   )
when not matched by source then 
  update set ativo = 0;

set identity_insert dbo.perfil off

/* desconto esttrategia */
set identity_insert dbo.desconto_estrategia on

merge dbo.desconto_estrategia as target 
using cloud_v1_0.desconto_estrategia as source with (nolock) on target.id = source.cliente_id
when matched then
  update set
    descricao = source.descricao,
    aceita_desconto = source.aceita_desconto,
    dt_alt = source.dt_alt
when not matched then
  insert
  (
    id,
    descricao,
    aceita_desconto,
    dt_alt,
    loja_id
   ) values
   (
     source.cliente_id,
     source.descricao,
     source.aceita_desconto,
     source.dt_alt,
     @loja_id
  );
 
set identity_insert dbo.desconto_estrategia off

/* desconto */
set identity_insert dbo.desconto on

merge dbo.desconto as target 
using (select de.cliente_id desconto_estrategia_id, d.*
       from cloud_v1_0.desconto d
       left join cloud_v1_0.desconto_estrategia de on
       de.id = d.desconto_estrategia) as source on target.id = source.cliente_id
when matched then
  update set
    descricao = source.descricao,
    codigo = source.codigo,
    dt_alt = source.dt_alt,
    valor = source.valor,
    pode_alterar = source.pode_alterar,
    desconto_estrategia_id = source.desconto_estrategia_id,
    ativo = source.ativo
when not matched then
  insert
  (
    id,
    dt_alt,
    ativo,
    codigo,
    descricao,
    valor,
    pode_alterar,
    desconto_estrategia_id,
    loja_id
   ) values
   (
     source.cliente_id,
     source.dt_alt,
     source.ativo,
     source.codigo,
     source.descricao,
     source.valor,
     source.pode_alterar,
     source.desconto_estrategia_id,
     @loja_id
  )
when not matched by source then 
  update set ativo = 0;

set identity_insert dbo.desconto off

/* desconto item */
merge dbo.desconto_estrategia_item as target 
using (
        select t.id tipo_id, de.cliente_id desconto_estrategia_id, item.*
        from cloud_v1_0.desconto_estrategia_item item
        join cloud_v1_0.desconto_estrategia de on
        de.id = item.desconto_estrategia
        join cloud_v1_0.django_types types on 
        item.tipo_item = types.id
        join dbo.django_content_type t on t.model = types.model
      ) as source on 
       target.desconto_estrategia_id = source.desconto_estrategia and
       target.tipo_item_id = source.tipo_id and
       target.item_id = source.item_id
when not matched then
  insert
  (
    desconto_estrategia_id,
	  item_id,
	  dt_alt,
	  tipo_item_id
  ) values
  (
    source.desconto_estrategia_id,
    source.item_id,
    source.dt_alt,
    source.tipo_id
  )
when not matched by source then 
  delete;
    
/* promocao */
set identity_insert dbo.promocao on

merge dbo.promocao as target 
using cloud_v1_0.promocao as source with (nolock) on target.id = source.cliente_id
when matched then
  update set
    dt_alt = source.dt_alt,
    ativo = source.ativo,
    descricao = source.descricao,
    dt_inicio = source.dt_inicio,
    dt_fim = source.dt_fim,
    balcao = source.balcao,
    mesa = source.mesa,
    entrega = source.entrega,
    ficha = source.ficha
when not matched then
 insert
 (
   id,
   dt_alt,
   ativo,
   descricao,
   dt_inicio,
   dt_fim,
   balcao,
   mesa,
   entrega,
   ficha,
   loja_id
 ) values
 (
   source.cliente_id,
   source.dt_alt,
   source.ativo,
   source.descricao,
   source.dt_inicio,
   source.dt_fim,
   source.balcao,
   source.mesa,
   source.entrega,
   source.ficha,
   @loja_id
  )
when not matched by source then 
  update set ativo = 0;;

set identity_insert dbo.promocao off

/* promocao dia */
set identity_insert dbo.promocao_dia on
merge dbo.promocao_dia as target 
using (select p.cliente_id promocao_id, dia.*
       from cloud_v1_0.promocao_dia dia
       join cloud_v1_0.promocao p
       on p.id = dia.promocao) as source on target.id = source.id and target.promocao_id = source.promocao_id 
when matched then
  update set
    dia_semana = source.dia_semana,
    hr_inicio = source.hr_inicio,
    hr_fim = source.hr_fim
when not matched then
  insert
  (
    id,
    dia_semana,
    hr_inicio,
    hr_fim,
    promocao_id
  ) values
  (
    source.id,
    source.dia_semana,
    source.hr_inicio,
    source.hr_fim,
    source.promocao_id
  )
when not matched by source then 
  delete;

set identity_insert dbo.promocao_dia off

/* promocao item */
merge dbo.promocao_item as target 
  using (select p.cliente_id promocao_id, item.*
         from cloud_v1_0.promocao_item item
		     join cloud_v1_0.promocao p on 
		     p.id = item.promocao) as source on 
		     target.item_id = source.item_id and 
		     target.promocao_id = source.promocao_id and
		     target.tipo_item = source.tipo_item
when matched then
  update set
    tipo_promocao = source.tipo_promocao,
    valor = source.valor
when not matched then
  insert
  (
    tipo_item,
	  item_id,
	  tipo_promocao,
	  valor,
	  promocao_id
   ) values
   (
     source.tipo_item,
	   source.item_id,
	   source.tipo_promocao,
	   source.valor,
	   source.promocao_id
	)
when not matched by source then 
  delete;

go


