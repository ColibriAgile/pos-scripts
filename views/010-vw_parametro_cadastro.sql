if (object_id('vw_paramCadastro') is not null)
  drop view vw_paramCadastro
go

if (object_id('vw_parametro_cadastro') is not null)
  drop view vw_parametro_cadastro
go

create view vw_parametro_cadastro
as
select
  modo_venda_id = isnull(pm.modo_venda_id, 0),
  categ = isnull(mv.codigo +'.'+ dbo.fn_capitalize(mv.nome,0), p.categoria),
  sub_categ = case len(p.subcategoria)
    when 0 then 'Geral'
    else p.subcategoria
  end,
  descr = p.descr,
  detalhes = isnull(p.detalhes, descr),
  cod = p.codigo,
  valor = isnull(pm.valor, case ltrim(isnull(p.valor,'')) when '' then p.valor_default else p.valor end),
  valor_default,
  tipo_param,
  tipo_valor,
  lista,
  valor_min,
  valor_max,
  mascara,
  altera_com_periodo_aberto,
  list_sql,
  dll
from parametro p
left join parametro_modo pm on
  pm.codigo = p.codigo and
  pm.visivel = 1
left join modo_venda mv on mv.id = pm.modo_venda_id
where p.visivel = 1
go

if object_id('tu_param') is not null
  drop trigger tu_param
go

create trigger tu_param
   on  dbo.vw_parametro_cadastro
   instead of update
as
begin
	-- set nocount on added to prevent extra result sets from
	-- interfering with select statements.
	set nocount on;

    --Se for uma configuração geral atualiza a tabela parametro
    if (select modo_venda_id from inserted) = 0
      update parametro set valor = inserted.valor
      from inserted
      where codigo = inserted.cod

    update parametro_modo set valor = inserted.valor
    from inserted
    where codigo = inserted.cod
      and parametro_modo.modo_venda_id = inserted.modo_venda_id

end
go
