if exists(
  select * 
  from syscolumns 
  where name = 'modo_venda_id' 
    and id = object_id('acesso')
) return 

alter table dbo.acesso
add modo_venda_id int not null default 0
go

exec dbo.sp_apagar_constraint 'pk_acesso' 
exec dbo.sp_apagar_indice 'acesso', 'ix_acesso$grupo_id$bloco_id' 

alter table dbo.acesso
alter column grupo_id int not null
go

alter table acesso
add constraint pk_acesso primary key (grupo_id, bloco_id, modo_venda_id)

