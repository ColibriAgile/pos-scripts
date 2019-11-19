if dbo.fn_existe('dbo.turno.func_fechou_id') = 1
  return

alter table dbo.turno 
add func_fechou_id int null

exec('update dbo.turno
set func_fechou_id = func_id
where func_fechou_id is null')
go