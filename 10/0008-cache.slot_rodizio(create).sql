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
  primary key clustered
  (
    venda_id, indice, slot_indice
  ) with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) 
) 
go