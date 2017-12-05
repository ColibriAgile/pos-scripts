if exists (
  select * 
  from syscolumns 
  where name = 'func_id'
  and id = object_id('historicocliente')
) return 

alter table dbo.historicocliente
add func_id integer