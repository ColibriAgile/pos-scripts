if exists (select * from syscolumns where id=object_id('perfilimpressao') and name='adiar_remota')
  return

alter table perfilimpressao
add adiar_remota bit null
go