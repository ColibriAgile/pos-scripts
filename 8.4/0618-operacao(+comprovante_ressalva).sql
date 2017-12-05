if exists(
  select * from syscolumns
  where name = 'comprovante_ressalva'
    and id = object_id('operacao')
) return


alter table dbo.operacao
add comprovante_ressalva varchar(250) null
go

if exists(
  select * from syscolumns
  where name = 'comprovante_ressalva'
    and id = object_id('operacaogeral')
) return


alter table dbo.operacaogeral
add comprovante_ressalva varchar(250) null

