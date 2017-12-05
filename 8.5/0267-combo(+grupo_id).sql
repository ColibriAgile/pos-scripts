if dbo.fn_existe('dbo.combo.grupo_id') = 0 
  alter table [dbo].[combo] add grupo_id int
go

if object_id('ri_combo$grupo_id__grupo_material$id') is null
  alter table [dbo].[combo] with check 
    add constraint [ri_combo$grupo_id__grupo_material$id] foreign key(grupo_id) references [dbo].[grupo_material] ([id])
go

