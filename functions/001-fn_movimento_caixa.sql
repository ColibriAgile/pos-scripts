if object_id ('dbo.fn_movimento_caixa') is not null
    drop function dbo.fn_movimento_caixa
go

create function dbo.fn_movimento_caixa(@operacao_id uniqueidentifier, @dia bit=null)
returns @tbl table
(
  movimento_caixa_id int,
  meio_pagamento_id int,
  vl_recebido money,
  operacao_id uniqueidentifier,
  func_recebeu_id int,
  func_cancelou_id int,
  func_autorizou_id int,
  maquina_id int,
  cancelado bit,
  dt_hr_pagamento datetime,
  dt_alt datetime,
  cliente_id uniqueidentifier,
  identificacao varchar(20),
  dt_hr_cancelamento datetime,
  versao varchar(20),
  credenciadora varchar(50),
  autorizacao int,
  bandeira varchar(50),
  dia bit,
  primary key clustered(operacao_id, movimento_caixa_id)
)
as 
begin  
  if isnull(@dia, dbo.fn_eh_operacao_dia(@operacao_id)) = 1
    insert @tbl
    select 
      movimento_caixa_id,
      meio_pagamento_id,
      vl_recebido,
      operacao_id,
      func_recebeu_id,
      func_cancelou_id,
      func_autorizou_id,
      maquina_id,
      cancelado,
      dt_hr_pagamento,
      dt_alt,
      cliente_id,
      identificacao,
      dt_hr_cancelamento,
      versao,
      credenciadora,
      autorizacao,
      bandeira,
      dia = 1
    from movimento_caixa with (nolock)
    where operacao_id = @operacao_id
  else
    insert @tbl
    select 
      movimento_caixa_id,
      meio_pagamento_id,
      vl_recebido,
      operacao_id,
      func_recebeu_id,
      func_cancelou_id,
      func_autorizou_id,
      maquina_id,
      cancelado,
      dt_hr_pagamento,
      dt_alt,
      cliente_id,
      identificacao,
      dt_hr_cancelamento,
      versao,
      credenciadora,
      autorizacao,
      bandeira,
      dia = 0
    from movimento_caixa_geral with (nolock)
    where operacao_id = @operacao_id  

  return
end
go
