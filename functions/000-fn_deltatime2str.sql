if (object_id('fn_deltatime2str') is not null)
  drop function fn_deltatime2str
go

create function fn_deltatime2str (
  @delta datetime, 
  @dtDia bit, 
  @dtHor bit, 
  @dtMin bit, 
  @dtSeg bit, 
  @useColon bit=1
)
returns varchar(15)
begin

declare
  @ret varchar(15),
  @aux float,
  @d int,
  @h int,
  @m int,
  @s int

  select 
    @d = 0, 
    @h = 0, 
    @m = 0, 
    @s = 0, 
    @aux = cast(@delta as float),
    @ret = ''

--Calculo do numero de dias
  if (@dtDia = 1) begin
    if (@dtHor <> 1)  set @d = round(@aux,0)
    else set @d = floor(@aux);
    set @aux= @aux - @d;
  end

--Calculo do numero de horas
  if (@dtHor = 1) begin
    set @aux = @aux * 24
    if (@dtMin = 1) set @h = floor(@aux)
    else begin
      set @h = round(@aux,0)
      if (@h >= 24) and (@dtDia = 1) begin
        set @d = @d + 1
        set @h = @h - 24
      end
    end
    set @aux = (@aux - @h) / 24
  end

--Calculo do numero de minutos
  if (@dtMin = 1) begin
    set @aux = @aux * (24 * 60)
    if (@dtSeg = 1) set @m = floor(@aux)
    else begin
      set @m = round(@aux,0)
      if (@m >= 60) and (@dtHor = 1) begin
        set @h = @h + 1
        set @m = @m - 60
      end
    end
    set @aux = (@aux - @m) / (24 * 60)
  end

--Calculo do numero de segundos
  if (@dtSeg = 1) begin
    set @aux = @aux * (24 * 60 * 60)
    set @s = round(@aux,0)
    if (@s >= 60) begin
      set @m = @m + 1
      set @s = @s - 60
    end
  end

--Formatação dos dias
  if (@dtDia = 1) set @ret = @ret + cast(@d as varchar) + 'd'


--Formatação das horas
  if (@dtHor = 1) begin
    if (@dtDia = 1) set @ret = @ret + Replace(Str(@h,2,0),' ','0')
    else set @ret = @ret + cast(@h as varchar)
    set @ret = @ret + 'h'
  end

--Formatação dos minutos
  if (@dtMin = 1) begin
    if (@dtHor = 1) set @ret = @ret + Replace(Str(@m,2,0),' ','0')
    else set @ret = @ret + cast(@m as varchar)
    set @ret = @ret + 'm'
  end

--Formatação dos segundos
  if (@dtSeg = 1) begin
    if (@dtMin = 1) set @ret = @ret + Replace(Str(@s,2,0),' ','0')
    else set @ret = @ret + cast(@s as varchar)
    set @ret = @ret + 's'
  end

--Troca   
  if (@useColon = 1) begin
    set @ret = Replace(@ret,'h',':')
    set @ret = Replace(@ret,'m',':')
    set @ret = Replace(@ret,'s',':')
    set @ret = Substring(@ret,1,len(@ret)-1)
  end

  return(@ret)
end
go
