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
  dia bit,
  primary key clustered(operacao_id)
)
as 
begin  
  if isnull(@dia, dbo.fn_eh_operacao_dia(@operacao_id)) = 1
    insert @tbl
    select 
      operacao_id,
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
      comprovante,
      comprovante_chave,
      comprovante_status,
      comprovante_ressalva,
      dia = 1
    from operacao with (nolock)
    where operacao_id = @operacao_id
  else
    insert @tbl
    select 
      operacao_id,
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
      comprovante,
      comprovante_chave,
      comprovante_status,
      comprovante_ressalva,
      dia = 0
    from operacao_geral with (nolock) 
    where operacao_id = @operacao_id  

  return
end
go
