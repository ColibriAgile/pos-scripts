declare 
  @sqlcode varchar(2048),
  @tabela varchar(50),
  @campo varchar(50)


declare mycursor cursor local for
  select 'alter table [' + sys.schemas.name + '].[' + sys.objects.name + '] alter column ['+ sys.columns.name + '] ' +  
    case sys.types.name
      when 'ident' then ' int '      
      when 'bool' then ' bit '
      when 'boolean' then ' bit '
      when 'inteiro' then ' int '      
      when 'inteiro_small' then ' smallint '      
      when 'inteiro_tiny' then ' tinyint '      
      when 'imagem' then ' image '
      when 'valor' then ' float '
      when 'moeda' then ' numeric(15,2) '
      when 'porcento' then ' numeric(10,5) '
      when 'quantidade' then ' numeric(15,4) '
      when 'dinheiro' then ' money '
      when 'data' then ' date '
      when 'data_hora' then ' datetime '      
      when 'hora' then ' datetime '      
      when 'texto' then ' varchar(max) '      
      when 'observacao' then ' varchar(max) '
      when 'sim_nao' then ' char(1) '      
      when 'caracter' then ' char(1) '
      else 'varchar(' + rtrim(
        case
          when sys.columns.max_length = -1 then 'max'
          when sys.columns.max_length > 4000 then 'max'
          else convert(char,sys.columns.max_length)
        end) + ')' 
    end
    + case sys.columns.is_nullable when 0 then ' not null' else ' null' end,
    sys.objects.name,
    sys.columns.name
    from sys.columns , sys.objects , sys.types, sys.schemas
    where sys.columns.object_id = sys.objects.object_id
      and sys.objects.type = 'u'
      and sys.types.is_user_defined = 1
      and sys.types.user_type_id = sys.columns.user_type_id
      and sys.objects.schema_id = sys.schemas.schema_id
      and not ( sys.objects.name like 'sys%' )
      and not ( sys.types.name like 'sys%' )

open mycursor
fetch next from mycursor into @sqlcode, @tabela, @campo

while @@fetch_status = 0 begin
  print 'executing: ' + @sqlcode
  begin try
    exec(@sqlcode);
    print 'done!' + char(10)
  end try
  begin catch
    begin try
       execute dbo.sp_apagar_defaults @tabela, @campo
       exec(@sqlcode);
       print 'done!' + char(10)      
    end try
    begin catch
      print 'error: ' + error_message() + char(10)
    end catch
  end catch
  fetch next from mycursor into @sqlcode, @tabela, @campo
end

print 'finished!'
-- **************** END LOGIC **********************