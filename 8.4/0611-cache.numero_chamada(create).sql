if object_id('cache.numero_chamada') is not null
return

create table cache.numero_chamada
(
  valor smallint null,
  dt_alt datetime constraint df_num_chamada$dt_alt default getdate() 
) on [primary]

go