if col_length('maquina','autopagamento') is not null return

alter table maquina add 
  autopagamento bit not null default 0,
  inicia_autopagamento bit not null default 0;
