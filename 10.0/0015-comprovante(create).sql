if dbo.fn_existe('dbo.comprovante') = 1
  return

create table dbo.comprovante (
  id int not null identity,
  operacao_id uniqueidentifier not null,
  consumidor varchar(30) null,
  numero varchar(20) null,
  chave varchar(150) null,
  [status] varchar(20) null,
  ressalva varchar(250) null,
  constraint [pk_comprovante] primary key clustered (id) on [primary]
) on [primary]

alter table dbo.comprovante  with check add foreign key([operacao_id])
references [dbo].[operacao] ([operacao_id])
go

if dbo.fn_existe('dbo.operacao.comprovante') = 1
  exec('
	insert into comprovante
	select 
		o.operacao_id, 
		consumidor = c.string_value, 
		comprovante, 
		comprovante_chave, 
		comprovante_status, 
		comprovante_ressalva
	from operacao o 
	left join operacao_venda ov on o.operacao_id = ov.operacao_id
	cross apply dbo.fn_parse_json(isnull(case when consumidor = '' then null else consumidor end,''{"cpf":"(nao informado)"}'')) c
	where c.name = ''cpf''
')
go

-- Geral
if dbo.fn_existe('dbo.comprovante_geral') = 1
  return

create table dbo.comprovante_geral (
  id int not null identity,
  operacao_id uniqueidentifier not null,
  consumidor varchar(30) null,
  numero varchar(20) null,
  chave varchar(150) null,
  [status] varchar(20) null,
  ressalva varchar(250) null,
  constraint [pk_comprovante_geral] primary key clustered (id) on [primary]
) on [primary]

alter table dbo.comprovante_geral with check add foreign key([operacao_id])
references [dbo].[operacao_geral] ([operacao_id])

if dbo.fn_existe('dbo.operacao.comprovante_geral') = 1
exec('
	insert into comprovante_geral
	select 
	  o.operacao_id, 
	  consumidor = c.string_value, 
	  comprovante, 
	  comprovante_chave, 
	  comprovante_status, 
	  comprovante_ressalva
	from operacao_geral o 
	left join operacao_venda_geral ov on o.operacao_id = ov.operacao_id
	cross apply dbo.fn_parse_json(isnull(case when consumidor = '' then null else consumidor end,''{"cpf":"(nao informado)"}'')) c
	where c.name = ''cpf''
')
go
