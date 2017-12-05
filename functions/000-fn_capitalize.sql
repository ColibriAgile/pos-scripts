if (object_id('fn_capitalize') is not null)
  drop function fn_capitalize
go
  
create function fn_capitalize (@text varchar(4000), @todas bit = 0)
returns varchar(4000)
as
begin
  declare   
    @counter int, 
    @length int,
    @char char(1),
    @textnew varchar(4000)

  set @text = rtrim(@text)
  if len(@text) = 0 return @text
  
  set @text = lower(@text)
  set @length = len(@text)
  set @counter = 1

  set @text = upper(left(@text, 1) ) + right(@text, @length - 1) 
  if not (@todas = 1) return @text

  while @counter <> @length 
  begin
    select @char = substring(@text, @counter, 1)
    
    if (@char in (space(1), '_', ',', '.', '\', '/', '(', ')'))
    begin
      set @textnew = left(@text, @counter)  + upper(substring(@text, @counter+1, 1)) + right(@text, (@length - @counter) - 1)
      set @text   = @textnew
    end

    set @counter = @counter + 1
  end

  return rtrim(@text)
end
go