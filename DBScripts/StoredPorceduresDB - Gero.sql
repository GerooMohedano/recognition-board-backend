USE [OnBoardDataBase]
/***** Desactivar Empresa *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='Empresa_Desactivate')
DROP PROCEDURE Empresa_Desactivate
GO
CREATE PROCEDURE [Empresa_Desactivate]
	@id int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [dbo].[Empresas] SET [estado] = 'inactivo' WHERE [idEmpresa] = @id
END
GO

/***** Activar Empresa *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='Empresa_Activate')
DROP PROCEDURE Empresa_Activate
GO
CREATE PROCEDURE [Empresa_Activate]
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [dbo].[Empresas] SET [estado] = 'activo' WHERE [idEmpresa] = @id
END
GO

/***** Activar miembro de equipo *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='UsuariosEquipos_Activate')
DROP PROCEDURE UsuariosEquipos_Activate
GO
CREATE PROCEDURE [UsuariosEquipos_Activate]
	@idUsuario int,
	@idEquipo int
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [dbo].[UsuariosEquipos] SET [estado] = 'activo' WHERE [idUsuario] = @idUsuario AND [idEquipo] = @idEquipo
END
GO

/***** Desactivar miembro de equipo *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='UsuariosEquipos_Desactivate')
DROP PROCEDURE UsuariosEquipos_Desactivate
GO
CREATE PROCEDURE [UsuariosEquipos_Desactivate]
	@idUsuario int,
	@idEquipo int
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [dbo].[UsuariosEquipos] SET [estado] = 'inactivo' WHERE [idUsuario] = @idUsuario AND [idEquipo] = @idEquipo
END
GO

/***** Buscar Perfil *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='BuscarPerfil')
DROP PROCEDURE BuscarPerfil
GO
CREATE PROCEDURE [BuscarPerfil]
	@idUsuario int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT nombre, mail, fotoPerfil FROM Usuarios WHERE idUsuario = @idUsuario
END
GO

/***** Buscar idUsuario *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='BuscarPerfil')
DROP PROCEDURE BuscarPerfil
GO
CREATE PROCEDURE [BuscarPerfil]
	@mailONombre varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT idUsuario, nombre, mail FROM Usuarios WHERE nombre LIKE @mailONombre OR mail LIKE @mailONombre
END
GO

/***** Consultar logros de un Usuario *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='ConsultarLogrosDeUnUsuario')
DROP PROCEDURE ConsultarLogrosDeUnUsuario
GO
CREATE PROCEDURE [ConsultarLogrosDeUnUsuario]
	@idUsuario int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Usuarios.nombre, Logros.nombre, Logros.descripcion, LogrosUsuarios.fecha
	FROM Usuarios INNER JOIN LogrosUsuarios ON Usuarios.idUsuario = LogrosUsuarios.idUsuario
	INNER JOIN Logros ON LogrosUsuarios.idLogro = Logros.idLogro
	WHERE Usuarios.idUsuario = @idUsuario
	ORDER BY Logros.nombre ASC
END
GO

/***** Consultar puntuacion de valores de un usuario *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='ConsultarValoresUsuario')
DROP PROCEDURE ConsultarValoresUsuario
GO
CREATE PROCEDURE [ConsultarValoresUsuario]
	@idUsuario int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Usuarios.nombre, Valores.nombre, SUM(Notas.puntuacion) AS 'Total'
	FROM Usuarios INNER JOIN Notas ON Usuarios.idUsuario = Notas.idDestinatario
	INNER JOIN Valores ON Notas.idValor = Valores.idValor
	WHERE Usuarios.idUsuario = @idUsuario
	GROUP BY Usuarios.nombre, Valores.nombre
	ORDER BY Valores.nombre
END
GO

/***** Consultar historico de un valor para un usuario *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='ConsultarHistoricoValorUsuario')
DROP PROCEDURE ConsultarHistoricoValorUsuario
GO
CREATE PROCEDURE [ConsultarHistoricoValorUsuario]
	@idUsuario int,
	@idValor int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Usuarios.nombre, Valores.nombre, Notas.puntuacion, Pizarras.fechaInicio
	FROM Usuarios INNER JOIN Notas ON Usuarios.idUsuario = Notas.idDestinatario
	INNER JOIN Valores ON Notas.idValor = Valores.idValor
	INNER JOIN Pizarras ON Notas.idPizarra = Pizarras.idPizarra
	WHERE Usuarios.idUsuario = @idUsuario AND Valores.idValor = @idValor
	ORDER BY Pizarras.fechaInicio
END
GO

/***** Consultar pizarra de un equipo *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='ConsultarPizarraEquipo')
DROP PROCEDURE ConsultarPizarraEquipo
GO
CREATE PROCEDURE [ConsultarPizarraEquipo]
	@idEquipo int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Equipos.nombre, Pizarras.titulo, Pizarras.fechaInicio, Pizarras.fechaFin
	FROM Pizarras INNER JOIN Equipos ON Pizarras.idEquipo = Equipos.idEquipo
	WHERE Equipos.idEquipo = @idEquipo
	ORDER BY FechaInicio ASC
END
GO