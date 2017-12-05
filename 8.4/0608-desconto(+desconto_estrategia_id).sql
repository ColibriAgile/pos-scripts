if exists(
  select * 
  from syscolumns 
  where name = 'desconto_estrategia_id' 
    and id = object_id('desconto')
) return 

alter table desconto
  add desconto_estrategia_id int null

alter table desconto
  add constraint ri_desc_desc_estr_id foreign key (desconto_estrategia_id)
    references desconto_estrategia(desconto_estrategia_id)

go