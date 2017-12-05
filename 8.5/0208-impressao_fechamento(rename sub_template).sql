if object_id('sub_template') is not null
  exec sp_rename 'sub_template', 'impressao_fechamento'
go

if exists(
  select * 
  from syscolumns
  where name = 'tipo'
    and id = object_id('impressao_fechamento')
) return

alter table dbo.impressao_fechamento 
add tipo varchar(10) null
go

if exists (
  select * 
  from syscolumns
  where name = 'rel_id'
    and id = object_id('impressao_fechamento')
)
begin
  execute ('update impressao_fechamento set tipo = ''caixa'' where rel_id = 15')
  execute ('update impressao_fechamento set tipo = ''periodo'' where rel_id = 16')

  alter table dbo.impressao_fechamento
  drop column rel_id

  alter table dbo.impressao_fechamento 
  alter column tipo varchar(10) not null
end
go

if object_id('pk_impressao_fechamento') is null 
  alter table dbo.impressao_fechamento 
  add constraint pk_impressao_fechamento primary key (tipo, ordem, nome)
go
