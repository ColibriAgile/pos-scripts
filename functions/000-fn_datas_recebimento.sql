if (object_id('fn_datas_recebimento') is not null)
  drop function fn_datas_recebimento
go

create function fn_datas_recebimento
(
  @func_id varchar(5),
  @dt_contabil_ini datetime,
  @dt_contabil_fim datetime,
  @apenas_ultimo_fechamento bit,
  @turno_id int = 0
)
returns @tbl table
(
  dt_hr_pagamento_ini datetime,
  dt_hr_pagamento_fim datetime
)

as
begin

  declare
    @dt_hr_pagamento_ini datetime,
    @dt_hr_pagamento_fim dateTime
    
  if @turno_id > 0 begin
    select
      @dt_hr_pagamento_ini = c.dt_hr_abertura,
      @dt_hr_pagamento_fim = isnull(c.dt_hr_fechamento, getdate())
    from turno c
    where c.turno_id = @turno_id
  end

  else if @apenas_ultimo_fechamento = 1
    select
      top(1)
      @dt_hr_pagamento_ini = c.dt_hr_abertura,
      @dt_hr_pagamento_fim = isnull(c.dt_hr_fechamento, getdate())
    from turno c
    where c.func_id = case when @func_id > 0 then @func_id else c.func_id end
      and c.dt_contabil between @dt_contabil_ini and @dt_contabil_fim
    order by turno_id desc

  else
    select
      @dt_hr_pagamento_ini = min(c.dt_hr_abertura),
      @dt_hr_pagamento_fim = max(isnull(c.dt_hr_fechamento, getdate()))
    from turno c
    where c.func_id = case when @func_id > 0 then @func_id else c.func_id end
      and c.dt_contabil between @dt_contabil_ini and @dt_contabil_fim

  insert @tbl
  (dt_hr_pagamento_ini, dt_hr_pagamento_fim) values
  (@dt_hr_pagamento_ini, @dt_hr_pagamento_fim)

  return
end


