if dbo.fn_existe('dbo.funcionario.api_key')=1
  return

alter table dbo.funcionario
  add api_key varchar(50) null

go
---------------------------------------------
if dbo.fn_existe('dbo.funcionario.virtual')=1
  alter table dbo.funcionario
    drop column virtual

alter table dbo.funcionario
  add virtual as (case when trim(isnull(api_key,'')) = '' then 0 else 1 end) persisted

go
