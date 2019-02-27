update venda set
  origem = 'pdv'
where venda_id in (
  select vi.venda_id
  from venda_item vi
  where isnull(vi.api_key, '') = ''
    and vi.contador_item = 1
  group by vi.venda_id
)
go

update venda set
  origem = 'cis'
where origem is null
go

update venda_geral set
  origem = 'pdv'
where venda_id in (
  select vi.venda_id
  from venda_item_geral vi
  where isnull(vi.api_key, '') = ''
    and vi.contador_item = 1
  group by vi.venda_id
)
go

update venda_geral set
  origem = 'cis'
where origem is null
go