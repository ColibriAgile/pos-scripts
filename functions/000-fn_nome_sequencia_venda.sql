if (object_id('fn_nome_sequencia_venda') is not null)
  drop function fn_nome_sequencia_venda
go

create function fn_nome_sequencia_venda(@tipovenda int)
returns varchar(50)
as
begin
  declare @seqNome varchar(50)
  set @seqNome = 'venda tipo '+rtrim(ltrim(str(@tipovenda)))
  return @seqNome
end
go
