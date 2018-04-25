if dbo.fn_existe('dbo.impressao.arquivo')=0
  alter table dbo.impressao add arquivo varchar(512) null
go
