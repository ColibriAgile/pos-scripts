if object_id ('dbo.fn_venda_item') is not null
    drop function dbo.fn_venda_item
go

create function dbo.fn_venda_item(@venda_id uniqueidentifier, @dia bit=null)
returns @tbl table
(
  venda_id uniqueidentifier,  
  maquina_id smallint,
  dt_contabil date,
  modo_venda_id smallint,
  contador_item smallint,
  func_logado_id int,
  material_id int,
  ponto_venda_id smallint,
  praca_id int,
  func_cancelou_id int,
  func_transferiu_id int,
  qtd numeric(15, 3),
  vl_preco numeric(15, 2),
  func_lancou_id int,
  vl_preco_original numeric(15, 2),
  codigo_situacao varchar(1),
  motivo_cancelamento_id int,
  imprimiu bit,
  exportado bit,
  dt_hr_lancamento datetime,
  func_autorizou_id smallint,
  dt_hr_cancelamento datetime,
  bn_fechamento bit,
  lote_id bigint,
  status smallint,
  dt_alt datetime,
  baixa_efetuada bit,
  classe_id int,
  ticket_origem varchar(50),
  observacoes varchar(1000),
  vl_servico_calculado numeric(10, 4),
  vl_servico_informado numeric(10, 4),
  local_entrega varchar(30),
  venda_origem int,
  api_key varchar(50),
  combo_id int,
  combo_obs varchar(150),
  indice smallint,
  codigo varchar(20),
  descricao varchar(100),
  local_producao_id int,
  item_id uniqueidentifier,
  versao varchar(20),
  dispositivo_utilizado varchar(40),
  perfil_impressao_id int,
  classe_rodizio_id int,
  transferido bit,
  desconto_id smallint,
  desconto_estrategia varchar(100),
  vl_desconto numeric(15, 2),
  slot_indice smallint,
  arredondamento numeric(15, 2),
  situacao varchar(28),
  cancelado bit,
  valido bit,
  vl_total money,
  hr_lancamento time,
  numero_venda int,
  ponto_venda nvarchar(20),
  modo_venda varchar(50),
  material_descr nvarchar(30),
  codigo_ticket varchar(10),
  dia bit,
  primary key clustered(venda_id, contador_item)
)
as 
begin  
  if isnull(@dia, dbo.fn_eh_venda_dia(@venda_id)) = 1
    insert @tbl
    select 
      i.venda_id,
      i.maquina_id,
      i.dt_contabil,
      i.modo_venda_id,
      i.contador_item,
      i.func_logado_id,
      i.material_id,
      i.ponto_venda_id,
      i.praca_id,
      i.func_cancelou_id,
      i.func_transferiu_id,
      i.qtd,
      i.vl_preco,
      i.func_lancou_id,
      i.vl_preco_original,
      i.codigo_situacao,
      i.motivo_cancelamento_id,
      i.imprimiu,
      i.exportado,
      i.dt_hr_lancamento,
      i.func_autorizou_id,
      i.dt_hr_cancelamento,
      i.bn_fechamento,
      i.lote_id,
      i.status,
      i.dt_alt,
      i.baixa_efetuada,
      i.classe_id,
      i.ticket_origem,
      i.observacoes,
      i.vl_servico_calculado,
      i.vl_servico_informado,
      i.local_entrega,
      i.venda_origem,
      i.api_key,
      i.combo_id,
      i.combo_obs,
      i.indice,
      i.codigo,
      i.descricao,
      i.local_producao_id,
      i.item_id,
      i.versao,
      i.dispositivo_utilizado,
      i.perfil_impressao_id,
      i.classe_rodizio_id,
      i.transferido,
      i.desconto_id,
      i.desconto_estrategia,
      i.vl_desconto,
      i.slot_indice,
      i.arredondamento,
      i.situacao,
      i.cancelado,
      i.valido,
      i.vl_total,
      i.hr_lancamento,
      v.numero_venda,
      ponto_venda = pv.nome,
      modo_venda = mv.nome,
      material_descr = mt.descricao,
      codigo_ticket = v.codigo_ticket,
      dia = 1
    from venda_item i with (nolock)    
    join venda v with (nolock) on v.venda_id = i.venda_id
    left join ponto_venda pv with (nolock) on  pv.id = i.ponto_venda_id
    join modo_venda mv with (nolock) on mv.id = i.modo_venda_id
    join material mt with (nolock) on mt.id = i.material_id
    where i.venda_id = @venda_id
  else
    insert @tbl
    select 
      i.venda_id,
      i.maquina_id,
      i.dt_contabil,
      i.modo_venda_id,
      i.contador_item,
      i.func_logado_id,
      i.material_id,
      i.ponto_venda_id,
      i.praca_id,
      i.func_cancelou_id,
      i.func_transferiu_id,
      i.qtd,
      i.vl_preco,
      i.func_lancou_id,
      i.vl_preco_original,
      i.codigo_situacao,
      i.motivo_cancelamento_id,
      i.imprimiu,
      i.exportado,
      i.dt_hr_lancamento,
      i.func_autorizou_id,
      i.dt_hr_cancelamento,
      i.bn_fechamento,
      i.lote_id,
      i.status,
      i.dt_alt,
      i.baixa_efetuada,
      i.classe_id,
      i.ticket_origem,
      i.observacoes,
      i.vl_servico_calculado,
      i.vl_servico_informado,
      i.local_entrega,
      i.venda_origem,
      i.api_key,
      i.combo_id,
      i.combo_obs,
      i.indice,
      i.codigo,
      i.descricao,
      i.local_producao_id,
      i.item_id,
      i.versao,
      i.dispositivo_utilizado,
      i.perfil_impressao_id,
      i.classe_rodizio_id,
      i.transferido,
      i.desconto_id,
      i.desconto_estrategia,
      i.vl_desconto,
      i.slot_indice,
      i.arredondamento,
      i.situacao,
      i.cancelado,
      i.valido,
      i.vl_total,
      i.hr_lancamento,
      v.numero_venda,
      ponto_venda = pv.nome,
      modo_venda = mv.nome,
      material_descr = mt.descricao,
      codigo_ticket = v.codigo_ticket,
      dia = 0
    from venda_item_geral i with (nolock)    
    join venda_geral v with (nolock) on v.venda_id = i.venda_id
    left join ponto_venda pv with (nolock) on  pv.id = i.ponto_venda_id
    join modo_venda mv with (nolock) on mv.id = i.modo_venda_id
    join material mt with (nolock) on mt.id = i.material_id 
    where i.venda_id = @venda_id  

  return
end
go
