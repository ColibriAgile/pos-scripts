if object_id('consumidordados') is null return

alter table consumidordados
  alter column endereco varchar(150)
