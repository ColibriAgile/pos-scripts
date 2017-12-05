if dbo.fn_existe('dbo.fn_eh_operacao_dia') = 1
  drop function dbo.fn_eh_operacao_dia
go

create function fn_eh_operacao_dia(@operacao_id uniqueidentifier)
returns bit
as
begin
  if exists(
    select operacao_id 
    from operacao with (nolock)
    where operacao_id = @operacao_id)
      return 1
  
  return 0
end
