if dbo.fn_existe('dbo.combo.descricao_extra')=0
  alter table dbo.combo add descricao_extra nvarchar(50) COLLATE Latin1_General_CI_AI NULL
go
