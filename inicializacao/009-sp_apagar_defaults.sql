if (object_id('sp_apagar_defaults') is not null)
  drop procedure sp_apagar_defaults
go

create procedure sp_apagar_defaults(@tabela varchar(100) = '', @campo varchar(100) = '')
as
begin
  declare @nome varchar(100)
  declare @pai varchar(100)
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
    nome = n.name,
    tabela = o.name
  from sys.columns c
  inner join sys.objects o on c.object_id = o.object_id
  inner join sys.default_constraints n on n.parent_object_id = o.object_id and c.column_id = n.parent_column_id
  where (o.name = @tabela or (len(@tabela) = 0 and o.type = 'U'))
    and (c.name = @campo or len(@campo) = 0)
    and (o.schema_id = @schema_id)
    and (n.schema_id = @schema_id)
  order by o.type

  open cur_defaults
    fetch next from cur_defaults 
    into @nome, @pai

    while @@fetch_status = 0 begin
      select @sql = 'alter table '+ quotename(@schema) + '.' + quotename(@pai) + ' drop constraint [' + @nome  +']'
      --print @sql
      execute sp_executesql @sql

      fetch next from cur_defaults 
      into @nome, @pai
    end
  close cur_defaults
  deallocate cur_defaults

end
