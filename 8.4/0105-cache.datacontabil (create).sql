if not exists(select * from sys.schemas where name = 'cache')
exec('create schema cache')
go

if object_id('cache.datacontabil') is not null return

create table cache.datacontabil (
  valor date null
)
go

declare @dtcontabil datetime

select @dtcontabil = dt_contabil 
from headerfechamento
where dt_fechamento is null

update cache.datacontabil
set valor = @dtcontabil

if @@ROWCOUNT = 0
  insert cache.datacontabil (valor) values (@dtcontabil)

go
