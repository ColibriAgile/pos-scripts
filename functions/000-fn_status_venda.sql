if (object_id('fn_status_venda') is not null)
  drop function fn_status_venda
go

create function fn_status_venda(@operacaoId varchar(40))
returns varchar(20)
begin

declare
  @ret varchar(20)

  set @ret = ''
  select top 1 @ret = v.situacao
  from venda v
  where v.operacao_id = @operacaoId

  if (@ret <> '') return @ret

  select top 1 @ret = v.situacao
  from venda_geral v
  where v.operacao_id = @operacaoId

  return @ret
end
GO


