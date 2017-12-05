if exists(
  select * 
  from syscolumns 
  where name = 'marchado' 
    and id = object_id('itemvenda')
) return 

alter table itemvenda 
add marchado bit null
 