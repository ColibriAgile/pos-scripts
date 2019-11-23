if dbo.fn_existe('dbo.turno.func_fechou_id') = 1
  return

alter table dbo.turno 
add func_fechou_id int null

exec sp_executesql @stmt=
'
update dbo.turno
set func_fechou_id = func_id
where dt_hr_fechamento is not null
'
go