if object_id('fn_dt_ultimo_credito_cliente') is not null
  drop function fn_dt_ultimo_credito_cliente
go
create function fn_dt_ultimo_credito_cliente (@clienteID uniqueidentifier)
  returns datetime
as 
begin
  declare @data datetime

  select top 1 @data = dt_hr_pendura
  from pendura as p with (nolock)
  where cliente_id = @clienteID
    and cancelado <> 1
    and vl_total > 0
  order by
    dt_hr_pendura desc,
    ordem desc
  
  return isnull(@data,0)
end