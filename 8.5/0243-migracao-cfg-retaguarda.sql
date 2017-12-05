if exists(select * from sys.schemas where name = 'sync') return
exec('create schema sync')
go

if Object_id('sync.parametro') is not null
  return

create table sync.parametro
(
  id int not null identity(0, 1) primary key,
  tipo  varchar(10) null,
  dados varchar(max) null
)
go

create procedure converte_ftp (@ftp_folder varchar(20), @tabela varchar(30), @where_clause nvarchar(100))
as
begin
  declare 
    @sql_query nvarchar(4000) = '
insert into [sync].[parametro]
(tipo, dados)
select 
  ''ftp'', 
  ''{"host": "'' +  replace(isnull(ftp_host,''''), ''\'', ''\\'') + 
  ''", "port": '' + convert(varchar(5), ftp_port) +
  '', "user": "'' + replace(isnull(ftp_user, ''''), ''\'', ''\\'') +
  ''", "pwd": "'' + replace(isnull(ftp_pwd, ''''), ''\'', ''\\'') +
  ''", "pasv": '' + replace(isnull(ftp_pasv, ''''), ''\'', ''\\'') +
  '', "folder": "'' + replace(isnull('
  + @ftp_folder + ', ''''), ''\'', ''\\'') +
				''"}''
from ' + @tabela + ' 
' + @where_clause;

  execute sp_executesql @sql_query
end
go

declare @lay_layer sysname
if Object_id('transact.lay_layer') is not null
  set @lay_layer  = 'transact.lay_layer'
else if Object_id('dbo.lay_layer') is not null
  set @lay_layer = 'dbo.lay_layer'

if @lay_layer is not null
begin
	declare @sql nvarchar(max) = 'select @modo = edi from ' + @lay_layer + ' where lay_classname = ''Tfrm_layerEsysLoja2Cntl'''
	declare @modo nvarchar(max)

	exec sp_executesql @sql, N'@modo varchar(max) output', @modo output;

	if @modo = 'FTP' 
	begin
	  exec converte_ftp
		'ftp_folder_rec',
		@lay_layer,
		'where lay_classname = ''Tfrm_layerEsysLoja2Cntl'''

	  exec converte_ftp
		'ftp_folder_env',
		@lay_layer,
		'where lay_classname = ''Tfrm_layerEsysLoja2Cntl'''
	end
	else begin
	  set @sql= 
	  'insert into sync.parametro
	    (tipo, dados)
	  select 
		''pasta'',
		''{"caminho": "'' + replace(dir_rec, ''\'', ''\\'') + ''"}''
	  from ' + @lay_layer + 
	  ' where  lay_classname = ''Tfrm_layerEsysLoja2Cntl''';
	  exec sp_executesql @sql

	  set @sql= 
	  'insert into sync.parametro
	    (tipo, dados)
	  select 
		''pasta'',
		''{"caminho": "'' + replace(dir_env, ''\'', ''\\'') + ''"}''
	  from ' + @lay_layer + 
	  ' where  lay_classname = ''Tfrm_layerEsysLoja2Cntl''';
	  exec sp_executesql @sql
	end
end
go

declare @layerftp sysname  = 'transact.layerftp';

if Object_id(@layerftp) is null
  set @layerftp = 'dbo.layerftp'

if object_id(@layerftp) is not null
  exec converte_ftp 'ftp_folder_env', @layerftp, ''
go

drop procedure converte_ftp
go
exec sp_apagar_tabela 'dbo.layerftp';
go
exec sp_apagar_tabela 'transact.layerftp';
go
exec sp_apagar_tabela 'dbo.age_agenda'
go
exec sp_apagar_tabela 'transact.age_agenda'
go
exec sp_apagar_tabela 'dbo.lay_layer';
go 
exec sp_apagar_tabela 'transact.lay_layer';
go 
