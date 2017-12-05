if object_id('itemvenda') is null
return
exec('
update itemvenda
set arredondamento = 0
where arredondamento is null
')

alter table itemvenda
  drop column vl_tot

alter table itemvenda
  alter column arredondamento numeric (15, 2) not null
   
if object_id('df_itemvenda$arredondamento') is null
  alter table itemvenda 
    add constraint df_itemvenda$arredondamento default(0) for arredondamento

alter table itemvenda
  add vl_tot  AS (CONVERT([money],[nu_quantidade]*[vl_preco]+[arredondamento],(0)))

go

if object_id('itemvendageral') is null
return
exec('
update itemvendageral
set arredondamento = 0
where arredondamento is null
')

alter table itemvendageral
  drop column vl_tot

alter table itemvendageral
  alter column arredondamento numeric (15, 2) not null
   
if object_id('df_itemvendageral$arredondamento') is null
  alter table itemvendageral 
    add constraint df_itemvendageral$arredondamento default(0) for arredondamento

alter table itemvendageral
  add vl_tot  AS (CONVERT([money],[nu_quantidade]*[vl_preco]+[arredondamento],(0)))

go

if object_id('venda_item') is null
return
exec('
update venda_item
set arredondamento = 0
where arredondamento is null
')

alter table venda_item
  drop column vl_total

alter table venda_item
  alter column arredondamento numeric (15, 2) not null
   
if object_id('df_venda_item$arredondamento') is null
  alter table venda_item 
    add constraint df_venda_item$arredondamento default(0) for arredondamento

alter table venda_item
  add vl_total  AS (CONVERT([money],[qtd]*[vl_preco]+[arredondamento],(0)))

go

if object_id('venda_item_geral') is null
return
exec('
update venda_item_geral
set arredondamento = 0
where arredondamento is null
')

alter table venda_item_geral
  drop column vl_total

alter table venda_item_geral
  alter column arredondamento numeric (15, 2) not null
   
if object_id('df_venda_item_geral$arredondamento') is null
  alter table venda_item_geral 
    add constraint df_venda_item_geral$arredondamento default(0) for arredondamento

alter table venda_item_geral
  add vl_total  AS (CONVERT([money],[qtd]*[vl_preco]+[arredondamento],(0)))

go