if exists(
  select * from dbo.vw_configiodispositivo
  where mododevenda_id = '4' and listaio_nome like '%pagamento parcial'
) return 

update dbo.vw_configiodispositivo
set mododevenda_id = 4
where mododevenda_id = 2
and listaio_nome like '%pagamento parcial'
