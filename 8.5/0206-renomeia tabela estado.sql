if exists(select * from syscolumns where name = 'sigla' and id = object_id('estado')) return

exec sys.sp_rename @objname = 'estado.sg_estado',
                    @newname = 'sigla',
                    @objtype = 'column'

exec sys.sp_rename @objname = 'estado.nm_estado',
                    @newname = 'nome',
                    @objtype = 'column'

