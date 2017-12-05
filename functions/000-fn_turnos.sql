if (object_id('fn_datas_recebimento') is not null)
  drop function fn_datas_recebimento
go

if (object_id('fn_turnos') is not null)
  drop function fn_turnos
go

create function fn_turnos
(
  @func_id varchar(5),
  @dt_contabil_ini datetime,
  @dt_contabil_fim datetime,
  @apenas_ultimo_fechamento bit,
  @turno_id int = 0
)
returns @tbl table
(
  turno_id int  
)

as
begin
  if @turno_id > 0 
  begin
    insert @tbl (turno_id)
    values (@turno_id)
    return
  end


  if @apenas_ultimo_fechamento = 1
    insert @tbl
    select top(1)
      c.turno_id      
    from turno c
    where c.func_id = case when @func_id > 0 then @func_id else c.func_id end
      and c.dt_contabil between @dt_contabil_ini and @dt_contabil_fim
    order by turno_id desc
  else
    insert @tbl
    select
      c.turno_id
    from turno c
    where c.func_id = case when @func_id > 0 then @func_id else c.func_id end
      and c.dt_contabil between @dt_contabil_ini and @dt_contabil_fim
  return
end


