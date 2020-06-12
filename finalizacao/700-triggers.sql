if (object_id('maquina_i') is not null)
  drop trigger dbo.maquina_i
go

create trigger dbo.maquina_i 
  on dbo.maquina 
  after insert
as 
begin

  set nocount on;

  declare @id int
  declare @maquinas as table (id int not null)

  insert into @maquinas
  select distinct(id) from inserted
  
  while exists(select id from @maquinas)
  begin
    select @id=id 
    from @maquinas
    
    exec sp_padronizar_maquina @id
    
    delete @maquinas 
    where id=@id
  end

end
go
