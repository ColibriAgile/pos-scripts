if exists (
  select * 
  from syscolumns 
  where name = 'versao'
  and id = object_id('movimentocaixa')
) return 

alter table dbo.movimentocaixa
add versao varchar(20) null

alter table dbo.movimentocaixageral
add versao varchar(20) null

alter table dbo.prepagamento
add versao varchar(20) null