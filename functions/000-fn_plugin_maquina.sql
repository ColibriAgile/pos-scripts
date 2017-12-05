if object_id ('fn_plugin_maquina') is not null
  drop function fn_plugin_maquina
go

create function fn_plugin_maquina (@plugin varchar(100), @sistema bit = 0)
returns table
as
return
(
  select
    ativo = cast(
      case @sistema
        when 0 then isnull(p.ativo, 0)
        else 1
      end as bit
    ),
    maquina_id = id,
    maquina = m.nome,
    plugin = p.nome
  from maquina m
  left join plugin_maquina p on 
    p.maquina_id = m.id and
    lower(p.nome) = lower(@plugin)
)
go