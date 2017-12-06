if exists(select * from grupo_funcionario where grupo_id = -999)
  return

set IDENTITY_INSERT grupo_funcionario ON
insert into grupo_funcionario
(grupo_id, nome, sistema, dt_alt) values
(-999,'SUPORTE', 1, GetDate())
set IDENTITY_INSERT grupo_funcionario OFF
