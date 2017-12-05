declare @movimentos table 
(
  operacao_id uniqueidentifier
)

declare @ajustes table 
(
  operacao_id uniqueidentifier,
  total_movimento numeric(15,2),
  total_trocos numeric(15,2),
  total_sem_troco numeric(15,2),
  troco_devido numeric(15,2),
  total_operacao numeric(15,2)
)

--Pega as operações com diferença entre total da operação e total recebido
insert @movimentos (operacao_id)  
select operacao_id 
from 
(
  select 
    m.operacao_id, 
    total_movimento = sum(vl_recebido),
    total_operacao = max(op.vl_total)
  from movimentocaixageral m
  join operacaogeral op on op.operacao_id = m.operacao_id
  where m.operacao_id in 
    (
      select distinct m.operacao_id
      from movimentocaixageral m
      where m.meiorecebimento_id < 0
        and m.cancelado = 0
    )  
    and m.cancelado = 0  
  group by 
    m.operacao_id
  having 
    sum(m.vl_recebido) <> max(op.vl_total)
) x

--Pega os valores de trocos e de acerto para as operações com diferença
insert @ajustes     
(
  operacao_id,
  total_movimento,
  total_trocos,
  total_sem_troco,
  troco_devido,
  total_operacao
)
select 
  m.operacao_id,
  total_movimento = sum(m.vl_recebido),
  total_trocos = sum(case when m.meiorecebimento_id < 0 then m.vl_recebido else 0 end),
  total_sem_troco = sum(case when m.meiorecebimento_id > 0 then m.vl_recebido else 0 end),
  troco_devido = max(opg.vl_total) - sum(case when m.meiorecebimento_id > 0 then m.vl_recebido else 0 end),
  total_operacao = max(opg.vl_total)
from movimentocaixageral m
join operacaogeral opg on opg.operacao_id = m.operacao_id
where m.operacao_id in (select operacao_id from @movimentos m2)
  and m.cancelado = 0
group by 
  m.operacao_id

declare 
  @operacao_id uniqueidentifier,
  @vl_troco numeric(15,2),
  @movimento_id int

while exists(select * from @ajustes a)  --Percorre os ajustes, efetuando um de cada vez
begin
  select top 1 
    @operacao_id = operacao_id,
    @vl_troco = a.troco_devido
  from @ajustes a

--Se não tem troco, apenas cancela todos os trocos
  if @vl_troco = 0 begin
    update movimentocaixageral
    set cancelado = 1
    where meiorecebimento_id < 0  
      and operacao_id = @operacao_id
  end
  else begin
    select @movimento_id = m.movimentocaixa_id  --Procura se tem um registro de troco com o valor exato do troco devido
    from movimentocaixageral m
    where m.vl_recebido = @vl_troco
      and operacao_id = @operacao_id
      and m.cancelado = 0

    if @movimento_id is not null begin
      update movimentocaixageral
      set cancelado = 1
      where meiorecebimento_id < 0
        and operacao_id = @operacao_id
        and movimentocaixa_id <> @movimento_id         
    end
    else begin  
      select top 1 @movimento_id = m.movimentocaixa_id
      from movimentocaixageral m
      where m.meiorecebimento_id < 0
        and operacao_id = @operacao_id
        and m.cancelado = 0
      order by movimentocaixa_id desc

      --Se não tem nenhum registro de troco com o mesmo valor, cancela todos e altera o ultimo troco para ter o valor devido
      update movimentocaixageral 
      set cancelado = 1
      where meiorecebimento_id < 0
        and operacao_id = @operacao_id
        and movimentocaixa_id <> @movimento_id

      update movimentocaixageral 
      set vl_recebido = @vl_troco
      where operacao_id = @operacao_id
        and movimentocaixa_id = @movimento_id
    end
  end

  delete from @ajustes
  where operacao_id = @operacao_id
end
