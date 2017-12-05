if exists(
  select * 
  from syscolumns 
  where name = 'codigo_pai' 
    and id = object_id('ticket')
) return 

alter table dbo.ticket
add codigo_pai int null
go

exec('
declare @t table (cod varchar(20), id uniqueidentifier)

insert @t ( cod, id )
select codigo, ticket_id 
from dbo.ticket
where estado = ''dividido''


update dbo.ticket
set codigo_pai = cod
from @t
where ticket_pai_id = id
')