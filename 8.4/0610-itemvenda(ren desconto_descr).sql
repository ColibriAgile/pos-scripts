if exists(
  select * 
  from syscolumns 
  where name = 'desconto_descr' 
    and id = object_id('itemvenda')
) 

execute sp_rename N'itemvenda.desconto_descr', N'desconto_estrategia', 'column' 
 
go

if exists(
  select * 
  from syscolumns 
  where name = 'desconto_descr' 
    and id = object_id('itemvendageral')
)  

execute sp_rename N'itemvendageral.desconto_descr', N'desconto_estrategia', 'column' 

go
 