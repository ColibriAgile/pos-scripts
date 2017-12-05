if exists(select * from syscolumns where name = 'sexo' and id = object_id('perfil')) return

alter table perfil add
  sexo varchar(10) not null
	constraint df_perfil$sexo default 'ambos'
go