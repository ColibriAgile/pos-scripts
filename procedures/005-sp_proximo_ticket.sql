if (object_id('sp_proximo_ticket') is not null)
  drop procedure sp_proximo_ticket
go

create procedure sp_proximo_ticket(@modo_venda smallint, @clienteid uniqueidentifier)
as
begin
  set nocount on
  declare
    @valor int = 1,
    @ticket_id uniqueidentifier;

  declare @valores table
  (
    valor smallint
  );

  declare @ticket table
  (
    ticket_id uniqueidentifier
  )

  /* Incrementa o valor do cache e verifica se o ticket com o código gerado está disponível. Tenta novamente até conseguir um ticket livre. */
  while 1 = 1
  begin
    update cache.proximo_ticket with (rowlock)
    set
      valor = valor + 1,
      dt_alt = default
    output inserted.valor into @valores
    where modo_venda = @modo_venda

    /*Se já existe o registro para o modo de venda, obtem-se o valor, senão, cria-se com o valor igual a 1. */
    if @@rowcount > 0
      select
        @valor = max(valor)
      from @valores
    else
      insert cache.proximo_ticket
      (
        valor,
        modo_venda,
        dt_alt
      )
      values
      (
        1,
        @modo_venda,
        default
      );

    /*Se o valor está disponível, encerra o loop. */
    if not exists (select * from ticket t with (nolock) where t.codigo = @valor and t.modo_venda_id = @modo_venda)
      break
  end

  /* Cria o ticket gerado. */
  insert into ticket
  (
    modo_venda_id,
    estado,
    codigo,
    praca_id,
    ativo,
    pct_servico,
    cliente_id
  )
  output inserted.ticket_id into @ticket (ticket_id)
  values
  (
    @modo_venda,
    'livre',
    @valor,
    0,
    1,
    0,
    @clienteid
  )

  /* Retorna o ticket gerado. */
  select top 1 @ticket_id = ticket_id from @ticket

  declare @sql nvarchar(1000)

  set @sql = '
  select top 1
    *
  from ticket with (nolock)
  where ticket_id = ''{' + cast(@ticket_id as varchar(40)) + '}''';

  execute sp_executesql @sql;
  set nocount off
end
go
