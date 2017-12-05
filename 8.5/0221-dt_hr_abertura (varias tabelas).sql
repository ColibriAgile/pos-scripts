exec sp_renomear 'ticket.dt_abertura','dt_hr_abertura', 'column'
go

exec sp_renomear 'turno.dt_abertura','dt_hr_abertura', 'column'
exec sp_renomear 'turno.dt_fechamento','dt_hr_fechamento', 'column'
go

exec sp_renomear 'periodo.dt_abertura','dt_hr_abertura', 'column'
exec sp_renomear 'periodo.dt_fechamento','dt_hr_fechamento', 'column'
go

exec sp_renomear 'venda.dt_abertura','dt_hr_abertura', 'column'
exec sp_renomear 'venda_geral.dt_abertura','dt_hr_abertura', 'column'
go
