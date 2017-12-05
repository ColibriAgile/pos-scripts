if object_id('perfil_impressao_detalhe') is not null return

create table perfil_impressao_detalhe
(
    perfil_id int not null,
    impressao_id int null,
    local_producao_id int null,
    ponto_impressao_id int null,
    tipo as case when impressao_id is not null then 1 else 2 end, --1: Impressao, 2: Local de producao
    dt_alt datetime not null default getdate()
)


