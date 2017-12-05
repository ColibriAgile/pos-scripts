if (object_id('sp_padronizar_defaults') is not null)
  drop procedure sp_padronizar_defaults
go

create procedure sp_padronizar_defaults(@tabela varchar(100) = '', @campo varchar(100) = '', @debug bit = 0)
as
begin
  declare 
    @esquema varchar(100),
    @tabela_atual varchar(100),
    @coluna_atual varchar(100),
    @nome_default varchar(100),
    @sql nvarchar(1000)

  declare cur_defaults cursor for
  select
    esquema = s.name,
    tabela = t.name,
    coluna = c.name,
    nome_default = df.name
  from sys.columns c
  join sys.tables t on t.object_id = c.object_id
  join sys.schemas as s on s.schema_id = t.schema_id
  join sys.default_constraints df on df.object_id = c.default_object_id
  where (t.name = @tabela or (len(@tabela) = 0 and t.type = 'U'))
    and (c.name = @campo or len(@campo) = 0)
    
  open cur_defaults

  fetch next from cur_defaults 
  into
    @esquema,
    @tabela_atual,
    @coluna_atual,
    @nome_default

  while @@fetch_status = 0 begin

    if 'df_'+@tabela_atual+'$'+@coluna_atual <> @nome_default
	begin
      select @sql = 'exec sp_rename ''['+@esquema+'].['+@nome_default+']'', ''df_'+@tabela_atual+'$'+@coluna_atual+''''
	  if @debug = 1
        print @sql
      else
        execute sp_executesql @sql
    end

    fetch next from cur_defaults 
    into
      @esquema,
      @tabela_atual,
      @coluna_atual,
      @nome_default
  end

  close cur_defaults
  deallocate cur_defaults
end
