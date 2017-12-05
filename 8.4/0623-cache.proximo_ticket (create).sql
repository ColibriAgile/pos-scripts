if object_id('cache.proximo_ticket') is not null
return

create table cache.proximo_ticket
(
  valor smallint null,
  modo_venda smallint not null,
  dt_alt datetime constraint df_proximo_ticket$dt_alt default getdate() 
) on [primary]

go