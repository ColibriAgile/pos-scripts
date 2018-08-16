if object_id ('dbo.fn_venda') is not null
    drop function dbo.fn_venda
go

create function dbo.fn_venda(@identificador uniqueidentifier, @dia bit=null, @eh_operacao_id bit = 1)
returns @tbl table
(
  venda_id uniqueidentifier,
  dt_contabil date,
  modo_venda_id smallint,
  modo_venda_nome varchar(10),
  maquina_id smallint,
  codigo_situacao varchar(1),
  perfil_id int,
  cliente_id uniqueidentifier,
  vl_limite numeric(15, 2),
  vl_subtotal_itens numeric(15, 2),
  vl_subtotal_para_desconto numeric(15, 2),
  vl_subtotal_para_servico numeric(15, 2),
  qtd_fechamentos int,
  numero_chamada int,
  operacao_id uniqueidentifier,
  operacao_origem_id uniqueidentifier,
  dt_hr_ultimo_consumo datetime,
  dt_alt datetime,
  obs varchar(200),
  func_atendeu_id smallint,
  codigo_ticket varchar(10),
  dt_hr_abertura datetime,
  numero_venda int,
  situacao varchar(15), 
  cancelado bit,
  transferido bit,
  ticket varchar(20),
  dia bit,
  primary key clustered(venda_id)
)
as 
begin  
  if @dia is null
    if @eh_operacao_id = 1
      set @dia = dbo.fn_eh_operacao_dia(@identificador)
    else
      set @dia = dbo.fn_eh_venda_dia(@identificador)

  if @dia = 1
    insert @tbl
    select 
      venda_id,
      dt_contabil,
      modo_venda_id,
      m.nome,
      maquina_id,
      codigo_situacao,
      perfil_id,
      cliente_id,
      vl_limite,
      vl_subtotal_itens,
      vl_subtotal_para_desconto,
      vl_subtotal_para_servico,
      qtd_fechamentos,
      numero_chamada,
      operacao_id,
      operacao_origem_id,
      dt_hr_ultimo_consumo,
      dt_alt,
      obs,
      func_atendeu_id,
      codigo_ticket,
      dt_hr_abertura,
      numero_venda,
      situacao,
      cancelado,
      transferido,
      ticket,
      dia = 1
    from venda with (nolock)
    join modo_venda m with (nolock) on m.id = modo_venda_id
    where ((@eh_operacao_id = 1) and (operacao_id = @identificador))
       or ((@eh_operacao_id = 0) and (venda_id = @identificador))
  else
    insert @tbl
    select 
      venda_id,
      dt_contabil,
      modo_venda_id,
      m.nome,
      maquina_id,
      codigo_situacao,
      perfil_id,
      cliente_id,
      vl_limite,
      vl_subtotal_itens,
      vl_subtotal_para_desconto,
      vl_subtotal_para_servico,
      qtd_fechamentos,
      numero_chamada,
      operacao_id,
      operacao_origem_id,
      dt_hr_ultimo_consumo,
      dt_alt,
      obs,
      func_atendeu_id,
      codigo_ticket,
      dt_hr_abertura,
      numero_venda,
      situacao,
      cancelado,
      transferido,
      ticket,
      dia = 0
    from venda_geral with (nolock)
    join modo_venda m with (nolock) on m.id = modo_venda_id
    where ((@eh_operacao_id = 1) and (operacao_id = @identificador))
       or ((@eh_operacao_id = 0) and (venda_id = @identificador))

  return
end
go
