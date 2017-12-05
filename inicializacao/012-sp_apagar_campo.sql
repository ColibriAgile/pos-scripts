if (object_id('sp_apagar_campo') is not null)
  drop procedure sp_apagar_campo
go

create procedure sp_apagar_campo(@tabela varchar(100)='', @campo varchar(100) = '')
as
begin
  declare @sql nvarchar(1000)

  if (rtrim(@tabela) = '') or (rtrim(@campo) = '')
    begin
    print 'Sintaxe: sp_apagar_campo @tabela=? @campo=?'
    return
  end

  if (object_id(@tabela) is null)
  begin
    print 'Tabela ' + @tabela + ' não encontrada'
    return
  end

  if not exists (select * from syscolumns where id=object_id(@tabela) and name=@campo)
  begin
    print 'Campo ' + @campo + ' não existe na tabela '+@tabela
    return
  end

  execute sp_apagar_defaults @tabela, @campo
  execute sp_apagar_relacionamentos @tabela, @campo
  execute sp_apagar_checks @tabela, @campo
  execute sp_apagar_indices @tabela, @campo 
  set @sql = 'alter table '+ @tabela + ' drop column [' + @campo  +']'
  --print @sql
  execute sp_executesql @sql
end
