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
		begin try
			UPDATE [dbo].[Empresas] SET [estado] = 'inactivo' WHERE [idEmpresa] = @id
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
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
		begin try
			UPDATE [dbo].[Empresas] SET [estado] = 'activo' WHERE [idEmpresa] = @id
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

/***** Desactivar UsuariosEmpresas *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='UsuarioEmpresa_Desactivate')
DROP PROCEDURE UsuarioEmpresa_Desactivate
GO
CREATE PROCEDURE [UsuarioEmpresa_Desactivate]
	@idUsuario int
AS
BEGIN
	SET NOCOUNT ON;
		begin try
			UPDATE [dbo].[UsuariosEmpresas] SET [estado] = 'inactivo' WHERE [idUsuario] = @idUsuario
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

/***** Activar UsuariosEmpresas *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='UsuarioEmpresa_Activate')
DROP PROCEDURE UsuarioEmpresa_Activate
GO
CREATE PROCEDURE [UsuarioEmpresa_Activate]
	@idUsuario int
AS
BEGIN
	SET NOCOUNT ON;
		begin try
			UPDATE [dbo].[UsuariosEmpresas] SET [estado] = 'activo' WHERE [idUsuario] = @idUsuario
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

/***** Eliminar UsuarioEmpresa *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='UsuarioEmpresa_Delete')
DROP PROCEDURE UsuarioEmpresa_Delete
GO
CREATE PROCEDURE [UsuarioEmpresa_Delete]
	@idUsuario int
AS
BEGIN
	SET NOCOUNT ON;
		begin try
			delete from dbo.UsuariosEmpresas where idUsuario = @idUsuario
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
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
		begin try
			UPDATE [dbo].[UsuariosEquipos] SET [estado] = 'activo' WHERE [idUsuario] = @idUsuario AND [idEquipo] = @idEquipo
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
	
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
		begin try
			UPDATE [dbo].[UsuariosEquipos] SET [estado] = 'inactivo' WHERE [idUsuario] = @idUsuario AND [idEquipo] = @idEquipo
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

/***** Activar valor de equipo *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='EquiposValores_Activate')
DROP PROCEDURE EquiposValores_Activate
GO
CREATE PROCEDURE [EquiposValores_Activate]
	@idValor int,
	@idEquipo int
AS
BEGIN
	SET NOCOUNT ON;
		begin try
			 UPDATE [dbo].[EquiposValores] SET [estado] = 'activo' WHERE [idValor] = @idValor AND [idEquipo] = @idEquipo
	    end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

/***** Desactivar miembro de equipo *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='EquiposValores_Desactivate')
DROP PROCEDURE EquiposValores_Desactivate
GO
CREATE PROCEDURE [EquiposValores_Desactivate]
	@idValor int,
	@idEquipo int
AS
BEGIN
	SET NOCOUNT ON;
		begin try
			UPDATE [dbo].[EquiposValores] SET [estado] = 'inactivo' WHERE [idValor] = @idValor AND [idEquipo] = @idEquipo
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

/***** Activar Equipo *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='Equipos_Activate')
DROP PROCEDURE Equipos_Activate
GO
CREATE PROCEDURE [Equipos_Activate]
	@idEquipo int
AS
BEGIN
	SET NOCOUNT ON;
		begin try
			 UPDATE [dbo].[Equipos] SET [estado] = 'activo' WHERE [idEquipo] = @idEquipo
	    end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

/***** Desactivar equipo *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='Equipos_Desactivate')
DROP PROCEDURE Equipos_Desactivate
GO
CREATE PROCEDURE [Equipos_Desactivate]
	@idEquipo int
AS
BEGIN
	SET NOCOUNT ON;
		begin try
			UPDATE [dbo].[Equipos] SET [estado] = 'inactivo' WHERE [idEquipo] = @idEquipo
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
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
		begin try
			 SELECT nombre, mail, fotoPerfil FROM Usuarios WHERE idUsuario = @idUsuario
	    end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
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
	begin try
		SELECT idUsuario, nombre, mail FROM Usuarios WHERE nombre LIKE @mailONombre OR mail LIKE @mailONombre
	end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
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
		begin try
			SELECT Logros.idLogro, Logros.nombre as nombre_logro, Logros.descripcion, LogrosUsuarios.fecha
			FROM Usuarios INNER JOIN LogrosUsuarios ON Usuarios.idUsuario = LogrosUsuarios.idUsuario
			INNER JOIN Logros ON LogrosUsuarios.idLogro = Logros.idLogro
			WHERE Usuarios.idUsuario = @idUsuario
			ORDER BY Logros.nombre ASC
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
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
		begin try
			SELECT  Valores.idValor, Valores.nombre, SUM(Notas.puntuacion) AS 'Total'
			FROM Usuarios INNER JOIN Notas ON Usuarios.idUsuario = Notas.idDestinatario
			INNER JOIN Valores ON Notas.idValor = Valores.idValor
			WHERE Usuarios.idUsuario = @idUsuario
			GROUP BY Usuarios.nombre, Valores.nombre, Usuarios.idUsuario, Valores.idValor
			ORDER BY Valores.nombre
		end try
			begin catch
				declare @error varchar(100)= ERROR_MESSAGE()
				RAISERROR(@error,11,1)  
			end catch
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
		begin try
			SELECT Usuarios.nombre, Valores.nombre, Notas.puntuacion, Pizarras.fechaInicio
			FROM Usuarios INNER JOIN Notas ON Usuarios.idUsuario = Notas.idDestinatario
			INNER JOIN Valores ON Notas.idValor = Valores.idValor
			INNER JOIN Pizarras ON Notas.idPizarra = Pizarras.idPizarra
			WHERE Usuarios.idUsuario = @idUsuario AND Valores.idValor = @idValor
			ORDER BY Pizarras.fechaInicio
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
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
		begin try
			SELECT Equipos.nombre, Pizarras.idPizarra, Pizarras.titulo, Pizarras.fechaInicio, Pizarras.fechaFin
			FROM Pizarras INNER JOIN Equipos ON Pizarras.idEquipo = Equipos.idEquipo
			WHERE Equipos.idEquipo = @idEquipo
			ORDER BY FechaFin ASC
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

/***** Consultar pizarra activa de un equipo *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='ConsultarPizarraActivaEquipo')
DROP PROCEDURE ConsultarPizarraActivaEquipo
GO
CREATE PROCEDURE [ConsultarPizarraActivaEquipo]
	@idEquipo int
AS
BEGIN
	SET NOCOUNT ON;

		begin try
			SELECT Equipos.nombre, Pizarras.titulo, Pizarras.fechaInicio, Pizarras.fechaFin
			FROM Pizarras INNER JOIN Equipos ON Pizarras.idEquipo = Equipos.idEquipo
			WHERE Equipos.idEquipo = @idEquipo AND GETDATE() BETWEEN Pizarras.fechaInicio AND Pizarras.fechaFin
			ORDER BY FechaInicio ASC
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

/***** Consultar pizarra activa de un usuario *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='ConsultarPizarraActivaUsuario')
DROP PROCEDURE ConsultarPizarraActivaUsuario
GO
CREATE PROCEDURE [ConsultarPizarraActivaUsuario]
	@idUsuario int
AS
BEGIN
	SET NOCOUNT ON;

		begin try
			SELECT Usuarios.nombre, Pizarras.titulo, Pizarras.fechaInicio, Pizarras.fechaFin, Equipos.nombre
			FROM Usuarios INNER JOIN UsuariosEquipos ON Usuarios.idUsuario = UsuariosEquipos.idUsuario
			INNER JOIN Equipos ON UsuariosEquipos.idEquipo = Equipos.idEquipo
			INNER JOIN Pizarras ON Equipos.idEquipo = Pizarras.idEquipo
			WHERE Usuarios.idUsuario = @idUsuario AND GETDATE() BETWEEN Pizarras.fechaInicio AND Pizarras.fechaFin
			ORDER BY Equipos.nombre ASC
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

/***** Consultar evaluacion de equipo *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='ConsultarEvaluacionEquipo')
DROP PROCEDURE ConsultarEvaluacionEquipo
GO
CREATE PROCEDURE [ConsultarEvaluacionEquipo]
	@idEquipo int
AS
BEGIN
	SET NOCOUNT ON;

		begin try
			SELECT Equipos.nombre as nombre_equipo, SUM(Notas.puntuacion) AS 'Total', Valores.idValor, Valores.nombre as nombre_valor
			FROM Equipos INNER JOIN Pizarras ON Equipos.idEquipo = Pizarras.idEquipo
			INNER JOIN Notas ON Pizarras.idPizarra = Notas.idPizarra
			INNER JOIN Valores ON Notas.idValor = Valores.idValor
			WHERE Equipos.idEquipo = @idEquipo
			GROUP BY Valores.idValor, Valores.nombre, Equipos.nombre
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

/***** Consultar evaluacion de empresa *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS(select * from sys.procedures where name='ConsultarEvaluacionEmpresa')
DROP PROCEDURE ConsultarEvaluacionEmpresa
GO
CREATE PROCEDURE [ConsultarEvaluacionEmpresa]
	@idEmpresa int
AS
BEGIN
	SET NOCOUNT ON;

		begin try
			SELECT Empresas.nombre, SUM(Notas.puntuacion) AS 'Total', Valores.nombre
			FROM Equipos INNER JOIN Pizarras ON Equipos.idEquipo = Pizarras.idEquipo
			INNER JOIN Notas ON Pizarras.idPizarra = Notas.idPizarra
			INNER JOIN Valores ON Notas.idValor = Valores.idValor
			INNER JOIN Empresas ON Equipos.idEmpresa = Empresas.idEmpresa
			WHERE Empresas.idEmpresa = @idEmpresa
			GROUP BY Valores.nombre, Empresas.nombre
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

/***** Consultar historico de un valor para un equipo *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(select * from sys.procedures where name='ConsultarHistoricoValorEquipo')
DROP PROCEDURE ConsultarHistoricoValorEquipo
GO
CREATE PROCEDURE [ConsultarHistoricoValorEquipo]
	@idEquipo int,
	@idValor int
AS
BEGIN
	SET NOCOUNT ON;
		begin try
			SELECT Equipos.nombre as nombre_equipo, Valores.nombre, Notas.puntuacion, Pizarras.fechaInicio			
			FROM Equipos INNER JOIN Pizarras ON Equipos.idEquipo = Pizarras.idEquipo
			INNER JOIN Notas ON Pizarras.idPizarra = Notas.idPizarra
			INNER JOIN Valores ON Notas.idValor = Valores.idValor
			WHERE Equipos.idEquipo = @idEquipo AND Valores.idValor = @idValor
			ORDER BY Pizarras.fechaInicio
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

/***** Consultar historico de un valor para una empresa *****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(select * from sys.procedures where name='ConsultarHistoricoValorEmpresa')
DROP PROCEDURE ConsultarHistoricoValorEmpresa
GO
CREATE PROCEDURE [ConsultarHistoricoValorEmpresa]
	@idEmpresa int,
	@idValor int
AS
BEGIN
	SET NOCOUNT ON;
		begin try
			SELECT Empresas.nombre as nombre_equipo, Valores.nombre, Notas.puntuacion, Pizarras.fechaInicio			
			FROM Empresas INNER JOIN Equipos on Empresas.idEmpresa = Equipos.idEmpresa
			INNER JOIN Pizarras ON Equipos.idEquipo = Pizarras.idEquipo
			INNER JOIN Notas ON Pizarras.idPizarra = Notas.idPizarra
			INNER JOIN Valores ON Notas.idValor = Valores.idValor
			WHERE Empresas.idEmpresa = @idEmpresa AND Valores.idValor = @idValor
			ORDER BY Pizarras.fechaInicio
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO