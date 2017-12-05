if object_id('dbo.script') is null

create table dbo.script
(
  versao varchar(10) not null,
  script varchar(100) not null,
  dt_exec datetime not null default getdate(),
  constraint script_pk primary key clustered
  (
    versao asc,
    script asc
  ) on [PRIMARY]
)
go

if (object_id('dbo.script') is not null) and (object_id('dbo.scr_scripts') is not null)
  exec('
 insert dbo.script (versao, script)
 select cvs_versao, scr_script
 from dbo.scr_scripts
 where scr_script not in (select script from script)'
 )
go

