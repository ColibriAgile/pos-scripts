if (object_id('fn_vendas_perfil') is not null)
  drop function fn_vendas_perfil
go

create function fn_vendas_perfil (@dtini datetime, @dtfim datetime)
returns @dados table
(
  dt_contabil date not null,
  perfil_id int not null,
  tot decimal(19, 4) not null,
  qtd_pessoas as (qtd_homem + qtd_mulher + qtd_ninformado),
  qtd_homem numeric not null,
  qtd_mulher numeric not null,
  /*
  A quantidade de não informados pode ser fracionado se implementarmos perfil no modo mesa
  ou se permitirmos alterar a quantidade de pessoas nos agrupamentos de ficha. Se isso
  acontecer teremos que alterar o tipo abaixo para float, mostrando fracionado.
  */
  qtd_ninformado numeric null
)
as
begin

  declare @tblPessoasPorConta table
  (
    operacao_id uniqueidentifier not null,
    qtd_pessoas decimal not null
  )

  declare @tblPessoasPorPerfil table
  (
    dt_contabil date not null,
    operacao_id uniqueidentifier not null,
    perfil_id int not null,
    qtd_ninformado decimal null,
    qtd_homem decimal null,
    qtd_mulher decimal null,
    vl_itens decimal(19, 4) null
  )

  /*
  Ajuste no levantamento de pessoas por operações agrupadas
  caso o n° de pessoas informado na operação seja superior
  ao total de tickets.
  */
  insert into @tblPessoasPorConta
  (
    operacao_id,
    qtd_pessoas
  )
  select
    o.operacao_id,

    /*
    Qtde de contas é o número de consumos contidos dentro
    de uma operação. Usaremos este calculo mais abaixo.
    qtd_contas = count(h.venda_id),
    */

    /*
    Qtd de pessoas em cada conta é o total de pessoas da operação dividido pelo qtde de contas.
    Este cálculo é de dificil entendimento. Em uma operação agrupada podemos ter uma qtde de pessoas
    maior do que o numero de contas. Isso ocorre quando o atendente altera a qtde de pessoas. Além
    disso, o join com venda multiplica esse valor por <n>, onde <n> é a quantidade de contas
    dentro do agrupamento. Por isso temos que dividir 2 vezes o total de pessoas pela qtde de contas.

    qtd pessoas na conta = qtd pessoas da operacao / qtd contas / qtd contas (esta divisao extra é para descontar o join)
    ou
    qtd pessoas na conta = qtd pessoas da operacao / qtd contas^2
    */
    qtd_pessoas_por_conta = 1.0 * sum(ov.qtd_pessoas) / power(count(h.venda_id),2)
  from dbo.operacao o with (nolock)
  join dbo.operacao_venda ov with (nolock) on ov.operacao_id = o.operacao_id
  join dbo.venda h with (nolock) on o.operacao_id = h.operacao_id
  where o.dt_contabil between @dtini and @dtfim
    and o.cancelada = 0
    and ov.paga = 1
    and h.cancelado = 0
    and h.transferido = 0
  group by
    o.operacao_id

  union all

  select
    o.operacao_id,
    qtd_pessoas_por_conta = 1.0 * sum(ov.qtd_pessoas) / power(count(h.venda_id),2)
  from dbo.operacao_geral o with (nolock)
  join dbo.operacao_venda_geral ov with (nolock) on ov.operacao_id = o.operacao_id
  join dbo.venda_geral h with (nolock) on o.operacao_id = h.operacao_id
  where o.dt_contabil between @dtini and @dtfim
    and o.cancelada = 0
    and ov.paga = 1
    and h.cancelado = 0
    and h.transferido = 0
  group by
    o.operacao_id

  /*
  N° de pessoas por ticket já com a definição/classificação
  de acordo com o genero do cliente. Contas sem cliente serão
  computadas como qtdNaoInformado.
  */
  insert into @tblPessoasPorPerfil
  (
    dt_contabil,
    operacao_id,
    perfil_id,
    vl_itens,
    qtd_homem,
    qtd_mulher,
    qtd_ninformado
  )
  /*
  Com 2 comandos unificados pelo UNION, precisamos
  de uma query externa para consolidar
  */
  select
    x.dt_contabil,
    x.operacao_id,
    x.perfil_id,
    vl_itens = sum(x.vl_itens),
    qtd_homem = sum(x.qtd_homem),
    qtd_mulher = sum(x.qtd_mulher),
    qtd_ninformado = sum(x.qtd_pessoas - x.qtd_homem - x.qtd_mulher)
  from
  (
    select
      h.dt_contabil,
      h.operacao_id,
      h.perfil_id,
      vl_itens = h.vl_subtotal_itens,
      qtd_pessoas = p.qtd_pessoas,
      qtd_homem = case
        when c.sexo = 'M' then 1
        when c2.sexo = 'M' then 1
        else 0
      end,
      qtd_mulher = case
        when c.sexo = 'F' then 1
        when c2.sexo = 'F' then 1
        else 0
      end
    from dbo.venda h with (nolock)
    join @tblPessoasPorConta as p on p.operacao_id = h.operacao_id
    left join dbo.cliente c with (nolock) on c.id = h.cliente_id
    /*
    O join com ticket é necessário porque contas não encerradas ainda não tem o dado do cliente.
    O cliente só é movido do ticket para a conta quando a mesma é encerrada.
    */
    left join dbo.ticket t with (nolock) on t.venda_id = h.venda_id
    left join dbo.cliente c2 with (nolock) on c2.id = t.cliente_id
    where h.cancelado = 0
      and h.transferido = 0
      and h.dt_contabil between @dtini and @dtfim

    union all

    select
      h.dt_contabil,
      h.operacao_id,
      h.perfil_id,
      vl_itens = h.vl_subtotal_itens,
      qtd_pessoas = p.qtd_pessoas,
      qtd_homem = case
        when c.sexo = 'M' then 1
        when c2.sexo = 'M' then 1
        else 0
      end,
      qtd_mulher = case
        when c.sexo = 'F' then 1
        when c2.sexo = 'F' then 1
        else 0
      end
    from dbo.venda_geral h with (nolock)
    join @tblPessoasPorConta as p on p.operacao_id = h.operacao_id
    left join dbo.cliente c with (nolock) on c.id = h.cliente_id
    left join dbo.ticket t with (nolock) on t.venda_id = h.venda_id
    left join dbo.cliente c2 with (nolock) on c2.id = t.cliente_id
    where h.cancelado = 0
      and h.transferido = 0
      and h.dt_contabil between @dtini and @dtfim
  ) x
  group by
    x.operacao_id,
    x.dt_contabil,
    x.perfil_id

  /*
  Consolida os dados por data e perfil
  */
  insert into @dados
  (
    dt_contabil,
    perfil_id,
    tot,
    qtd_homem,
    qtd_mulher,
    qtd_ninformado
  )
  select
    p.dt_contabil,
    p.perfil_id,
    tot = sum(p.vl_itens),
    qtd_homem = sum(p.qtd_homem),
    qtd_mulher = sum(p.qtd_mulher),
    qtd_ninformado = sum(p.qtd_ninformado)
  from @tblPessoasPorPerfil p
  group by
    p.dt_contabil,
    p.perfil_id

  return
end
go
