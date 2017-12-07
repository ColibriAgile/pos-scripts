if (object_id('sp_alias_bandeira') is not null)
  drop procedure sp_alias_bandeira
go

create procedure dbo.sp_alias_bandeira(@alias varchar(50), @bandeira varchar(50), @somente_credito bit = 0)
as begin
	update bandeira 
	set aliases = case 
	  when aliases is not null then aliases + ';' + @alias 
	  else @alias 
	end 
	where nome = @bandeira
	and isnull(aliases,'') not like '%'+@alias+'%'
	and ((tipo = 'credito') or (@somente_credito = 0))
end;
go

exec dbo.sp_alias_bandeira 'ALELO', 'Alelo'
exec dbo.sp_alias_bandeira 'Alimentação',  'Ticket Refeição'
exec dbo.sp_alias_bandeira 'AMEX', 'Amex'
exec dbo.sp_alias_bandeira 'AURA', 'Aura'
exec dbo.sp_alias_bandeira 'AVISTA', 'Mastercard'
exec dbo.sp_alias_bandeira 'BANESCARD crédito à vista', 'Banescard', 1
exec dbo.sp_alias_bandeira 'BANESE CARD', 'Banescard'
exec dbo.sp_alias_bandeira 'BNBCLUBE',  'BNB Clube'
exec dbo.sp_alias_bandeira 'CABAL', 'Cabal'
exec dbo.sp_alias_bandeira 'COOPERCRED', 'Coopercred'
exec dbo.sp_alias_bandeira 'CREDI-SHOP', 'Credishop'
exec dbo.sp_alias_bandeira 'Crédito', 'Visa', 1
exec dbo.sp_alias_bandeira 'Crédito com senha', 'Banescard', 1
exec dbo.sp_alias_bandeira 'CREDSYSTEM', 'Credisystem'
exec dbo.sp_alias_bandeira 'CredZ crédito à vista', 'CredZ'
exec dbo.sp_alias_bandeira 'DINERS', 'Diners'
exec dbo.sp_alias_bandeira 'DISCOVER', 'Discovery'
exec dbo.sp_alias_bandeira 'ELO Débito', 'Elo'
exec dbo.sp_alias_bandeira 'ELO Crédito', 'Elo', 1
exec dbo.sp_alias_bandeira 'FROTA', 'Policard'
exec dbo.sp_alias_bandeira 'GOOD CARD', 'Goodcard'
exec dbo.sp_alias_bandeira 'GREEN CARD', 'Greencard'
exec dbo.sp_alias_bandeira 'HIPERCARD', 'Hipercard'
exec dbo.sp_alias_bandeira 'JCB', 'JCB'
exec dbo.sp_alias_bandeira 'MAESTRO', 'Maestro'
exec dbo.sp_alias_bandeira 'MAIS', 'Mastercard'
exec dbo.sp_alias_bandeira 'MASTERCARD', 'Mastercard'
exec dbo.sp_alias_bandeira 'NUTRICASH', 'Nutricash'
exec dbo.sp_alias_bandeira 'PAT', 'Policard'
exec dbo.sp_alias_bandeira 'PLANVALE', 'Planvale'
exec dbo.sp_alias_bandeira 'POLICARD', 'Policard'
exec dbo.sp_alias_bandeira 'PRIVATE LABEL',  'Private Label'
exec dbo.sp_alias_bandeira 'REDE ESTRADA', 'Mastercard'
exec dbo.sp_alias_bandeira 'Refeição',  'Ticket Refeição'
exec dbo.sp_alias_bandeira 'SAPORE', 'Sapore'
exec dbo.sp_alias_bandeira 'SICREDI', 'Sicredi'
exec dbo.sp_alias_bandeira 'SODEXO',  'Sodexo Refeição'
exec dbo.sp_alias_bandeira 'SODEXO', 'Sodexo'
exec dbo.sp_alias_bandeira 'SOROCRED', 'Sorocred'
exec dbo.sp_alias_bandeira 'TICKET',  'Ticket Refeição'
exec dbo.sp_alias_bandeira 'TICKET CAR',  'Ticket Combustível'
exec dbo.sp_alias_bandeira 'VALECARD', 'Verocheque'
exec dbo.sp_alias_bandeira 'VALECARD', 'Valecard'
exec dbo.sp_alias_bandeira 'VALEMULTI', 'Valecard'
exec dbo.sp_alias_bandeira 'VEROCARD', 'Verocheque'
exec dbo.sp_alias_bandeira 'VEROCHEQUE', 'Verocheque'
exec dbo.sp_alias_bandeira 'VISA Crediário', 'Visa', 1
exec dbo.sp_alias_bandeira 'VISA Crédito', 'Visa', 1
exec dbo.sp_alias_bandeira 'VISA Electron',  'Visa Electron'
exec dbo.sp_alias_bandeira 'VISA Parcelado Loja', 'Visa'
go
