if dbo.fn_existe('dbo.local_producao.loja_id') = 0
  alter table [dbo].[local_producao] add loja_id bigint
go 

if object_id('ri_local_producao$loja_id__loja$loja_id') is null
  alter table [dbo].[local_producao] with check 
    add constraint [ri_local_producao$loja_id__loja$loja_id] foreign key(loja_id) references [dbo].[loja] ([loja_id])
go

update [dbo].[local_producao] set loja_id =  (select top 1 loja_id from loja)

go