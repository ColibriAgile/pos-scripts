if object_id('desconto_estrategia') is not null
return  

create table desconto_estrategia 
(
  desconto_estrategia_id int identity(1,1) not null,
  descricao varchar(100) not null,
  aceita_desconto bit not null constraint df_desconto_estrategia$aceita_desconto default 1,
  ativo bit not null constraint df_desconto_estrategia$ativo default 1,
  dt_alt datetime not null constraint df_desconto_estrategia$dt_alt default getdate(),
  constraint pk_desconto_estrategia primary key clustered 
  (
	  desconto_estrategia_id asc
  ) on [primary]
) on [primary]    

create table desconto_estrategia_item 
(
  desconto_estrategia_id int not null 
    constraint ri_desc_estr_item foreign key references desconto_estrategia(desconto_estrategia_id),
  desconto_estrategia_item_id int identity(1,1) not null,
  tipo varchar(10) not null,
  item_id int not null,  
  dt_alt datetime not null constraint df_desconto_estrategia_item$dt_alt default getdate(),
) on [primary]

alter table desconto_estrategia_item
add constraint pk_desconto_estrategia_item primary key
(
  desconto_estrategia_item_id asc
)

alter table desconto_estrategia_item
add constraint descestitem_ix_id$tipo$item_id unique
(
  desconto_estrategia_id,
  tipo,
  item_id  
)

go