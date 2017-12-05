set identity_insert dbo.django_content_type on
go

insert dbo.django_content_type (id, app_label, model) values (38, N'perfil', N'perfil')
go

set identity_insert dbo.django_content_type off
go

set identity_insert dbo.auth_permission on
go

insert dbo.auth_permission (id, name, content_type_id, codename) values (106, N'can add perfil', 38, N'add_perfil')
go

insert dbo.auth_permission (id, name, content_type_id, codename) values (107, N'can change perfil', 38, N'change_perfil')
go

insert dbo.auth_permission (id, name, content_type_id, codename) values (108, N'can delete perfil', 38, N'delete_perfil')
go

set identity_insert dbo.auth_permission off
go


create table tmp_rg_xx_perfil_exceto
(
    perfil_id int not null,
    exceto nvarchar(352) null
)
go

;with tmp_perfil_execto(perfil_id, hr_inicio, hr_fim, dia_item, dias_livres) as (
    select perfil_id, hr_inicio, hr_fim, cast(left(dias_livres, charindex(',',dias_livres+',')-1) as varchar(50)), stuff(dias_livres, 1, charindex(',',dias_livres+','), '')
    from perfil
    where dias_livres > ''
    union all
    select perfil_id, hr_inicio, hr_fim, cast(left(dias_livres, charindex(',',dias_livres+',')-1) as varchar(50)), stuff(dias_livres, 1, charindex(',',dias_livres+','), '')
    from tmp_perfil_execto
    where dias_livres > ''
)

insert into tmp_rg_xx_perfil_exceto(perfil_id, exceto)
select t.perfil_id, exceto = '{'+stuff((
          select ',"' + lower(ex.dia_item), '":{"ativo":true,"ini":"' + ex.hr_inicio + '"', ',"fim":"' + ex.hr_fim + '"}'
          from tmp_perfil_execto ex
          where t.perfil_id = ex.perfil_id
          for xml path(''), type).value('.', 'nvarchar(max)'), 1, 1, '') + '}'
from tmp_perfil_execto t
group by t.perfil_id
go


create table tmp_rg_xx_perfil
(
    id int identity(1,1) not null,
    ativo bit not null default 1,
    dt_alt datetime null,
    codigo int not null,
    nome nvarchar(20) collate latin1_general_ci_ai not null,
    descricao nvarchar(50) collate latin1_general_ci_ai not null,
    vl_consumacao float not null,
    vl_entrada float not null,
    vl_limite float not null,
    protegido bit not null,
    exceto nvarchar(352) null,
    sexo nvarchar(10) not null,
    loja_id bigint null,
    rede_id bigint not null,
    sub_rede_id bigint null
)
go

set identity_insert tmp_rg_xx_perfil on
go

insert into tmp_rg_xx_perfil(id, dt_alt, codigo, nome, descricao, vl_consumacao, vl_entrada, vl_limite, protegido,  exceto,  sexo, loja_id, rede_id)
    select p.perfil_id, getdate(), p.codigo, p.nome, p.descricao, p.vl_consumacao, p.vl_entrada, p.vl_limite, p.protegido, e.exceto, lower(p.sexo), p.loja_id, 1 from perfil p
    left join tmp_rg_xx_perfil_exceto e
    on p.perfil_id= e.perfil_id
go

set identity_insert tmp_rg_xx_perfil off
go

exec sp_apagar_tabela 'perfil'
go

exec sp_apagar_tabela 'tmp_rg_xx_perfil_exceto'
go

exec sp_rename 'tmp_rg_xx_perfil', 'perfil'
go


alter table perfil add constraint pk__perfil__684a1485 primary key clustered  (id)
go

alter table dbo.perfil add constraint df_perfil$protegido default ((0)) for protegido
go

alter table dbo.perfil add constraint df_perfil$sexo default ('ambos') for sexo
go

alter table dbo.ticket  with check add  constraint ri_ticket$perfil_id__perfil$perfil_id foreign key(perfil_id)
references dbo.perfil (id)
go

alter table dbo.ticket check constraint ri_ticket$perfil_id__perfil$perfil_id
go