if not exists(
  select * from syscolumns
  where name = 'comprovante_ressalva'
    and id = object_id('operacao')
) return


alter table dbo.operacao
alter column comprovante_ressalva varchar(250) null
go

if not exists(
  select * from syscolumns
  where name = 'comprovante_ressalva'
    and id = object_id('operacaogeral')
) return


alter table dbo.operacaogeral
alter column comprovante_ressalva varchar(250) null
go
