if object_id('sp_criar_tickets') is not null
    drop procedure dbo.sp_criar_tickets
go

create procedure dbo.sp_criar_tickets
    @modo int,
    @cod_inicial int,
    @cod_final int,
    @servico numeric(8, 2),
    @ativo bit,
    @pre_pago bit = 0,
    @praca_id int = null
as
    while @cod_inicial <= @cod_final
    begin
        if not exists (
           select *
           from ticket
           where modo_venda_id = @modo
             and codigo = @cod_inicial
       )
            insert into dbo.ticket
                    ( modo_venda_id,
                      estado,
                      codigo,
                      praca_id,
                      ativo,
                      pre_pago,
                      pct_servico )
            values
                    ( @modo,
                      'livre',
                      @cod_inicial,
                      @praca_id,
                      @ativo,
                      @pre_pago,
                      @servico )
        set @cod_inicial = @cod_inicial + 1
    end
go
