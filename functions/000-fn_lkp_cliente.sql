if (object_id('fn_lkp_cliente') is not null)
  drop function fn_lkp_cliente
go

create function fn_lkp_cliente (@ativo bit, @inativo bit, @conta bit)
returns table
as
return
  select 
    c.id, 
    c.ativo, 
    c.conta, 
    c.nome, 
    c.dt_validade_conta, 
    c.identificacao, 
    c.limite_conta, 
    c.telefone,
    c.tipo_id,
    tipo_cliente = t.nome
  from cliente c
  left join tipo_cliente t on (c.tipo_id = t.id)
  where ((c.ativo = 1 and @ativo = 1) or (c.ativo = 0 and @inativo = 1))
    and ((@conta = 0) or (@conta = 1 and c.conta = @conta))

go
