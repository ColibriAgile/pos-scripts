--drop table impressora
if object_id('impressora') is not null return
create table dbo.impressora
(
    id int identity not null,
    nome as (marca + ' '+ modelo),
    marca varchar(50) not null,
    modelo varchar(50) not null,
    sistema bit not null default 0,
    foto image null,
    colunas int not null,
    normal varchar(50) null,
    comprimido varchar(50) null,
    descomprimido varchar(50) null,
    enfatizado varchar(50) null,
    desenfatizado varchar(50) null,
    expandido varchar(50) null,
    desexpandido varchar(50) null,
    gaveta varchar(50) null,
    cortador varchar(150) null,
    eject varchar(150) null,
    cor varchar(50) null,
    salto integer null,
    liga_autenticacao varchar(50) null,
    desliga_autenticacao varchar(50) null,
    qrcode varchar(200) null,
    fimqrcode varchar(200) null,
    barcode varchar(200) null,
    fimbarcode varchar(200) null,
    inicio varchar(200) null,
    fim varchar(200) null,
    dt_alt datetime not null default getdate(),
    dispositivo_id int null,
    constraint pk_impressora primary key (id)
)
go

if object_id('dispositivo') is null return
delete configio
where periferico_id = (select id from periferico where nome = 'LASER')
  or perifericobackup_id = (select id from periferico where nome = 'LASER')

delete dbo.periferico
where nome = 'LASER'

delete dbo.dispositivo
where nm_dispositivo = 'LASER'

update dbo.dispositivo
set marca = 'Sigtron',
  modelo = 'Genérica'
where nm_dispositivo = 'SIGTRON'

update dbo.dispositivo
set marca = 'QUATTRO',
  modelo = 'Genérica'
where nm_dispositivo = 'QUATTRO'

update dbo.dispositivo
set marca = 'Citzen',
  modelo = 'CBM-231'
where nm_dispositivo = 'Citizen CBM-231'

update dbo.dispositivo
set marca = 'Citzen',
  modelo = 'IDP3540'
where nm_dispositivo = 'CITIZEN IDP3540'

update dbo.dispositivo
set marca = 'Mecaf',
  modelo = 'IM402TP'
where nm_dispositivo = 'MECAF IM402TP'

update dbo.dispositivo
set marca = 'Mecaf',
  modelo = 'Genérica'
where nm_dispositivo = 'MECAF'

update dbo.dispositivo
set marca = 'Fujitsu',
  modelo = 'FT-510'
where nm_dispositivo = 'FUJTSU FT-510'

update dbo.dispositivo
set marca = 'Epson',
  modelo = 'TM U300C'
where nm_dispositivo = 'EPSON - TM U300C'

update dbo.dispositivo
set marca = 'Bematech',
  modelo = 'MP-20CI'
where nm_dispositivo = 'BEMATECH'

update dbo.dispositivo
set marca = 'Bematech',
  modelo = 'MP-2100TH'
where nm_dispositivo = 'BEMATECH TERMICA'

update dbo.dispositivo
set marca = 'Star',
  modelo = 'TSP'
where nm_dispositivo = 'star tsp'
go

insert dbo.impressora (
  marca, modelo, colunas, dispositivo_id
)
select
  isnull(marca, nm_dispositivo),
  isnull(modelo, ''),
  colunas,
  dispositivo_id
from dbo.dispositivo
where bn_impressora = 1
order by marca
go


if object_id('ri_dispositivo__ponto_impressao$dispositivo_id') is null return
alter table ponto_impressao
drop constraint ri_dispositivo__ponto_impressao$dispositivo_id
go

if object_id('ri_dispositivo__ponto_impressao$dispositivo_backup_id') is null return
alter table ponto_impressao
drop constraint ri_dispositivo__ponto_impressao$dispositivo_backup_id
go


if not exists(
  select *
  from syscolumns
  where name = 'dispositivo_id'
    and id = object_id('ponto_impressao')
) return
exec sp_rename 'ponto_impressao.dispositivo_id', 'impressora_id'
exec sp_rename 'ponto_impressao.dispositivo_backup_id', 'impressora_backup_id'
go

if object_id('dispositivo') is null return
update dbo.ponto_impressao
  set impressora_id = impressora.id
from impressora
where ponto_impressao.impressora_id = impressora.dispositivo_id

update dbo.ponto_impressao
  set impressora_backup_id = impressora.id
from impressora
where ponto_impressao.impressora_backup_id = impressora.dispositivo_id
go



