if not exists(select * from sys.schemas where name = 'launcher')
  return

if not exists(select * from sys.databases where name = 'colibri-master')
  return;

if not exists(select * from [colibri-master].sys.schemas where name = 'launcher')
  return

declare 
  @campos varchar(max)

if (object_id('launcher.layout') is not null) 
begin
  delete [colibri-master].launcher.layout

  select @campos = dbo.fn_listar_colunas('launcher.layout', '')
  exec (
'
insert [colibri-master].launcher.layout (' + @campos + ')
select ' + @campos + ' from launcher.layout
'
  )
  exec sp_apagar_tabela 'launcher.layout'
end

if (object_id('launcher.suporte') is not null) 
begin
  delete [colibri-master].launcher.suporte

  exec (
'
set identity_insert [colibri-master].launcher.suporte on

insert [colibri-master].launcher.suporte
(id,  nome, texto)
select id,  nome, texto from launcher.suporte

set identity_insert [colibri-master].launcher.suporte off
'
  )  

  exec sp_apagar_tabela 'launcher.suporte'
end
go
