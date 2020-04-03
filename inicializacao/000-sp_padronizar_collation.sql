if (object_id('sp_padronizar_collation') is not null)
  drop procedure sp_padronizar_collation
go

create procedure sp_padronizar_collation (@nome_com_schema varchar(200))
as
begin
	
  declare @tbl table
	(
	  coluna nvarchar(200) not null,
	  tipo nvarchar(100) not null,
	  tam int not null,
	  nulo bit not null
	)
	
	declare
	  @tabela varchar(100) = parsename(@nome_com_schema, 1),
	  @schema varchar(100) = parsename(@nome_com_schema, 2),
	  @collation varchar(100) = convert(varchar(100), databasepropertyex(db_name(), 'Collation'))
	
	if (@schema is null)
	  set @schema = 'dbo'
	
	set @tabela = quotename(@schema) + '.' + quotename(@tabela)
	
	insert into @tbl
	(
	  coluna,
	  tipo,
	  tam,
	  nulo
	)
	select 
	  name,
	  system_type,
	  length,
	  is_null
	from dbo.fn_columns(@nome_com_schema) 
	where collation_name <> @collation
	
	declare 
	  @cmd nvarchar(500),
	  @coluna nvarchar(200), 
	  @tipo nvarchar(100), 
	  @tam int,
	  @nulo bit
	  
	declare cur cursor local fast_forward read_only for 
	select 
	  coluna,
	  tipo,
	  tam,
	  nulo
	from @tbl 
	    
	open cur
	fetch next from cur
	into @coluna, @tipo, @tam, @nulo
	   
	while @@fetch_status = 0
	begin
	
	  select @cmd =  
	    ' alter table '+ @tabela + 
	    ' alter column ['+ @coluna +
	    '] ' + @tipo +
	    '(' + cast(@tam as varchar(3)) + ') collate database_default '+
	    case @nulo
	      when 0 then 'not null'
	      else 'null'
	    end
	
	  print @cmd
	  exec sp_executesql @stmt=@cmd
	
	  fetch next from cur
	  into @coluna, @tipo, @tam, @nulo
	end
	close cur
	deallocate cur

end

