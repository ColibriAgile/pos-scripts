if (object_id('sp_apagar_tabela') is not null)
  drop procedure sp_apagar_tabela
go

create procedure sp_apagar_tabela (@tabela varchar(200))
as
begin
  declare @sql nvarchar(1000)

  if (object_id(@tabela) is null) begin
    print 'Tabela '+@tabela+' não encontrada.'
    return
  end

  exec sp_apagar_defaults @tabela
  exec sp_apagar_relacionamentos @tabela
  exec sp_apagar_relacionamentos @tabela, '', 1

  select @sql = 'drop table ' + @tabela
  --print @sql
  execute sp_executesql @sql
end
