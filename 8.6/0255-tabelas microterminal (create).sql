if exists(select * from sys.schemas where name = 'mt') 
  return

exec('create schema mt')
go

if object_id('mt.terminal') is not null
  return

create table mt.terminal
(
  id int identity(1,1) not null,
  modelo varchar(20) not null,
  modo_venda varchar(3) not null,
  numero int not null,
  ip varchar(15) not null, 
  usa_balanca bit not null,
  auto_lancar varchar(20) null,
  teclas_funcao varchar(5) null,
  perfil_impressao_mesa_id int null,
  perfil_impressao_ficha_id int null,
  ponto_venda_id int null
  primary key clustered
  (
    id asc
  ) with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) 
) 
go

if object_id('mt.tecla_material') is not null
  return

create table mt.tecla_material
(
  id int identity (1,1) not null,
  terminal_id int not null,
  tecla char(1) not null,
  material varchar(20) not null
  primary key clustered 
  (
    id asc
  ) with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on)
) 
go

exec dbo.sp_apagar_relacionamentos @tabela = 'mt.tecla_material'
go

alter table mt.tecla_material with check 
add foreign key
(
  terminal_id
)
references mt.terminal 
(
  id
)
on delete cascade
on update cascade

if not exists(
  select * 
  from sys.indexes 
  where name='ix_tecla_material$terminal_id$tecla'
    and object_id = object_id('mt.tecla_material')
)
  alter table mt.tecla_material 
    add constraint ix_tecla_material$terminal_id$tecla
    unique 
    (
      terminal_id, 
      tecla
    ) 
go

