if object_id('fn_obter_saldo_conta_assinada') is not null
  drop function fn_obter_saldo_conta_assinada
go

if object_id('fn_saldo_cliente') is not null
  drop function fn_saldo_cliente
go

create function fn_saldo_cliente (@cliente_id uniqueidentifier, @data datetime = null) returns money
as
begin
  declare @valor money

   select top 1 @valor = isnull(saldo, 0)
   from pendura with(nolock)
   where cliente_id = @cliente_id
     and cancelado <> 1
     and dt_hr_pendura <= isnull(@data, getdate())
   order by
     dt_hr_pendura desc,
     ordem desc

  return isnull(@valor, 0)
end
