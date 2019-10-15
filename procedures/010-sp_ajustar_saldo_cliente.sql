if object_id ('sp_ajustar_saldo_cliente') is not null
  drop procedure sp_ajustar_saldo_cliente
go

create procedure sp_ajustar_saldo_cliente (@clienteID uniqueidentifier = null, @dtIni datetime = null)
as
begin

  declare @tbl table
    (
      cliente_id uniqueidentifier,
      pendura_id uniqueidentifier,
      dt_hr_pendura datetime,
      vl_lanc money,
      saldo money,
      cancelado char(1),
      ordem int
    )

  /*Coleta dados na tabela temporária.*/
  begin try

    insert @tbl
    (
      cliente_id,
      pendura_id,
      dt_hr_pendura,
      vl_lanc,
      saldo,
      cancelado,
      ordem
    )
    select
      cliente_id,
      pendura_id,
      dt_hr_pendura,
      vl_lanc = vl_total,
      saldo,
      cancelado,
      ordem
    from pendura with(nolock)
    where ((cliente_id = @clienteID) or (@clienteID is null))
      and dt_hr_pendura >= isnull(@dtIni, '19000101')
    order by
      cliente_id,
      dt_hr_pendura,
      ordem

    /*Utiliza um cursor para calcular e atualiar o saldo diário.*/
    declare
      @auxID uniqueidentifier = '00000000-0000-0000-0000-000000000000',
      @cliID uniqueidentifier = '00000000-0000-0000-0000-000000000000',
      @penduraID uniqueidentifier,
      @valor money,
      @saldo money,
      @cancelado char(1)

    declare curpendura cursor
    for
      select cliente_id, pendura_id, vl_lanc, cancelado
      from @tbl
      order by
        cliente_id,
        dt_hr_pendura,
        ordem
    for
      update of pendura_id

    open curpendura
    fetch next from curpendura into @cliID, @penduraID, @valor, @cancelado

    while (@@fetch_status <> -1) begin
      if (@@fetch_status <> -2) begin

        if (@auxID <> @cliID)
          select @saldo = dbo.fn_saldo_cliente(@cliID, @dtIni) , @auxID = @cliID

        if @cancelado <> '1'
          set @saldo = @saldo + @valor

        update pendura with(rowlock)
        set saldo = @saldo
        where pendura_id = @penduraID
      end

      fetch next from curpendura into @cliID, @penduraID, @valor, @cancelado
    end

    close curpendura
    deallocate curpendura

  end try

  begin catch

    declare
      @erro nvarchar(4000),
      @severidade int

    select
      @erro = error_message(),
      @severidade = error_severity()

    raiserror(@erro, @severidade, 1)

  end catch
end

