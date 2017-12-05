if (object_id('sp_incluir_impressao') is not null)
  drop procedure sp_incluir_impressao
go

create procedure sp_incluir_impressao
(
  @nome varchar(50),
  @balcao bit,
  @mesa bit,
  @ficha bit,
  @entrega bit,
  @pasta varchar(100)
)
as
set nocount on
  
  if not exists(select * from impressao where nome = @nome) 
    insert into impressao (nome, balcao, mesa, ficha, entrega, pasta)
    values (@nome, @balcao, @mesa, @ficha, @entrega, @pasta)      
  else begin
    update impressao set 
      balcao = @balcao,
      mesa = @mesa,
      ficha = @ficha,
      entrega = @entrega,
      pasta = @pasta
    where nome = @nome
    
    declare @id integer = (select id from dbo.impressao where nome = @nome)  
    
    -- remove as impressoes do perfil de impressao caso o modo de venda tenha mudado
      if (@balcao = 0) 
        delete from dbo.perfil_impressao_detalhe
        where impressao_id = @id
          and perfil_id in (select id from dbo.perfil_impressao where modo_venda = 1)

      if (@entrega = 0) 
        delete from dbo.perfil_impressao_detalhe
        where impressao_id = @id
          and perfil_id in (select id from dbo.perfil_impressao where modo_venda = 2)

      if (@mesa = 0) 
        delete from dbo.perfil_impressao_detalhe
        where impressao_id = @id
          and perfil_id in (select id from dbo.perfil_impressao where modo_venda = 3)

      if (@ficha = 0) 
        delete from dbo.perfil_impressao_detalhe
        where impressao_id = @id
          and perfil_id in (select id from dbo.perfil_impressao where modo_venda = 4)
        
      if (@balcao = 1 or @entrega = 1 or @mesa = 1 or @ficha = 1) 
        delete from dbo.perfil_impressao_detalhe
        where impressao_id = @id
          and perfil_id in (select id from dbo.perfil_impressao where modo_venda = 0)
  end   
  
go