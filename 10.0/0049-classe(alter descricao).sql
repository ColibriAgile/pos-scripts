execute sp_apagar_constraint 'ix_classe$descricao'
go

alter table dbo.classe
	alter column descricao nvarchar(200) collate database_default null 
go

alter table dbo.classe
	alter column descricao_touch nvarchar(40) collate database_default null
go

alter table dbo.classe 
  add constraint ix_classe$descricao unique nonclustered (descricao asc)
go