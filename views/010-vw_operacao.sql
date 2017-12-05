if (not object_id('vw_operacao') is null)
  drop view vw_operacao
go

create view vw_operacao
as
select
  o.operacao_id,
  o.tipo,
  ov.modo_venda_id,
  modo_venda_nome = md.nome,
  func_recebeu_id = o.func_logado_id,
  o.dt_contabil,
  valor = o.vl_total,
  ov.vl_subtotal_itens,
  ov.vl_subtotal_para_servico,
  ov.vl_subtotal_para_desconto,
  o.vl_total,
  mv.vl_total_recebido,
  ov.vl_servico,
  ov.vl_consumacao,
  ov.vl_consumacao_maxima,
  ov.vl_entrada_maxima,
  ov.vl_entrada,
  ov.vl_desconto,
  ov.desconto_id,
  o.cancelada,
  movimento_dia = 1,
  estornada = o.cancelada,
  ov.qtd_pessoas
from operacao o
left join operacao_venda ov on o.operacao_id = ov.operacao_id
left join modo_venda md on md.id = ov.modo_venda_id
left join vw_movimento_caixa mv on mv.operacao_id = o.operacao_id

union

select
  o.operacao_id,
  o.tipo,
  ov.modo_venda_id,
  modo_venda_nome = md.nome,
  func_recebeu_id = o.func_logado_id,
  o.dt_contabil,
  valor = o.vl_total,
  ov.vl_subtotal_itens,
  ov.vl_subtotal_para_servico,
  ov.vl_subtotal_para_desconto,
  o.vl_total,
  mv.vl_total_recebido,
  ov.vl_servico,
  ov.vl_consumacao,
  ov.vl_consumacao_maxima,
  ov.vl_entrada_maxima,
  ov.vl_entrada,
  ov.vl_desconto,
  ov.desconto_id,
  o.cancelada,
  movimento_dia = 0,
  estornada = o.cancelada,
  ov.qtd_pessoas
from operacao_geral o
left join operacao_venda_geral ov on o.operacao_id = ov.operacao_id
left join modo_venda md on md.id = ov.modo_venda_id
left join vw_movimento_caixa mv on mv.operacao_id = o.operacao_id

go

