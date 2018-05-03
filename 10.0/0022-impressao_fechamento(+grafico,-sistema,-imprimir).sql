exec dbo.sp_renomear 'dbo.impressao_fechamento.sistema', 'grafico', 'column'
go
exec dbo.sp_apagar_campo 'dbo.impressao_fechamento', 'imprimir'
go
update impressao_fechamento set grafico = 0
go


exec sp_apagar_pk 'dbo.impressao_fechamento'

alter table dbo.impressao_fechamento add constraint
	pk_impressao_fechamento primary key clustered 
	(
  tipo,
	grafico,
  ordem,
	nome
	) with( statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [primary]

go