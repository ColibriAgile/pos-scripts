if object_id('sp_movclasse') is not null 
  drop procedure [dbo].[sp_movclasse]
go

create procedure [dbo].[sp_movclasse](
    @erro integer output,
    @tipo char(1),
    @loja integer,
    @classid integer output,
    @movclassid integer,
    @classe bit,
    @itmaterial integer,
    @itclasse integer,
    @ordem integer,
    @itcombo integer
  )
as
begin
  
  if (@itmaterial = 0) set @itmaterial = null
  if (@itclasse = 0) set @itclasse = null
  if (@itcombo = 0) set @itcombo = null

  if @tipo = 'I' begin
    select 
      @movclassid = isnull(max(movclasse_id)+1,1)
    from movclasse
    where classe_id = @classid
    
    insert into movclasse
    (loja_id, classe_id, movclasse_id, bn_classe, it_material, it_classe, nu_ordem, it_combo) values
    (@loja, @classid, @movclassid, @classe, @itmaterial, @itclasse, @ordem, @itcombo)
    
    select @erro=@@error
  end
  else if @tipo = 'U' begin
    update movclasse
    set 
      bn_classe = @classe,
      it_material = @itmaterial,
      it_classe = @itclasse,
      it_combo = @itcombo,
      nu_ordem = @ordem
    where loja_id = @loja
      and classe_id = @classid
      and movclasse_id = @movclassid
    
    select @erro=@@error
  end
  else begin
    delete movclasse
    where loja_id = @loja 
      and movclasse_id = @movclassid 
      and classe_id = @classid
      
    select @erro=@@error
  end
end