exec sp_apagar_constraint 'auth_group_modulo_modulo_id_3ab00aae_uniq'
go
exec sp_apagar_constraint 'ix_auth_group_modulo$modulo_id$grupo_id'
go
alter table auth_group_modulo alter column modulo_id varchar(36) not null 
go
alter table [auth_group_modulo] add constraint [ix_auth_group_modulo$modulo_id$grupo_id] unique ([modulo_id], [grupo_id])
go
update django_content_type set app_label = 'meio_pagamento', model = 'meiopagamento'
where id= 23
go