-- insert na tabela de controle do django -- 
if not exists(select * from dbo.django_content_type where model = 'descontoestrategia')
begin
  insert into dbo.django_content_type
  (app_label, model) values 
  ('desconto', 'descontoestrategia'),
  ('desconto', 'descontoestrategiaitem')
end
go

-- altera desconto estrategia --
if dbo.fn_existe('dbo.desconto_estrategia.ativo') = 0
begin
  alter table dbo.desconto_estrategia 
  add ativo bit null

  alter table dbo.desconto_estrategia 
  add constraint df_ativo default 1 for ativo

  exec('update dbo.desconto_estrategia set ativo = 1')

  alter table dbo.desconto_estrategia 
  alter column ativo bit not null
end
go

exec sp_renomear 'dbo.desconto_estrategia.desconto_estrategia_id', 'id', 'column'
go

-- altera desconto estrategia item -- 
exec dbo.sp_renomear 'dbo.desconto_estrategia_item.desconto_estrategia_item_id', 'id', 'column'
go

if dbo.fn_existe('dbo.desconto_estrategia_item.tipo_item_id') = 0
begin
  alter table dbo.desconto_estrategia_item 
  add tipo_item_id int

  exec('
update dbo.desconto_estrategia_item 
set tipo_item_id = (select id from dbo.django_content_type where model = ''material'')
where tipo = ''material''
')

  exec('
update dbo.desconto_estrategia_item 
set tipo_item_id = (select id from dbo.django_content_type where model = ''grupomaterial'')
where tipo = ''grupo''
')

  exec('
update dbo.desconto_estrategia_item 
set tipo_item_id = (select id from dbo.django_content_type where model = ''combo'')
where tipo = ''combo''
')

  alter table dbo.desconto_estrategia_item 
  alter column tipo_item_id int not null
end
go

if dbo.fn_existe('dbo.desconto_estrategia_item.tipo') = 1
begin

  if object_id('descestitem_ix_id$tipo$item_id') is not null
    alter table dbo.desconto_estrategia_item 
    drop constraint descestitem_ix_id$tipo$item_id
 
  if object_id('ix_desconto_estrategia_item$desconto_estrategia_id$tipo$item_id') is not null
    alter table dbo.desconto_estrategia_item 
    drop constraint ix_desconto_estrategia_item$desconto_estrategia_id$tipo$item_id

  exec sp_apagar_campo 'desconto_estrategia_item', 'tipo' 
end
go

if object_id('ix_desconto_estrategia_item$desconto_estrategia_id$tipo_item_id$item_id') is null
  alter table dbo.desconto_estrategia_item 
  add constraint ix_desconto_estrategia_item$desconto_estrategia_id$tipo_item_id$item_id unique nonclustered 
	(
		desconto_estrategia_id asc,
		tipo_item_id asc,
		item_id asc
	)

go

if object_id('fk_desconto_estrategia_item__django_content_type') is null
begin
  alter table dbo.desconto_estrategia_item  with check 
  add constraint fk_desconto_estrategia_item__django_content_type foreign key(tipo_item_id)
  references dbo.django_content_type (id)

  alter table dbo.desconto_estrategia_item check constraint fk_desconto_estrategia_item__django_content_type
  alter table dbo.desconto_estrategia_item with check add  constraint desconto_estrategia_item_item_id_29d8714e_check check  ((item_id>=(0)))
  alter table dbo.desconto_estrategia_item check constraint desconto_estrategia_item_item_id_29d8714e_check
end
go
