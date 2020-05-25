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

IF OBJECT_ID('dbo.ix_grupo_material$rede_id$codigo', 'UQ') IS NOT NULL
  alter table dbo.grupo_material 
  drop constraint ix_grupo_material$rede_id$codigo


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

update grupo_material 
set codigo = -1 * codigo
from grupo_material gru 
join
(
  select
    cod = codigo
  from grupo_material
  group by codigo
  having count(*) > 1
) temp on gru.codigo = temp.cod
where gru.ativo = 0

alter table dbo.grupo_material add  constraint ix_grupo_material$rede_id$codigo unique nonclustered
(
  rede_id asc,
  codigo asc
)

/* local producao */
set identity_insert dbo.local_producao on

merge dbo.local_producao as target
using cloud_v1_0.local_producao as source with (nolock) on 
  target.id = source.cliente_id
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
IF OBJECT_ID('dbo.ix_material$rede_id$sub_rede_id$loja_id$codigo', 'UQ') IS NOT NULL
  alter table dbo.material drop constraint ix_material$rede_id$sub_rede_id$loja_id$codigo

set identity_insert dbo.material on

exec('
merge dbo.material as target
using
(
  select
    grupo_id = grupo.cliente_id,
    local_id = l.cliente_id,
    mat.*
  from cloud_v1_0.material mat
  join cloud_v1_0.grupo_material grupo 
    on mat.grupo = grupo.id
  left join cloud_v1_0.local_producao l 
    on l.id = mat.local_producao
) as source on target.id = source.cliente_id
when matched then
  update set
    ativo = source.ativo,
    dt_alt = source.dt_alt,
    codigo = source.codigo,
    descricao = source.descricao,
    descricao_touch = source.descricao_touch,
    descricao_producao = source.descricao_producao,
    descricao_extra = source.descricao_extra,
    tecla_prog = source.tecla_prog,
    imagem = source.imagem,
    cod_externo = source.cod_externo,
    unidade = source.unidade,
    venda = source.venda,
    servico = source.servico,
    requer_obs = source.requer_obs,
    qtde_frac = source.qtde_frac,
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
    descricao_extra,
    tecla_prog,
    imagem,
    cod_externo,
    unidade,
    venda,
    servico,
    requer_obs,
    qtde_frac,
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
  source.descricao_extra,
  source.tecla_prog,
  source.imagem,
  source.cod_externo,
  source.unidade,
  source.venda,
  source.servico,
  source.requer_obs,
  source.qtde_frac,
  source.balanca,
  source.consumacao,
  source.vende_combo,
  source.vende_web,
  source.grupo_id,
  source.local_id,'
  + @loja_id + ','
  + @rede_id + '
)
when not matched by source then
  update set target.ativo = 0;'
)

set identity_insert dbo.material OFF

update dbo.material 
set codigo = 'Inat.'+cast(mat.id as varchar(15))
from dbo.material mat 
join
(
  select cod = codigo
  from dbo.material
  group by codigo
  having count(*) > 1
) temp on 
  mat.codigo = temp.cod
where mat.ativo = 0

alter table dbo.material
  add constraint ix_material$rede_id$sub_rede_id$loja_id$codigo unique NONCLUSTERED
  (
    rede_id asc,
    sub_rede_id asc,
    loja_id asc,
    codigo asc
  )

/* codigodebarras */
merge dbo.codigo_barra as target
using
(
  select
    material_id = mat.cliente_id,
    barra.*
  from cloud_v1_0.codigo_barra barra
  join cloud_v1_0.material mat on barra.material = mat.id
) as source on 
  target.codigo = source.codigo
when matched then
  update set material_id = source.material_id
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
    source.material_id,
    @rede_id,
    @loja_id
  )
when not matched by source then
  delete;

/* classe */
set identity_insert dbo.classe on

merge dbo.classe as target
using cloud_v1_0.classe as source with (nolock) on 
  target.id = source.cliente_id
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
    imagem,
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
    source.imagem,
    @loja_id,
    @rede_id
  )
when not matched by source then
  update set 
    target.ativo = 0, 
    target.descricao = 'Inat.'+cast(target.id as varchar(15)),
    target.dt_alt = getdate();

set identity_insert dbo.classe off

