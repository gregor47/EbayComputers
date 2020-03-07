USE [Work_DataBase]
GO

/****** Object:  Table [dbo].[Inventario]    Script Date: 07/03/2020 18:18:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Inventario](
	[Nombre] [nchar](1000) NULL,
	[ImagenUrl] [nvarchar](4000) NULL,
	[TipoProducto] [nchar](200) NULL,
	[id_producto] [bigint] IDENTITY(1,1) NOT NULL,
	[precio] [float] NULL
) ON [PRIMARY]
GO

