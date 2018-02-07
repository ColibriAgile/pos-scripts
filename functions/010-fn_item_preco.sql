
if object_id('dbo.fn_item_preco') is not null
   drop function dbo.fn_item_preco
go

create function fn_item_preco( )
returns @itens table 
(
  material_id int not null,
  preco_geral money,
  preco_balcao money,
  preco_mesa money,
  preco_ficha money,
  preco_entrega money
)
as
begin
  declare @modo_venda int
  
  insert @itens
  (material_id)
  select m.id
  from material m
  where m.ativo = 1
    and m.venda = 1

--tabela de preço geral  
  set @modo_venda = 0
  if (dbo.fn_existe_tabela_preco(@modo_venda) = 1) 
  begin
    with tabela (mat_id, preco) as
    (
      select 
        i.material_id,
        t.preco
      from @itens i 
      left join vw_item_preco t on 
         t.modo_venda_id = @modo_venda and
         t.material_id = i.material_id and
         t.situacao = 'vigente'
    )
      update @itens
      set preco_geral = preco
      from tabela
      where material_id = tabela.mat_id
  end

--tabela de preço balcao
  set @modo_venda = 1
  if (dbo.fn_existe_tabela_preco(@modo_venda) = 1)
  begin
    with tabela (mat_id, preco) as
    (
      select 
        i.material_id,
        t.preco
      from @itens i 
      left join vw_item_preco t on 
         t.modo_venda_id = @modo_venda and
         t.material_id = i.material_id and
         t.situacao = 'vigente'
    )
      update @itens
      set preco_balcao = preco
      from tabela
      where material_id = tabela.mat_id
  end

--tabela de preço entrega
  set @modo_venda = 2
  if (dbo.fn_existe_tabela_preco(@modo_venda) = 1)
  begin
    with tabela (mat_id, preco) as
    (
      select 
        i.material_id,
        t.preco
      from @itens i 
      left join vw_item_preco t on 
         t.modo_venda_id = @modo_venda and
         t.material_id = i.material_id and
         t.situacao = 'vigente'
    )
      update @itens
      set preco_entrega = preco
      from tabela
      where material_id = tabela.mat_id
  end

--tabela de preço mesa
  set @modo_venda = 3
  if (dbo.fn_existe_tabela_preco(@modo_venda) = 1)
  begin
    with tabela (mat_id, preco) as
    (
      select 
        i.material_id,
        t.preco
      from @itens i 
      left join vw_item_preco t on 
         t.modo_venda_id = @modo_venda and
         t.material_id = i.material_id and
         t.situacao = 'vigente'
    )
      update @itens
      set preco_mesa = preco
      from tabela
      where material_id = tabela.mat_id
  end

--tabela de preço ficha
  set @modo_venda = 4
  if (dbo.fn_existe_tabela_preco(@modo_venda) = 1)
  begin
    with tabela (mat_id, preco) as
    (
      select 
        i.material_id,
        t.preco
      from @itens i 
      left join vw_item_preco t on 
         t.modo_venda_id = @modo_venda and
         t.material_id = i.material_id and
         t.situacao = 'vigente'
    )
      update @itens
      set preco_ficha = preco
      from tabela
      where material_id = tabela.mat_id
  end
  return
end
go


