if (object_id('sp_padronizar_primary_keys') is not null)
  drop procedure sp_padronizar_primary_keys
go

create procedure sp_padronizar_primary_keys(@tabela varchar(100) = '', @debug bit = 0)
as
begin
  declare 
    @esquema varchar(100),
    @tabela_atual varchar(100),
    @nome_pk varchar(100),
    @sql nvarchar(1000)

  declare cur_defaults cursor for
  select
	s.name,
    tabela = t.name,
    indice = i.name
  from sys.columns c
  join sys.tables t on c.object_id = t.object_id
  join sys.schemas s on s.schema_id = t.schema_id
  join sys.index_columns ic on c.column_id = ic.index_column_id and c.object_id = ic.object_id 
  join sys.indexes i on i.index_id = ic.index_id and i.object_id = ic.object_id
  where i.is_primary_key = 1
    and (t.name = @tabela or (len(@tabela) = 0 and t.type = 'U'))
  group by s.name, i.name, t.name
  order by s.name, i.name

    
  open cur_defaults

  fetch next from cur_defaults 
  into
    @esquema,
    @tabela_atual,
    @nome_pk

  while @@fetch_status = 0 begin

    if @nome_pk <> 'pk_' + @tabela_atual
	begin  
		select @sql = 'exec sp_rename ''['+@esquema+'].['+@nome_pk+']'', ''pk_'+ @tabela_atual+''''
		if @debug = 1
		  print @sql
		else
		  execute sp_executesql @sql
    end

    fetch next from cur_defaults 
    into
      @esquema,
      @tabela_atual,
      @nome_pk
  end

  close cur_defaults
  deallocate cur_defaults
end
