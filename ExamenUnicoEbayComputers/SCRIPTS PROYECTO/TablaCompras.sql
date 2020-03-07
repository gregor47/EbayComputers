USE [Work_DataBase]
GO

/****** Object:  Table [dbo].[Compras]    Script Date: 07/03/2020 18:18:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Compras](
	[Nombre] [nchar](50) NULL,
	[direccion] [nchar](200) NULL,
	[telefono] [nchar](20) NULL,
	[cantidad] [int] NULL,
	[tarjetacredito] [nchar](4) NULL,
	[id_compra] [bigint] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO

