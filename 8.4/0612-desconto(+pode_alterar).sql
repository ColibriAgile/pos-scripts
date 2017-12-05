if exists(
  select * 
  from syscolumns 
  where name = 'pode_alterar' 
    and id = object_id('desconto')
) return 

alter table desconto
  add pode_alterar bit not null
    constraint df_desconto$pode_alterar default 0


go