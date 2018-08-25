USE [master]
GO

IF EXISTS(select * from sys.databases where name='OnBoardDataBase')
DROP DATABASE OnBoardDataBase

/****** Object:  Database [OnBoardDataBase] ******/
CREATE DATABASE [OnBoardDataBase]
 ON  PRIMARY 
( NAME = N'OnBoardDataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\OnBoardDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnBoardDataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\OnBoardDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OnBoardDataBase] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnBoardDataBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

USE [OnBoardDataBase]
GO

/****** Object:  Table Usuarios ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[contrasenia] [varchar](30) NOT NULL,
	[adminGrupo] [bit] NOT NULL,
	[adminGeneral] [bit] NOT NULL,
	[responsable] [int] NULL,
	[mail] [varchar](50) NULL,
	[fotoPerfil] [image] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table Logros ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logros](
	[idLogro] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](150) NOT NULL,
	[foto] [image] NULL,
 CONSTRAINT [PK_Logros] PRIMARY KEY CLUSTERED 
(
	[idLogro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table LogrosUsuarios ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogrosUsuarios](
	[idLogro] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [PK_LogrosUsuarios] PRIMARY KEY CLUSTERED 
(
	[idLogro] ASC,
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table Equipos ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipos](
	[idEquipo] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[admin] [int] NOT NULL,
 CONSTRAINT [PK_Equipos] PRIMARY KEY CLUSTERED 
(
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table UsuariosEquipos ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosEquipos](
	[idEquipo] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
 CONSTRAINT [PK_UsuariosEquipos] PRIMARY KEY CLUSTERED 
(
	[idEquipo] ASC,
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table Pizarras ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pizarras](
	[idPizarra] [int] NOT NULL,
	[sprint] [varchar](8) NOT NULL,
	[equipo] [int] NOT NULL,
 CONSTRAINT [PK_Pizarras] PRIMARY KEY CLUSTERED 
(
	[idPizarra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table Valores ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valores](
	[idValor] [int] NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Valores] PRIMARY KEY CLUSTERED 
(
	[idValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table ValoresPizarras ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValoresPizarras](
	[idValor] [int] NOT NULL,
	[idPizarra] [int] NOT NULL,
 CONSTRAINT [PK_ValoresPizarras] PRIMARY KEY CLUSTERED 
(
	[idValor] ASC,
	[idPizarra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table Notas ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notas](
	[idNota] [int] NOT NULL,
	[pizarra] [int] NOT NULL,
	[usuario] [int] NOT NULL,
	[valor] [int] NOT NULL,
	[nota] [varchar](300) NULL,
	[positividad] [int] NOT NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[idNota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*** Foreign keys ***/

ALTER TABLE [dbo].[Usuarios] WITH CHECK ADD CONSTRAINT [FK_Usuarios_Responsable] FOREIGN KEY([responsable])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[LogrosUsuarios] WITH CHECK ADD CONSTRAINT [FK_UsuariosLogros_IdUsuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[LogrosUsuarios] WITH CHECK ADD CONSTRAINT [FK_UsuariosLogros_IdLogro] FOREIGN KEY([idLogro])
REFERENCES [dbo].[Logros] ([idLogro])
GO
ALTER TABLE [dbo].[Equipos] WITH CHECK ADD CONSTRAINT [FK_Equipos_Admin] FOREIGN KEY([admin])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[UsuariosEquipos] WITH CHECK ADD CONSTRAINT [FK_UsuariosEquipos_IdUsuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[UsuariosEquipos] WITH CHECK ADD CONSTRAINT [FK_UsuariosEquipos_IdEquipo] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Pizarras] WITH CHECK ADD CONSTRAINT [FK_Pizarras_Equipo] FOREIGN KEY([equipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[ValoresPizarras] WITH CHECK ADD CONSTRAINT [FK_ValoresPizarras_IdValor] FOREIGN KEY([idValor])
REFERENCES [dbo].[Valores] ([idValor])
GO
ALTER TABLE [dbo].[ValoresPizarras] WITH CHECK ADD CONSTRAINT [FK_ValoresPizarras_IdPizarra] FOREIGN KEY([idPizarra])
REFERENCES [dbo].[Pizarras] ([idPizarra])
GO
ALTER TABLE [dbo].[Notas] WITH CHECK ADD CONSTRAINT [FK_Notas_Pizarra] FOREIGN KEY([pizarra])
REFERENCES [dbo].[Pizarras] ([idPizarra])
GO
ALTER TABLE [dbo].[Notas] WITH CHECK ADD CONSTRAINT [FK_Notas_Valor] FOREIGN KEY([valor])
REFERENCES [dbo].[Valores] ([idValor])
GO
ALTER TABLE [dbo].[Notas] WITH CHECK ADD CONSTRAINT [FK_Notas_Usuario] FOREIGN KEY([usuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO

/*** Default ***/
ALTER TABLE [dbo].[Usuarios] ADD CONSTRAINT [DF_Usuarios_Contrasenia]  DEFAULT (('sovos123')) FOR [contrasenia]
GO

/*** Check ***/
ALTER TABLE [dbo].[Notas] ADD CONSTRAINT [CK_Notas_Positividad] CHECK (([positividad] = -1 OR [positividad] = 1))
GO

/*** Unique ***/

CREATE UNIQUE INDEX IX_Mail ON Usuarios(mail)
GO

CREATE UNIQUE INDEX IX_Nombre ON Usuarios(nombre)
GO

/*** Index ***/


/* 
 * INDEX: IX_idUsuario 
 */

CREATE UNIQUE INDEX IX_idUsuario ON Usuarios(idUsuario)
go


/* 
 * INDEX: IX_idEquipo
 */

CREATE UNIQUE INDEX IX_idEquipo ON Equipos(idEquipo)
go

/* 
 * INDEX: IX_idPizarra 
 */

CREATE UNIQUE INDEX IX_idPizarra ON Pizarras(idPizarra)
go

/* 
 * INDEX: IX_idLogro
 */

CREATE UNIQUE INDEX IX_idLogro ON Logros(idLogro)
go

/* 
 * INDEX: IX_idValor
 */

CREATE UNIQUE INDEX IX_idValor ON Valores(idValor)
go

/* 
 * INDEX: IX_idNota
 */

CREATE UNIQUE INDEX IX_idNota ON Notas(idNota)
go

/*** Index compuestos ***/

/* 
 * INDEX: IX_idLogroUsuario
 */

CREATE INDEX IX_idLogroUsuario ON LogrosUsuarios(idLogro)
go

/* 
 * INDEX: IX_idUsuarioLogro 
 */

CREATE INDEX IX_idUsuarioLogro ON LogrosUsuarios(idUsuario)
go

/* 
 * INDEX: IX_idUsuarioEquipo
 */

CREATE INDEX IX_idUsuarioEquipo ON UsuariosEquipos(idUsuario)
go

/* 
 * INDEX: IX_idEquipoUsuario
 */

CREATE INDEX IX_idEquipoUsuario ON UsuariosEquipos(idEquipo)
go

/* 
 * INDEX: IX_idValorPizarra
 */

CREATE INDEX IX_idValorPizarra ON ValoresPizarras(idValor)
go

/* 
 * INDEX: IX_idPizarraValor
 */

CREATE INDEX IX_idPizarraValor ON ValoresPizarras(idPizarra)
go


/* 
 * INDEX: IX_idPizarraNota
 */

CREATE INDEX IX_idPizarraNota ON Notas(pizarra)
go

/* 
 * INDEX: IX_idValorNota
 */

CREATE INDEX IX_idValorNota ON Notas(valor)
go

/* 
 * INDEX: IX_idUsuarioNota
 */

CREATE INDEX IX_idUsuarioNota ON Notas(usuario)
go
