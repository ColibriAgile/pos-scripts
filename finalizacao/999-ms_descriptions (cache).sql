/**********************************************
 *** Schema cache
 **********************************************/
exec sp_descricao_schema 'cache', 'Esquema para dados com grande volume de acesso'
 
/**********************************************
 *** tabela data_contabil
 **********************************************/
exec sp_descricao_tabela 'data_contabil', 'Cache para consulta do período aberto no sistema.', 'cache'
exec sp_descricao_campo  'data_contabil', 'valor', 'Dia aberto no sistema', 'cache'
go
 
/**********************************************
 *** tabela numero_chamada
 **********************************************/
exec sp_descricao_tabela 'numero_chamada', 'Cache para controle do número de chamada aleatório. O número de chamada é válido por 1 hora, após esse período pode ser repetido.', 'cache'
exec sp_descricao_campo  'numero_chamada', 'dt_alt', 'Data/hora da criação do número de chamada', 'cache'
exec sp_descricao_campo  'numero_chamada', 'valor', 'Valor do número de chamada', 'cache'
go
 
/**********************************************
 *** tabela numero_chamada_seq
 **********************************************/
exec sp_descricao_tabela 'numero_chamada_seq', 'Cache para controle do número de chamado sequencial. É reiniciado a cada fechamento de dia.', 'cache'
exec sp_descricao_campo  'numero_chamada_seq', 'dt_alt', 'Data/hora da criação do número de chamada', 'cache'
exec sp_descricao_campo  'numero_chamada_seq', 'valor', 'Valor do número de chamada', 'cache'
go
 
/**********************************************
 *** tabela proximo_ticket
 **********************************************/
exec sp_descricao_tabela 'proximo_ticket', '---', 'cache'
exec sp_descricao_campo  'proximo_ticket', 'dt_alt', '---', 'cache'
exec sp_descricao_campo  'proximo_ticket', 'modo_venda', '---', 'cache'
exec sp_descricao_campo  'proximo_ticket', 'valor', '---', 'cache'
go
