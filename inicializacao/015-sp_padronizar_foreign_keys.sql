if (object_id('sp_padronizar_foreign_keys') is not null)
  drop procedure sp_padronizar_foreign_keys
go

create procedure sp_padronizar_foreign_keys(@tabela varchar(100) = '', @debug bit = 0)
as
begin
  declare 
    @esquema varchar(100),
    @tabela1 varchar(100),
    @tabela2 varchar(100),
    @coluna1 varchar(100),
    @coluna2 varchar(100),
    @nome_fk varchar(150),
    @nome_fk_padrao varchar(150),
    @sql nvarchar(1000),
	@columns varchar(200)

  declare cur_fk cursor for
  select fo.name, ps.name, pt.name,  pc.name, rt.name, rc.name
  from sys.foreign_key_columns fkc
  join sys.objects fo on fkc.constraint_object_id = fo.object_id
  join sys.tables pt on fkc.parent_object_id = pt.object_id
  join sys.columns pc on fkc.parent_column_id = pc.column_id and fkc.parent_object_id = pc.object_id
  join sys.schemas ps on ps.schema_id = pt.schema_id
  join sys.tables rt on fkc.referenced_object_id = rt.object_id
  join sys.schemas rs on rs.schema_id = rt.schema_id
  join sys.columns rc on fkc.referenced_column_id = rc.column_id and fkc.referenced_object_id = rc.object_id
  where (pt.name = @tabela) or (rt.name = @tabela) or (@tabela = '')
  group by fo.name, ps.name, pt.name, rt.name, pc.name, rc.name
      
  open cur_fk

  fetch next from cur_fk 
  into
    @nome_fk,
    @esquema,
    @tabela1,
    @coluna1,
    @tabela2,
    @coluna2

  while @@fetch_status = 0 begin
    	
    set @nome_fk_padrao = 'ri_' + @tabela1 + '$'+@coluna1+ '__' + @tabela2 + '$' + @coluna2
    if @nome_fk <> @nome_fk_padrao
	begin  
		select @sql = 'exec dbo.sp_renomear ''['+@esquema+'].['+@nome_fk+']'', '''+@nome_fk_padrao+''''
		if @debug = 1
		  print @sql
		else
        begin try
		  execute sp_executesql @sql
        end try
        begin catch
          if @@ERROR = 15335
          begin
            exec dbo.sp_apagar_constraint @nome_fk
            print 'contraint '+ @nome_fk + ' apagada pois estava duplicada'
          end
          else print error_message()
        end catch 
    end

    fetch next from cur_fk 
    into
        @nome_fk,
        @esquema,
        @tabela1,
        @coluna1,
        @tabela2,
        @coluna2
  end

  close cur_fk
  deallocate cur_fk
end
