if exists (select * from sys.indexes where name = N'ix_codigo_barra$rede_id$sub_rede_id$loja_id$codigo')
  alter table dbo.codigo_barra
  drop constraint ix_codigo_barra$rede_id$sub_rede_id$loja_id$codigo
go

exec dbo.sp_padronizar_collation @nome_com_schema = 'dbo.codigo_barra'
go
