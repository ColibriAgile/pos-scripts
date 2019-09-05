  if dbo.fn_existe('dbo.grupo_funcionario.virtual') = 1
    return

  alter table dbo.grupo_funcionario
    add virtual bit not null default 0
  go

  update dbo.grupo_funcionario
  set virtual = 0
  where virtual is null
  go

