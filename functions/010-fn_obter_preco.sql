if object_id('dbo.fn_obter_preco') is not null 
  drop function dbo.fn_obter_preco
go

create function dbo.fn_obter_preco(@material_id int, @modo_venda_id int, @dataHora datetime)
returns @tbl table
(
  preco money,
  origem varchar(100)
)
as
begin  
  declare 
    @preco money,
    @origem varchar(100)
  
  select top 1 
    @preco = preco, 
    @origem = 'tabela de preço "' +tp.nome + '"'
  from dbo.item_preco ip with (nolock)
  join dbo.tabela_preco tp on tp.id = ip.tabela_id 
  where ip.ativo = 1 
    and material_id = @material_id 
    and 
    (
      tp.id = dbo.fn_obter_tabela_vigente(@modo_venda_id, @dataHora) or 
      tp.id = dbo.fn_obter_tabela_vigente(0, @dataHora)
    )
  order by 
    tp.modo_venda desc, 
    dt_vigencia desc
   
  if @@ROWCOUNT = 0
    return    
   
  select top 1
    @preco = case tipo_promocao 
      when 'fixo' then  i.valor
      when 'perc' then @preco - (@preco * (i.valor / 100))
    end, 
    @origem = 'promoção "' +rtrim(p.descricao) +'"'
  from promocao p with (nolock)
  left join promocao_item i with (nolock) on i.promocao_id = p.id 
  left join promocao_dia d with (nolock) on d.promocao_id = p.id
  where p.ativo = 1
    and cast(@dataHora as date) between p.dt_inicio and p.dt_fim
    and cast(@dataHora as time) between d.hr_inicio and d.hr_fim
    and d.dia_semana = datepart(weekday, @datahora)
    and 
    (
      (i.tipo_item = 'ma' and i.item_id = @material_id) or
      (i.tipo_item = 'gr' and i.item_id = (select grupo_id from dbo.material where id = @material_id))
    )
    and 
    (
      (balcao = 1 and @modo_venda_id = 1) or
      (entrega = 1 and @modo_venda_id = 2) or
      (mesa = 1 and @modo_venda_id = 3) or
      (ficha = 1 and @modo_venda_id = 4) 
    )
  
  insert into @tbl
  values (@preco, @origem)
    
  return
end

go