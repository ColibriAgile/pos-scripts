if object_id('dbo.sp_apagar_trocos') is not null
  drop procedure dbo.sp_apagar_trocos
go

create procedure dbo.sp_apagar_trocos
  @operacao_id uniqueidentifier 
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
      
    delete dbo.movimento_caixa
    where movimento_caixa_id = @id
  end
end
go
