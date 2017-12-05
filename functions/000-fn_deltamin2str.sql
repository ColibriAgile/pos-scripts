if (object_id('fn_deltamin2str') is not null)
  drop function fn_deltamin2str
go

create function fn_deltamin2str (@delta int, @usecolon bit = 0)
returns varchar(15)
begin

declare
  @ret varchar(15),
  @aux float,
  @h int,
  @m int

  if (@delta = 0) return('')

  select 
    @h = 0, 
    @m = 0, 
    @ret = ''

--Calculo do numero de horas
  set @aux = @delta / 60.0
  set @h = floor(@aux)
  set @m = round((@aux - @h) * 60,0)
    
--Formatação em 999h99m
  set @ret = @ret + cast(@h as varchar) + 'h'
  set @ret = @ret + Replace(Str(@m,2,0),' ','0') + 'm'

--Troca   
  if (@useColon = 1) begin
    set @ret = Replace(@ret,'h',':')
    set @ret = Substring(@ret,1,len(@ret)-1)
  end

  return(@ret)
end
go
