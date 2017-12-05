exec sp_incluirRelatorio
    @tipoio_id = 1, -- int
    @num = 50, -- int
    @id = 424,
    @modo_venda = 1,
    @nome = 'Cupom da boqueta',
    @descricao = 'Cupom da boqueta',
    @tipoequipamento_id = 1

exec sp_incluirRelatorio
    @tipoio_id = 1,
    @num = 50,
    @id = 525,
    @modo_venda = 3,
    @nome = 'Cupom da boqueta',
    @descricao = 'Cupom da boqueta',
    @tipoequipamento_id = 1

exec sp_incluirRelatorio
    @tipoio_id = 1,
    @num = 50,
    @id = 725,
    @modo_venda = 4,
    @nome = 'Cupom da boqueta',
    @descricao = 'Cupom da boqueta',
    @tipoequipamento_id = 1

--Removendo o relatório Cupom montador dos modos balcão, ficha e mesa.
delete listaioxmododevenda
where num = 10 and tipoio_id = 1
  and mododevenda_id <> 2

delete maparelatorio
where mododevenda_id <> 2
  and relatorio_id in (401, 501, 701)

delete gruporelatorios
where relatorio_id in (401, 501, 701)

delete relatorioxmodulo
where relatorio_id in (401, 501, 701)

delete impressoraxrelatorio
where relatorio_id in (401, 501, 701)

exec sp_ajustaconfigio