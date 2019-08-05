USE [master]
GO

IF EXISTS(select * from sys.databases where name='OnBoardDataBase')
DROP DATABASE OnBoardDataBase

/****** Object:  Database [OnBoardDataBase] ******/
CREATE DATABASE [OnBoardDataBase]
 ON  PRIMARY 
( NAME = N'OnBoardDataBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OnBoardDataBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnBoardDataBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\OnBoardDataBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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


USE [OnBoardDataBase]
GO

/****** Object:  Table TOKEN ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.tables where name='Token')
DROP TABLE Token
GO
CREATE TABLE [dbo].[Token](
	[idToken] [int] IDENTITY(1,1) NOT NULL,
	[valorToken] [varchar](MAX) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Token] PRIMARY KEY CLUSTERED 
(
	[idToken] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table Usuarios ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.tables where name='Usuarios')
DROP TABLE Usuarios
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[contrasenia] [varchar](30) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[fotoPerfil] [image] NULL,
	[adminGeneral] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE Usuarios WITH CHECK ADD CONSTRAINT[

ERROR:
Debe ingresar sólo caracteres alfabéticos

]CHECK (Usuarios.nombre NOT LIKE '%[^A-Z]%') 
GO 


/****** Object:  Table Logros ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.tables where name='Logros')
DROP TABLE Logros
GO
CREATE TABLE [dbo].[Logros](
	[idLogro] [int] IDENTITY(1,1)  NOT NULL,
	[idEmpresa] [int] NOT NULL,
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
IF EXISTS(select * from sys.tables where name='LogrosUsuarios')
DROP TABLE LogrosUsuarios
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
IF EXISTS(select * from sys.tables where name='Equipos')
DROP TABLE Equipos
GO
CREATE TABLE [dbo].[Equipos](
	[idEquipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[imagen] [image] NULL,
	[estado] [varchar](30) NOT NULL,
	[idEmpresa] [int] NOT NULL,
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
IF EXISTS(select * from sys.tables where name='UsuariosEquipos')
DROP TABLE UsuariosEquipos
GO
CREATE TABLE [dbo].[UsuariosEquipos](
	[idEquipo] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[rol] [bit] NOT NULL,
	[estado] [varchar](30) NOT NULL,
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
IF EXISTS(select * from sys.tables where name='Pizarras')
DROP TABLE Pizarras
GO
CREATE TABLE [dbo].[Pizarras](
	[idPizarra] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](30) NOT NULL,
	[idEquipo] [int] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
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
IF EXISTS(select * from sys.tables where name='Valores')
DROP TABLE Valores
GO
CREATE TABLE [dbo].[Valores](
	[idValor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Valores] PRIMARY KEY CLUSTERED 
(
	[idValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table equipoValor ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.tables where name='EquiposValores')
DROP TABLE EquiposValores
GO
CREATE TABLE [dbo].[EquiposValores](
	[idEquipo] [int] NOT NULL,
	[idValor] [int] NOT NULL,
	[estado] [varchar](30) NOT NULL,
 CONSTRAINT [PK_EquipoValor] PRIMARY KEY CLUSTERED 
(
	[idValor] ASC,
	[idEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table Notas ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.tables where name='Notas')
DROP TABLE Notas
GO
CREATE TABLE [dbo].[Notas](
	[idNota] [int] IDENTITY(1,1) NOT NULL,
	[idPizarra] [int] NOT NULL,
	[idAutor] [int] NOT NULL,
	[idDestinatario] [int] NOT NULL,
	[idValor] [int] NOT NULL,
	[descripcion] [varchar](300) NULL,
	[puntuacion] [int] NOT NULL, CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[idNota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table Empresas ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
IF EXISTS(select * from sys.tables where name='Empresas')
DROP TABLE Empresas
GO
CREATE TABLE [dbo].[Empresas](
	[idEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[telefono] [int] NULL,
	[estado] [varchar](30) NOT NULL,
	[logo] [image] NULL, CONSTRAINT [PK_Empresas] PRIMARY KEY CLUSTERED 
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE Empresas WITH CHECK ADD CONSTRAINT[

ERROR:
Debe ingresar sólo números

]CHECK (Empresas.telefono NOT LIKE '%[^0-9]%') 
GO 


/****** Object:  Table UsuariosEmpresas ******/
IF EXISTS(select * from sys.tables where name='UsuariosEmpresas')
DROP TABLE UsuariosEmpresas
GO
CREATE TABLE [dbo].[UsuariosEmpresas](
	[idEmpresa] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[rol] [bit] NOT NULL,
	CONSTRAINT [PK_UsuariosEmpresas] PRIMARY KEY CLUSTERED 
(
	[idEmpresa] ASC,
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table EmpresasValores ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
IF EXISTS(select * from sys.tables where name='EmpresasValores')
DROP TABLE EmpresasValores
GO
CREATE TABLE [dbo].[EmpresasValores](
	[idEmpresa] [int] NOT NULL,
	[idValor] [int] NOT NULL, CONSTRAINT [PK_EmpresasValores] PRIMARY KEY CLUSTERED 
(
	[idEmpresa] ASC,
	[idValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table Condiciones ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
IF EXISTS(select * from sys.tables where name='Condiciones')
DROP TABLE Condiciones
GO
CREATE TABLE [dbo].[Condiciones](
	[idCondicion] [int] IDENTITY(1,1) NOT NULL,
	[idValor] [int] NOT NULL,
	[puntuacion] [int] NOT NULL,
	[modificador] [bit] NOT NULL,
	[excluyente][bit] NOT NULL,
	CONSTRAINT [PK_Condiciones] PRIMARY KEY CLUSTERED 
(
	[idCondicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table LogrosCondiciones ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
IF EXISTS(select * from sys.tables where name='LogrosCondiciones')
DROP TABLE LogrosCondiciones
GO
CREATE TABLE [dbo].[LogrosCondiciones](
	[idCondicion] [int] NOT NULL,
	[idLogro] [int] NOT NULL,
	CONSTRAINT [PK_LogrosCondiciones] PRIMARY KEY CLUSTERED 
(
	[idCondicion] ASC,
	[idLogro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/*** Foreign keys ***/

ALTER TABLE [dbo].[LogrosUsuarios] WITH CHECK ADD CONSTRAINT [FK_UsuariosLogros_IdUsuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[LogrosUsuarios] WITH CHECK ADD CONSTRAINT [FK_UsuariosLogros_IdLogro] FOREIGN KEY([idLogro])
REFERENCES [dbo].[Logros] ([idLogro])
GO
ALTER TABLE [dbo].[Equipos] WITH CHECK ADD CONSTRAINT [FK_Equipos_IdEmpresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresas] ([idEmpresa])
GO
ALTER TABLE [dbo].[UsuariosEquipos] WITH CHECK ADD CONSTRAINT [FK_UsuariosEquipos_IdUsuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[UsuariosEquipos] WITH CHECK ADD CONSTRAINT [FK_UsuariosEquipos_IdEquipo] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Pizarras] WITH CHECK ADD CONSTRAINT [FK_Pizarras_Equipo] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[EquiposValores] WITH CHECK ADD CONSTRAINT [FK_EquiposValores_IdValor] FOREIGN KEY([idValor])
REFERENCES [dbo].[Valores] ([idValor])
GO
ALTER TABLE [dbo].[EquiposValores] WITH CHECK ADD CONSTRAINT [FK_EquiposValores_IdEquipo] FOREIGN KEY([idEquipo])
REFERENCES [dbo].[Equipos] ([idEquipo])
GO
ALTER TABLE [dbo].[Notas] WITH CHECK ADD CONSTRAINT [FK_Notas_Pizarra] FOREIGN KEY([idPizarra])
REFERENCES [dbo].[Pizarras] ([idPizarra])
GO
ALTER TABLE [dbo].[Notas] WITH CHECK ADD CONSTRAINT [FK_Notas_Valor] FOREIGN KEY([idValor])
REFERENCES [dbo].[Valores] ([idValor])
GO
ALTER TABLE [dbo].[Notas] WITH CHECK ADD CONSTRAINT [FK_Notas_Autor] FOREIGN KEY([idAutor])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Notas] WITH CHECK ADD CONSTRAINT [FK_Notas_Destinatario] FOREIGN KEY([idDestinatario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[EmpresasValores] WITH CHECK ADD CONSTRAINT [FK_EmpresasValores_idEmpresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresas] ([idEmpresa])
GO
ALTER TABLE [dbo].[EmpresasValores] WITH CHECK ADD CONSTRAINT [FK_EmpresasValores_idValor] FOREIGN KEY([idValor])
REFERENCES [dbo].[Valores] ([idValor])
GO
ALTER TABLE [dbo].[UsuariosEmpresas] WITH CHECK ADD CONSTRAINT [FK_UsuariosEmpresas_idUsuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[UsuariosEmpresas] WITH CHECK ADD CONSTRAINT [FK_UsuariosEmpresas_idEmpresa] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresas] ([idEmpresa])
GO
ALTER TABLE [dbo].[Condiciones] WITH CHECK ADD CONSTRAINT [FK_Condiciones_idValor] FOREIGN KEY([idValor])
REFERENCES [dbo].[Valores] ([idValor])
GO
ALTER TABLE [dbo].[LogrosCondiciones] WITH CHECK ADD CONSTRAINT [FK_LogrosCondiciones_idLogro] FOREIGN KEY([idLogro])
REFERENCES [dbo].[Logros] ([idLogro])
GO
ALTER TABLE [dbo].[LogrosCondiciones] WITH CHECK ADD CONSTRAINT [FK_LogrosCondiciones_idCondicion] FOREIGN KEY([idCondicion])
REFERENCES [dbo].[Condiciones] ([idCondicion])
GO

/*** Default ***/
ALTER TABLE [dbo].[Usuarios] ADD CONSTRAINT [DF_Usuarios_Contrasenia] DEFAULT (('sovos123')) FOR [contrasenia]
GO
ALTER TABLE [dbo].[Usuarios] ADD CONSTRAINT [DF_Usuarios_AdminGeneral] DEFAULT ((0)) FOR [adminGeneral]
GO
ALTER TABLE [dbo].[UsuariosEquipos] ADD CONSTRAINT [DF_UsuariosEquipos_Rol] DEFAULT ((0)) FOR [rol]
GO
ALTER TABLE [dbo].[UsuariosEmpresas] ADD CONSTRAINT [DF_UsuariosEmpresas_Rol] DEFAULT ((0)) FOR [rol]
GO
ALTER TABLE [dbo].[Equipos] ADD CONSTRAINT [DF_Equipos_Estado] DEFAULT (('activo')) FOR [estado]
GO
ALTER TABLE [dbo].[UsuariosEquipos] ADD CONSTRAINT [DF_UsuariosEquipos_Estado] DEFAULT (('activo')) FOR [estado]
GO
ALTER TABLE [dbo].[EquiposValores] ADD CONSTRAINT [DF_EquiposValores_Estado] DEFAULT (('activo')) FOR [estado]
GO
ALTER TABLE [dbo].[Empresas] ADD CONSTRAINT [DF_Empresas_Estado] DEFAULT (('activo')) FOR [estado]
GO
ALTER TABLE [dbo].[Condiciones] ADD CONSTRAINT [DF_Condiciones_Modificador] DEFAULT ((1)) FOR [modificador]
GO
ALTER TABLE [dbo].[Condiciones] ADD CONSTRAINT [DF_Condiciones_Excluyente] DEFAULT ((0)) FOR [excluyente]
GO

/*** Check ***/
ALTER TABLE [dbo].[Notas] ADD CONSTRAINT [CK_Notas_Puntuacion] CHECK (([puntuacion] = -1 OR [puntuacion] = 1))
GO
ALTER TABLE [dbo].[Equipos] ADD CONSTRAINT [CK_Equipos_Estado] CHECK (([estado] = 'activo' OR [estado] = 'inactivo'))
GO
ALTER TABLE [dbo].[UsuariosEquipos] ADD CONSTRAINT [CK_UsuariosEquipos_Estado] CHECK (([estado] = 'activo' OR [estado] = 'inactivo'))
GO
ALTER TABLE [dbo].[EquiposValores] ADD CONSTRAINT [CK_EquiposValores_Estado] CHECK (([estado] = 'activo' OR [estado] = 'inactivo'))
GO
ALTER TABLE [dbo].[Empresas] ADD CONSTRAINT [CK_Empresas_Estado] CHECK (([estado] = 'activo' OR [estado] = 'inactivo'))
GO

/*** Index ***/


/* 
 * INDEX: IX_idUsuario 
 */

CREATE UNIQUE INDEX IX_idUsuario ON Usuarios(idUsuario)
go

CREATE UNIQUE INDEX IX_Mail ON Usuarios(mail)
GO

CREATE UNIQUE INDEX IX_Nombre ON Usuarios(nombre)
GO

/* 
 * INDEX: IX_idEquipo
 */

CREATE UNIQUE INDEX IX_idEquipo ON Equipos(idEquipo)
go

CREATE UNIQUE INDEX IX_NombreEquipo ON Equipos(nombre)
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

CREATE UNIQUE INDEX IX_nombreValor ON Valores(nombre)
go

/* 
 * INDEX: IX_idNota
 */

CREATE UNIQUE INDEX IX_idNota ON Notas(idNota)
go

/* 
 * INDEX: IX_idValorNota
 */

CREATE INDEX IX_idValorNota ON Notas(idValor)
go

/* 
 * INDEX: IX_idUsuarioNota
 */

CREATE INDEX IX_idAutorNota ON Notas(idAutor)
go

/* 
 * INDEX: IX_idUsuarioNota
 */

CREATE INDEX IX_idDestinatarioNota ON Notas(idDestinatario)
go

/* 
 * INDEX: IX_idPizarraNota
 */

CREATE INDEX IX_idPizarraNota ON Notas(idPizarra)
go

/*** Index compuestos (de union) ***/

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
 * INDEX: IX_idEquipoEquiposValores
 */

CREATE INDEX IX_idEquiposValoresEquipo ON EquiposValores(idEquipo)
go

/* 
 * INDEX: IX_idEquipoValorValor
 */

CREATE INDEX IX_idEquiposValoresValor ON EquiposValores(idValor)
go

---
/* 
 * INDEX: IX_idEmpresa
 */

CREATE INDEX IX_idEmpresa ON Empresas(idEmpresa)
go

/* 
 * INDEX: IX_idEmpresaValorEmpresa
 */

CREATE INDEX IX_idEmpresaValorEmpresa ON EmpresasValores(idEmpresa)
go

/* 
 * INDEX: IX_idEmpresaValorValor
 */

CREATE INDEX IX_idEmpresaValorValor ON EmpresasValores(idValor)
go

 if object_id ('Regla_Puntuacion') is not null
   drop rule Regla_Puntuacion;
   go

CREATE RULE Regla_Puntuacion
as

@puntuacion = +1 or @puntuacion = -1;
go
exec sp_bindrule Regla_Puntuacion, 'Notas.puntuacion'