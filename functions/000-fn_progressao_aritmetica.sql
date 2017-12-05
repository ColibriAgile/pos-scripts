if (object_id('fn_progressao_aritmetica') is not null)
  drop function fn_progressao_aritmetica
go

create function fn_progressao_aritmetica (@valorinicial int, @incremento int, @passos int)
returns @tbl table (id int) as
begin

declare
  @valor int

  set @valor = @valorinicial
  while (@passos > 0) begin
    insert into @tbl values (@valor)
    set @passos = @passos - 1
    set @valor = @valor + @incremento
  end
  return
end
go
