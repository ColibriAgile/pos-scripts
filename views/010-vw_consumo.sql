if (object_id('vw_consumo') is not null)
  drop view vw_consumo
go

create view vw_consumo as
select
  ticket_id = null,
  ticket_pai_id = null,
  modo_venda_id = o.modo_venda_id,
  estado = case 
    when op.cancelada = 1 then 'cancelado'
	  else'finalizado'
	end,
  codigo = case 
    when charindex('/', h.codigo_ticket, 0) > 0 then
      substring(h.codigo_ticket, charindex('/', h.codigo_ticket, 0)+1, len(h.codigo_ticket))
    else
      h.codigo_ticket
  end,
  apelido = null,
  codigo_pai = case 
    when charindex('/', h.codigo_ticket, 0) > 0 then 
      substring(h.codigo_ticket, 1, charindex('/', h.codigo_ticket, 0)-1)
    else
      0
  end,
  praca_id = 0,
  ativo = cast(1 as bit),
  pct_servico = 0,
  dt_alt = h.dt_alt,
  h.venda_id,
  h.operacao_id,
  vl_subtotal_itens = o.vl_subtotal_itens,
  h.situacao,
  h.dt_contabil,
  o.encerrada,
  h.qtd_fechamentos,
  vl_limite = h.vl_limite,
  h.dt_hr_ultimo_consumo,
  o.vl_subtotal_para_desconto,
  o.vl_subtotal_para_servico,
  vl_total = op.vl_total,
  vl_recebido = isnull(m.vl_recebido, 0),
  cliente_id = h.cliente_id,
  c.regiao_id,
  o.consumidor,
  perfil = p.nome,
  perfil_id = h.perfil_id,
  limite_consumo = h.vl_limite,
  qtd_subtickets = 0,
  h.func_atendeu_id,
  atendente_nome = cast(f.codigo as varchar(3)) + ' - ' + f.nome,
  dt_hr_abertura = h.dt_hr_abertura,
  func_entregou_id = o.func_entregou_id,
  entregador = e.nome,
  numero_venda,
  cancelado,
  o.paga,
  dt_hr_expedicao,
  dt_hr_encerramento,
  vl_acrescimo,
  vl_desconto,
  o.vl_consumacao,
  o.vl_diferenca_consumacao,
  o.vl_entrada,
  vl_servico,
  vl_taxa_de_entrega,
  qtd_pessoas,
  cliente = c.nome,
  sexo = c.sexo,
  ordem = row_number() over (partition by o.operacao_id order by h.numero_venda),
  agrupado = case
    when h.operacao_origem_id is null then 0
    else 1
  end,
  t.permite_reserva
from operacao_venda o  with (nolock)
join venda h with (nolock) on (h.operacao_id = o.operacao_id)
left join funcionario f with (nolock) on (h.func_atendeu_id = f.id)
left join funcionario e with (nolock) on (o.func_entregou_id = e.id)
join operacao op with (nolock) on (op.operacao_id = o.operacao_id)
left join cliente c with (nolock) on (c.id = h.cliente_id)
left join regiao r with (nolock) on (r.id = c.regiao_id)
left join ticket t with (nolock) on t.venda_id = h.venda_id
left join perfil p with (nolock) on (p.id = h.perfil_id)
left join
(
  select
    operacao_id, 
    vl_recebido = sum(vl_recebido)
  from movimento_caixa with (nolock)
  where cancelado = 0
  group by operacao_id
) m on m.operacao_id = o.operacao_id
where t.ticket_id is null
  and o.encerrada = 1

union

