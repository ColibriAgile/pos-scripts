dbo.sp_apagar_defaults 'maquina', 'log_detalhado'
go

alter table dbo.maquina 
add constraint df_maquina$log_detalhado 
default 1 for log_detalhado
go

update maquina set log_detalhado = 1
