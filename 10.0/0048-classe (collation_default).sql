if  exists (select * from sys.indexes where name = N'ix_combo$rede_id$sub_rede_id$loja_id$codigo')
  alter table [dbo].[combo] 
  drop constraint [ix_combo$rede_id$sub_rede_id$loja_id$codigo]
go

if  exists (select * from sys.indexes where name = N'combo_rede_id_20d88f96_uniq')
  alter table [dbo].[combo] 
  drop constraint [combo_rede_id_20d88f96_uniq]
go

exec dbo.sp_padronizar_collation @nome_com_schema = 'dbo.item_classe'
exec dbo.sp_padronizar_collation @nome_com_schema = 'dbo.combo'