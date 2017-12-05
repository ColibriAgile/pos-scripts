if object_id('sp_refazer_saldo_clientes') is not null
  drop procedure sp_refazer_saldo_clientes
go

create procedure sp_refazer_saldo_clientes(@operacaoID uniqueidentifier)
as begin

  declare @penduras table (cliente_id uniqueidentifier, dt_hr_pendura datetime)
    
  insert @penduras
  select p.cliente_id, p.dt_hr_pendura
  from pendura p with(nolock)
  where p.operacao_id = @operacaoID
    
  declare 
    @cliente_id uniqueidentifier,
    @dt_pendura date 
    
  while exists (select * from @penduras)
  begin
    select top 1 @cliente_id = cliente_id, @dt_pendura = dt_hr_pendura 
    from @penduras
   
    exec dbo.sp_ajustar_saldo_cliente @cliente_id, @dt_pendura
  
    delete from @penduras
    where cliente_id = @cliente_id
  end
end