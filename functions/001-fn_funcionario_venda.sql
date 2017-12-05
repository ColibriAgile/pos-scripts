if object_id ('dbo.fn_funcionario_venda') is not null
    drop function dbo.fn_funcionario_venda
go

create function dbo.fn_funcionario_venda(@venda_id uniqueidentifier, @dia bit = null)
returns @tbl table
(
  funcionario_iniciou_id int,
  funcionario_iniciou_nome varchar(40),
  funcionario_terminou_id int,
  funcionario_terminou_nome varchar(40),
  atendente_iniciou_id int,
  atendente_iniciou_nome varchar(40),
  atendente_terminou_id int,
  atendente_terminou_nome varchar(40),
  dia bit
) as
begin
  declare
    @funcionario_iniciou_id int,
    @funcionario_iniciou_nome varchar(40),
    @funcionario_terminou_id int,
    @funcionario_terminou_nome varchar(40),
    @atendente_iniciou_id int,
    @atendente_iniciou_nome varchar(40),
    @atendente_terminou_id int,
    @atendente_terminou_nome varchar(40)

  if isnull(@dia, dbo.fn_eh_venda_dia(@venda_id)) = 1
  begin
    select top 1
      @funcionario_iniciou_id = func_logado_id,
      @atendente_iniciou_id = func_lancou_id,
      @funcionario_iniciou_nome = f.nome,
      @atendente_iniciou_nome = g.nome,
      @dia = 1
    from venda_item with (nolock)
    left join funcionario f with (nolock) on f.id = func_logado_id
    left join funcionario g with (nolock) on g.id = func_lancou_id
    where venda_id = @venda_id
    order by contador_item

    select top 1
      @funcionario_terminou_id = func_logado_id,
      @atendente_terminou_id = func_lancou_id,
      @funcionario_terminou_nome = f.nome,
      @atendente_terminou_nome = f.nome
    from venda_item with (nolock)
    left join funcionario f with (nolock) on f.id = func_logado_id
    left join funcionario g with (nolock) on g.id = func_lancou_id
    where venda_id = @venda_id
    order by contador_item desc
  end
  else
  begin
    select top 1
      @funcionario_iniciou_id = func_logado_id,
      @atendente_iniciou_id = func_lancou_id,
      @funcionario_iniciou_nome = f.nome,
      @atendente_iniciou_nome = g.nome,
      @dia = 0
    from venda_item_geral with (nolock)
    left join funcionario f with (nolock) on f.id = func_logado_id
    left join funcionario g with (nolock) on g.id = func_lancou_id
    where venda_id = @venda_id
    order by contador_item

    select top 1
      @funcionario_terminou_id = func_logado_id,
      @atendente_terminou_id = func_lancou_id,
      @funcionario_terminou_nome = f.nome,
      @atendente_terminou_nome = f.nome
    from venda_item_geral with (nolock)
    left join funcionario f with (nolock) on f.id = func_logado_id
    left join funcionario g with (nolock) on g.id = func_lancou_id
    where venda_id = @venda_id
    order by contador_item desc
  end

  insert @tbl values (
    @funcionario_iniciou_id,
    @funcionario_iniciou_nome,
    @funcionario_terminou_id,
    @funcionario_terminou_nome,
    @atendente_iniciou_id,
    @atendente_iniciou_nome,
    @atendente_terminou_id,
    @atendente_terminou_nome,
    @dia
    )

  return
end
go
