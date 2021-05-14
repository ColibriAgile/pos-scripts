if dbo.fn_existe('dbo.pre_pagamento') = 0
  return;

update operacao_venda set
  troco_para = vl_total,
  intencao_pagamento = intencao
from 
(
  select 
    operacao_id, 
    vl_total = sum(vl_recebido),
    intencao = case min(meio_pagamento_id)
      when 1 then 1
      when 4 then 4
      else case min(m.tipo_tef) when 'V' then 3 else 2 end 
    end
  from pre_pagamento p
  join meio_pagamento m on p.meio_pagamento_id = m.id
  where meio_pagamento_id > 0
  group by operacao_id
) x
where operacao_venda.operacao_id = x.operacao_id