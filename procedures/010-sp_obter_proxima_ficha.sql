if object_id('sp_obter_proxima_ficha') is not null
  drop procedure sp_obter_proxima_ficha
go
-----------------------------------------------------
create procedure sp_obter_proxima_ficha(@modoVenda integer, @codigoInicial integer, @abre integer)
as 
begin
  declare
    @tmp table (codigo int)
  
  declare 
    @codigo integer,
    @estado varchar(20) = 'livre',
    @dthrAbertura datetime = null;

  begin try
    if (@abre = 1) 
    begin
      set @estado = 'consumindo'
      set @dthrAbertura = getdate()
    end

    /*
      Garante que retorne o menor código livre
      usando o order by codigo
    */
    ;with ticket_ordenado as (
      select top(1) 
        estado,
        dt_hr_abertura,
        codigo,         
        ticket_id
      from ticket with (nolock)
      where modo_venda_id = @modoVenda
        and estado = 'livre'
        and codigo >= @codigoInicial
        and ativo = 1
      order by codigo
    )
    update ticket_ordenado with (readpast)
    set
      estado = @estado,
      dt_hr_abertura = @dthrAbertura
    output inserted.codigo
    into @tmp
    
    select top 1 @codigo = codigo 
    from @tmp
    
    if @codigo > 0
      return @codigo

    update ticket with (readpast)
    set
      estado = 'livre',
      perfil_id = null,
      venda_id = null,
      cliente_id = null,
      dt_hr_abertura = null,
      limite_consumo = null
    where estado = 'checkout'      

    ;with ticket_ordenado as (
      select top(1) 
        estado,
        dt_hr_abertura,
        codigo,         
        ticket_id
      from ticket with (nolock)
      where modo_venda_id = @modoVenda
        and estado = 'livre'
        and codigo >= @codigoInicial
        and ativo = 1
      order by codigo
    )
    update ticket_ordenado with (readpast)
    set
      estado = @estado,
      dt_hr_abertura = @dthrAbertura
    output inserted.codigo
    into @tmp    

    select top 1 @codigo = codigo 
    from @tmp
    return @codigo
  end try
  begin catch
    declare
      @errmsg nvarchar(4000),
      @errseverity int

    select
      @errmsg = 'Erro ao obter proxima ficha. ' + error_message(),
      @errseverity = error_severity()

    raiserror(@errmsg, @errseverity, 1)
  end catch
end
