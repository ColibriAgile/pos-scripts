if object_id('fn_obter_saldo_conta_assinada') is not null
  drop function fn_obter_saldo_conta_assinada
go

if object_id('fn_saldo_cliente') is not null
  drop function fn_saldo_cliente
go

create function fn_saldo_cliente (@clienteID uniqueidentifier, @data datetime = null) returns decimal(19, 4)
as
begin
  declare 
    @valor decimal(19, 4),
    @dataEstupidamenteFuturaParaNaoTerProblema datetime = '21000101'

  select top(1) @valor = isnull(saldo, 0)
  from dbo.pendura
  where cliente_id = @clienteID
    and cancelado <> 1
    and dt_hr_pendura <= isnull(@data, @dataEstupidamenteFuturaParaNaoTerProblema)
  order by
    ordem desc

  return isnull(@valor, 0)
end
