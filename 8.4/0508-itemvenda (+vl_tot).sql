if exists (select * from syscolumns where id=object_id('itemvenda') and name='vl_tot')
  return

alter table itemvenda
add vl_tot AS cast(nu_quantidade * vl_preco as money)
go
----------------------------------------
if exists (select * from syscolumns where id=object_id('itemvendageral') and name='vl_tot')
  return

alter table itemvendageral
add vl_tot AS cast(nu_quantidade * vl_preco as money)
go
----------------------------------------
if exists (select * from syscolumns where id=object_id('itemvenda') and name='hr_lanc')
  return

alter table itemvenda
add hr_lanc AS cast(dt_lanc as time)
go
----------------------------------------
if exists (select * from syscolumns where id=object_id('itemvendageral') and name='hr_lanc')
  return

alter table itemvendageral
add hr_lanc AS cast(dt_lanc as time)

go
