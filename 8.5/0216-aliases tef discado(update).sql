declare
    @alias varchar(50),
    @bandeira varchar(50);

set @alias = 'ALELO'
set @bandeira = 'Alelo'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'Alimentação'
set @bandeira =  'Ticket Refeição'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'AMEX'
set @bandeira = 'Amex'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'AURA'
set @bandeira = 'Aura'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'AVISTA'
set @bandeira = 'Mastercard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'BANESCARD crédito à vista'
set @bandeira = 'Banescard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira and tipo = 'credito'

set @alias = 'BANESE CARD'
set @bandeira = 'Banescard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'BNBCLUBE'
set @bandeira =  'BNB Clube'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'CABAL'
set @bandeira = 'Cabal'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'COOPERCRED'
set @bandeira = 'Coopercred'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'CREDI-SHOP'
set @bandeira = 'Credishop'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'Crédito'
set @bandeira = 'Visa'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira and tipo = 'credito'

set @alias = 'Crédito com senha'
set @bandeira = 'Banescard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira and tipo = 'credito'

set @alias = 'CREDSYSTEM'
set @bandeira = 'Credisystem'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'CredZ crédito à vista'
set @bandeira = 'CredZ'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'DINERS'
set @bandeira = 'Diners'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'DISCOVER'
set @bandeira = 'Discovery'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'ELO Crédito'
set @bandeira = 'Elo'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira and tipo = 'credito'

set @alias = 'ELO Débito'
set @bandeira = 'Elo'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira and tipo = 'debito'

set @alias = 'FROTA'
set @bandeira = 'Policard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'GOOD CARD'
set @bandeira = 'Goodcard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'GREEN CARD'
set @bandeira = 'Greencard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'HIPERCARD'
set @bandeira = 'Hipercard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'JCB'
set @bandeira = 'JCB'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'MAESTRO'
set @bandeira = 'Maestro'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'MAIS'
set @bandeira = 'Mastercard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'MASTERCARD'
set @bandeira = 'Mastercard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'NUTRICASH'
set @bandeira = 'Nutricash'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'PAT'
set @bandeira = 'Policard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'PLANVALE'
set @bandeira = 'Planvale'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'POLICARD'
set @bandeira = 'Policard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'PRIVATE LABEL'
set @bandeira =  'Private Label'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'REDE ESTRADA'
set @bandeira = 'Mastercard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'Refeição'
set @bandeira =  'Ticket Refeição'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'SAPORE'
set @bandeira = 'Sapore'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'SICREDI'
set @bandeira = 'Sicredi'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'SODEXO'
set @bandeira =  'Sodexo Refeição'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'SODEXO'
set @bandeira = 'Sodexo'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'SOROCRED'
set @bandeira = 'Sorocred'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'TICKET'
set @bandeira =  'Ticket Refeição'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'TICKET CAR'
set @bandeira =  'Ticket Combustível'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'VALECARD'
set @bandeira = 'Verocheque'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'VALECARD'
set @bandeira = 'Valecard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'VALEMULTI'
set @bandeira = 'Valecard'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'VEROCARD'
set @bandeira = 'Verocheque'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'VEROCHEQUE'
set @bandeira = 'Verocheque'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'VISA Crediário'
set @bandeira = 'Visa'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira and tipo = 'credito'

set @alias = 'VISA Crédito'
set @bandeira = 'Visa'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira and tipo = 'credito'

set @alias = 'VISA Electron'
set @bandeira =  'Visa Electron'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira

set @alias = 'VISA Parcelado Loja'
set @bandeira = 'Visa'
update bandeira set aliases = case when aliases is not null then aliases + ';' + @alias else @alias end where nome = @bandeira
