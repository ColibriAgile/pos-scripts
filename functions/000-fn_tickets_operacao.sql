if (object_id('fn_tickets_operacao') is not null)
  drop function fn_tickets_operacao
go

create function fn_tickets_operacao(@operacaoId varchar(40))
returns varchar(1000)
begin

  declare
    @ret varchar(1000),
    @ticket varchar(20)


  declare cur cursor for
    select codigo_ticket
    from venda v
    join operacao_venda o on v.operacao_id = o.operacao_id
    where o.operacao_id = @operacaoId
    order by v.numero_venda

  set @ret = ''
  open cur
  fetch next from cur into @ticket
  while (@@fetch_status = 0) begin
    if (Len(@ret) > 0) select @ret = @ret + ', '
    select @ret = @ret + @ticket
    fetch next from cur into @ticket
  end
  close cur
  deallocate cur

  if (@ret <> '') return @ret

  declare cur cursor for
    select codigo_ticket
    from venda_geral v
    join operacao_venda_geral o on v.operacao_id = o.operacao_id
    where o.operacao_id = @operacaoId
    order by v.numero_venda

  set @ret = ''
  open cur
  fetch next from cur into @ticket
  while (@@fetch_status = 0) begin
    if (Len(@ret) > 0) select @ret = @ret + ', '
    select @ret = @ret + @ticket
    fetch next from cur into @ticket
  end
  close cur
  deallocate cur

  return @ret
end

GO