/* combo */
set identity_insert dbo.combo on

IF OBJECT_ID('dbo.ix_combo$rede_id$sub_rede_id$loja_id$codigo', 'UQ') is not null
  alter table dbo.combo drop constraint ix_combo$rede_id$sub_rede_id$loja_id$codigo
exec('
merge dbo.combo as target
using
(
  select
    local_id =
     case
        when combo.local_producao_id <> 0 then
          l.cliente_id
        else
          combo.local_producao_id
      end,
    grupo_id = g.cliente_id,
    combo.*
  from cloud_v1_0.combo combo
  left join cloud_v1_0.local_producao l on l.id = combo.local_producao_id
  left join cloud_v1_0.grupo_material g on g.id = combo.grupo
) as source on 
  target.id = source.cliente_id

when matched then
  update set
    codigo = source.codigo,
    descricao_touch = source.descricao_touch,
    descricao_prod = source.descricao_prod,
    descricao_extra = source.descricao_extra,
    requer_obs = source.requer_obs,
    ativo = source.ativo,
    imagem = source.imagem,
    vende_web = source.vende_web,
    local_producao_id = source.local_id,
    grupo_id =  source.grupo_id

when not matched by target then
  insert
  (
    id,
    ativo,
    dt_alt,
    codigo,
    descricao_touch,
    descricao_prod,
    descricao_extra,
    requer_obs,
    vende_web,
    imagem,
    local_producao_id,
    grupo_id,
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
    source.descricao_extra,
    source.requer_obs,
    source.vende_web,
    source.imagem,
    source.local_id,
    source.grupo_id,'
    + @loja_id + ','
    + @rede_id + '
  )

when not matched by source then
  update set target.ativo = 0;'
)

set identity_insert dbo.combo off

update dbo.combo 
set codigo = 'Inat.'+cast(cob.id as varchar(15))
from dbo.combo cob 
join
(
  select cod = codigo
  from dbo.combo
  group by codigo
  having count(*) > 1
) temp on 
  cob.codigo = temp.cod
where cob.ativo = 0

alter table dbo.combo 
  add constraint ix_combo$rede_id$sub_rede_id$loja_id$codigo unique NONCLUSTERED
  (
    rede_id ASC,
    sub_rede_id ASC,
    loja_id ASC,
    codigo ASC
  )

/* comboslot */
set identity_insert dbo.combo_slot on

merge dbo.combo_slot as target
using
(
  select
    combo_id = combo.cliente_id,
    local_id = 
      case
        when slot.local_producao_id <> 0 then
          l.cliente_id
        else
          slot.local_producao_id
       end,
    classe_id = c.cliente_id,
    mat_id = m.cliente_id,
    slot.*
  from cloud_v1_0.combo_slot slot
  join cloud_v1_0.combo combo on combo.id = slot.combo
  left join cloud_v1_0.local_producao l on l.id = slot.local_producao_id
  left join cloud_v1_0.classe c on c.id = slot.classe
  left join cloud_v1_0.material m on m.id = slot.material
  where m.id is not null 
      or c.id is not null
) as source on 
  target.id = source.id

when matched then
  update set
    ordem = source.ordem,
    minimo = source.minimo,
    maximo = source.maximo,
    preco = source.preco,
    classe_id = source.classe_id,
    combo_id = source.combo_id,
    local_producao_id = source.local_id,
    material_id = source.mat_id,
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
    source.classe_id,
    source.combo_id,
    source.local_id,
    source.mat_id,
    source.precificador,
    source.quantificador
  )

when not matched by source then
  delete;

set identity_insert dbo.combo_slot off

