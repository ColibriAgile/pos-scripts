if dbo.fn_existe('dbo.desconto_estrategia.loja_id') = 0
  alter table [dbo].[desconto_estrategia] 
    add loja_id bigint
go 


if object_id('ri_desconto_estrategia$loja_id__loja$loja_id') is null
  alter table [dbo].[desconto_estrategia] with check 
    add constraint [ri_desconto_estrategia$loja_id__loja$loja_id] foreign key(loja_id) references [dbo].[loja] ([loja_id])
go

update [dbo].[desconto_estrategia] set loja_id =  (select top 1 loja_id from loja)

go

if dbo.fn_existe('dbo.desconto.loja_id') = 0
  alter table [dbo].[desconto] add loja_id bigint
go 


if object_id('ri_desconto$loja_id__loja$loja_id') is null
  alter table [dbo].[desconto] with check 
    add constraint [ri_desconto$loja_id__loja$loja_id] foreign key(loja_id) references [dbo].[loja] ([loja_id])
go

update [dbo].[desconto] set loja_id =  (select top 1 loja_id from loja)

go