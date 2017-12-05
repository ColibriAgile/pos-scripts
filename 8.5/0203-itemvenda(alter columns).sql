
if object_id('df_itemvenda$funcionario_id', 'D') is null return
alter table dbo.itemvenda
drop constraint [df_itemvenda$funcionario_id]
go

if object_id('fk_itemvenda_funcionario') is not null  
  alter table dbo.itemvenda
  drop constraint fk_itemvenda_funcionario

alter table dbo.itemvenda
alter column funcionario_id int null

if object_id('df_itemvendageral$funcionario_id', 'D') is null return
alter table dbo.itemvendageral
drop constraint [df_itemvendageral$funcionario_id]
go

if object_id('ri_funcionario_itemvendageral') is not null  
  alter table dbo.itemvendageral
  drop constraint ri_funcionario_itemvendageral

alter table dbo.itemvendageral
alter column funcionario_id int null

