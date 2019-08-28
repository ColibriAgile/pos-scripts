-- adiciona o campo sistema
if exists(
  select * 
  from sys.columns 
  where object_id = object_id('layout_touch') 
    and name='sistema'
) 
  return

alter table dbo.layout_touch add
  sistema bit not null default 0
go

/*
Cria os layouts de sistema caso não existam*/
declare @temp_layout_touch table 
(
  ativo bit not null default 1,
  dt_alt datetime not null default getdate(),
  descricao nvarchar(60) collate LATIN1_GENERAL_CI_AI not null,
  modo_venda_id int not null,
  rede_id bigint not null default 1,
  loja_id int not null,
  sistema bit not null default 1
)

declare @loja int = (
  select top(1) loja_id 
  from dbo.loja 
  order by loja_id
)

insert into @temp_layout_touch 
(descricao, modo_venda_id, sistema, loja_id) values
('(Padrao balcão)', 1, 1, @loja),
('(Padrao entrega)', 2, 1, @loja),
('(Padrao mesa)', 3, 1, @loja),
('(Padrao ficha)', 4, 1, @loja),
('(Padrao comanda)', 5, 1, @loja)

/*
Garante que qualquer layout touch antigo deixe de ser de sistema */
update dbo.layout_touch
set sistema = 0

merge dbo.layout_touch as target
using
(
  select 
    ativo, 
    dt_alt, 
    descricao, 
    modo_venda_id, 
    rede_id,
    loja_id,
    sistema 
  from @temp_layout_touch
) as source
on target.descricao = source.descricao collate Latin1_General_CI_AI
when matched then
  update set 
    target.modo_venda_id = source.modo_venda_id,
    target.sistema = source.sistema,
    target.loja_id = source.loja_id
when not matched by target then
  insert 
  (
    ativo, 
    dt_alt, 
    descricao, 
    modo_venda_id, 
    rede_id, 
    loja_id,
    sistema
  ) values 
  (
    source.ativo, 
    source.dt_alt, 
    source.descricao, 
    source.modo_venda_id, 
    source.rede_id, 
    source.loja_id,
    source.sistema
  );
go

declare 
  @acaotouch int,
  @layout_balcao_id int,
  @layout_entrega_id int,
  @layout_mesa_id int,
  @layout_ficha_id int;

set @acaotouch = (select id from dbo.django_content_type where model = 'acaotouch');
set @layout_balcao_id = (select top 1 id from dbo.layout_touch where modo_venda_id = 1 and sistema = 1);
set @layout_entrega_id = (select top 1 id from dbo.layout_touch where modo_venda_id = 2 and sistema = 1);
set @layout_mesa_id = (select top 1 id from dbo.layout_touch where modo_venda_id = 3 and sistema = 1);
set @layout_ficha_id = (select top 1 id from dbo.layout_touch where modo_venda_id = 4 and sistema = 1);

declare @temp_config_touch table 
(
  tipo int not null default 1,
  item_id int not null,
  cor_botao nvarchar(20) null default '#EBF3D0',
  cor_fonte nvarchar(20) null default '#516642',
  ordem int not null,
  layout_id int not null,
  tipo_item_id int not null
)

-- 'balcao', 1
insert into @temp_config_touch 
(item_id, ordem, layout_id, tipo_item_id)
select
  a.acao_id as item_id,
  rank() over (order by a.acao_id) as ordem,
  @layout_balcao_id as layout_id,
  @acaotouch as tipo_item_id
from acao_touch a
where balcao = 1
order by ordem;

-- 'entrega', 2
insert into @temp_config_touch 
(item_id, ordem, layout_id, tipo_item_id)
select
  a.acao_id as item_id,
  rank() over (order by a.acao_id) as ordem,
  @layout_entrega_id as layout_id,
  @acaotouch as tipo_item_id
from acao_touch a
where entrega = 1
order by ordem;

-- 'mesa', 3
insert into @temp_config_touch 
(item_id, ordem, layout_id, tipo_item_id)
select
  a.acao_id as item_id,
  rank() over (order by a.acao_id) as ordem,
  @layout_mesa_id as layout_id,
  @acaotouch as tipo_item_id
from acao_touch a
where mesa = 1
order by ordem;

-- 'ficha', 4
insert into @temp_config_touch 
(item_id, ordem, layout_id, tipo_item_id)
select
  a.acao_id as item_id,
  rank() over (order by a.acao_id) as ordem,
  @layout_ficha_id as layout_id,
  @acaotouch as tipo_item_id
from acao_touch a
where ficha = 1
order by ordem;

merge dbo.config_touch as target
using 
(
  select 
    tipo, 
    item_id, 
    cor_botao, 
    cor_fonte, 
    ordem, 
    layout_id, 
    tipo_item_id 
  from @temp_config_touch
) as source
on target.layout_id = source.layout_id
when not matched by target then
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
    source.tipo_item_id
  );

update dbo.maquina
set 
  layout_balcao_id = coalesce(layout_balcao_id, @layout_balcao_id),
  layout_entrega_id = coalesce(layout_entrega_id, @layout_entrega_id),
  layout_ficha_id = coalesce(layout_ficha_id, @layout_ficha_id),
  layout_mesa_id = coalesce(layout_mesa_id, @layout_mesa_id)
from dbo.maquina
go
