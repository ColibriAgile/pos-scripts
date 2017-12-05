alter table dbo.historicocliente
drop constraint pk_historicocliente

alter table dbo.historicocliente
drop column hist_id

alter table dbo.historicocliente
add hist_id int identity

alter table dbo.historicocliente
add constraint pk_historicocliente PRIMARY KEY CLUSTERED  ([hist_id]) ON [PRIMARY]