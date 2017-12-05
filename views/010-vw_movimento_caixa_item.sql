if (object_id('vw_movcaixaitem') is not null)
  drop view vw_movcaixaitem
go

if (object_id('vw_movimento_caixa_item') is not null)
  drop view vw_movimento_caixa_item
go

create view vw_movimento_caixa_item
as
select
  movimento_caixa_id,
  operacao_id,
  dt_contabil,
  dt_hr_pagamento,
  tipo,
  modo_venda = mv.nome,
  ponto_venda = pv.nome,
  t.func_id,
  func_nome = f.nome,
  maquina_id = t.maquina_id,
  maquina_nome = maq.nome,
  maquina_caminho = maq.caminho,
  meio_id = t.meio_pagamento_id,
  meio_cod = r.codigo,
  meio_nome = r.descricao,
  vl_recebido,
  t.descricao,
  cancelado
from
(
  select
    m.movimento_caixa_id,
    o.dt_contabil,
    m.dt_hr_pagamento,
    ov.modo_venda_id,
    o.tipo,
    func_id = m.func_recebeu_id,
    m.maquina_id,
    m.meio_pagamento_id,
    m.vl_recebido,
    m.cancelado,
    o.operacao_id,
    o.descricao
  from movimento_caixa m
  join operacao o on m.operacao_id = o.operacao_id
  left join operacao_venda ov on ov.operacao_id = o.operacao_id

  union

  select
    m.movimento_caixa_id,
    o.dt_contabil,
    m.dt_hr_pagamento,
    ov.modo_venda_id,
    o.tipo,
    func_id = m.func_recebeu_id,
    m.maquina_id,
    m.meio_pagamento_id,
    m.vl_recebido,
    m.cancelado,
    o.operacao_id,
    o.descricao
  from movimento_caixa_geral m
  join operacao_geral o on m.operacao_id = o.operacao_id
  left join operacao_venda_geral ov on ov.operacao_id = o.operacao_id
) t
left join meio_pagamento r on r.id = t.meio_pagamento_id
left join maquina maq on maq.id = t.maquina_id
left join funcionario f on f.id = t.func_id
left join modo_venda mv on mv.id = t.modo_venda_id
left join ponto_venda pv on pv.id = case
  when t.modo_venda_id = 1 then maq.ponto_balcao_id
  when t.modo_venda_id = 2 then maq.ponto_entrega_id
  when t.modo_venda_id = 3 then maq.ponto_mesa_id
  when t.modo_venda_id = 4 then maq.ponto_ficha_id
end

go


