exec dbo.sp_incluirRelatorio
  @tipoio_id = 1, -- int
  @num = 51, -- int
  @id = 51, -- smallint
  @modo_venda = 4, -- int
  @nome = 'FreePass', -- varchar(50)
  @descricao = 'Ticket de liberação de saida', -- varchar(200)
  @tipoequipamento_id = 1 -- int