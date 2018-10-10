if (object_id('sp_posicao_caixa') is not null)
  drop procedure sp_posicao_caixa
go

create procedure sp_posicao_caixa (@maquina_id int, @func_id int)
as

  declare @troco_dinheiro money;
  declare @troco_contravale money;

  set @troco_dinheiro =
    (select isnull(sum(vl_recebido),0)
     from dbo.movimento_caixa m with(nolock)
     where (m.maquina_id = @maquina_id)
       and (m.func_recebeu_id = @func_id)
       and (isnull(m.cancelado, 0) = 0)
       and meio_pagamento_id = -1)


  set @troco_contravale =
    (select isnull(sum(vl_recebido),0)
     from dbo.movimento_caixa m with(nolock)
     where (m.maquina_id = @maquina_id)
       and (m.func_recebeu_id = @func_id)
       and (isnull(m.cancelado, 0) = 0)
       and meio_pagamento_id = -3)


  select
    id = m.meio_pagamento_id,
    valor = isnull(sum(vl_recebido),0) -
    case meio_pagamento_id
      when 1 then @troco_dinheiro
      when 3 then @troco_contravale
      else 0
    end
  from movimento_caixa m with(nolock)
  where (m.maquina_id = @maquina_id)
    and (m.func_recebeu_id = @func_id)
    and (isnull(m.cancelado, 0) = 0)
    and meio_pagamento_id > 0
  group by m.meio_pagamento_id

go

