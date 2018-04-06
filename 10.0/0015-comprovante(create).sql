if dbo.fn_existe('dbo.comprovante') = 1
  return

create table dbo.comprovante 
(
  id int not null identity,
  operacao_id uniqueidentifier not null,
  consumidor varchar(30) null,
  numero varchar(20) null,
  chave varchar(150) null,
  [status] varchar(20) null,
  ressalva varchar(250) null,
  constraint [pk_comprovante] primary key clustered (id) on [primary]
) on [primary]

alter table dbo.comprovante 
with check add foreign key
([operacao_id])
references [dbo].[operacao] 
([operacao_id])

go

if dbo.fn_existe('dbo.operacao.comprovante') = 1
  exec('
insert into comprovante
select 
	o.operacao_id, 
	consumidor = isnull(nullif(c.string_value, ''''),''(nao informado)''), 
	comprovante, 
	comprovante_chave, 
	comprovante_status, 
	comprovante_ressalva
from operacao o 
left join operacao_venda ov on o.operacao_id = ov.operacao_id
cross apply dbo.fn_parse_json(isnull(nullif(consumidor, ''''),''{"cpf":"(nao informado)"}'')) c
where c.name = ''cpf''
  and isnull(comprovante_status,'''') <> ''''
')
go

