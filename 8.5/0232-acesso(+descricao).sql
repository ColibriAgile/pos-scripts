if dbo.fn_existe('dbo.acesso.descricao') = 1
  return

alter table dbo.acesso
add descricao varchar(100) null