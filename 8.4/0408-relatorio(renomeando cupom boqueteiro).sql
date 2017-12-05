update gruporelatorios
set nm_relatorio = 'Cupom da boqueta'
where relatorio_id in (424, 525, 725)
  and nu_tipodispositivo = 1

update listaio
set nome = 'Cupom da boqueta'
where num = 50
  and tipoio_id = 1