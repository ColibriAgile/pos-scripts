if object_id('fn_transacoes') is not null
	drop function fn_transacoes
go
  
create function fn_transacoes()
returns table
as
  return
		select 
			x.hostname, 
			x.spid, 
			dbname = db_name(dbid), 
			sqlstatement = (select text from sys.dm_exec_sql_text(sql_handle)) 
		from master..sysprocesses x with(nolock)
		where (open_tran > 0)
		  and (spid <> @@spid)

go


