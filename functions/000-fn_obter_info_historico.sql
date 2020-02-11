if dbo.fn_existe('dbo.fn_obter_info_historico') = 1
  drop function dbo.fn_obter_info_historico
go

create function dbo.fn_obter_info_historico(@operacao_id varchar(38), @info varchar(100))
returns table
as

return 
select top 1
  dt_hora,
  funcionario = isnull(s.nome, f.nome)
from historico_operacao
left join funcionario f on func_logado_id = f.id
left join funcionario s on func_autorizou_id = s.id
where descricao like '%'+@info+'%'
  and operacao_id = isnull(@operacao_id, operacao_id)
order by dt_hora desc

