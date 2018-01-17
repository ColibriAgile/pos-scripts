if object_id('cache.slot_rodizio') is not null
  return

create table cache.slot_rodizio
(
  venda_id uniqueidentifier not null,
  indice int not null,
  slot_indice int not null,
  minimo int null,
  maximo int null,
  classe_id int null,
  material_id int null,
  descricao varchar(30) not null,
  constraint pk_slot_rodizio primary key clustered (venda_id, indice, slot_indice) on [PRIMARY]
) 
go