if (object_id('sp_abrir_periodo') is not null)
  drop procedure sp_abrir_periodo
go

create procedure sp_abrir_periodo(@dt datetime, @funcid integer)
as
begin
  declare @qt integer

/*Try..catch incluido para interromper a execuçao
  de outros comandos se algum apresentar falha*/
  begin try
    begin transaction
    
    select @qt = count(*)
    from periodo
    where dt_hr_fechamento is null

    if @qt = 0 
    begin

      insert into periodo
      (func_abriu_id, dt_contabil, dt_hr_abertura) values
      (@funcid, @dt, getdate())

      --Atualizando o cache
      update cache.data_contabil
      set valor = @dt

      if @@rowcount = 0
        insert cache.data_contabil 
        (valor) values 
        (@dt)

      --Atualizando data contabil dos movimentos pendentes
      update venda_item with(rowlock)
      set dt_contabil = @dt

      update venda with(rowlock)
      set dt_contabil = @dt

      update operacao with(rowlock)
      set dt_contabil = @dt
    end

    commit
  end try

  begin catch
    if @@trancount > 0 rollback

    declare
      @errmsg nvarchar(4000),
      @errseverity int

    select
      @errmsg = 'Falha na abertura do período. ' + error_message(),
      @errseverity = error_severity()

    raiserror(@errmsg, @errseverity, 1)
  end catch
end
