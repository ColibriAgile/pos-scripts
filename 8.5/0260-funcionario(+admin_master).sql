if dbo.fn_existe('dbo.funcionario.admin_master') = 1
  return

alter table dbo.funcionario
add admin_master bit null default 0

exec('
  update dbo.funcionario set admin_master = 1 where id <= 1
  update dbo.funcionario set admin_master = 0 where id > 1
')
