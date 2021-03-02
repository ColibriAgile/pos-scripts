if (dbo.fn_existe('dbo.venda_item.situacao') = 1)
  alter table dbo.venda_item
  drop column situacao
go

alter table dbo.venda_item
add situacao as
(
  case [codigo_situacao] 
    when 'N' then 'normal' 
    when 'A' then 'cancelado antes da produção' 
    when 'T' then 'transferido' 
    when 'D' then 'cancelado depois da produção' 
    when 'E' then 'estornado'
    else 'desconhecida'
  end
)
go 

if (dbo.fn_existe('dbo.venda_item_geral.situacao') = 1)
  alter table dbo.venda_item_geral
  drop column situacao
go

alter table dbo.venda_item_geral
add situacao as
(
  case [codigo_situacao] 
    when 'N' then 'normal' 
    when 'A' then 'cancelado antes da produção' 
    when 'T' then 'transferido' 
    when 'D' then 'cancelado depois da produção' 
    when 'E' then 'estornado'
    else 'desconhecida'
  end
)
go 
