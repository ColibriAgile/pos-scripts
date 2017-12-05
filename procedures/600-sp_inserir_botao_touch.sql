if  (object_id('sp_inserir_botao_touch') is not null)
  drop procedure sp_inserir_botao_touch
go

create procedure sp_inserir_botao_touch
(
  @id integer,
  @img varchar(50),
  @titulo varchar(50),
  @balcao bit,
  @entrega bit,
  @mesa bit,
  @ficha bit,
  @atalho varchar(20),
  @atalho2 varchar(20),
  @trans varchar(50)
)
as
begin

  if not exists(select acao_id from acao_touch where acao_id = @id)
    insert into acao_touch
    (
      acao_id, 
      imagem, 
      caption, 
      balcao, 
      entrega, 
      mesa, 
      ficha, 
      atalho, 
      atalho2, 
      transicao
    ) values
    (
      @id,      
      @img,   
      @titulo,    
      @balcao,   
      @entrega,   
      @mesa,   
      @ficha,   
      @atalho, 
      @atalho2, 
      @trans
    )
  else
    update acao_touch
    set
      imagem = @img,
      caption = @titulo,
      balcao = @balcao,
      entrega = @entrega,
      mesa = @mesa,
      ficha = @ficha,
      atalho = @atalho,
      atalho2 = @atalho2,
      transicao = @trans
    where acao_id = @id

end
go
