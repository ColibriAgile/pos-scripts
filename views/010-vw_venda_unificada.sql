if (object_id('vw_headervendaunificada') is not null)
  drop view vw_headervendaunificada
go

if (object_id('vw_venda_unificada') is not null)
  drop view vw_venda_unificada
go
-----------------------------------------------------
create view vw_venda_unificada as
select
  t.ticket_pai_id,
  ticket_estado = case o.encerrada
    when 1 then 'finalizado' 
    else t.estado 
  end,
  ticket_codigo = h.codigo_ticket,
  ticket_praca = t.praca_id,
  ticket_ativo = t.ativo,
  h.dt_contabil,
  h.dt_hr_ultimo_consumo,
  h.maquina_id,
  h.numero_chamada,
  h.operacao_id,
  h.operacao_origem_id,
  h.perfil_id,
  h.cancelado,
  h.transferido,
  o.encerrada,
  h.situacao,
  h.codigo_situacao,
  modo_venda_nome = m.nome,
  ponto_venda_id = pv.id,
  ponto_venda = pv.nome,
  t.ticket_id,
  h.venda_id,
  h.numero_venda,
  h.qtd_fechamentos,
  h.vl_limite,
  modo_venda_id = isnull(o.modo_venda_id, h.modo_venda_id),
  qtd_pessoas = isnull(o.qtd_pessoas, 1),
  o.pct_servico,
  o.vl_consumacao,
  o.vl_desconto,
  o.vl_entrada,
  o.vl_servico,
  h.vl_subtotal_itens,
  funcionario_iniciou_id = (select top 1 func_logado_id from venda_item where venda_id = h.venda_id order by contador_item),
  funcionario_terminou_id = (select top 1 func_logado_id from venda_item where venda_id = h.venda_id order by contador_item desc),
  garcom_iniciou_id = (select top 1 func_lancou_id from venda_item where venda_id = h.venda_id order by contador_item),
  garcom_terminou_id = (select top 1 func_lancou_id from venda_item where venda_id = h.venda_id order by contador_item desc),
  h.cliente_id,
  h.dt_alt,
  h.dt_hr_abertura,
  movimento_dia = 1
from venda h  with (nolock)
left join ticket t on (t.venda_id = h.venda_id)
left join ticket p on (p.ticket_id = t.ticket_pai_id)
left join operacao_venda o on (o.operacao_id = h.operacao_id)
left join maquina maq on maq.id = h.maquina_id
left join modo_venda m on m.id = h.modo_venda_id
left join ponto_venda pv on
  pv.id = case
    when m.id = 1 then maq.ponto_balcao_id
    when m.id = 2 then maq.ponto_entrega_id
    when m.id = 3 then maq.ponto_mesa_id
    when m.id = 4 then maq.ponto_ficha_id
  end

union

select
  t.ticket_pai_id,
  ticket_estado = 'finalizado',
  ticket_codigo = h.codigo_ticket,
  ticket_praca = t.praca_id,
  ticket_ativo = t.ativo,
  h.dt_contabil,
  h.dt_hr_ultimo_consumo,
  h.maquina_id,
  h.numero_chamada,
  h.operacao_id,
  h.operacao_origem_id,
  h.perfil_id,
  h.cancelado,
  h.transferido,
  o.encerrada,
  h.situacao,
  h.codigo_situacao,
  modo_venda_nome = m.nome,
  ponto_venda_id = pv.id,
  ponto_venda = pv.nome,
  t.ticket_id,
  h.venda_id,
  h.numero_venda,
  h.qtd_fechamentos,
  h.vl_limite,
  modo_venda_id = isnull(o.modo_venda_id, h.modo_venda_id),
  qtd_pessoas = isnull(o.qtd_pessoas, 1),
  o.pct_servico,
  o.vl_consumacao,
  o.vl_desconto,
  o.vl_entrada,
  o.vl_servico,
  h.vl_subtotal_itens,
  funcionario_iniciou_id = (select top 1 func_logado_id from venda_item_geral where venda_id = h.venda_id order by contador_item),
  funcionario_terminou_id = (select top 1 func_logado_id from venda_item_geral where venda_id = h.venda_id order by contador_item desc),
  garcom_iniciou_id = (select top 1 func_lancou_id from venda_item_geral where venda_id = h.venda_id order by contador_item),
  garcom_terminou_id = (select top 1 func_lancou_id from venda_item_geral where venda_id = h.venda_id order by contador_item desc),
  h.cliente_id,
  h.dt_alt,
  h.dt_hr_abertura,
  movimento_dia = 0
from venda_geral h  with (nolock)
left join ticket t on (t.venda_id = h.venda_id)
left join ticket p on (p.ticket_id = t.ticket_pai_id)
left join operacao_venda_geral o on (o.operacao_id = h.operacao_id)
left join maquina maq on maq.id = h.maquina_id
left join modo_venda m on m.id = h.modo_venda_id
left join ponto_venda pv on
  pv.id = case
    when m.id = 1 then maq.ponto_balcao_id
    when m.id = 2 then maq.ponto_entrega_id
    when m.id = 3 then maq.ponto_mesa_id
    when m.id = 4 then maq.ponto_ficha_id
  end

go
