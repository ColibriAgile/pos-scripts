if (object_id('fn_datas') is not null)
  drop function fn_datas
go

create function fn_datas (@d1 datetime, @d2 datetime)
returns @tbl table
(
  dt datetime
)
as
begin

  while (@d1 <= @d2) begin
    insert into @tbl values (@d1)
    set @d1 = @d1 + 1
  end

  return
end
go


