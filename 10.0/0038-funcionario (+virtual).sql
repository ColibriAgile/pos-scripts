  if dbo.fn_existe('dbo.funcionario.virtual') = 1
    return

  alter table dbo.funcionario
    add virtual bit not null default 0
  go


