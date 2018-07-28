if (object_id('sp_apagar_relacionamentos') is not null)
  drop procedure sp_apagar_relacionamentos
go

create procedure sp_apagar_relacionamentos(@tabela varchar(100) = '', @campo varchar(100) = '', @tabela_referencia bit = 0, @debug bit = 0)
as
begin
  declare 
    @nome varchar(250),
    @pai varchar(250),
    @sql nvarchar(max),
    @schema sysname,
    @schema_id int

  select
    @schema = isnull(parsename(@tabela, 2), 'dbo'),
    @tabela = parsename(@tabela, 1)

  select
    @schema_id = s.schema_id
  from sys.schemas s
  where s.name = @schema

  declare cur_relacionamentos cursor local forward_only read_only for
  select distinct
    nome = o.name,
    tabela = pai.name /*,
    c_nome = c.name */
  from sys.foreign_key_columns f 
  join sys.objects o on f.constraint_object_id = o.object_id
  left join sys.tables ref on ref.[object_id] = f.referenced_object_id
  left join sys.tables pai on pai.[object_id] = f.parent_object_id
  left join sys.foreign_key_columns fc on fc.constraint_object_id = o.[object_id] and fc.referenced_object_id = ref.[object_id]
  left join sys.columns c on c.[object_id] = ref.[object_id] and c.column_id = fc.referenced_column_id
  where ((pai.name = @tabela or (len(@tabela) = 0 and ref.type = 'U')) or (ref.name = @tabela and @tabela_referencia = 1))    
    and (c.name = @campo or len(@campo) = 0)
    and (o.schema_id = @schema_id)

  open cur_relacionamentos
  
  fetch next from cur_relacionamentos 
  into @nome, @pai

  while @@fetch_status = 0 begin
    select @sql = 'alter table '+ quotename(@schema) + '.' + quotename(@pai) + ' drop constraint [' + @nome  +']'
    if @debug = 1
      print @sql
    else
      execute sp_executesql @sql
    
    fetch next from cur_relacionamentos 
    into @nome, @pai
  end
  close cur_relacionamentos
  deallocate cur_relacionamentos
end
go
