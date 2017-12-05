if (object_id('vw_itemvendaunificada') is not null)
  drop view vw_itemvendaunificada
go
if (object_id('vw_venda_item_unificada') is not null)
  drop view vw_venda_item_unificada
go

create view vw_venda_item_unificada
as
  select
  ponto_venda = pv.nome,
  modo_venda_descr = md.nome,
  item.*,
  motivo_canc = mcanc.nome,
  ticket_modo_venda = t.modo_venda_id,

--grupo
  grupo_id = IsNull(m.grupo_id, -1),
  grupo_descr = IsNull(g.descricao, '(grupo inexistente)'),

  material_cod = m.codigo,
  material_cod_num = IsNull(m.codigo, -1),
  material_descr = m.descricao
  from
  (
  select
    nao_geral = 1,
  --identificacao da venda
    venda_id = i.venda_id,
    numero_venda = h.numero_venda,
    item_id = i.contador_item,
    dt_contabil = i.dt_contabil,
    loja_id = i.loja_id,
    maquina_id = i.maquina_id,
    modo_venda_id = i.modo_venda_id,
    ponto_venda_id = i.ponto_venda_id,

  --ticket
    ticket_cod = h.codigo_ticket,
    ticket_id = t.ticket_id,
    ticket_estado = case
      o.encerrada when 1 then 'finalizado'
      else t.estado
    end,
    ticket_origem = i.ticket_origem,
    venda_origem = i.venda_origem,

  --lançamento
    hr_lancamento = convert(varchar(5),i.dt_hr_lancamento, 14),
    dt_hr_lancamento = i.dt_hr_lancamento,
    dt_hr_cancelamento = case
      when h.cancelado = 1 then h.dt_alt
      else i.dt_hr_cancelamento
    end,
    motivo_canc_id = i.motivo_cancelamento_id,

  --funcionarios
    func_id = i.func_logado_id,
    func_lancou_id = i.func_lancou_id,
    func_cancelou_id = i.func_cancelou_id,
    func_transferiu_id = i.func_transferiu_id,
    func_autorizou_id = i.func_autorizou_id,

  --material
    i.material_id,

  --item de venda
    qtd = i.qtd,
    vl_unit = i.vl_preco,
    vl_total = convert(money,(round((i.qtd*i.vl_preco+i.arredondamento),2,1)),0),
    vl_servico_calculado = i.vl_servico_calculado,
    vl_servico_informado = i.vl_servico_informado,

   --status
    i.situacao,
    i.codigo_situacao,
    cancelado = i.cancelado,
    transferido = i.transferido,
    imprimiu = i.imprimiu,
    i.valido
  from venda_item i
  left join venda h on h.venda_id = i.venda_id
  left join operacao_venda o on o.operacao_id = h.operacao_id
  left join ticket t on t.venda_id = h.venda_id

  union all

  select
    nao_geral = 0,
  --identificacao da venda
    venda_id = i.venda_id,
    numero_venda = h.numero_venda,
    item_id = i.contador_item,
    dt_contabil = i.dt_contabil,
    loja_id = i.loja_id,
    maquina_id = i.maquina_id,
    modo_venda_id = i.modo_venda_id,
    ponto_venda_id = i.ponto_venda_id,

  --ticket
    ticket_cod = h.codigo_ticket,
    ticket_id = null,
    ticket_estado = 'finalizado',
    ticket_origem = i.ticket_origem,
    venda_origem = i.venda_origem,

  --lançamento
    hr_lancamento = i.dt_hr_lancamento,
    dt_hr_lancamento = i.dt_hr_lancamento,
    dt_hr_cancelamento = i.dt_hr_cancelamento,
    motivo_canc_id = i.motivo_cancelamento_id,

  --funcionarios
    func_id = i.func_logado_id,
    func_lancou_id = i.func_lancou_id,
    func_cancelou_id = i.func_cancelou_id,
    func_transferiu_id = i.func_cancelou_id,
    func_autorizou_id = i.func_autorizou_id,

  --material
    i.material_id,

  --item de venda
    qtd = i.qtd,
    vl_unit = i.vl_preco,
    vl_total = convert(money,(round((i.qtd*i.vl_preco+i.arredondamento),2,1)),0),
    vl_servico_calculado = i.vl_servico_calculado,
    vl_servico_informado = i.vl_servico_informado,

   --status
    i.situacao,
    i.codigo_situacao,
    cancelado = i.cancelado,
    transferido = i.transferido,
    imprimiu = i.imprimiu,
    i.valido
  from venda_item_geral i
  left join venda_geral h on h.venda_id = i.venda_id
) item
left join material m on m.id = item.material_id
left join grupo_material g on g.id = m.grupo_id
left join ticket t on t.ticket_id = item.ticket_id
left join modo_venda md on md.codigo = item.modo_venda_id
left join maquina maq on maq.id = item.maquina_id
left join motivo_cancelamento mcanc on mcanc.id = item.motivo_canc_id
left join ponto_venda pv on  pv.id = item.ponto_venda_id

go
