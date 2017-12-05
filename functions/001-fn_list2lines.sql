/* $log:  169224: 001-fn_list2lines.sql */
/*
    Rev 1.3    21/07/2009 16:44:48  pitty
  > inclusão do log
*/

if (object_id('fn_list2lines') is not null)
  drop function fn_list2lines
go

create function fn_list2lines (@list as varchar(5000), @string as int = 0)
returns @tbl table (id int, cod varchar(20)) as 
begin

declare 
  @pos int,
  @id int,
  @cod varchar(20)

/*Se for string retira as aspas se tiver */
  if (@string = 1) begin
    while (charindex('''',@list,0) > 0) begin
      select @pos = charindex('''',@list,0)
      select @list = substring(@list,0,@pos) + substring(@list,@pos+1,len(@list))
    end
  end

  while (len(@list) > 0) begin
    select @pos = charindex(',', @list, 0) 
    if (@pos > 0) begin
      if (@string = 0) 
        select @id = cast(substring(@list,1,@pos-1) as int)
      else 
        select @cod = substring(@list,1,@pos-1)       
      select @list = substring(@list,@pos+1,len(@list))
    end
    else begin
      if (@string = 0) 
        select @id = cast(@list as int)
      else
        select @cod = @list
      set @list = ''
    end
    if (@string = 0) insert into @tbl values (@id, null)
    else insert into @tbl values (null, @cod)
  end

  return
end
GO

