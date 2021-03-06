if OBJECT_ID(N'[dbo].[config_touch_tipo_item_id_675d9e99_fk_django_content_type_id]') is not null
  alter table config_touch drop constraint [config_touch_tipo_item_id_675d9e99_fk_django_content_type_id]  

if OBJECT_ID(N'[dbo].[funcionario_usuario_app_id_3b045417_fk_auth_user_id]') is not null
  alter table funcionario drop constraint [funcionario_usuario_app_id_3b045417_fk_auth_user_id]    

if  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[django_admin_log_action_flag_2df89e11_check]') AND parent_object_id = OBJECT_ID(N'[dbo].[django_admin_log]'))
ALTER TABLE [dbo].[django_admin_log] DROP CONSTRAINT [django_admin_log_action_flag_2df89e11_check]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[django_admin_log_user_id_1c5f563_fk_auth_user_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[django_admin_log]'))
ALTER TABLE [dbo].[django_admin_log] DROP CONSTRAINT [django_admin_log_user_id_1c5f563_fk_auth_user_id]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[django_admin_log_content_type_id_5151027a_fk_django_content_type_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[django_admin_log]'))
ALTER TABLE [dbo].[django_admin_log] DROP CONSTRAINT [django_admin_log_content_type_id_5151027a_fk_django_content_type_id]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions]'))
ALTER TABLE [dbo].[auth_user_user_permissions] DROP CONSTRAINT [auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions_permission_id_3d7071f0_fk_auth_permission_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions]'))
ALTER TABLE [dbo].[auth_user_user_permissions] DROP CONSTRAINT [auth_user_user_permissions_permission_id_3d7071f0_fk_auth_permission_id]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_groups_user_id_24702650_fk_auth_user_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_user_groups]'))
ALTER TABLE [dbo].[auth_user_groups] DROP CONSTRAINT [auth_user_groups_user_id_24702650_fk_auth_user_id]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_groups_group_id_30a071c9_fk_auth_group_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_user_groups]'))
ALTER TABLE [dbo].[auth_user_groups] DROP CONSTRAINT [auth_user_groups_group_id_30a071c9_fk_auth_group_id]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_permission_content_type_id_51277a81_fk_django_content_type_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_permission]'))
ALTER TABLE [dbo].[auth_permission] DROP CONSTRAINT [auth_permission_content_type_id_51277a81_fk_django_content_type_id]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_permissions_permission_id_23962d04_fk_auth_permission_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_group_permissions]'))
ALTER TABLE [dbo].[auth_group_permissions] DROP CONSTRAINT [auth_group_permissions_permission_id_23962d04_fk_auth_permission_id]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_permissions_group_id_58c48ba9_fk_auth_group_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_group_permissions]'))
ALTER TABLE [dbo].[auth_group_permissions] DROP CONSTRAINT [auth_group_permissions_group_id_58c48ba9_fk_auth_group_id]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_modulo_grupo_id_2560093e_fk_auth_group_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_group_modulo]'))
ALTER TABLE [dbo].[auth_group_modulo] DROP CONSTRAINT [auth_group_modulo_grupo_id_2560093e_fk_auth_group_id]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[django_content_type]') AND name = N'django_content_type_app_label_3ec8c61c_uniq')
ALTER TABLE [dbo].[django_content_type] DROP CONSTRAINT [django_content_type_app_label_3ec8c61c_uniq]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions]') AND name = N'UQ__auth_use__07ED06A10C4F6F61')
ALTER TABLE [dbo].[auth_user_user_permissions] DROP CONSTRAINT [UQ__auth_use__07ED06A10C4F6F61]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_groups]') AND name = N'UQ__auth_use__A4E94E5468F4CFCB')
ALTER TABLE [dbo].[auth_user_groups] DROP CONSTRAINT [UQ__auth_use__A4E94E5468F4CFCB]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_user]') AND name = N'UQ__auth_use__F3DBC572270AB4ED')
ALTER TABLE [dbo].[auth_user] DROP CONSTRAINT [UQ__auth_use__F3DBC572270AB4ED]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_permission]') AND name = N'UQ__auth_per__0A068CF7737CA828')
ALTER TABLE [dbo].[auth_permission] DROP CONSTRAINT [UQ__auth_per__0A068CF7737CA828]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_permissions]') AND name = N'UQ__auth_gro__6B24A40E83C0DCC7')
ALTER TABLE [dbo].[auth_group_permissions] DROP CONSTRAINT [UQ__auth_gro__6B24A40E83C0DCC7]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_modulo]') AND name = N'auth_group_modulo_modulo_id_3ab00aae_uniq')
ALTER TABLE [dbo].[auth_group_modulo] DROP CONSTRAINT [auth_group_modulo_modulo_id_3ab00aae_uniq]
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_group]') AND name = N'UQ__auth_gro__72E12F1BD93FC475')
ALTER TABLE [dbo].[auth_group] DROP CONSTRAINT [UQ__auth_gro__72E12F1BD93FC475]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[django_session]') AND type in (N'U'))
DROP TABLE [dbo].[django_session]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[django_migrations]') AND type in (N'U'))
DROP TABLE [dbo].[django_migrations]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[django_content_type]') AND type in (N'U'))
DROP TABLE [dbo].[django_content_type]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[django_admin_log]') AND type in (N'U'))
DROP TABLE [dbo].[django_admin_log]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions]') AND type in (N'U'))
DROP TABLE [dbo].[auth_user_user_permissions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_groups]') AND type in (N'U'))
DROP TABLE [dbo].[auth_user_groups]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_user]') AND type in (N'U'))
DROP TABLE [dbo].[auth_user]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_permission]') AND type in (N'U'))
DROP TABLE [dbo].[auth_permission]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_permissions]') AND type in (N'U'))
DROP TABLE [dbo].[auth_group_permissions]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_modulo]') AND type in (N'U'))
DROP TABLE [dbo].[auth_group_modulo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_group]') AND type in (N'U'))
DROP TABLE [dbo].[auth_group]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_group]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_modulo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[auth_group_modulo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[modulo_id] [int] NOT NULL,
	[incluir] [bit] NOT NULL,
	[alterar] [bit] NOT NULL,
	[excluir] [bit] NOT NULL,
	[grupo_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_permissions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_permission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[auth_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_user]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[auth_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetime] NULL,
	[is_superuser] [bit] NOT NULL,
	[username] [nvarchar](30) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](30) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[date_joined] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_groups]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[auth_user_groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[auth_user_user_permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[django_admin_log]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetime] NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[django_content_type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[django_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[django_migrations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[django_migrations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[django_session]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
go
delete dbo.auth_permission
SET IDENTITY_INSERT [dbo].[auth_permission] ON 

GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (1, N'Can add content type', 1, N'add_contenttype')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (2, N'Can change content type', 1, N'change_contenttype')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (3, N'Can delete content type', 1, N'delete_contenttype')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (4, N'Can add log entry', 2, N'add_logentry')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (5, N'Can change log entry', 2, N'change_logentry')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (6, N'Can delete log entry', 2, N'delete_logentry')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (7, N'Can add permission', 5, N'add_permission')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (8, N'Can change permission', 5, N'change_permission')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (9, N'Can delete permission', 5, N'delete_permission')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (10, N'Can add group', 3, N'add_group')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (11, N'Can change group', 3, N'change_group')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (12, N'Can delete group', 3, N'delete_group')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (13, N'Can add user', 4, N'add_user')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (14, N'Can change user', 4, N'change_user')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (15, N'Can delete user', 4, N'delete_user')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (16, N'Can add session', 6, N'add_session')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (17, N'Can change session', 6, N'change_session')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (18, N'Can delete session', 6, N'delete_session')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (19, N'Can add usuario', 7, N'add_usuario')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (20, N'Can change usuario', 7, N'change_usuario')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (21, N'Can delete usuario', 7, N'delete_usuario')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (22, N'Can add rede', 8, N'add_rede')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (23, N'Can change rede', 8, N'change_rede')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (24, N'Can delete rede', 8, N'delete_rede')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (25, N'Can add loja', 9, N'add_loja')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (26, N'Can change loja', 9, N'change_loja')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (27, N'Can delete loja', 9, N'delete_loja')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (28, N'Can add grupo material', 10, N'add_grupomaterial')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (29, N'Can change grupo material', 10, N'change_grupomaterial')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (30, N'Can delete grupo material', 10, N'delete_grupomaterial')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (31, N'Can add local impressao', 11, N'add_localimpressao')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (32, N'Can change local impressao', 11, N'change_localimpressao')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (33, N'Can delete local impressao', 11, N'delete_localimpressao')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (34, N'Can add combo', 15, N'add_combo')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (35, N'Can change combo', 15, N'change_combo')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (36, N'Can delete combo', 15, N'delete_combo')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (37, N'Can add combo precificador', 14, N'add_comboprecificador')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (38, N'Can change combo precificador', 14, N'change_comboprecificador')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (39, N'Can delete combo precificador', 14, N'delete_comboprecificador')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (40, N'Can add combo quantificador', 12, N'add_comboquantificador')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (41, N'Can change combo quantificador', 12, N'change_comboquantificador')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (42, N'Can delete combo quantificador', 12, N'delete_comboquantificador')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (43, N'Can add combo slot', 13, N'add_comboslot')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (44, N'Can change combo slot', 13, N'change_comboslot')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (45, N'Can delete combo slot', 13, N'delete_comboslot')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (46, N'Can add material', 19, N'add_material')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (47, N'Can change material', 19, N'change_material')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (48, N'Can delete material', 19, N'delete_material')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (49, N'Can add observacao', 20, N'add_observacao')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (50, N'Can change observacao', 20, N'change_observacao')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (51, N'Can delete observacao', 20, N'delete_observacao')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (52, N'Can add material obs', 18, N'add_materialobs')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (53, N'Can change material obs', 18, N'change_materialobs')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (54, N'Can delete material obs', 18, N'delete_materialobs')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (55, N'Can add classe', 17, N'add_classe')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (56, N'Can change classe', 17, N'change_classe')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (57, N'Can delete classe', 17, N'delete_classe')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (58, N'Can add item classe', 21, N'add_itemclasse')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (59, N'Can change item classe', 21, N'change_itemclasse')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (60, N'Can delete item classe', 21, N'delete_itemclasse')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (61, N'Can add codigo barras', 16, N'add_codigobarras')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (62, N'Can change codigo barras', 16, N'change_codigobarras')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (63, N'Can delete codigo barras', 16, N'delete_codigobarras')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (64, N'Can add motivo canc', 22, N'add_motivocanc')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (65, N'Can change motivo canc', 22, N'change_motivocanc')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (66, N'Can delete motivo canc', 22, N'delete_motivocanc')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (67, N'Can add tipo recebimento', 23, N'add_tiporecebimento')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (68, N'Can change tipo recebimento', 23, N'change_tiporecebimento')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (69, N'Can delete tipo recebimento', 23, N'delete_tiporecebimento')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (70, N'Can add layout touch', 24, N'add_layouttouch')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (71, N'Can change layout touch', 24, N'change_layouttouch')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (72, N'Can delete layout touch', 24, N'delete_layouttouch')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (73, N'Can add acao touch', 25, N'add_acaotouch')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (74, N'Can change acao touch', 25, N'change_acaotouch')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (75, N'Can delete acao touch', 25, N'delete_acaotouch')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (76, N'Can add config touch', 26, N'add_configtouch')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (77, N'Can change config touch', 26, N'change_configtouch')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (78, N'Can delete config touch', 26, N'delete_configtouch')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (79, N'Can add tabela preco', 27, N'add_tabelapreco')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (80, N'Can change tabela preco', 27, N'change_tabelapreco')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (81, N'Can delete tabela preco', 27, N'delete_tabelapreco')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (82, N'Can add item preco', 28, N'add_itempreco')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (83, N'Can change item preco', 28, N'change_itempreco')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (84, N'Can delete item preco', 28, N'delete_itempreco')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (85, N'Can add modulo grupo', 29, N'add_modulogrupo')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (86, N'Can change modulo grupo', 29, N'change_modulogrupo')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (87, N'Can delete modulo grupo', 29, N'delete_modulogrupo')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (88, N'Can add funcao', 30, N'add_funcao')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (89, N'Can change funcao', 30, N'change_funcao')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (90, N'Can delete funcao', 30, N'delete_funcao')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (91, N'Can add funcionario', 31, N'add_funcionario')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (92, N'Can change funcionario', 31, N'change_funcionario')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (93, N'Can delete funcionario', 31, N'delete_funcionario')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (94, N'Can add ponto venda', 32, N'add_pontovenda')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (95, N'Can change ponto venda', 32, N'change_pontovenda')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (96, N'Can delete ponto venda', 32, N'delete_pontovenda')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (97, N'Can add ponto fiscal', 33, N'add_pontofiscal')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (98, N'Can change ponto fiscal', 33, N'change_pontofiscal')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (99, N'Can delete ponto fiscal', 33, N'delete_pontofiscal')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (100, N'Can add maquina', 34, N'add_maquina')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (101, N'Can change maquina', 34, N'change_maquina')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (102, N'Can delete maquina', 34, N'delete_maquina')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (103, N'Can add desconto', 35, N'add_desconto')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (104, N'Can change desconto', 35, N'change_desconto')
GO
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (105, N'Can delete desconto', 35, N'delete_desconto')
GO
SET IDENTITY_INSERT [dbo].[auth_permission] OFF
go

delete dbo.auth_user
go
SET IDENTITY_INSERT [dbo].[auth_user] ON 

GO
INSERT [dbo].[auth_user] ([id], [password], [last_login], [is_superuser], [username], [first_name], [last_name], [email], [is_staff], [is_active], [date_joined]) VALUES (1, N'pbkdf2_sha256$20000$3uqZzFV5QzpZ$ifkTmzdE6ICkn4vSXjqaGARx68IgebzlDFNUIAXG2KY=', CAST(0x0000A59500BE5FF0 AS DateTime), 1, N'admin', N'', N'', N'', 1, 1, CAST(0x0000A59500BE1040 AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[auth_user] OFF
go
delete dbo.django_content_type
go
SET IDENTITY_INSERT [dbo].[django_content_type] ON 

GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (2, N'admin', N'logentry')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (7, N'autenticacao_base', N'usuario')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (3, N'auth', N'group')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (5, N'auth', N'permission')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (4, N'auth', N'user')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (15, N'combo', N'combo')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (14, N'combo', N'comboprecificador')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (12, N'combo', N'comboquantificador')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (13, N'combo', N'comboslot')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (1, N'contenttypes', N'contenttype')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (35, N'desconto', N'desconto')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (30, N'funcao', N'funcao')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (31, N'funcionario', N'funcionario')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (10, N'grupo_material', N'grupomaterial')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (25, N'layout_touch', N'acaotouch')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (26, N'layout_touch', N'configtouch')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (24, N'layout_touch', N'layouttouch')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (11, N'local_impressao', N'localimpressao')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (9, N'loja', N'loja')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (34, N'maquina', N'maquina')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (17, N'mat_obs_classe', N'classe')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (16, N'mat_obs_classe', N'codigobarras')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (21, N'mat_obs_classe', N'itemclasse')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (19, N'mat_obs_classe', N'material')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (18, N'mat_obs_classe', N'materialobs')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (20, N'mat_obs_classe', N'observacao')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (22, N'motivo_cancelamento', N'motivocanc')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (29, N'permissao', N'modulogrupo')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (33, N'ponto_fiscal', N'pontofiscal')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (32, N'ponto_venda', N'pontovenda')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (8, N'rede', N'rede')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (6, N'sessions', N'session')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (28, N'tabela_preco', N'itempreco')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (27, N'tabela_preco', N'tabelapreco')
GO
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (23, N'tipo_recebimento', N'tiporecebimento')
GO
SET IDENTITY_INSERT [dbo].[django_content_type] OFF
go
delete dbo.django_migrations
go
SET IDENTITY_INSERT [dbo].[django_migrations] ON 

GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (1, N'contenttypes', N'0001_initial', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (2, N'auth', N'0001_initial', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (3, N'admin', N'0001_initial', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (4, N'contenttypes', N'0002_remove_content_type_name', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (5, N'auth', N'0002_alter_permission_name_max_length', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (6, N'auth', N'0003_alter_user_email_max_length', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (7, N'auth', N'0004_alter_user_username_opts', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (8, N'auth', N'0005_alter_user_last_login_null', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (9, N'auth', N'0006_require_contenttypes_0002', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (10, N'rede', N'0001_initial', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (11, N'loja', N'0001_initial', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (12, N'local_impressao', N'0001_initial', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (13, N'grupo_material', N'0001_initial', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (14, N'combo', N'0001_initial', CAST(0x0000A59500BDE994 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (15, N'mat_obs_classe', N'0001_initial', CAST(0x0000A59500BDEAC0 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (16, N'combo', N'0002_auto_20160115_0905', CAST(0x0000A59500BDEBEC AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (17, N'desconto', N'0001_initial', CAST(0x0000A59500BDEBEC AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (18, N'funcao', N'0001_initial', CAST(0x0000A59500BDEBEC AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (19, N'funcionario', N'0001_initial', CAST(0x0000A59500BDEBEC AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (20, N'layout_touch', N'0001_initial', CAST(0x0000A59500BDEBEC AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (21, N'ponto_venda', N'0001_initial', CAST(0x0000A59500BDEBEC AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (22, N'ponto_fiscal', N'0001_initial', CAST(0x0000A59500BDEBEC AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (23, N'maquina', N'0001_initial', CAST(0x0000A59500BDEBEC AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (24, N'mat_obs_classe', N'0002_auto_20160120_1437', CAST(0x0000A59500BDED18 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (25, N'motivo_cancelamento', N'0001_initial', CAST(0x0000A59500BDED18 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (26, N'permissao', N'0001_initial', CAST(0x0000A59500BDED18 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (27, N'sessions', N'0001_initial', CAST(0x0000A59500BDED18 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (28, N'tabela_preco', N'0001_initial', CAST(0x0000A59500BDED18 AS DateTime))
GO
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (29, N'tipo_recebimento', N'0001_initial', CAST(0x0000A59500BDED18 AS DateTime))
go
delete dbo.django_session
go
SET IDENTITY_INSERT [dbo].[django_migrations] OFF
go
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'005od9uu7qe4tw8phs9d8h6vm7e4x8pd', N'ODcwZTY5ZDQ4YTQ4MTQ5NTRhMDMxNjlmOWM2NTQxYmNiZTVkNTUzYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImEzZDFhMzUzM2FjY2RlMzM3Yzc1MTFlM2ZkYTBmYWE1NTQxZDZjYWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', CAST(0x0000A5A300BE5FF0 AS DateTime))
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_group]') AND name = N'UQ__auth_gro__72E12F1BD93FC475')
ALTER TABLE [dbo].[auth_group] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_modulo]') AND name = N'auth_group_modulo_modulo_id_3ab00aae_uniq')
ALTER TABLE [dbo].[auth_group_modulo] ADD  CONSTRAINT [auth_group_modulo_modulo_id_3ab00aae_uniq] UNIQUE NONCLUSTERED 
(
	[modulo_id] ASC,
	[grupo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_permissions]') AND name = N'UQ__auth_gro__6B24A40E83C0DCC7')
ALTER TABLE [dbo].[auth_group_permissions] ADD UNIQUE NONCLUSTERED 
(
	[group_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_permission]') AND name = N'UQ__auth_per__0A068CF7737CA828')
ALTER TABLE [dbo].[auth_permission] ADD UNIQUE NONCLUSTERED 
(
	[content_type_id] ASC,
	[codename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_user]') AND name = N'UQ__auth_use__F3DBC572270AB4ED')
ALTER TABLE [dbo].[auth_user] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_groups]') AND name = N'UQ__auth_use__A4E94E5468F4CFCB')
ALTER TABLE [dbo].[auth_user_groups] ADD UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions]') AND name = N'UQ__auth_use__07ED06A10C4F6F61')
ALTER TABLE [dbo].[auth_user_user_permissions] ADD UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[django_content_type]') AND name = N'django_content_type_app_label_3ec8c61c_uniq')
ALTER TABLE [dbo].[django_content_type] ADD  CONSTRAINT [django_content_type_app_label_3ec8c61c_uniq] UNIQUE NONCLUSTERED 
(
	[app_label] ASC,
	[model] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_modulo_grupo_id_2560093e_fk_auth_group_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_group_modulo]'))
ALTER TABLE [dbo].[auth_group_modulo]  WITH CHECK ADD  CONSTRAINT [auth_group_modulo_grupo_id_2560093e_fk_auth_group_id] FOREIGN KEY([grupo_id])
REFERENCES [dbo].[auth_group] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_modulo_grupo_id_2560093e_fk_auth_group_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_group_modulo]'))
ALTER TABLE [dbo].[auth_group_modulo] CHECK CONSTRAINT [auth_group_modulo_grupo_id_2560093e_fk_auth_group_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_permissions_group_id_58c48ba9_fk_auth_group_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_group_permissions]'))
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_group_id_58c48ba9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_permissions_group_id_58c48ba9_fk_auth_group_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_group_permissions]'))
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_58c48ba9_fk_auth_group_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_permissions_permission_id_23962d04_fk_auth_permission_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_group_permissions]'))
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_permission_id_23962d04_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_group_permissions_permission_id_23962d04_fk_auth_permission_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_group_permissions]'))
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_23962d04_fk_auth_permission_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_permission_content_type_id_51277a81_fk_django_content_type_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_permission]'))
ALTER TABLE [dbo].[auth_permission]  WITH CHECK ADD  CONSTRAINT [auth_permission_content_type_id_51277a81_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_permission_content_type_id_51277a81_fk_django_content_type_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_permission]'))
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_51277a81_fk_django_content_type_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_groups_group_id_30a071c9_fk_auth_group_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_user_groups]'))
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_group_id_30a071c9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_groups_group_id_30a071c9_fk_auth_group_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_user_groups]'))
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_30a071c9_fk_auth_group_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_groups_user_id_24702650_fk_auth_user_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_user_groups]'))
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_user_id_24702650_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_groups_user_id_24702650_fk_auth_user_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_user_groups]'))
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_user_id_24702650_fk_auth_user_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions_permission_id_3d7071f0_fk_auth_permission_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions]'))
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_permission_id_3d7071f0_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions_permission_id_3d7071f0_fk_auth_permission_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions]'))
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_permission_id_3d7071f0_fk_auth_permission_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions]'))
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[auth_user_user_permissions]'))
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[django_admin_log_content_type_id_5151027a_fk_django_content_type_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[django_admin_log]'))
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_5151027a_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[django_admin_log_content_type_id_5151027a_fk_django_content_type_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[django_admin_log]'))
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_5151027a_fk_django_content_type_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[django_admin_log_user_id_1c5f563_fk_auth_user_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[django_admin_log]'))
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_1c5f563_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[django_admin_log_user_id_1c5f563_fk_auth_user_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[django_admin_log]'))
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_1c5f563_fk_auth_user_id]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[django_admin_log_action_flag_2df89e11_check]') AND parent_object_id = OBJECT_ID(N'[dbo].[django_admin_log]'))
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_2df89e11_check] CHECK  (([action_flag]>=(0)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[django_admin_log_action_flag_2df89e11_check]') AND parent_object_id = OBJECT_ID(N'[dbo].[django_admin_log]'))
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_2df89e11_check]
GO
