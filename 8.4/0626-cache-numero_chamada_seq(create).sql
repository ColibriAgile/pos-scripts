if object_id('cache.numero_chamada_seq') is not null
return

create table cache.numero_chamada_seq
(
  valor int not null identity(0,1),  
  dt_alt datetime 
    constraint df_numero_chamada_seq$dt_alt default getdate() 
) on [primary]

go