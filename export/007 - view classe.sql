if object_id(N'export.classe', N'V') is not null
  drop view export.classe
go

create view [export].[classe]
as
select
  id = id,
  ativo = 1,  
  descricao = case 
    when descricao <> '' then descricao 
    else 'CLASSE ' + cast(id as varchar(5)) 
  end,
  descricao_touch = case 
    when descricao_touch <> '' then descricao_touch 
    else case 
      when descricao <> '' then descricao 
      else 'CLASSE ' + cast(id as varchar(5)) 
    end 
  end,
  imagem = imagem
from [dbo].[classe]
GO
