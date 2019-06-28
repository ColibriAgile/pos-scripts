if object_id('sync.fn_formatar_msg_erro') is not null
  drop function sync.fn_formatar_msg_erro
go

create function sync.fn_formatar_msg_erro(@errorNo int, @errorLn int, @errorMsg varchar(1000), @CustomMsg varchar(1000)) 
returns varchar(2000)
as 
begin
  return char(13) + char(10) + '## '+ @CustomMsg + char(13) + char(10) +
     '> Erro: ' + cast(@errorNo as varchar(6)) + ' Linha: '+ cast(@errorLn as varchar(6)) + char(13) + char(10) +
     '>> ' + @errorMsg + char(13) + char(10)
end;
