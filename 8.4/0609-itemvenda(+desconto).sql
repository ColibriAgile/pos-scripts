if exists(
  select * 
  from syscolumns 
  where name = 'desconto_id' 
    and id = object_id('itemvenda')
) return 

alter table itemvenda add
  desconto_id smallint null,       
  desconto_descr varchar(100) null,
  desconto_valor numeric(15,2) null
  
go

if exists(
  select * 
  from syscolumns 
  where name = 'desconto_id' 
    and id = object_id('itemvendageral')
) return 

alter table itemvendageral add
  desconto_id smallint null,
  desconto_descr varchar(100) null,
  desconto_valor numeric(15,2) null
  
go