if object_id('dbo.sp_apagar_trocos') is not null
  drop procedure dbo.sp_apagar_trocos
go

create procedure dbo.sp_apagar_trocos
  @operacao_id uniqueidentifier,
  @cancelar bit = 0,
  @func_id int = null,
  @func_autorizou_id int = null
as
begin
  declare @ids table
  (
    id int not null primary key identity(1,1),
    operacao_id int not null
  )
  declare
    @id int,
    @currentrow int,
    @rowstoprocess int

  insert into @ids (operacao_id)
  select
    movimento_caixa_id
  from dbo.movimento_caixa with (nolock)
  where operacao_id = @operacao_id
    and meio_pagamento_id < 0

  set @rowstoprocess = @@rowcount      

  set @currentrow = 0
  while @currentrow < @rowstoprocess
  begin
    set @currentrow = @currentrow + 1

    select
      @id = operacao_id
    from @ids
    where id = @currentrow
      
    if (@cancelar = 0)
      delete dbo.movimento_caixa
      where movimento_caixa_id = @id
    else
      update dbo.movimento_caixa with (rowlock)
      set
        cancelado = 1,
        func_cancelou_id = @func_id,
        func_autorizou_id = @func_autorizou_id
      where movimento_caixa_id = @id
  end
end
go
