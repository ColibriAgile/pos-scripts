if (object_id('sp_copiar_permissao') is not null)
  drop procedure sp_copiar_permissao
go

create procedure dbo.sp_copiar_permissao(@grupo integer,@copia integer)
as
begin
   -- Copia = 0 e Grupo = 0 Cria Sem Permissões.
   -- Copia = 1 copia todas as permissões do Grupo informado.
   -- Copia = 0 e Grupo = 1 Cria Com Permissões do SUPER USUARIO.
   if @copia = 0 begin
      if @grupo = 1 begin
         insert into permissao(GrupoFunc_Id,Modulo_Id,Acesso,Incluir,Alterar,Excluir,Chave,Printer)
         select @Grupo,Modulo_Id,1,1,1,1,1,1
         from Modulo
      end else
         insert into permissao(GrupoFunc_Id,Modulo_Id,Acesso,Incluir,Alterar,Excluir,Chave,Printer)
         select @Grupo,Modulo_Id,0,0,0,0,0,0
         from permissao
         where GrupoFunc_Id = 1
   end else
      insert into permissao(GrupoFunc_Id,Modulo_Id,Acesso,Incluir,Alterar,Excluir,Chave,Printer)
      select @grupo,Modulo_Id,Acesso,Incluir,Alterar,Excluir,Chave,Printer
      from permissao
      where GrupoFunc_Id = @copia
end


go


