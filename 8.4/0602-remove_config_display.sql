delete dbo.configio
where listaio_id = 3

delete from dbo.periferico
where nome like 'display%'

delete impressoraxrelatorio 
where dispositivo_id in (
  select dispositivo_id from dbo.dispositivo
  where nm_dispositivo like 'display%'
)

delete from dbo.dispositivo
where nm_dispositivo like 'display%'

delete from dbo.maparelatorio
where listaio_id = (select id from dbo.listaio where nome = 'display')

delete from dbo.listaioxmododevenda
where tipoio_id = 5

delete from dbo.listaio
where nome = 'Display'

delete from dbo.gruporelatorios
where nm_relatorio = 'Display de Clientes'

