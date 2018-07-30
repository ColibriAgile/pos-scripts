if (object_id('sp_inserir_parametro') is not null)
  drop procedure sp_inserir_parametro
go

create procedure sp_inserir_parametro
(
  -- obrigatórios
  @codigo varchar(50),
  @valor_default varchar(100),
  --opcionais
  @categoria varchar(50) = '',
  @subcategoria varchar(50) = '',
  @descr varchar(250) = '',
  @tipo_valor varchar(15) = '',
  @tipo_param char(1) = '',
  @modovenda varchar(20) = '',
  @detalhes text = null,
  @visivel bit = 1,
  @lista text = null,
  @valor_min varchar(100) = null,
  @valor_max varchar(100) = null,
  @mascara varchar(100) = null,
  @list_sql text = null,
  @dll varchar(150) = null,
  @altera_com_periodo_aberto bit = 1
)
as
set nocount on
begin try

  begin tran
    declare
      @erro nvarchar(4000),
      @severidade int,
      @id int

    if (object_id('#auxmodo') is not null)
      drop table #auxmodo

    select
      mododevenda = cod
    into #auxmodo
    from fn_list2lines(@modovenda, 1)

    if not exists(
      select 1
      from parametro with(rowlock)
      where codigo = @codigo
    )
    insert into parametro with(rowlock)
    (
      codigo,
      categoria,
      subcategoria,
      descr,
      detalhes,
      visivel,
      tipo_valor,
      tipo_param,
      lista,
      valor_min,
      valor_max,
      mascara,
      valor,
      valor_default,
      list_sql,
      dll,
      altera_com_periodo_aberto
    )
    values
    (
      @codigo,
      @categoria,
      @subcategoria,
      @descr,
      @detalhes,
      @visivel,
      @tipo_valor,
      @tipo_param,
      @lista,
      @valor_min,
      @valor_max,
      @mascara,
      @valor_default,
      @valor_default,
      @list_sql,
      @dll,
      @altera_com_periodo_aberto
    )
    else
      update parametro with(rowlock)
      set
        codigo = @codigo,
        categoria = @categoria,
        subcategoria = @subcategoria,
        descr = @descr,
        detalhes = @detalhes,
        visivel = @visivel,
        tipo_valor = @tipo_valor,
        tipo_param = @tipo_param,
        lista = @lista,
        valor_min = @valor_min,
        valor_max = @valor_max,
        mascara = @mascara,
        valor = case when @modovenda <> '' then @valor_default else valor end,
        valor_default = @valor_default,
        list_sql = @list_sql,
        dll = @dll,
        altera_com_periodo_aberto = @altera_com_periodo_aberto
      where codigo = @codigo

    if @modovenda <> ''
    begin
      while exists(select * from #auxmodo)
      begin

        select top 1
          @id = mododevenda
        from #auxmodo

        if not exists (select * from parametro_modo where codigo = @codigo and modo_venda_id = @id)
          insert into parametro_modo
          (codigo, modo_venda_id, valor, visivel) values
          (@codigo, @id, @valor_default, @visivel)

        delete #auxmodo
        where mododevenda = @id
      end
    end

    commit tran

end try
begin catch
  rollback

  select
    @erro = error_message(),
    @severidade = error_severity()

  raiserror(@erro, @severidade, 1)

end catch
set nocount off
go
