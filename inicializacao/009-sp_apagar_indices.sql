if (object_id('dbo.sp_apagar_indices') is not null)
  drop procedure dbo.sp_apagar_indices
go

create procedure dbo.sp_apagar_indices(@tabela varchar(100) = '', @campo varchar(100) = '')
as
begin
  declare @nome varchar(100)  
  declare @sql nvarchar(1000)
  declare @schema sysname
  declare @schema_id int

  select
    @schema = isnull(parsename(@tabela, 2), 'dbo'),
    @tabela = parsename(@tabela, 1)

  select
    @schema_id = s.schema_id
  from sys.schemas s
  where s.name = @schema

  declare cur_defaults cursor for
  select      
     indexname = ind.name 
  from sys.indexes ind 
  join sys.index_columns ic on  ind.object_id = ic.object_id and ind.index_id = ic.index_id 
  join sys.columns col on ic.object_id = col.object_id and ic.column_id = col.column_id 
  where ind.is_primary_key = 0 
    and col.name = @campo
    and col.object_id = object_id(@tabela)

  open cur_defaults
    fetch next from cur_defaults 
    into @nome

    while @@fetch_status = 0 begin
      select @sql = 'drop index [' + @nome  +'] on  '+ quotename(@schema) + '.' + quotename(@tabela)
      --print @sql
      execute sp_executesql @sql
    
      fetch next from cur_defaults 
      into @nome
    end
  close cur_defaults
  deallocate cur_defaults

end
