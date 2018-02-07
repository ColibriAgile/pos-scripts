if (object_id('fn_faturamento') is not null)
  drop function fn_faturamento
go

create function fn_faturamento
(
  @dt_ini datetime,
  @dt_fim datetime,
  @func_id varchar(6),
  @apenas_ultimo_fechamento bit,
  @turno_id int = 0,
  @modos_venda varchar(10) = ''
)
returns @tbl table
(
  data datetime,
  grupo int,
  sessao varchar(40),
  descricao varchar(50),
  valor money,
  total_faturamento money
)
as begin

  if @modos_venda = ''
    set @modos_venda = '0,1,2,3,4'

  /*Obtendo filtro por data de recebimento e se acumula ou não os movimentos por operador*/
  declare @turnos table (turno_id int)

  insert into @turnos
  select
    turno_id
  from dbo.fn_turnos(@func_id, @dt_ini, @dt_fim, @apenas_ultimo_fechamento, @turno_id)
  /**/

  declare @aux_totais_caixa table
  (
    --identificação
    data datetime,
    func_id int,
    meio_id int,
    meio_nome varchar(30),

    --totais do movimento de caixa
    valor_venda money default 0,
    credito_assinada money default 0,
    troco money default 0,
    repique money default 0,
    contra_vale money default 0,
    sangria money default 0,
    suprimento money default 0
  )
  insert into @aux_totais_caixa
  select
    data,
    func_id,
    meio_id,
    meio_nome,
    valor_venda,
    credito_assinada,
    troco,
    repique,
    contra_vale,
    sangria,
    suprimento
  from dbo.fn_fechamento_caixa(
    @dt_ini,
    @dt_fim,
    @func_id,
    @apenas_ultimo_fechamento,
    @turno_id,
    @modos_venda
  )

  declare @aux_totais_operacao table
  (
    data datetime,
    vl_desconto_aplicado money,
    vl_servico_recebido money,
    vl_entrada_recebido money,
    vl_diferenca_consumacao money,
	vl_taxa_de_entrega money
  )
  /**/

  /*Inserindo totais das operações por data*/
  insert into @aux_totais_operacao
  select
    data,
    vl_desconto_aplicado = sum(vl_desconto_aplicado),
    vl_servico_recebido = sum(vl_servico_recebido),
    vl_entrada_recebido = sum(vl_entrada_recebido),
    vl_diferenca_consumacao = sum(vl_diferenca_consumacao),
	vl_taxa_entrega = sum(vl_taxa_de_entrega)
  from
  (
    select
      data = o.dt_contabil,
      vl_desconto_aplicado = max(isnull(ov.vl_desconto, 0)),
      vl_servico_recebido = max(isnull(ov.vl_servico, 0)),
      vl_entrada_recebido = max(isnull(ov.vl_entrada, 0)),
      vl_diferenca_consumacao = max(isnull(ov.vl_diferenca_consumacao, 0)),
	  vl_taxa_de_entrega = max(isnull(ov.vl_taxa_de_entrega,0))
    from operacao_geral o with (nolock)
    join operacao_venda_geral ov with (nolock) on
      ov.operacao_id = o.operacao_id
    join movimento_caixa_geral m with (nolock) on
      m.operacao_id = o.operacao_id
    join @turnos t on t.turno_id = m.turno_id
    where o.cancelada = 0
      and ((m.func_recebeu_id = @func_id) or (@func_id <= 0))
      and ov.modo_venda_id in (select id from dbo.fn_list2lines(@modos_venda, ''))
    group by o.operacao_id, dt_contabil

    union all

    select
      data = o.dt_contabil,
      vl_desconto_aplicado = max(isnull(ov.vl_desconto, 0)),
      vl_servico_recebido = max(isnull(ov.vl_servico, 0)),
      vl_entrada_recebido = max(isnull(ov.vl_entrada, 0)),
      vl_diferenca_consumacao = max(isnull(ov.vl_diferenca_consumacao, 0)),
	  vl_taxa_de_entrega = max(isnull(ov.vl_taxa_de_entrega,0))
    from operacao o with (nolock)
    join operacao_venda ov with (nolock) on
      ov.operacao_id = o.operacao_id
    join movimento_caixa m with (nolock) on
      m.operacao_id = ov.operacao_id
    join @turnos t on t.turno_id = m.turno_id
    where o.cancelada = 0
      and ((m.func_recebeu_id = @func_id) or (@func_id <= 0))
      and ov.modo_venda_id in (select id from dbo.fn_list2lines(@modos_venda, ''))
    group by o.operacao_id, dt_contabil
  )x
  group by data;

  /**/

  --sessão 1 - receitas de venda
  insert into @tbl
  (data, grupo, sessao, descricao, valor)
  select
    data,
    grupo = 1,
    sessao = 'Receitas de venda',
    meio_nome,
    valor = sum(valor_venda)
  from @aux_totais_caixa
  group by data, meio_id, meio_nome
  order by data, meio_id

  --sessão 2 - Saidas
  insert into @tbl
  (data, grupo, sessao, descricao, valor)
  select
    data,
    grupo = 2,
    sessao = 'Saídas',
    descr = 'Troco',
    vl = sum(troco)
  from @aux_totais_caixa
  group by data
  order by data

  insert into @tbl
  (data, grupo, sessao, descricao, valor)
  select
    data,
    grupo = 2,
    sessao = 'Saídas',
    descr = 'Repique',
    vl = sum(repique)
  from @aux_totais_caixa
  group by data
  order by data

  insert into @tbl
  (data, grupo, sessao, descricao, valor)
  select
    data,
    grupo = 2,
    sessao = 'Saídas',
    descr = 'Serviço',
    vl = -sum(vl_servico_recebido)
  from @aux_totais_operacao
  group by data
  order by data

  --sessão 3 indicadores
  insert into @tbl
  (data, grupo, sessao, descricao, valor)
  select
    data,
    grupo = 3,
    sessao = 'Indicadores',
    descr = 'Descontos',
    vl = vl_desconto_aplicado
  from @aux_totais_operacao
  order by data

  insert into @tbl
  (data, grupo, sessao, descricao, valor)
  select
    data,
    grupo = 3,
    sessao = 'Indicadores',
    item = 'Entradas',
    vl = vl_entrada_recebido
  from @aux_totais_operacao
  order by data

  insert into @tbl
  (data, grupo, sessao, descricao, valor)
  select
    data,
    grupo = 3,
    sessao = 'Indicadores',
    item = 'Consumação',
    vl = sum(vl_diferenca_consumacao)
  from @aux_totais_operacao
  group by data
  order by data

  insert into @tbl
  (data, grupo, sessao, descricao, valor)
  select
    data,
    grupo = 3,
    sessao = 'Indicadores',
    descr = 'Taxa de entrega',
    vl = vl_taxa_de_entrega
  from @aux_totais_operacao
  order by data

  insert into @tbl
  (data, grupo, sessao, descricao, valor)
  select
    data,
    grupo = 3,
    sessao = 'Indicadores',
    item = 'Pgto contas assinadas',
    vl = sum(credito_assinada)
  from @aux_totais_caixa
  where meio_id <> 4
  group by data, meio_id, meio_nome
  order by data, meio_id

  insert into @tbl
  (data, grupo, sessao, descricao, valor)
  select
    data,
    grupo = 3,
    sessao = 'Indicadores',
    item = 'Crédito cliente recebido',
    vl = sum(valor_venda + credito_assinada)
  from @aux_totais_caixa
  where meio_id = 3
  group by data

  insert into @tbl
  (data, grupo, sessao, descricao, valor)
  select
    data,
    grupo = 3,
    sessao = 'Indicadores',
    descr = 'Crédito cliente emitido',
    vl = sum(contra_vale)
  from @aux_totais_caixa
  group by data
  order by data
  insert into @tbl
  (data, grupo, sessao, descricao, valor)
  select
    data,
    grupo = 3,
    sessao = 'Indicadores',
    descr = 'Suprimento',
    vl = sum(suprimento)
  from @aux_totais_caixa
  group by data
  order by data
  insert into @tbl
  (data, grupo, sessao, descricao, valor)
  select
    data,
    grupo = 3,
    sessao = 'Indicadores',
    descr = 'Sangria',
    vl = abs(sum(sangria))
  from @aux_totais_caixa
  group by data
  order by data

  /*Atualizando total do faturamento*/
  update @tbl
  set total_faturamento = x.tot_fat
  from (
    select
      dt = data,
      tot_fat = sum(valor)
    from @tbl
    where sessao <> 'Indicadores'
    group by data
  )x
  where data = dt

  return

end
go
