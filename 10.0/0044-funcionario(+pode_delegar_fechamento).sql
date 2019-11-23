if dbo.fn_existe('dbo.funcionario.pode_delegar_fechamento') = 1
  return

alter table dbo.funcionario
add pode_delegar_fechamento bit null

exec sys.sp_executesql @stmt=
'
update dbo.funcionario
set pode_delegar_fechamento = virtual
'
go
