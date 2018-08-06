update pendura
set 
  cancelado = 1,
  obs = 'Cancelado por script devido à falha no pagamento'
where pendura_id in 
(
  select p.pendura_id
  from pendura as p 
  left join movimentocaixageral as m on 
    m.operacao_id = p.operacao_id and
    m.vl_recebido = abs(p.vl_total)
  left join movimentocaixa as md on 
    md.operacao_id = p.operacao_id and
    md.vl_recebido = abs(p.vl_total)
  where p.vl_total < 0
    and md.vl_recebido is null
    and md.vl_recebido is null
    and p.cancelado = 0
)
go

exec sp_ajustasaldocliente 
go



