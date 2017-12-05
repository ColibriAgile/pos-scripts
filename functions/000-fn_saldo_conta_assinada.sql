if object_id('fn_saldo_conta_assinada') is not null
  drop function fn_saldo_conta_assinada
go

create function fn_saldo_conta_assinada()
returns table
as
return
(
  with tbl as
  (
    select
      cliente_id,
      dt_hr_pendura = max(dt_hr_pendura)
    from pendura
    group by cliente_id
  )
  select *
  from
  (
    select
      p.cliente_id,
      saldo,
      indice = row_number() over (partition by p.cliente_id order by p.dt_hr_pendura desc, ordem desc)
    from pendura p
    join tbl on
      tbl.cliente_id = p.cliente_id and
      tbl.dt_hr_pendura = p.dt_hr_pendura
  ) t
  where t.indice = 1
)
go
