if exists(select * from syscolumns where id = object_id('dispositivo') and name = 'cf_inicio') return

alter table dispositivo add
  cf_inicio varchar(200) null,
  cf_fim varchar(200) null,
  cf_barcode varchar(200) null,
  cf_fimbarcode varchar(200) null

go