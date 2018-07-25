
if object_id('dbo.fn_item_preco') is not null
   drop function dbo.fn_item_preco
go

create function fn_item_preco( )
returns table 
as return
(
  select 
    material_id = m.id,
    preco_geral = isnull(t.preco, 0),
    preco_balcao = isnull(tb.preco, 0),
    preco_mesa = isnull(tm.preco, 0),
    preco_ficha = isnull(tf.preco, 0),
    preco_entrega = isnull(te.preco, 0)
  from dbo.material m
  left join dbo.vw_item_preco t on
    t.modo_venda_id = 0 and 
    t.material_id = m.id and 
    t.situacao = 'vigente'
  left join dbo.vw_item_preco tb on
    tb.modo_venda_id = 1 and 
    tb.material_id = m.id and 
    tb.situacao = 'vigente'
  left join dbo.vw_item_preco te on
    te.modo_venda_id = 2 and 
    te.material_id = m.id and 
    te.situacao = 'vigente'
  left join dbo.vw_item_preco tm on
    tm.modo_venda_id = 3 and 
    tm.material_id = m.id and 
    tm.situacao = 'vigente'
  left join dbo.vw_item_preco tf on
    tf.modo_venda_id = 4 and 
    tf.material_id = m.id and 
    tf.situacao = 'vigente'
  where m.ativo = 1
    and m.venda = 1
)
go


