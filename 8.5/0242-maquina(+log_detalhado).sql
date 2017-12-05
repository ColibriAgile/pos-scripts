if exists(
  select *
  from syscolumns
  where name = 'log_detalhado'
    and id = object_id('[dbo].[maquina]')
) return

alter table [dbo].[maquina]
add log_detalhado bit null default 0
go

update dbo.maquina 
set log_detalhado = 0
where log_detalhado is null
go