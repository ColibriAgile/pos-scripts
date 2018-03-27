-- Geral
if dbo.fn_existe('dbo.comprovante_geral') = 1
  drop table dbo.comprovante_geral

create table dbo.comprovante_geral 
(
  id int not null,
  operacao_id uniqueidentifier not null,
  consumidor varchar(30) null,
  numero varchar(20) null,
  chave varchar(150) null,
  [status] varchar(20) null,
  ressalva varchar(250) null,
  constraint [pk_comprovante_geral] primary key clustered (id) on [primary]
) on [primary]

alter table dbo.comprovante_geral 
with check add foreign key
([operacao_id])
references [dbo].[operacao_geral] 
([operacao_id])

if dbo.fn_existe('dbo.operacao_geral.comprovante') = 1
  exec('
insert into comprovante_geral
select 
  id = (ROW_NUMBER() OVER(ORDER BY o.operacao_id ASC) * -1),
  o.operacao_id, 
	consumidor = isnull(nullif(c.string_value, ''''),''(nao informado)''), 
	comprovante, 
	comprovante_chave, 
	comprovante_status, 
	comprovante_ressalva
from operacao_geral o 
left join operacao_venda_geral ov on o.operacao_id = ov.operacao_id
cross apply dbo.fn_parse_json(isnull(nullif(consumidor, ''''),''{"cpf":"(nao informado)"}'')) c
where c.name = ''cpf''
')
go
