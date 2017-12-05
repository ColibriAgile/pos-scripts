if exists (
  select * 
  from syscolumns 
  where name = 'versao'
  and id = object_id('itemvenda')
) return 

alter table dbo.itemvenda
add versao varchar(20) null

alter table dbo.itemvendageral
add versao varchar(20) null