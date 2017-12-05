if (object_id('fn_dia_semana') is not null)
  drop function fn_dia_semana
go

create function fn_dia_semana(@data datetime) returns varchar (20)  as
begin
  declare
    @dia int,
    @dia_ext varchar(20)

  select @dia = (datepart(dw, @data))

  if @dia=1
    set @dia_ext = 'Domingo'
  else if @dia=2
    set @dia_ext = 'Segunda-feira'
  else if @dia=3
    set @dia_ext = 'Terça-feira'
  else if @dia=4
    set @dia_ext = 'Quarta-feira'
  else if @dia=5
    set @dia_ext = 'Quinta-feira'
  else if @dia=6
    set @dia_ext = 'Sexta-feira'
  else if @dia=7
    set @dia_ext = 'Sábado'

  return @dia_ext
end
