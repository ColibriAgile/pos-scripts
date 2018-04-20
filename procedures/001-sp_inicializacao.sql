if (object_id('sp_inicializar') is not null)
  drop procedure sp_inicializar
go

create procedure sp_inicializar(
  @lojaId integer,
  @nome varchar(40),
  @senha varchar(64)
 )
as
begin

  if exists(select * from loja) begin
    print 'Loja já cadastrada'
    return
  end

  begin try

    begin transaction

    --rede
      insert into rede
      (rede_id, nome) values
      (1, 'rede padrão')

    --loja
      insert into loja
      (loja_id, nome, rede_id) values
      (@lojaId, @nome, 1)

    --GrupoFuncionario
      set IDENTITY_INSERT grupo_funcionario ON
      
      insert into grupo_funcionario
      (grupo_id, nome, dt_alt) values
      (-1,'SUPER USUARIO',GetDate()),
      (-2,'GERENTE', GetDate()),
      (-3,'CAIXA',GetDate()),
      (-4,'GARÇOM',GetDate())
      
      set IDENTITY_INSERT grupo_funcionario OFF

    --Funcoes
      set IDENTITY_INSERT funcao ON
    
      insert into funcao
      (id, nome) values
      (1, 'GERENTE'),
      (2, 'CAIXA'),
      (4, 'ATENDENTE'),
      (5, 'OPERADOR'),
      (6, 'ENTREGADOR')
  
      set IDENTITY_INSERT funcao OFF

    --Funcionario
      insert into funcionario
      (grupo_id, funcao_id, nome, senha, usuario, codigo, ativo, dt_alt) values
      (-1, 1, 'SUPER USUARIO ', @senha, 'SUPER', 1, 1, GetDate())
      
      if exists(select * from syscolumns where name='admin_master' and id=object_id('funcionario'))
        exec ('update funcionario set admin_master = 1')

    --Regiao
      insert into regiao
      (nome, taxa, dt_alt) values
      ('Região única',0.0, GetDate())

    --Desconto
      insert into desconto
      (descricao, valor, codigo, dt_alt) values
      ('nenhum', 0.0, 0, GetDate())

    --TipoCliente
      insert into tipo_cliente
      (nome, dt_alt) values
      ('Tipo unico',GetDate())

    --TipoRecebimento
      insert into meio_pagamento
      (descricao, codigo, troco_dinheiro, multiplo, troco_repique, troco_contravale, tef, dt_alt, rede_id) values
      ('Dinheiro', 1, 1, 0, 0, 0, 0, GetDate(), 1),
      ('Cheque', 2, 0, 0, 1, 0, 0, GetDate(), 1),
      ('Contra vale', 3, 0, 0, 0, 1, 0, GetDate(), 1),
      ('Conta assinada', 99, 0, 0, 1, 0, 0, GetDate(), 1)

      SET IDENTITY_INSERT meio_pagamento on

      insert into meio_pagamento
      (id, descricao, codigo, troco_dinheiro, multiplo, troco_repique, troco_contravale, tef, dt_alt, rede_id) values
      (-1, 'Troco dinheiro', -1, 1, 0, 0, 0, 0, GetDate(), 1),
      (-2, 'Troco contra vale', -2, 0, 0, 0, 1, 0, GetDate(), 1),
      (-3, 'Troco repique', -3, 0, 0, 1, 0, 0, GetDate(), 1)
      
      SET IDENTITY_INSERT meio_pagamento off

    --Modovenda
      insert into dbo.modo_venda
      (id, codigo, nome) values
      (0,0,'nenhum'),
      (1,1,'balcão'),
      (2,2,'entrega'),
      (3,3,'mesa'),
      (4,4,'ficha')

    --PerfilImpressao
      insert dbo.perfil_impressao
      ( nome, modo_venda_id, sistema )
      values
      ('(padrão geral)', 0, 1),
      ('(padrão balcão)', 1, 1),
      ('(padrão entrega)', 2, 1),
      ('(padrão mesa)', 3, 1),
      ('(padrão ficha)', 4, 1)

      insert dbo.estado
      (sigla, nome) values
      ('AC', 'ACRE'),
      ('AL', 'ALAGOAS'),
      ('AM', 'AMAZONAS'),
      ('AP', 'AMAPA'),
      ('BA', 'BAHIA'),
      ('CE', 'CEARA'),
      ('DF', 'DISTRITO FEDERAL'),
      ('ES', 'ESPIRITO SANTO'),
      ('go', 'GOIAS'),
      ('MG', 'MINAS GERAIS'),
      ('MS', 'MATO GROSSO DO SUL'),
      ('MT', 'MATO GROSSO'),
      ('PB', 'PARAIBA'),
      ('PE', 'PERNAMBUCO'),
      ('PI', 'PIAU'),
      ('PR', 'PARANA'),
      ('RJ', 'RIO DE JANEIRO'),
      ('RN', 'RIO GRANDE DO NORTE'),
      ('RO', 'RONDONIA'),
      ('RR', 'RORAIMA'),
      ('RS', 'RIO GRANDE DO SUL'),
      ('SC', 'SANTA CATARINA'),
      ('SE', 'SERGIPE'),
      ('SP', 'SAO PAULO'),
      ('TO', 'TOCANTINS')
    commit
  end try

  begin catch
    if @@trancount > 0 rollback

    declare
      @errmsg nvarchar(4000),
      @errseverity int

    select
      @errmsg = 'Falha na inicialização do banco. ' + error_message(),
      @errseverity = error_severity()

    raiserror(@errmsg, @errseverity, 1)
  end catch
end
go
