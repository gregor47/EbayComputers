USE [Work_DataBase]
GO

/****** Object:  Table [dbo].[Usuarios]    Script Date: 07/03/2020 18:19:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Usuarios](
	[id_usuario] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nchar](50) NULL,
	[contrasena] [nchar](50) NULL
) ON [PRIMARY]
GO

