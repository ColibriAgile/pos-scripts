if object_id('historicoOperacao') is not null
  return

create table historicooperacao  
(
  dataHora datetime not null,
  maquina_id integer not null,
  func_id integer not null,
  func_id_autoriz integer null,
  operacao_id uniqueidentifier not null,
  venda_id uniqueidentifier null,
  descricao varchar(100) null,
  versao varchar(20) null
)
go

if object_id('historicooperacaogeral') is not null
  return

create table historicooperacaogeral
(
  dataHora datetime not null,
  maquina_id integer not null,
  func_id integer not null,
  func_id_autoriz integer null,
  operacao_id uniqueidentifier not null,
  venda_id uniqueidentifier null,
  descricao varchar(100) null,
  versao varchar(20) null
)


