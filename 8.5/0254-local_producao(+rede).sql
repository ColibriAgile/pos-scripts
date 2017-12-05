if dbo.fn_existe('dbo.local_producao.rede_id') = 0
  alter table [dbo].[local_producao] add rede_id bigint
go 

if dbo.fn_existe('dbo.local_producao.sub_rede_id') = 0
  alter table [dbo].[local_producao] add sub_rede_id bigint
go 

update [dbo].[local_producao] set rede_id =  (select top 1 rede_id from rede)

go