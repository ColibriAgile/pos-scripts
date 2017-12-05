alter table itemvenda
  drop column vl_tot

alter table itemvenda
  add vl_tot as (convert(money, (nu_quantidade * vl_preco) + arredondamento, 0))
go

alter table itemvendageral
  drop column vl_tot

alter table itemvendageral
  add vl_tot as (convert(money, (nu_quantidade * vl_preco) + arredondamento, 0))
go