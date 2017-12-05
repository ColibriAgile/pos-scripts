if (object_id('sp_add_permissao') is not null) and dbo.fn_existe('dbo.modulo.nome') = 1
  drop procedure sp_add_permissao
go

if dbo.fn_existe('dbo.modulo.nome') = 1
exec('
create procedure sp_add_permissao (
  @modID integer,
  @modDescr varchar(40),
  @modTipo integer,
  @gerAtivo as bit,
  @cxaAtivo as bit,
  @gcoAtivo as bit,
  @outAtivo as bit
)
as
begin

--Cria uma linha na tabela modulo
  if not exists (select * from modulo where modulo_id = @modID)
    insert into modulo
    (modulo_id, nome, tipo) values
    (@modID, @modDescr, @modTipo)
  else
    update modulo
    set nome = @modDescr, tipo = @modTipo
    where modulo_id = @modID

--Obtem o numero da loja
  declare @lojID int
  select @lojID = IsNull(Min(loja_id),0)
  from loja

--Se houver loja cadastrada, cria as permissoes
  if (@lojID = 0) return

  declare @achou bit
  declare @grpID int
  declare cur_grupo cursor for
    select grupo_id
    from grupo_funcionario

--Percorre todos os grupos de funcionarios
  open cur_grupo
  fetch next from cur_grupo into @grpID
  while (@@fetch_status = 0) begin

    set @achou = 0
    if exists(
      select * from permissao
      where grupofunc_id = @grpID
        and modulo_id = @modID
    ) set @achou = 1

  --Insere permissões para o SUPERUSUARIO
    if (@grpID = 1) begin
      if (@achou = 0)
        insert into permissao
        (grupofunc_id, modulo_id, acesso, incluir, alterar, excluir, chave, printer) values
        (@grpID, @modID, 1, 1, 1, 1, 1, 1)
      else
        update permissao
        set acesso=1, incluir=1, alterar=1, excluir=1, chave=1, printer=1
        where grupofunc_id = @grpID
          and modulo_id = @modID
    end

  --Insere permissões para o GERENTE
    else if (@grpID = 2) begin
      if (@achou = 0)
        insert into permissao
        (grupofunc_id, modulo_id, acesso, incluir, alterar, excluir, chave, printer) values
        (@grpID, @modID, @gerAtivo, @gerAtivo, @gerAtivo, @gerAtivo, @gerAtivo, @gerAtivo)
      else
        update permissao
        set acesso=@gerAtivo, incluir=@gerAtivo, alterar=@gerAtivo, excluir=@gerAtivo, chave=@gerAtivo, printer=@gerAtivo
        where grupofunc_id = @grpID
          and modulo_id = @modID
    end

  --Insere permissões para o CAIXA
    else if (@grpID = 3) begin
      if (@achou = 0)
        insert into permissao
        (grupofunc_id, modulo_id, acesso, incluir, alterar, excluir, chave, printer) values
        (@grpID, @modID, @cxaAtivo, @cxaAtivo, @cxaAtivo, @cxaAtivo, @cxaAtivo, @cxaAtivo)
      else
        update permissao
        set acesso=@cxaAtivo, incluir=@cxaAtivo, alterar=@cxaAtivo, excluir=@cxaAtivo, chave=@cxaAtivo, printer=@cxaAtivo
        where grupofunc_id = @grpID
          and modulo_id = @modID
    end

  --Insere permissões para o GARÇOM
    else if (@grpID = 4) begin
      if (@achou = 0)
        insert into permissao
        (grupofunc_id, modulo_id, acesso, incluir, alterar, excluir, chave, printer) values
        (@grpID, @modID, @gcoAtivo, @gcoAtivo, @gcoAtivo, @gcoAtivo, @gcoAtivo, @gcoAtivo)
      else
        update permissao
        set acesso=@gcoAtivo, incluir=@gcoAtivo, alterar=@gcoAtivo, excluir=@gcoAtivo, chave=@gcoAtivo, printer=@gcoAtivo
        where grupofunc_id = @grpID
          and modulo_id = @modID
    end

  --Insere permissões para outros grupos
    else begin
      if (@achou = 0)
        insert into permissao
        (grupofunc_id, modulo_id, acesso, incluir, alterar, excluir, chave, printer) values
        (@grpID, @modID, @outAtivo, @outAtivo, @outAtivo, @outAtivo, @outAtivo, @outAtivo)
    end
    fetch next from cur_grupo into @grpID
  end
  close cur_grupo
  deallocate cur_grupo
end
')
else
	exec dbo.sp_renomear 'dbo.sp_addpermissao', 'sp_add_permissao'
GO

