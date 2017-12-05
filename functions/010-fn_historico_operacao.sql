if (object_id('fn_historico_operacao') is not null)
  drop function fn_historico_operacao
go

create function fn_historico_operacao(@operacao_id uniqueidentifier)
returns @tbl table
(
  operacao_id uniqueidentifier,
  data date,
  dt_hora datetime,
  maquina varchar(20),
  funcionario varchar(50),
  autorizou varchar(50),
  descricao varchar(200),
  detalhe varchar(max)
)
as
begin

insert into @tbl
        (
		  operacao_id,
          data,
          dt_hora,
          maquina,
          funcionario,
		  autorizou,
		  descricao,
      detalhe
        )
select
  operacao_id,
  data = cast(h.dt_hora as date),
  h.dt_hora,
  m.nome,
  funcionario = f1.usuario,
  autorizou = 'autorizado por: ' + f2.usuario,
  descricao,
  detalhe
from dbo.historico_operacao h
join dbo.maquina m on m.id = h.maquina_id
join dbo.funcionario f1 on f1.id = h.func_logado_id
left join dbo.funcionario f2 on f2.id = h.func_autorizou_id
where operacao_id = @operacao_id
order by h.dt_hora desc

insert into @tbl
        (
		  operacao_id,
          data,
          dt_hora,
          maquina,
          funcionario,
		  autorizou,
		  descricao,
      detalhe         
        )
select
  operacao_id,
  data = cast(h.dt_hora as date),
  h.dt_hora,
  m.nome,
  funcionario = f1.usuario,
  autorizou = 'autorizado por: ' + f2.usuario,
  descricao,
  detalhe

from dbo.historico_operacao_geral h
join dbo.maquina m on m.id = h.maquina_id
join dbo.funcionario f1 on f1.id = h.func_logado_id
left join dbo.funcionario f2 on f2.id = h.func_autorizou_id
where operacao_id = @operacao_id
order by h.dt_hora desc


return

end
