if object_id ('sp_inserir_conta_assinada') is not null
  drop procedure sp_inserir_conta_assinada
go

create procedure sp_inserir_conta_assinada 
(
  @clienteId uniqueidentifier, 
  @operacaoId uniqueidentifier, 
  @valor decimal(19,4), 
  @dtContabil datetime, 
  @movimentoId int
)
as
begin
  begin tran
 
  declare 
    @saldo decimal(19, 4) = dbo.fn_saldo_cliente(@clienteid, default) + @valor;

  insert into dbo.pendura 
  (
    cliente_id, 
    dt_hr_pendura, 
    vl_total, 
    operacao_id, 
    cancelado, 
    saldo, 
    dt_contabil, 
    movimento_id
  ) output inserted.pendura_id values 
  (
    @clienteId, 
    getdate(), 
    @valor, 
    @operacaoId, 
    0, 
    @saldo, 
    @dtContabil, 
    @movimentoId
  )
  commit          
end


