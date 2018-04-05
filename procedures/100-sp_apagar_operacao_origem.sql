if (object_id('sp_apagar_operacao_origem') is not null)
  drop procedure sp_apagar_operacao_origem
go

create procedure sp_apagar_operacao_origem(@operacao_id varchar(50) = null)
as
begin

  declare @tmp_operacaoorigem table (operacao_origem_id uniqueidentifier)

  insert into
    @tmp_operacaoorigem
  select
    operacao_origem_id
  from venda h
  join operacao_venda o on o.operacao_id = h.operacao_id
  where h.operacao_id = isnull(@operacao_id, h.operacao_id)
    and operacao_origem_id is not null
    and o.encerrada = 1

  update venda set
    operacao_origem_id = null
  from operacao_venda o
  where o.operacao_id = isnull(@operacao_id, o.operacao_id)
    and o.operacao_id = venda.operacao_id
    and o.encerrada = 1

  delete comprovante where operacao_id in (select operacao_origem_id from @tmp_operacaoorigem)
  delete operacao_venda where operacao_id in (select operacao_origem_id from @tmp_operacaoorigem)
  delete operacao where operacao_id in (select operacao_origem_id from @tmp_operacaoorigem)

end;
