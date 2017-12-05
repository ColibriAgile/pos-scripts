if exists( 
  select * 
  from syscolumns 
  where name='comprovante' 
    and id=object_id('operacao')
) return

alter table dbo.operacao add 
  comprovante varchar(20) null,
  comprovante_chave varchar(150) null,
  comprovante_status varchar(20) null

go

if exists( 
  select * 
  from syscolumns 
  where name='comprovante' 
    and id=object_id('operacaogeral')
) return

alter table dbo.operacaogeral add 
  comprovante varchar(20) null,
  comprovante_chave varchar(150) null,
  comprovante_status varchar(20) null

