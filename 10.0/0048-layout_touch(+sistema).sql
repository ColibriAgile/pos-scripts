-- adiciona o campo sistema
if (dbo.fn_existe('dbo.layout_touch.sistema') = 1)
  return

alter table dbo.layout_touch add
  sistema bit not null default 0
go