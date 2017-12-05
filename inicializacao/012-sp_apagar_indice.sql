if (object_id('sp_apagar_indice') is not null)
  drop procedure sp_apagar_indice
go

create procedure sp_apagar_indice(@tabela varchar(100)='', @indice varchar(100) = '')
as
begin
  declare @sql nvarchar(1000)

  if (rtrim(@tabela) = '') or (rtrim(@indice) = '') begin
    print 'Sintaxe: sp_apagar_indice @tabela=?, @indice=?'
    return
  end

  if (object_id(@tabela) is null) begin
    print 'Tabela ' + @tabela + ' não encontrada'
    return
  end

  if not exists (select * from sys.indexes where object_id=object_id(@tabela) and name=@indice) begin
    print 'Indice ' + @indice + ' não existe na tabela '+@tabela
    return
  end

  set @sql = 'drop index ['+ @indice + '] on ' + @tabela

  --print @sql
  execute sp_executesql @sql
end
