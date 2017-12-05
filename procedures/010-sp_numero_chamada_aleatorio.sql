if object_id('dbo.sp_numero_chamada_aleatorio') is not null
  drop procedure dbo.sp_numero_chamada_aleatorio
go
      
create procedure dbo.sp_numero_chamada_aleatorio(@digitos smallint)
as
begin 
  set nocount on
  declare @range int = power(10, @digitos)
  declare @valor int = cast(rand() * @range as int) 
  declare @contador smallint = 0  
  declare @max_tentativas smallint = 10
  
  while @contador < @max_tentativas
  begin
    if not exists 
    (
      select valor from cache.numero_chamada nc with (nolock) 
      where nc.valor = @valor and nc.dt_alt > dateadd(minute, -60, getdate())
    )
    begin
      insert into cache.numero_chamada (valor, dt_alt) 
      output inserted.valor 
      values (@valor, getdate())
      break
    end
    else
      select @valor = cast(rand() * @range as int) 
    set @contador = @contador + 1 
  end
  set nocount off
  if @contador = @max_tentativas
    raiserror('Falha ao obter o número de chamada. Não há mais valores livres.', 16, 1)

end
go
