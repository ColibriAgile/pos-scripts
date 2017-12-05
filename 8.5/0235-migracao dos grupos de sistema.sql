exec dbo.sp_apagar_relacionamentos 'grupo_funcionario', 'grupo_id'
go

set identity_insert grupo_funcionario on
go

if not exists (select * from grupo_funcionario where grupo_id < 0)
  update grupo_funcionario
  set nome = nome + 'tmp'
  where sistema = 1
go

if not exists (select * from grupo_funcionario where grupo_id < 0)
  insert grupo_funcionario (grupo_id, nome, sistema, dt_alt) values
    (-1, 'SUPER USUARIO', 1, getdate()),
    (-2, 'GERENTE', 1, getdate()),
    (-3, 'CAIXA', 1, getdate()),
    (-4, 'GARÇOM', 1, getdate())
go

set identity_insert grupo_funcionario off
go

update funcionario set
  grupo_id = -grupo_id
where grupo_id in (1, 2, 3, 4)
go

delete from acesso
where grupo_id in (1, 2, 3, 4)
go

delete grupo_funcionario
where grupo_id in (1, 2, 3, 4)
go

