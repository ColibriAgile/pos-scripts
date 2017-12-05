if not exists(select * from sys.schemas where name = 'balanca') 
  exec('create schema balanca')
go

if dbo.fn_existe('balanca.dispositivo') = 1
  return

create table balanca.dispositivo
(
  dispositivo_id int identity not null,
  modelo varchar(100),
  baudrate int,
  databits smallint,
  stopbits smallint,
  parity smallint,
  enq tinyint,
  stx tinyint,
  etx tinyint
  constraint dispositivo_pk$id primary key clustered
  (
    dispositivo_id asc
  )with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [PRIMARY]
) on [PRIMARY]

insert balanca.dispositivo
(
  modelo,
  baudrate,
  enq,
  stx,
  etx,
  databits,
  stopbits,
  parity
) values
(
  'Toledo Prix3',   --nm_dispositivo,
  9600,             --nu_baudrate,
  5,                --nm_enq,
  2,                --nm_stx,
  3,                --nm_etx,
  8,                --nu_bits,
  1,                --nu_stop,
  0                 --nu_paridade
),
(
  'Elgin DP15 Plus',  --nm_dispositivo,
  9600,               --nu_baudrate,
  5,                  --nm_enq,
  2,                  --nm_stx,
  3,                  --nm_etx,
  8,                  --nu_bits,
  1,                  --nu_stop,
  0                   --nu_paridade
),
(
  'Urano',            --nm_dispositivo,
  9600,               --nu_baudrate,
  4,                  --nm_enq,
  27,                 --nm_stx,
  13,                 --nm_etx,
  8,                  --nu_bits,
  2,                  --nu_stop,
  0                   --nu_paridade
),
(
  'Bematech',         --nm_dispositivo,
  2400,               --nu_baudrate,
  5,                  --nm_enq,
  2,                  --nm_stx,
  3,                  --nm_etx,
  8,                  --nu_bits,
  1,                  --nu_stop,
  0                   --nu_paridade
)
go

--drop table balanca.maquinaxdispositivo
if dbo.fn_existe('balanca.balanca_terminal') = 1
  return

create table balanca.balanca_terminal
(
  maquina_id int not null,
  dispositivo_id int not null,
  porta varchar(5) null,
  constraint balanca_terminal_pk$id primary key clustered
  (
    maquina_id asc,
    dispositivo_id asc
  )with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [PRIMARY]
) on [PRIMARY]
go

if dbo.fn_existe('balanca.balanca_microterminal') = 1
  return

create table balanca.balanca_microterminal(
  microterminal_id int not null,
  dispositivo_id int not null
  constraint balanca_microterminal_pk$id primary key clustered
  (
    microterminal_id asc,
    dispositivo_id asc
  )with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) on [PRIMARY]
) on [PRIMARY]

go

exec dbo.sp_apagar_tabela 'balanca.maquinaxdispositivo'
