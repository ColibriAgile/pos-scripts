if (object_id('fn_sequencia_venda') is not null)
  drop function fn_sequencia_venda
go

create function fn_sequencia_venda(@tipovenda int)
returns smallint
as
begin
  declare @sequencia smallint

  select @sequencia = curr_value
  from seq_sequencia
  where sequence_name = dbo.fn_nome_sequencia_venda(@tipovenda)

  return @sequencia
end
go
