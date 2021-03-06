if object_id('perfil_impressao') is not null return

create table perfil_impressao
(
    id int identity not null,
    nome varchar(50) not null,
    modo_venda int not null,
    adiar_remota bit null default 0,
    sistema bit not null default 0,
    dt_alt datetime not null default getdate(),
    constraint pk_perfil_impressao primary key (id)
)
go

exec('
if exists(
  select * 
  from dbo.perfil_impressao 
  where nome = ''(padr�o geral)''
) return 

insert dbo.perfil_impressao 
  ( nome, modo_venda, sistema )
values 
  (''(padr�o geral)'', 0, 1),
  (''(padr�o balc�o)'', 1, 1),
  (''(padr�o entrega)'', 2, 1),
  (''(padr�o mesa)'', 3, 1),
  (''(padr�o ficha)'', 4, 1)
')
go