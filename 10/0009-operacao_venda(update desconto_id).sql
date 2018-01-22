/*
    Apaga a referência à um desconto id inexistente
    para que seja possível criar a chave estrangeira
    entre operacao_venda e desconto.
*/

update dbo.operacao_venda 
set desconto_id = null
where isnull(desconto_id, 0) > 0
  and desconto_id not in (
      select id from desconto
  ) 