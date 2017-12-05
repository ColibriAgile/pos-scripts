if (not object_id('vw_movimento_caixa') is null)
  drop view vw_movimento_caixa
go

create view vw_movimento_caixa
as

select
  o.operacao_id,
  vl_total_recebido = sum(case when mc.cancelado = 1 then 0 else mc.vl_recebido end),
  func_recebeu_id = max(mc.func_recebeu_id),
  dt_hr_pagamento = max(mc.dt_hr_pagamento),
  dt_contabil = o.dt_contabil,
  ov.modo_venda_id,
  modo_venda = mv.nome,
  func_recebeu_nome = f.nome,
  o.maquina_id,
  ponto_venda_id = pv.id,
  ponto_venda_nome = pv.nome,
  ov.vl_subtotal_itens,
  o.vl_total,
  ov.vl_servico,
  ov.vl_servico_informado,
  ov.vl_consumacao,
  ov.vl_consumacao_maxima,
  ov.vl_diferenca_consumacao,
  ov.vl_entrada_maxima,
  ov.vl_entrada,
  ov.desconto,
  ov.vl_desconto,
  ov.desconto_id,
  o.cancelada,
  o.tipo,
  o.descricao,
  movimento_dia = 1
from movimento_caixa mc
join operacao o on mc.operacao_id = o.operacao_id
join operacao_venda ov on o.operacao_id = ov.operacao_id
join modo_venda mv on mv.id = ov.modo_venda_id
left join funcionario f on f.id = mc.func_recebeu_id
left join maquina m on m.id = mc.maquina_id
left join ponto_venda pv on
  pv.id = case
    when ov.modo_venda_id = 1 then m.ponto_balcao_id
    when ov.modo_venda_id = 2 then m.ponto_entrega_id
    when ov.modo_venda_id = 3 then m.ponto_mesa_id
    when ov.modo_venda_id = 4 then m.ponto_ficha_id
  end
group by
  o.operacao_id,
  o.dt_contabil,
  ov.modo_venda_id,
  mv.nome,
  f.nome,
  o.maquina_id,
  pv.id,
  pv.nome,
  ov.vl_subtotal_itens,
  o.vl_total,
  ov.vl_servico,
  ov.vl_servico_informado,
  ov.vl_consumacao,
  ov.vl_consumacao_maxima,
  ov.vl_diferenca_consumacao,
  ov.vl_entrada_maxima,
  ov.vl_entrada,
  ov.desconto,
  ov.vl_desconto,
  ov.desconto_id,
  o.cancelada,
  o.tipo,
  o.descricao

union

select
  o.operacao_id,
  vl_total_recebido = sum(case when mc.cancelado = 1 then 0 else mc.vl_recebido end),
  func_recebeu_id = max(mc.func_recebeu_id),
  dt_hr_pagamento = max(mc.dt_hr_pagamento),
  dt_contabil = o.dt_contabil,
  ov.modo_venda_id,
  modo_venda = mv.nome,
  func_recebeu_nome = f.nome,
  o.maquina_id,
  ponto_venda_id = pv.id,
  ponto_venda_nome = pv.nome,
  ov.vl_subtotal_itens,
  o.vl_total,
  ov.vl_servico,
  ov.vl_servico_informado,
  ov.vl_consumacao,
  ov.vl_consumacao_maxima,
  ov.vl_diferenca_consumacao,
  ov.vl_entrada_maxima,
  ov.vl_entrada,
  ov.desconto,
  ov.vl_desconto,
  ov.desconto_id,
  o.cancelada,
  o.tipo,
  o.descricao,
  movimento_dia = 0
from movimento_caixa_geral mc
join operacao_geral o on mc.operacao_id = o.operacao_id
join operacao_venda_geral ov on o.operacao_id = ov.operacao_id
join modo_venda mv on mv.id = ov.modo_venda_id
left join funcionario f on f.id = mc.func_recebeu_id
left join maquina m on m.id = mc.maquina_id
left join ponto_venda pv on
  pv.id = case
    when ov.modo_venda_id = 1 then m.ponto_balcao_id
    when ov.modo_venda_id = 2 then m.ponto_entrega_id
    when ov.modo_venda_id = 3 then m.ponto_mesa_id
    when ov.modo_venda_id = 4 then m.ponto_ficha_id
  end
group by
  o.operacao_id,
  o.dt_contabil,
  ov.modo_venda_id,
  mv.nome,
  f.nome,
  o.maquina_id,
  pv.id,
  pv.nome,
  ov.vl_subtotal_itens,
  o.vl_total,
  ov.vl_servico,
  ov.vl_servico_informado,
  ov.vl_consumacao,
  ov.vl_consumacao_maxima,
  ov.vl_diferenca_consumacao,
  ov.vl_entrada_maxima,
  ov.vl_entrada,
  ov.desconto,
  ov.vl_desconto,
  ov.desconto_id,
  o.cancelada,
  o.tipo,
  o.descricao
go
