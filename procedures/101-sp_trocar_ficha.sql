if (object_id('sp_trocar_ficha') is not null)
  drop procedure sp_trocar_ficha
go

create procedure sp_trocar_ficha(
  @ticketIdDeOrigem uniqueidentifier,
  @ticketIdDeDestino uniqueidentifier
)
as
begin try

  declare
    @erro nvarchar(4000),
    @severidade int,
    @codigoOrigem varchar(10),
    @codigoDestino varchar(10)

    set @codigoOrigem = ''
    set @codigoDestino = ''

    select @codigoOrigem = cast(codigo as varchar(10))
    from ticket with (nolock)
    where ticket_id = @ticketIdDeOrigem
      and modo_venda_id = 4

    if (@codigoOrigem = '') begin
      raiserror ('Ficha de origem não encontrada.', 16, 1)
      return
    end

    select @codigoDestino = cast(codigo as varchar(10))
    from ticket with (nolock)
    where ticket_id = @ticketIdDeDestino
      and modo_venda_id = 4

    if (@codigoDestino = '') begin
      raiserror ('Ficha de destino não encontrada.', 16, 1)
      return
    end

  begin tran
    update ticket with (rowlock)
    set
      estado = orig.estado,
      venda_id = orig.venda_id,
      cliente_id = orig.cliente_id,
      perfil_id = orig.perfil_id,
      pct_servico = orig.pct_servico,
      limite_consumo = orig.limite_consumo,
      apelido = orig.apelido
    from
    (
      select *
      from ticket with (nolock)
      where ticket_id = @ticketIdDeOrigem
    ) orig
    where ticket.ticket_id = @ticketIdDeDestino

    update venda with (rowlock)
    set
      codigo_ticket = @codigoDestino
     where codigo_ticket = @codigoOrigem
       and modo_venda_id = 4

    update ticket with (rowlock)
    set
      estado = 'livre',
      venda_id = null,
      cliente_id = null,
      perfil_id = null,
      limite_consumo = null,
      apelido = null,
      ativo = 0
    where ticket_id = @ticketIdDeOrigem
  commit tran

end try

begin catch
  if @@trancount > 0 rollback

  select
    @erro = 'Falha ao trocar ficha: ' + error_message(),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)
end catch
go
