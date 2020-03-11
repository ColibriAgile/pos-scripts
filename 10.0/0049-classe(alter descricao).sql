
execute sp_apagar_constraint 'ix_classe$descricao'
go

alter table dbo.classe
	alter column descricao varchar(200)
go

alter table dbo.classe add constraint ix_classe$descricao unique NONCLUSTERED (descricao ASC)
go