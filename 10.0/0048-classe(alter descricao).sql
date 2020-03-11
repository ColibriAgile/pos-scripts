IF OBJECT_ID('dbo.ix_classe$descricao', 'UQ') IS NOT NULL
  alter table dbo.classe drop constraint ix_classe$descricao
go


alter table dbo.classe
	alter column descricao varchar(200)
go

alter table dbo.classe add constraint ix_classe$descricao unique NONCLUSTERED (descricao ASC)
go