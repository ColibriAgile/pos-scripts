if object_id ('dbo.fn_operacao_venda') is not null
    drop function dbo.fn_operacao_venda
go

create function dbo.fn_operacao_venda(@operacao_id uniqueidentifier, @dia bit=null)
returns @tbl table
(
  operacao_id uniqueidentifier,
  modo_venda_id int,
  vl_consumacao numeric(15, 2),
  vl_consumacao_maxima numeric(15, 2),
  vl_desconto numeric(15, 2),
  vl_entrada numeric(15, 2),
  vl_entrada_maxima numeric(15, 2),
  pct_servico numeric(10, 5),
  vl_servico_informado numeric(15, 2),
  vl_servico numeric(15, 2),
  vl_acrescimo numeric(15, 2),
  vl_subtotal_itens numeric(15, 2),
  vl_subtotal_para_desconto numeric(15, 2),
  vl_subtotal_para_servico numeric(15, 2),
  qtd_pessoas int,
  dt_alt datetime,
  desconto_id int,
  dt_hr_expedicao datetime,
  func_expediu_id smallint,
  func_entregou_id smallint,
  consumidor varchar(1000),
  vl_taxa_de_entrega numeric(15, 2),
  vl_taxa_de_entrega_calculada numeric(15, 2),
  vl_taxa_de_entrega_informada numeric(15, 2),
  desconto varchar(20),
  pct_desconto numeric(10, 5),
  vl_diferenca_consumacao money,
  vl_outros money,
  encerrada bit,
  dt_hr_encerramento datetime,
  maquina_encerrou_id int,
  func_encerrou_id int,
  transferida bit,
  paga bit,
  dia bit,
  primary key clustered(operacao_id)
)
as 
begin  
  if isnull(@dia, dbo.fn_eh_operacao_dia(@operacao_id)) = 1
    insert @tbl
    select 
      operacao_id,
      modo_venda_id,
      vl_consumacao,
      vl_consumacao_maxima,
      vl_desconto,
      vl_entrada,
      vl_entrada_maxima,
      pct_servico,
      vl_servico_informado,
      vl_servico,
      vl_acrescimo,
      vl_subtotal_itens,
      vl_subtotal_para_desconto,
      vl_subtotal_para_servico,
      qtd_pessoas,
      dt_alt,
      desconto_id,
      dt_hr_expedicao,
      func_expediu_id,
      func_entregou_id,
      consumidor,
      vl_taxa_de_entrega,
      vl_taxa_de_entrega_calculada,
      vl_taxa_de_entrega_informada,
      desconto,
      pct_desconto,
      vl_diferenca_consumacao,
      vl_outros,
      encerrada,
      dt_hr_encerramento,
      maquina_encerrou_id,
      func_encerrou_id,
      transferida,
      paga,
      dia = 1
    from operacao_venda with (nolock)
    where operacao_id = @operacao_id
  else
    insert @tbl
    select 
      operacao_id,
      modo_venda_id,
      vl_consumacao,
      vl_consumacao_maxima,
      vl_desconto,
      vl_entrada,
      vl_entrada_maxima,
      pct_servico,
      vl_servico_informado,
      vl_servico,
      vl_acrescimo,
      vl_subtotal_itens,
      vl_subtotal_para_desconto,
      vl_subtotal_para_servico,
      qtd_pessoas,
      dt_alt,
      desconto_id,
      dt_hr_expedicao,
      func_expediu_id,
      func_entregou_id,
      consumidor,
      vl_taxa_de_entrega,
      vl_taxa_de_entrega_calculada,
      vl_taxa_de_entrega_informada,
      desconto,
      pct_desconto,
      vl_diferenca_consumacao,
      vl_outros,
      encerrada,
      dt_hr_encerramento,
      maquina_encerrou_id,
      func_encerrou_id,
      transferida,
      paga,
      dia = 0
    from operacao_venda_geral with (nolock)
    where operacao_id = @operacao_id  

  return
end
go
