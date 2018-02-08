if dbo.fn_existe('dbo.layout_touch.loja_id')=0
  alter table dbo.layout_touch add loja_id bigint
go

if dbo.fn_existe('dbo.layout_touch.sub_rede_id')=0
  alter table dbo.layout_touch add sub_rede_id bigint
go

update dbo.layout_touch set loja_id = (select top 1 loja_id from loja)

go