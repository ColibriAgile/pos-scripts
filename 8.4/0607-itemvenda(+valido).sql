if exists(
  select * 
  from syscolumns 
  where name = 'valido' 
    and id = object_id('itemvenda')
) return

alter table itemvenda 
  drop column transferido

exec('
    alter table itemvenda 
      add transferido bit not null default 0
')

exec('
    update itemvenda set transferido = 1
    where st_cancelado = ''T''

    update itemvenda set st_cancelado = ''N''
    where st_cancelado = ''T''

    alter table itemvenda 
      add valido as (CONVERT([bit],case when st_cancelado = ''N'' and transferido = 0 then 1 else 0 end)) 
')

if exists(
  select * 
  from syscolumns 
  where name = 'valido' 
    and id = object_id('itemvendageral')
) return 

exec sp_apagarcampo 'itemvendageral', 'transferido'

exec('
    alter table itemvendageral 
      add transferido bit not null default 0
')
exec('
    update itemvendageral set transferido = 1
    where st_cancelado = ''T''

    update itemvendageral set st_cancelado = ''N''
    where st_cancelado = ''T''

    alter table itemvendageral 
      add valido as (CONVERT([bit],case when st_cancelado = ''N'' and transferido = 0 then 1 else 0 end)) 
')
