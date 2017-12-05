if object_id ('sp_cancelar_conta_assinada') is not null
  drop procedure sp_cancelar_conta_assinada
go

create procedure sp_cancelar_conta_assinada (@penduraID uniqueidentifier, @obs varchar(100))
as
begin
    
  update pendura with(rowlock) set
    cancelado = 1,
    obs = @obs
  where pendura_id = @penduraID
    
	
  declare 
    @cliente_id uniqueidentifier,
    @dt_pendura date 
    
  select @cliente_id = p.cliente_id, @dt_pendura = p.dt_hr_pendura
  from pendura p with(nolock)
  where p.pendura_id = @penduraID
    
  exec dbo.sp_ajustar_saldo_cliente @cliente_id, @dt_pendura

end