/* item classe */
merge dbo.item_classe as target
using
(
  select
    classe_id = c.cliente_id,
    classe_item_id = ci.cliente_id,
    material_item_id = m.cliente_id,
    combo_item_id = co.cliente_id,
    item.*
  from cloud_v1_0.item_classe item
  join cloud_v1_0.classe c on 
    c.id = item.classe
  left join cloud_v1_0.classe ci on 
    ci.id = item.classe_item
  left join cloud_v1_0.material m on 
    m.id = item.material_item
  left join cloud_v1_0.combo co on 
    co.id = combo_item
) as source on 
  target.classe_id = source.classe_id and
  (
    target.classe_item_id = source.classe_item_id or
    target.material_item_id = source.material_item_id or
    target.combo_item_id = source.combo_item_id
  )
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
using cloud_v1_0.observacao as source with (nolock) on 
  target.id = source.cliente_id
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
using
(
  select
    observacao_id = obs.cliente_id,
    material_id = mat.cliente_id,
    combo_id = co.cliente_id,
    mat_obs.*
  from cloud_v1_0.material_obs mat_obs
  join cloud_v1_0.observacao obs on obs.id = mat_obs.observacao
  left join cloud_v1_0.material mat on mat.id = mat_obs.material
  left join cloud_v1_0.combo co on co.id = mat_obs.combo
) as source on
  target.observacao_id = source.observacao_id and
  (
    target.material_id = source.material_id or
    target.combo_id = source.combo_id
  )
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
IF OBJECT_ID('dbo.ix_motivo_cancelamento$rede_id$sub_rede_id$codigo', 'UQ') IS NOT NULL
  alter table dbo.motivo_cancelamento drop constraint ix_motivo_cancelamento$rede_id$sub_rede_id$codigo

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

update dbo.motivo_cancelamento 
set codigo = -1 * codigo
from dbo.motivo_cancelamento mot 
join
(
  select cod = codigo
  from dbo.motivo_cancelamento
  group by codigo
  having count(*) > 1
) temp on 
  mot.codigo = temp.cod
where mot.ativo = 0

alter table dbo.motivo_cancelamento add constraint ix_motivo_cancelamento$rede_id$sub_rede_id$codigo unique nonclustered
(
  rede_id asc,
  sub_rede_id asc,
  codigo asc
)

set identity_insert dbo.motivo_cancelamento off

/* meio_pagamento */
IF OBJECT_ID('dbo.ix_meio_pagamento$rede_id$sub_rede_id$codigo') IS NOT NULL
  alter table dbo.meio_pagamento drop constraint ix_meio_pagamento$rede_id$sub_rede_id$codigo

set identity_insert dbo.meio_pagamento on

merge dbo.meio_pagamento as target
using cloud_v1_0.meio_pagamento as source with (nolock) on 
  target.id = source.cliente_id
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
    dt_alt = source.dt_alt,
    cor = source.cor,
    cartao = source.cartao,
    cloud = 1
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
    cartao,
    loja_id,
    rede_id,
    cloud
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
    source.cor,
    source.cartao,
    @loja_id,
    @rede_id,
    1
  )
when not matched by source and target.cloud=1 then
  update set target.ativo = 0;

update meio_pagamento 
set codigo = -1 * codigo
from meio_pagamento meio 
join
(
  select cod = codigo
  from meio_pagamento
  group by codigo
  having count(*) > 1
) temp on meio.codigo = temp.cod
where meio.ativo = 0

alter table dbo.meio_pagamento add constraint ix_meio_pagamento$rede_id$sub_rede_id$codigo unique nonclustered
(
  rede_id asc,
  sub_rede_id asc,
  codigo asc
)

/* tab_preco */
set identity_insert dbo.meio_pagamento off
set identity_insert dbo.tabela_preco on

IF OBJECT_ID('dbo.ix_tabela_preco$loja_id$modo_venda$dt_vigencia') IS NOT NULL
  alter table dbo.tabela_preco drop constraint ix_tabela_preco$loja_id$modo_venda$dt_vigencia

