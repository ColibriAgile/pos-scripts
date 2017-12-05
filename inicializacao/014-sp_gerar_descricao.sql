if (object_id('sp_gerar_descricao') is not null)
  drop procedure sp_gerar_descricao
go

create procedure sp_gerar_descricao (@objeto nvarchar(100) = '', @schema sysname = 'dbo')
as
begin
  declare
    @nome nvarchar(100),
    @tipo nvarchar(5),
    @texto nvarchar(1000)

--cursor para percorrer schemas
  declare cur_schemas cursor for
    select 
      cmd = 'exec sp_descricao_schema '''+s.name+''', ''' +isnull(cast(p.value as varchar(1000)), '---')+''''
    from sys.schemas s
    left join sys.extended_properties p on
      p.class_desc = 'SCHEMA' and
      p.major_id = s.schema_id
    where s.principal_id = 1
      and s.name = @schema

  print ''
  print '/**********************************************'
  print ' *** Schema ' + @schema
  print ' **********************************************/'
  open cur_schemas
  fetch next from cur_schemas
  into @texto

  while @@fetch_status = 0 begin
    print @texto

    fetch next from cur_schemas
    into @texto
  end
  close cur_schemas
  deallocate cur_schemas

--cursor para percorrer tabelas e views
  declare cur_objetos cursor for
    select o.name, o.type
    from sys.objects o
    where (o.name = @objeto or (len(@objeto) = 0 and o.type in ('U','V')))
      and (@schema = '' or o.schema_id = schema_id(@schema))
    order by 
      o.type, 
      o.name

--Navega o cursor imprimindo o comando
  open cur_objetos

  fetch next from cur_objetos 
  into @nome, @tipo

  while @@fetch_status = 0 begin
    print ''
    print '/**********************************************'
    print ' *** ' +case @tipo when 'U' then 'tabela ' when 'V' then 'view ' end + @nome
    print ' **********************************************/'

    select @texto =           
      'exec sp_descricao_tabela ''' +                              -- procedure
      @nome + ''', ''' +                                           -- nome da tabela
      cast(isnull(tp.value, '---') as nvarchar(1000)) + ''', ''' +  -- descrição da tabela
      @schema + ''''
    from sys.objects t
    left join sys.extended_properties tp on
      tp.major_id = t.object_id and
      tp.minor_id = 0
    where t.object_id = object_id(quoteName(@schema)+'.'+quoteName(@nome))
    print @texto

  --Cria o cursor para percorrer as colunas do objeto
    declare cur_coldescricoes cursor for
    select texto = 
      'exec sp_descricao_campo  ''' +                     -- procedure
      @nome + ''', ''' +                                  -- nome da tabela
      cast(c.name as nvarchar(100)) + ''', ''' +          -- nome do campo
      cast(
        case 
          when cp.value is null then '---'                   -- descrição do campo
          when cp.value = '' then '---'
          else cp.value
        end as nvarchar(1000)
      ) + ''', ''' +
      @schema + ''''
    from syscolumns c
    left join sys.extended_properties cp on
      c.id = cp.major_id and
      c.colid = cp.minor_id
    where cp.major_id = object_id(quoteName(@schema)+'.'+quoteName(@nome))
       or c.id = object_id(quoteName(@schema)+'.'+quoteName(@nome))
    order by c.name

  --Navega o cursor de colunas imprimindo o comando
    open cur_coldescricoes
    fetch next from cur_coldescricoes into @texto
    while @@fetch_status = 0 begin
      print @texto
      fetch next from cur_coldescricoes into @texto
    end
    close cur_coldescricoes
    deallocate cur_coldescricoes
    print 'go'
    
    fetch next from cur_objetos 
    into @nome, @tipo
  end

  close cur_objetos
  deallocate cur_objetos
end
go
