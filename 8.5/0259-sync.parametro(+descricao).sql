if exists(
  select * 
  from syscolumns 
  where name = 'descricao' 
    and id = object_id('sync.parametro')
) return 

alter table sync.parametro
add descricao varchar(20) null