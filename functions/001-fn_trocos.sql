if object_id ('dbo.fn_trocos') is not null
    drop function dbo.fn_trocos
go

create function dbo.fn_trocos(@operacao_id uniqueidentifier, @dia bit = null)
returns @tbl table 
(
  vl_troco_dinheiro money,
  vl_troco_contravale money,
  vl_troco_repique money
) as
begin
  insert @tbl
  select
    vl_troco_dinheiro = sum(case when meio_pagamento_id = -1 then vl_recebido else 0 end),
    vl_troco_contravale = sum(case when meio_pagamento_id = -2 then vl_recebido else 0 end),
    vl_troco_repique = sum(case when meio_pagamento_id = -3 then vl_recebido else 0 end)
  from dbo.fn_movimento_caixa(@operacao_id, @dia)
  where operacao_id = @operacao_id
    and isnull(cancelado, 0) = 0

  return
end
go