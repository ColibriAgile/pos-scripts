if (object_id('fn_ultimos_pedidos') is not null)
   drop function fn_ultimos_pedidos
go

create function fn_ultimos_pedidos
(
  @cliente_id uniqueidentifier,
  @limite integer = 7,
  @modo_venda int = 0
)
returns @tbl table
(
  operacao_id uniqueidentifier,
  venda_id uniqueidentifier,
  dt_contabil date,
  dt_hr_abertura datetime,
  dt_hr_lancamento datetime,
  num_ped int,
  qtd_ped int,
  vl_taxa_de_entrega money,
  vl_desconto money,
  vl_total money,
  mat_id int,
  mat_cod varchar(30),
  mat_descr varchar(100),
  mat_qtd numeric(15,4),
  mat_preco money,
  mat_obs varchar(1000),
  mat_contador int,
  mat_inativo bit,
  combo_id int,
  combo_nome varchar(30),
  combo_obs varchar(200),
  combo_indice int,
  cliente_nome varchar(50)
)
as
begin

  declare
    @vendas table (venda_id uniqueidentifier)

  declare
    @qtd_pedidos_1 int,
    @qtd_pedidos_2 int,
    @cliente_nome varchar(50) = null

  select @cliente_nome = c.nome
  from cliente as c
  where c.id = @cliente_id

-----------------------------------------------
-- Busca pedidos do cliente nas tabelas do dia
-----------------------------------------------
  insert @vendas
  select top(@limite) h.venda_id
  from venda as h
  where h.cliente_id = @cliente_id
    and h.cancelado = 0
    and (h.modo_venda_id = @modo_venda or @modo_venda = 0)
  order by h.dt_hr_abertura desc

  set @qtd_pedidos_1 = @@ROWCOUNT

----------------------------------------
-- Completa os dados do pedido
----------------------------------------
  insert into @tbl
  select
    operacao_id = o.operacao_id,
    venda_id = h.venda_id,
    dt_contabil = h.dt_contabil,
    dt_hr_abertura = h.dt_hr_abertura,
    dt_hr_lancamento = i.dt_hr_lancamento,
    num_ped = h.codigo_ticket,
    qtd_ped = 0,
    vl_taxa_de_entrega = ov.vl_taxa_de_entrega,
    vl_desconto = ov.vl_desconto,
    vl_total = o.vl_total,
    mat_id = i.material_id,
    mat_cod = m.codigo,
    mat_descr = i.descricao,
    mat_qtd = i.qtd,
    mat_preco = i.vl_preco,
    mat_obs = i.observacoes,
    mat_contador = i.contador_item,
    mat_inativo = case m.ativo
      when 1 then 0
      else 1
    end,
    combo_id = i.combo_id,
    combo_nome = c.descricao_prod,
    combo_obs = i.combo_obs,
    combo_indice = i.indice,
    cliente_nome = @cliente_nome
  from venda as h
  join venda_item as i on i.venda_id = h.venda_id
  left join combo as c on c.id = i.combo_id
  join operacao as o on o.operacao_id = h.operacao_id
  join operacao_venda as ov on ov.operacao_id = o.operacao_id
  join material m on m.id = i.material_id
  where h.venda_id in (select venda_id from @vendas)

-----------------------------------------------
-- Busca pedidos do cliente no passado
-----------------------------------------------
  set @limite = @limite - @qtd_pedidos_1
  delete @vendas

  insert @vendas
  select top(@limite) h.venda_id
  from venda_geral as h
  where h.cliente_id = @cliente_id
    and h.cancelado = 0
    and (h.modo_venda_id = @modo_venda or @modo_venda = 0)
  order by h.dt_hr_abertura desc

  set @qtd_pedidos_2 = @@ROWCOUNT

  insert into @tbl
  select
    operacao_id = o.operacao_id,
    venda_id = h.venda_id,
    dt_contabil = h.dt_contabil,
    dt_hr_abertura = h.dt_hr_abertura,
    dt_hr_lancamento = i.dt_hr_lancamento,
    num_ped = h.codigo_ticket,
    qtd_ped = 0,
    vl_taxa_de_entrega = ov.vl_taxa_de_entrega,
    vl_desconto = ov.vl_desconto,
    vl_total = o.vl_total,
    mat_id = i.material_id,
    mat_cod = m.codigo,
    mat_descr = i.descricao,
    mat_qtd = i.qtd,
    mat_preco = i.vl_preco,
    mat_obs = i.observacoes,
    mat_contador = i.contador_item,
    mat_inativo = case m.ativo
      when 1 then 0
      else 1
    end,
    combo_id = i.combo_id,
    combo_nome = c.descricao_prod,
    combo_obs = i.combo_obs,
    combo_indice = i.indice,
    cliente_nome = @cliente_nome
  from venda_geral as h
  join venda_item_geral as i on i.venda_id = h.venda_id
  left join combo as c on c.id = i.combo_id
  join operacao_geral as o on o.operacao_id = h.operacao_id
  join operacao_venda_geral as ov on ov.operacao_id = o.operacao_id
  join material m on m.id = i.material_id
  where h.venda_id in (select venda_id from @vendas)

  update @tbl
  set qtd_ped = @qtd_pedidos_1 + @qtd_pedidos_2

  return
end

