if (object_id('sp_mapa_ticket') is not null)
  drop procedure sp_mapa_ticket
go
----------------------------------------------------------------------------------------
create procedure sp_mapa_ticket(@modo_venda_id int, @intervalo int, @estados varchar(100), @func_atendeu_id int = 0, @usa_praca int = 0)
as 
begin
  set nocount on

  if (object_id('tempdb..#tmp') is not null)
    drop table #tmp

  select
    estado = case
      when (@intervalo > 0) and (t.estado = 'consumindo') and (h.dt_hr_ultimo_consumo < dateadd(mi, -@intervalo, GETDATE())) then 'sem consumo recente'
      when o.cancelada = 1 then 'cancelado'
      else t.estado      
    end
    ,t.ticket_id
    ,t.ticket_pai_id
    ,t.modo_venda_id
    ,t.codigo
    ,t.codigo_pai
    ,t.ativo
    ,t.apelido
    ,t.pct_servico
    ,t.venda_id
    ,o.operacao_id
    ,ov.vl_subtotal_itens
    ,situacao
    ,o.dt_contabil
    ,t.dt_hr_abertura
    ,qtd_fechamentos
    ,vl_limite
    ,dt_hr_ultimo_consumo
    ,ov.vl_subtotal_para_servico
    ,ov.vl_subtotal_para_desconto
    ,t.dt_alt
    ,t.praca_id
    ,c.regiao_id
    ,t.cliente_id
    ,t.perfil_id
    ,t.limite_consumo
    ,func_atendeu_id
    ,atendente_nome = cast(f.codigo as varchar(3)) + ' - ' + f.nome
    ,o.vl_total
    ,m.vl_recebido
    ,ov.paga
    ,h.codigo_situacao
    ,permite_reserva
    ,t.saiu
    ,t.pre_pago
    ,t.retirada
  into #tmp
  from ticket t
  left join dbo.venda h on h.venda_id = t.venda_id
  left join dbo.operacao o on o.operacao_id = h.operacao_id
  left join dbo.operacao_venda ov on ov.operacao_id = o.operacao_id
  left join cliente c with (nolock) on (c.id = h.cliente_id)
  left join regiao r with (nolock) on (r.id = c.regiao_id)
  left join funcionario f with (nolock) on (h.func_atendeu_id = f.id)
  left join 
  (
    select 
      operacao_id, 
      vl_recebido = sum(vl_recebido) 
    from movimento_caixa with (nolock)
    where cancelado = 0
    group by operacao_id
  ) m on m.operacao_id = o.operacao_id

  where t.modo_venda_id = @modo_venda_id
    and t.ativo = 1
    and 
    (
      (@func_atendeu_id = 0) or 
      (func_atendeu_id = @func_atendeu_id) or 
      (
        @usa_praca = 1 and
        t.praca_id in 
        (
          select praca_id
          from atendente_praca p
          where (p.func_id = @func_atendeu_id)
        )
      )
    )
  order by 
    case 
      when codigo_pai is not null then codigo_pai 
      else t.codigo 
    end, 
    t.codigo

  declare @sql nvarchar(1000) = 
'
select *
from #tmp
where estado in '+@estados+ ' 
  and ticket_id is not null 
order by 
  case 
    when codigo_pai > 0 then codigo_pai 
    else codigo 
  end, 
  codigo
';

  execute sp_executesql @sql;
  set nocount off
end
