if object_id('modulo_ctrl_terceiro') is not null
  return

create table [dbo].[modulo_ctrl_terceiro]
(
    [modulo_id] [nvarchar](36) NOT NULL,
    primary key clustered
    (
        modulo_id asc
    ) with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on) 
) 

go