select
  t.ticket_id,
  t.ticket_pai_id,
  t.modo_venda_id,
  estado = case 
    when op.cancelada = 1 then 'cancelado'
	  else t.estado
	end,
  t.codigo,
  t.apelido,
  codigo_pai = isnull(pai.codigo,0),
  t.praca_id,
  t.ativo,
  t.pct_servico,
  t.dt_alt,
  t.venda_id,
  h.operacao_id,
  vl_subtotal_itens = o.vl_subtotal_itens,
  h.situacao,
  h.dt_contabil,
  o.encerrada,
  h.qtd_fechamentos,
  vl_limite = case
    when t.venda_id is null then p.vl_limite
    else h.vl_limite
  end,
  h.dt_hr_ultimo_consumo,
  o.vl_subtotal_para_desconto,
  o.vl_subtotal_para_servico,
  vl_total = case
    when t.venda_id is null then cast(p.vl_consumacao + p.vl_entrada as money)
    else op.vl_total
  end,
  vl_recebido = isnull(m.vl_recebido, 0),
  t.cliente_id,
  c.regiao_id,
  o.consumidor,
  perfil = p.nome,
  t.perfil_id,
  t.limite_consumo,
  qtd_subtickets = isnull(sub.qtd_subtickets, 0),
  h.func_atendeu_id,
  atendente_nome = cast(f.codigo as varchar(3)) + ' - ' + f.nome,
  t.dt_hr_abertura,
  func_entregou_id = o.func_entregou_id,
  entregador = e.nome,
  numero_venda,
  cancelado,
  o.paga,
  dt_hr_expedicao,
  dt_hr_encerramento,
  vl_acrescimo,
  vl_desconto,
  vl_consumacao = isnull(o.vl_consumacao,p.vl_consumacao),
  vl_diferenca_consumacao = isnull(vl_diferenca_consumacao,p.vl_consumacao),
  vl_entrada = isnull(o.vl_entrada,p.vl_entrada),
  vl_servico,
  vl_taxa_de_entrega,
  qtd_pessoas = o.qtd_pessoas,
  cliente = c.nome,
  sexo = c.sexo,
  ordem = row_number() over (partition by o.operacao_id order by h.numero_venda),
  agrupado = case
    when h.operacao_origem_id is null then 0
    else 1
  end,
  t.permite_reserva
from ticket t  with (nolock)
left join perfil p with (noLock) on p.id = t.perfil_id
left join ticket pai with (nolock) on (pai.ticket_id = t.ticket_pai_id)
left join venda h with (nolock) on (h.venda_id = t.venda_id)
left join funcionario f with (nolock) on (h.func_atendeu_id = f.id)
left join operacao_venda o with (nolock) on (o.operacao_id = h.operacao_id)
left join funcionario e with (nolock) on (o.func_entregou_id = e.id)
left join operacao op with (nolock) on (op.operacao_id = o.operacao_id)
left join cliente c with (nolock) on (c.id = t.cliente_id)
left join regiao r with (nolock) on (r.id = c.regiao_id)
left join 
(
  select
    operacao_id, 
    vl_recebido = sum(vl_recebido)
  from movimento_caixa with (nolock)
  where cancelado = 0
  group by operacao_id
) m on m.operacao_id = o.operacao_id
left join 
(
  select
    ticket_id = ticket_pai_id,
    qtd_subtickets = count(*)
  from ticket with (nolock)
  where ticket_pai_id is not null
    and estado <> 'finalizado'
  group by ticket_pai_id
) sub on sub.ticket_id = t.ticket_id

go
---------------------------------------------------
if exists (select * from sysobjects where id = object_id('consumo_i') and objectproperty(id, 'istrigger') = 1)
  drop trigger consumo_i
go

create trigger consumo_i on vw_consumo
instead of insert
as
begin
  insert into ticket
  (
    modo_venda_id, 
    ticket_pai_id, 
    estado, 
    codigo, 
    praca_id, 
    ativo, 
    pct_servico, 
    dt_alt, 
    perfil_id, 
    dt_hr_abertura
  )
  select 
    modo_venda_id, 
    ticket_pai_id, 
    estado, 
    codigo, 
    praca_id, 
    ativo, 
    pct_servico, 
    isNull(dt_alt, getdate()), 
    perfil_id, 
    dt_hr_abertura
  from inserted
end
go
---------------------------------------------------
if exists (select * from sysobjects where id = object_id('consumo_u') and objectproperty(id, 'istrigger') = 1)
  drop trigger consumo_u
go

create trigger consumo_u on vw_consumo
instead of update
as
begin
  update ticket 
  set
    estado = inserted.estado,
    ticket_pai_id = inserted.ticket_pai_id,
    codigo = inserted.codigo,
    praca_id = inserted.praca_id,
    ativo = inserted.ativo,
    pct_servico = inserted.pct_servico,
    dt_alt = inserted.dt_alt,
    perfil_id = inserted.perfil_id,
    dt_hr_abertura = inserted.dt_hr_abertura
  from inserted
  where ticket.ticket_id = inserted.ticket_id
end
go
---------------------------------------------------
if exists (select * from sysobjects where id = object_id('consumo_d') and objectproperty(id, 'istrigger') = 1)
  drop trigger consumo_d
go

create trigger consumo_d on vw_consumo
instead of delete
as
begin
  delete from ticket
  where ticket_id in 
  (
    select ticket_id 
    from deleted
  )
end
go
