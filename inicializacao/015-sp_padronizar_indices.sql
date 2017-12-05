if (object_id('sp_padronizar_indices') is not null)
  drop procedure sp_padronizar_indices
go

create procedure sp_padronizar_indices(@tabela varchar(100) = '', @debug bit = 0)
as
begin
  declare 
    @esquema varchar(100),
    @tabela_atual varchar(100),
    @nome_indice varchar(150),
    @sql nvarchar(1000),
	@columns varchar(200)

  declare cur_indexes cursor for
  select
	s.name,
    tabela = t.name,
    indice = i.name
  from sys.columns c
  join sys.tables t on c.object_id = t.object_id
  join sys.schemas s on s.schema_id = t.schema_id
  join sys.index_columns ic on c.column_id = ic.index_column_id and c.object_id = ic.object_id 
  join sys.indexes i on i.index_id = ic.index_id and i.object_id = ic.object_id
  where i.is_primary_key = 0
    and (t.name = @tabela or (len(@tabela) = 0 and t.type = 'U'))
  group by s.name, i.name, t.name
  order by s.name, i.name

    
  open cur_indexes

  fetch next from cur_indexes 
  into
    @esquema,
    @tabela_atual,
    @nome_indice

  while @@fetch_status = 0 begin
      
	set @columns = dbo.fn_obter_colunas_do_indice(@nome_indice)
  
    if @nome_indice <> 'ix_' + @tabela_atual + @columns
	begin  
		select @sql = 'exec dbo.sp_renomear ''['+@esquema+'].['+@tabela_atual+'].['+@nome_indice+']'', ''ix_'+ @tabela_atual+@columns + ''', ''index'''
		if @debug = 1
		  print @sql
		else
        begin try
		  execute sp_executesql @sql
        end try
        begin catch
          if @@ERROR = 15335
          begin
            exec dbo.sp_apagar_constraint @nome_indice
            print 'contraint '+ @nome_indice + ' apagada pois estava duplicada'
          end
          else print error_message()
        end catch
    end

    fetch next from cur_indexes 
    into
      @esquema,
      @tabela_atual,
      @nome_indice
  end

  close cur_indexes
  deallocate cur_indexes
end
