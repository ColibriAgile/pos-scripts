declare
  @ver varchar(50),
  @banco varchar(50),
  @aux varchar(max)

set @ver = cast(serverproperty('ProductVersion') as varchar(50))
set @ver = substring(@ver, 1, CharIndex('.', @ver) -1)
set @banco = '[' + db_name() + ']'

if @ver < 10 begin
  set @aux = 'Esta versão do SQL Server não é suportada pelo NCR Colibri 8: 
' + @@version
  raiserror (@aux, 50001, 1)
end 
else begin
  set @aux = replace('alter database {banco} set compatibility_level = 100', '{banco}', @banco)
  if (select @@trancount) > 0 commit
  exec(@aux)
  if (select @@trancount) = 0 begin transaction
end