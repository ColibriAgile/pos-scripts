if dbo.fn_existe('dbo.fn_eh_venda_dia') = 1
  drop function dbo.fn_eh_venda_dia
go

create function fn_eh_venda_dia(@venda_id uniqueidentifier)
returns bit
as
begin
  if exists(
    select venda_id 
    from venda with (nolock)
    where venda_id = @venda_id)
      return 1
  
  return 0
end
