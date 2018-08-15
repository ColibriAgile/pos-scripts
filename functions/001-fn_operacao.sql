if object_id ('dbo.fn_operacao') is not null
    drop function dbo.fn_operacao
go

create function dbo.fn_operacao(@operacao_id uniqueidentifier, @dia bit=null)
returns @tbl table
(
  operacao_id uniqueidentifier,
  tipo varchar(15),
  vl_total numeric(15, 2),
  cancelada bit,
  maquina_id smallint,
  dt_contabil date,
  dt_alt datetime,
  descricao varchar(150),
  func_logado_id smallint,
  func_cancelou_id smallint,
  func_autorizou_id smallint,
  dt_hr_cancelamento datetime,
  comprovante varchar(20),
  comprovante_chave varchar(150),
  comprovante_status varchar(20),
  comprovante_ressalva varchar(250),
  dia bit
)
as 
begin  
  if isnull(@dia, dbo.fn_eh_operacao_dia(@operacao_id)) = 1
    insert @tbl
    select 
      o.operacao_id,
      tipo,
      vl_total,
      cancelada,
      maquina_id,
      dt_contabil,
      dt_alt,
      descricao,
      func_logado_id,
      func_cancelou_id,
      func_autorizou_id,
      dt_hr_cancelamento,
      comprovante = c.numero,
      comprovante_chave = c.chave,
      comprovante_status = c.[status],
      comprovante_ressalva = c.ressalva,
      dia = 1
    from dbo.operacao o with (nolock)
	left join dbo.comprovante c on c.operacao_id = o.operacao_id
    where o.operacao_id = @operacao_id
  else
    insert @tbl
    select 
      o.operacao_id,
      tipo,
      vl_total,
      cancelada,
      maquina_id,
      dt_contabil,
      dt_alt,
      descricao,
      func_logado_id,
      func_cancelou_id,
      func_autorizou_id,
      dt_hr_cancelamento,
      comprovante = c.numero,
      comprovante_chave = c.chave,
      comprovante_status = c.[status],
      comprovante_ressalva = c.ressalva,
      dia = 0
    from operacao_geral o with (nolock) 
    left join dbo.comprovante_geral c on c.operacao_id = o.operacao_id
    where o.operacao_id = @operacao_id  

  return
end
go
