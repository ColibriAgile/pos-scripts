if dbo.fn_existe('dbo.maquina.inicia_pos') = 0
  alter table dbo.maquina 
  add inicia_pos bit not null default(0)


