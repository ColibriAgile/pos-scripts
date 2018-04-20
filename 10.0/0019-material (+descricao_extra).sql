if dbo.fn_existe('dbo.material.descricao_extra')=0
  alter table dbo.material add descricao_extra nvarchar(50) COLLATE Latin1_General_CI_AI NULL
go

