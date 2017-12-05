if object_id('sync.sp_limpar_schema') is not null
  drop procedure sync.sp_limpar_schema
go 

create procedure sync.sp_limpar_schema
as

declare 
  @comando nvarchar(max) = ''
  
while (1 = 1)
begin
  select @comando = 'drop table sync.' + t.name 
  from sys.tables t
  join sys.schemas s on s.schema_id = t.schema_id
  where s.name = 'sync'
    and t.name <> 'parametro'

  if @@rowcount = 0 break;
  
  execute(@comando)
end
   
go
