if dbo.fn_existe('dbo.desconto.loja_id')=0
  alter table dbo.desconto add loja_id bigint 
go