merge dbo.tabela_preco as target
using cloud_v1_0.tabela_preco as source with (nolock) on 
  target.nome = source.nome
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
    id,
    ativo,
    dt_alt,
    nome,
    dt_vigencia,
    loja_id,
    modo_venda
  ) values
  (
    source.id,
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

update tabela_preco 
set dt_vigencia = DATEADD(day, tabela.id, cast('17530101' as date))
from tabela_preco tabela join
(
  select 
    loja_id,
    modo_venda,
    dt_vigencia
  from tabela_preco
  group by 
    loja_id, 
    modo_venda, 
    dt_vigencia
  having count(*) > 1
) temp on 
  temp.loja_id = tabela.loja_id and 
  temp.dt_vigencia = tabela.dt_vigencia and
  (
    (temp.modo_venda is null and tabela.modo_venda is null) or
    (temp.modo_venda = tabela.modo_venda)
  )
where tabela.ativo = 0

set identity_insert dbo.tabela_preco off

alter table dbo.tabela_preco add constraint ix_tabela_preco$loja_id$modo_venda$dt_vigencia unique nonclustered
(
  loja_id asc,
  modo_venda asc,
  dt_vigencia asc
)

/* item_preco */
merge dbo.item_preco as target
using 
(
  select
    tab_id = tp.id,
    material_id = mat.cliente_id,
    item.*
  from cloud_v1_0.item_preco item
  join cloud_v1_0.tabela_preco temp_tabela on item.tabela = temp_tabela.id
  join cloud_v1_0.material mat on mat.id = item.material
  join dbo.tabela_preco tp on tp.nome = temp_tabela.nome
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
using cloud_v1_0.layout_touch as source with (nolock) on 
  target.id = source.cliente_id
when matched then
  update set
    ativo = source.ativo,
    dt_alt = source.dt_alt,
    descricao = source.descricao,
    modo_venda_id = source.tipo_venda,
    cloud = 1
when not matched by target then
  insert
  (
    id,
    ativo,
    dt_alt,
    descricao,
    modo_venda_id,
    rede_id,
    loja_id,
    cloud
  ) values
  (
    source.cliente_id,
    1,
    source.dt_alt,
    source.descricao,
    source.tipo_venda,
    @rede_id,
    @loja_id,
    1
  )
when not matched by source and target.cloud = 1 then
  update set ativo = 0;

set identity_insert dbo.layout_touch off

/* config touch */
select
  layout_id =l.cliente_id ,
  config.*,
  case config.tipo
    when 1 then config.item_id
    when 2 then c.cliente_id
    when 3 then m.cliente_id
    when 4 then combo.cliente_id
  end cliente_item_id
into #temp_config_touch
from cloud_v1_0.config_touch config
join cloud_v1_0.layout_touch l on l.id = config.layout
left join cloud_v1_0.classe c on c.id = config.item_id
left join cloud_v1_0.material m on m.id = config.item_id
left join cloud_v1_0.combo combo on combo.id = config.item_id

merge dbo.config_touch as target
using
(
  select * from #temp_config_touch
) as source on
  target.layout_id = source.layout_id and
  target.tipo = source.tipo and
  target.item_id = source.cliente_item_id
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
    source.cliente_item_id,
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
  );

delete config
from dbo.config_touch config
join dbo.layout_touch layout on 
  layout.id = config.layout_id
where layout.cloud = 1
  and not exists
  (
    select * from #temp_config_touch t
    where t.layout_id = config.layout_id
      and t.tipo = config.tipo 
      and t.cliente_item_id = config.item_id
  )

/* perfil */
set identity_insert dbo.perfil on

merge dbo.perfil as target
using cloud_v1_0.perfil as source with (nolock) on 
  target.id = source.cliente_id
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
    sexo = source.sexo,
    cloud = 1
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
    rede_id,
    cloud
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
    @rede_id,
    1
  )
when not matched by source and target.cloud = 1 then
  update set ativo = 0;

set identity_insert dbo.perfil off

/* desconto esttrategia */
set identity_insert dbo.desconto_estrategia on

merge dbo.desconto_estrategia as target
using cloud_v1_0.desconto_estrategia as source with (nolock) on 
  target.id = source.cliente_id
when matched then
  update set
    descricao = source.descricao,
    aceita_desconto = source.aceita_desconto,
    dt_alt = source.dt_alt,
    cloud = 1
when not matched then
  insert
  (
    id,
    descricao,
    aceita_desconto,
    dt_alt,
    loja_id,
    cloud
  ) values
  (
    source.cliente_id,
    source.descricao,
    source.aceita_desconto,
    source.dt_alt,
    @loja_id,
    1
  );

set identity_insert dbo.desconto_estrategia off

/* desconto */
set identity_insert dbo.desconto on

merge dbo.desconto as target
using
(
  select
    desconto_estrategia_id = de.cliente_id,
    d.*
  from cloud_v1_0.desconto d
  left join cloud_v1_0.desconto_estrategia de on de.id = d.desconto_estrategia
) as source on 
  target.id = source.cliente_id
