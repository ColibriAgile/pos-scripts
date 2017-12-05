if dbo.fn_existe('mt.terminal.balanca_id') = 1
begin
  alter table mt.terminal add usa_balanca bit
  alter table mt.terminal drop column balanca_id
end
