if (object_id('sp_incluirRelatorio') is not null)
  drop procedure sp_incluirRelatorio
go

create procedure sp_incluirRelatorio
(
  @tipoio_id int,
  @num int,
  @id smallint,
  @modo_venda int,
  @nome varchar(50),
  @descricao varchar(200),
  @tipoequipamento_id int = 1
)
as
set nocount on 

  declare @tipoRel smallint = 300;

  if @modo_venda = 1
    set @tipoRel = 400 --balcao
  else if @modo_venda = 2
    set @tipoRel = 600  --entrega
  else if @modo_venda = 3
    set @tipoRel = 500  --mesa
  else if @modo_venda = 4
    set @tipoRel = 700  --ficha

	if exists (select * from listaioxmododevenda where tipoio_id = @tipoio_id and num = @num and mododevenda_id = @modo_venda) return

	/* inclui relatório na gruporelatorios */
	exec sp_increl @id, @nome, @tipoRel

  if not exists (select * from listaio l where l.tipoio_id = @tipoio_id and l.num = @num)
	  insert into listaio (tipoio_id, num, nome, descricao) values 
	  (@tipoio_id, @num, @nome, @descricao)
	
	/* popular o Mapeamento das entradas e saídas (IO) no sistema por modos de venda */
	insert into listaioxmododevenda (tipoio_id, num, mododevenda_id) values (@tipoio_id, @num, @modo_venda) 

	insert into maparelatorio (listaio_id, relatorio_id, mododevenda_id, tipoequipamento_id)
	select id, rel=@id, mv=@modo_venda, eq=@tipoequipamento_id from listaio where tipoio_id = @tipoio_id and num = @num

	/* popular lista de config IO para relatórios não registrados */
	insert into configio (listaio_id, equipamento_id, mododevenda_id, periferico_id, perifericobackup_id)
	  select 
		conf.listaio_id,
		conf.equipamento_id,
		conf.mododevenda_id,
		periferico_id = null,
		perifericobackup_id = null
	  from 
	  (
		select 
		  listaio_id = l.id,
		  equipamento_id = e.id,
		  mododevenda_id = lmv.mododevenda_id,
		  tipoequipamento_id,
		  equipamento_num = e.num
		from listaioxmododevenda lmv
		join listaio l on l.tipoio_id = lmv.tipoio_id and l.num = lmv.num
		cross join equipamento e
	  ) conf
	  where not exists (
		select 
		  * 
		from configio c
		where c.listaio_id = conf.listaio_id
		  and c.equipamento_id = conf.equipamento_id
		  and c.mododevenda_id = conf.mododevenda_id
	  )   

	exec sp_ajustaconfigio
go