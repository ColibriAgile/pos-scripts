alter table dbo.cliente
alter column dt_validade_desconto date null

alter table dbo.cliente
alter column dt_validade_cartao date null

alter table dbo.cliente
alter column dt_validade_conta date null

alter table dbo.cliente
alter column dt_cadastro date null

exec dbo.sp_renomear 'dbo.cliente.dt_primeira_compra', 'dt_hr_primeira_compra', 'column'
exec dbo.sp_renomear 'dbo.cliente.dt_ultima_compra', 'dt_hr_ultima_compra', 'column'