when matched then
  update set
    descricao = source.descricao,
    codigo = source.codigo,
    dt_alt = source.dt_alt,
    valor = source.valor,
    pode_alterar = source.pode_alterar,
    desconto_estrategia_id = source.desconto_estrategia_id,
    ativo = source.ativo,
    cloud = 1
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
    loja_id,
    cloud
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
    @loja_id,
    1
  )
when not matched by source and target.cloud = 1 then
  update set ativo = 0;


set identity_insert dbo.desconto off

/* desconto item */
select
  tipo_id = t.id,
  desconto_estrategia_id = de.cliente_id,
  item.*,
  case t.model
    when 'grupomaterial' then g.cliente_id
    when 'material' then m.cliente_id
    when 'combo' then c.cliente_id
  end cliente_item_id
into #temp_estat_item
from cloud_v1_0.desconto_estrategia_item item
join cloud_v1_0.desconto_estrategia de on de.id = item.desconto_estrategia
join cloud_v1_0.django_types types on item.tipo_item = types.id
join dbo.django_content_type t on t.model = types.model
left join cloud_v1_0.grupo_material g on item.item_id = g.id
left join cloud_v1_0.material m on item.item_id = m.id
left join cloud_v1_0.combo c on item.item_id = c.id

merge dbo.desconto_estrategia_item as target
using
(
  select * from #temp_estat_item
) as source on
  target.desconto_estrategia_id = source.desconto_estrategia_id and
  target.tipo_item_id = source.tipo_id and
  target.item_id = source.cliente_item_id
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
    source.cliente_item_id,
    source.dt_alt,
    source.tipo_id
  );

delete item
from dbo.desconto_estrategia_item item
join dbo.desconto_estrategia est on est.id = item.desconto_estrategia_id
where est.cloud = 1 
  and not exists
  (
    select * from #temp_estat_item t
    where t.desconto_estrategia_id = est.id 
      and t.tipo_id = item.tipo_item_id 
      and t.cliente_item_id = item.item_id
  )

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
    ficha = source.ficha,
    cloud = 1
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
    loja_id,
    cloud
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
    @loja_id,
    1
  )
when not matched by source and target.cloud = 1 then
  update set ativo = 0;

set identity_insert dbo.promocao off

/* promocao dia */
delete dia
from dbo.promocao_dia dia
join dbo.promocao promo on 
  promo.id = dia.promocao_id
where promo.cloud = 1
  and not exists
  (
    select *
    from cloud_v1_0.promocao_dia temp
    join cloud_v1_0.promocao temp_p on 
      temp_p.id = temp.promocao 
    where temp.id = dia.id 
      and temp_p.cliente_id = promo.id
  )

set identity_insert dbo.promocao_dia on
merge dbo.promocao_dia as target
using
(
  select
    promocao_id = p.cliente_id,
    dia.*
  from cloud_v1_0.promocao_dia dia
  join cloud_v1_0.promocao p on p.id = dia.promocao
) as source on 
  target.id = source.id and 
  target.promocao_id = source.promocao_id
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
  );

set identity_insert dbo.promocao_dia off

/* promocao item */
select
  promocao_id = p.cliente_id,
  item.*,
  case item.tipo_item
    when 'ma' then m.cliente_id
    when 'gr' then g.cliente_id
  end cliente_item_id
into #temp_promo_item
from cloud_v1_0.promocao_item item
join cloud_v1_0.promocao p on p.id = item.promocao
left join cloud_v1_0.material m on m.id = item.item_id
left join cloud_v1_0.grupo_material g on g.id = item.item_id

merge dbo.promocao_item as target
using
(
  select * from #temp_promo_item
) as source on
  target.item_id = source.cliente_item_id and
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
    source.cliente_item_id,
    source.tipo_promocao,
    source.valor,
    source.promocao_id
  );

delete item
from dbo.promocao_item item
join dbo.promocao promo on promo.id = item.promocao_id
where promo.cloud = 1
  and not exists
  (
    select * from #temp_promo_item t
    where t.cliente_item_id = item.item_id 
      and t.promocao_id = item.promocao_id 
      and t.tipo_item = item.tipo_item
  )
go
