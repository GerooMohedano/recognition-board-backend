USE [OnBoardDataBase]
GO
IF EXISTS(select * from sys.procedures where name='Usuarios_Insert')
DROP PROCEDURE Usuarios_Insert
GO
CREATE procedure [Usuarios_Insert]
@nombre varchar(50),
@contraseña varchar(30),
@mail varchar(30),
@fotoPerfil image,
@adminGeneral bit
as
begin
		begin try
			Insert dbo.Usuarios(nombre,contrasenia,mail,fotoPerfil,adminGeneral)
			values (@nombre,@contraseña,@mail,@fotoPerfil,@adminGeneral)
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
end
GO

IF EXISTS(select * from sys.procedures where name='Usuarios_Update')
DROP PROCEDURE Usuarios_Update
GO
CREATE procedure [Usuarios_Update]
@idUsuario int,
@nombre varchar(50),
@contrasenia varchar(30),
@mail varchar(30),
@fotoPerfil image,
@adminGeneral bit
as
begin
		begin try
			update dbo.Usuarios
			set
			 nombre=@nombre,
			 contrasenia= @contrasenia,
			 mail= @mail,
			 fotoPerfil= @fotoPerfil,
			 adminGeneral = @adminGeneral
			where idUsuario = @idUsuario
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
end 
go

IF EXISTS(select * from sys.procedures where name='Empresas_Insert')
DROP PROCEDURE Empresas_Insert
GO
CREATE PROCEDURE [dbo].[Empresas_Insert]
	@nombre nvarchar(50),
	@direccion nvarchar(50),
   	@telefono int,
	@logo image,
	@estado nvarchar(50)

AS
BEGIN
	BEGIN TRY
		INSERT INTO dbo.Empresas(nombre,direccion,telefono,logo,estado)
		VALUES(@nombre,@direccion, @telefono, @logo, @estado)
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)  
	END CATCH

END
GO

IF EXISTS(select * from sys.procedures where name='Empresas_Update')
DROP PROCEDURE Usuarios_Update
GO
CREATE PROCEDURE [dbo].[Empresas_Update]
	@idEmpresa int,
	@nombre nvarchar(50),
	@direccion nvarchar(50),
   	@telefono int,
	@logo image,
	@estado nvarchar(50)	
AS
BEGIN
	BEGIN TRY
		UPDATE dbo.Empresas
		SET 
		nombre= @nombre,
		direccion= @direccion,
   		telefono= @telefono,
		logo= @logo,
		Estado= @estado	
		WHERE idEmpresa = @idEmpresa 
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)  
	END CATCH
END
GO

IF EXISTS(select * from sys.procedures where name='Equipos_Insert')
DROP PROCEDURE Equipos_Insert
GO
CREATE PROCEDURE [dbo].[Equipos_Insert]
	@nombre varchar(30),
	@imagen image,
	@estado varchar(30)

AS
BEGIN
	BEGIN TRY
		INSERT INTO dbo.Equipos(nombre,imagen,estado)
		VALUES(@nombre,@imagen,@estado)
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)  
	END CATCH

END
go

IF EXISTS(select * from sys.procedures where name='Equipos_Update')
DROP PROCEDURE Equipos_Update
GO
CREATE PROCEDURE [dbo].[Equipos_Update]
	@idEquipo int,
	@nombre nvarchar(50),
	@imagen image,
	@estado nvarchar(50)
AS
BEGIN
	BEGIN TRY
			UPDATE dbo.Equipos
			SET 
			nombre= @nombre,
			imagen= @imagen,
			estado= @estado	
		
			WHERE idEquipo = @idEquipo 
	END TRY
	BEGIN CATCH
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1) 
	END CATCH
END
go

IF EXISTS(select * from sys.procedures where name='Valores_Insert')
DROP PROCEDURE Valores_Insert
GO
CREATE PROCEDURE [dbo].[Valores_Insert]
	@nombre nvarchar(50)

AS
BEGIN
	BEGIN TRY
		INSERT INTO dbo.Valores(nombre)
		VALUES(@nombre)
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1) 
	END CATCH;
END
go

IF EXISTS(select * from sys.procedures where name='Valores_Update')
DROP PROCEDURE Valores_Update
GO
CREATE PROCEDURE [dbo].[Valores_Update]
	@idValor int,
	@nombre nvarchar(50)
AS
BEGIN
	BEGIN TRY
		UPDATE dbo.Valores
		SET 
		nombre= @nombre	
		WHERE idValor = @idValor 
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1) 
	END CATCH
END
go

IF EXISTS(select * from sys.procedures where name='EquiposValores_Insert')
DROP PROCEDURE EquiposValores_Insert
GO
CREATE PROCEDURE [dbo].[EquiposValores_Insert]
	@idValor int,
	@idEquipo int,
	@estado nvarchar(50)

AS
BEGIN
	BEGIN TRY
			INSERT INTO dbo.EquiposValores(idValor,idEquipo,estado)
			VALUES(@idValor,@idEquipo,@estado)
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
END
go

IF EXISTS(select * from sys.procedures where name='EquiposValores_Update')
DROP PROCEDURE EquiposValores_Update
GO
CREATE PROCEDURE [dbo].[EquiposValores_Update]
	@idValor int,
	@idEquipo int,
	@estado nvarchar(30)
AS
BEGIN
	BEGIN TRY
		UPDATE dbo.EquiposValores
		SET 
		idValor = @idValor,
		idEquipo = @idEquipo,  
		estado= @estado		
		WHERE idValor = @idValor and idEquipo = @idEquipo
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
END
go

IF EXISTS(select * from sys.procedures where name='EmpresasValores_Insert')
DROP PROCEDURE EmpresasValores_Insert
GO
CREATE PROCEDURE [dbo].[EmpresasValores_Insert]
	@idValor int,
	@idEmpresa int

AS
BEGIN
	BEGIN TRY
		INSERT INTO dbo.EmpresasValores(idValor,idEmpresa)
		VALUES(@idValor,@idEmpresa)
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
END
go

IF EXISTS(select * from sys.procedures where name='EmpresasValores_Update')
DROP PROCEDURE EmpresasValores_Update
GO
CREATE PROCEDURE [dbo].[EmpresasValores_Update]
	@idValor int,
	@idEmpresa int
AS
BEGIN
	BEGIN TRY
		UPDATE dbo.EmpresasValores
		SET 
		idValor = @idValor,
		idEmpresa = @idEmpresa 

		WHERE 	idValor = @idValor and idEmpresa = @idEmpresa
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
END
go

IF EXISTS(select * from sys.procedures where name='Logros_Insert')
DROP PROCEDURE Logros_Insert
GO
CREATE PROCEDURE [dbo].[Logros_Insert]
	@nombre nvarchar(50),
	@descripcion nvarchar(50),
	@foto image

AS
BEGIN
	BEGIN TRY
		INSERT INTO dbo.Logros(nombre,descripcion,foto)
		VALUES(@nombre, @descripcion, @foto)
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
END
go

IF EXISTS(select * from sys.procedures where name='Logros_Update')
DROP PROCEDURE Logros_Update
GO
CREATE PROCEDURE [dbo].[Logros_Update]
	@idLogro int,
	@nombre nvarchar(50),
	@descripcion nvarchar(50),
	@foto image
	
AS
BEGIN
	BEGIN TRY
		UPDATE dbo.Logros
		SET 
		nombre= @nombre,
		descripcion = @descripcion,
		foto = @foto	
		WHERE idLogro = @idLogro
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 

END
go

IF EXISTS(select * from sys.procedures where name='UsuariosEquipos_Insert')
DROP PROCEDURE UsuariosEquipos_Insert
GO
CREATE PROCEDURE [dbo].[UsuariosEquipos_Insert]
	@idEquipo int,
	@idUsuario int,
	@rol nvarchar(50),
	@estado nvarchar(50)

AS
BEGIN
	BEGIN TRY
		INSERT INTO dbo.UsuariosEquipos(idEquipo, idUsuario, rol, estado)
		VALUES(@idEquipo, @idUsuario, @rol, @estado)
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 

END
go

IF EXISTS(select * from sys.procedures where name='UsuariosEquipos_Update')
DROP PROCEDURE UsuariosEquipos_Update
GO
CREATE PROCEDURE [dbo].[UsuariosEquipos_Update]
	@idEquipo int,
	@idUsuario int,
	@rol nvarchar(50),
	@estado nvarchar(50)
	
AS
BEGIN
	BEGIN TRY
		UPDATE dbo.UsuariosEquipos
		SET 
		idEquipo = @idEquipo,
		idUsuario = @idUsuario,
		rol= @rol,
		estado = @estado

		WHERE 	idEquipo = @idEquipo and idUsuario = @idUsuario
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
END
go

IF EXISTS(select * from sys.procedures where name='Pizarras_Insert')
DROP PROCEDURE Pizarras_Insert
GO
CREATE PROCEDURE [dbo].[Pizarras_Insert]
	@titulo nvarchar(50),
	@idEquipo int,
	@fechaInicio datetime,
	@fechaFin datetime

AS
BEGIN
	BEGIN TRY
		INSERT INTO dbo.Pizarras(titulo,idEquipo,fechaInicio,fechaFin)
		VALUES(@titulo, @idEquipo, @fechaInicio, @fechaFin)
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
END
go

IF EXISTS(select * from sys.procedures where name='Pizarras_Update')
DROP PROCEDURE Pizarras_Update
GO
CREATE PROCEDURE [dbo].[Pizarras_Update]
	@idPizarra int,
	@titulo nvarchar(50),
	@idEquipo int,
	@fechaInicio datetime,
	@fechaFin datetime

AS
BEGIN
	BEGIN TRY
		UPDATE dbo.Pizarras
		SET 
		titulo = @titulo,
		idEquipo= @idEquipo,
		fechaInicio= @fechaInicio,
		fechaFin= @fechaFin	
		WHERE idPizarra= @idPizarra
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 

END
go

IF EXISTS(select * from sys.procedures where name='Notas_Insert')
DROP PROCEDURE Notas_Insert
GO
CREATE PROCEDURE [dbo].[Notas_Insert]
	@idPizarra int,
	@idAutor int,
	@idDestinatario int,
	@idValor int,
	@descripcion nvarchar(50),
	@puntuacion int

AS
BEGIN
	BEGIN TRY
		INSERT INTO dbo.Notas(idPizarra,idAutor,idDestinatario, idValor, descripcion, puntuacion)
		VALUES(@idPizarra, @idAutor, @idDestinatario, @idValor, @descripcion, @puntuacion)
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
END
go

IF EXISTS(select * from sys.procedures where name='Notas_Update')
DROP PROCEDURE Notas_Update
GO
CREATE PROCEDURE [dbo].[Notas_Update]
	@idNota int,
	@idPizarra int,
	@idAutor int,
	@idDestinatario int,
	@idValor int,
	@descripcion nvarchar(50),
	@puntuacion int
AS
BEGIN
	BEGIN TRY
		UPDATE dbo.Notas
		SET 
		idPizarra= @idPizarra,
		idAutor = @idAutor,
		idDestinatario= @idDestinatario,
		idValor= @idValor,
		descripcion= @descripcion,
		puntuacion= @puntuacion
		WHERE idNota= @idNota
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 

END
go

IF EXISTS(select * from sys.procedures where name='UsuariosEmpresas_Insert')
DROP PROCEDURE UsuariosEmpresas_Insert
GO
CREATE PROCEDURE [dbo].[UsuariosEmpresas_Insert]
	@idUsuario int,
	@idEmpresa int,
	@rol nvarchar(50)

AS
BEGIN
	BEGIN TRY
		INSERT INTO dbo.UsuariosEmpresas(idUsuario, idEmpresa, rol)
		VALUES(@idUsuario,@idEmpresa,@rol)
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
END
go

IF EXISTS(select * from sys.procedures where name='UsuariosEmpresas_Update')
DROP PROCEDURE UsuariosEmpresas_Update
GO
CREATE PROCEDURE [dbo].[UsuariosEmpresas_Update]
	@idUsuario int,
	@idEmpresa int,
	@rol nvarchar(50)

AS
BEGIN
	BEGIN TRY
		UPDATE dbo.UsuariosEmpresas
		SET 
		idUsuario= @idUsuario,
		idEmpresa= @idEmpresa,
		rol= @rol
		WHERE 	idUsuario= @idUsuario and idEmpresa= @idEmpresa 
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
END
go

IF EXISTS(select * from sys.procedures where name='Usuarios_Delete')
DROP PROCEDURE Usuarios_Delete
GO
CREATE procedure [Usuarios_Delete]
@idUsuario int
as
begin
	BEGIN TRY
		delete from dbo.Usuarios where idUsuario = @idUsuario
		delete from dbo.LogrosUsuarios where idUsuario = @idUsuario
		delete from dbo.UsuariosEmpresas where idUsuario = @idUsuario
		delete from dbo.UsuariosEquipos where idUsuario = @idUsuario
	EN TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Empresas_Delete')
DROP PROCEDURE Empresas_Delete
GO
create procedure [Empresas_Delete]
@idEmpresa int
as
begin
	BEGIN TRY
		delete from dbo.Empresas where idEmpresa = @idEmpresa
		delete from dbo.EmpresasValores where idEmpresa = @idEmpresa
		delete from dbo.UsuariosEmpresas where idEmpresa = @idEmpresa
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Equipos_Delete')
DROP PROCEDURE Equipos_Delete
GO
create procedure [Equipos_Delete]
@idEquipo int
as
begin
	BEGIN TRY
		delete from dbo.Equipos where idEquipo = @idEquipo
		delete from dbo.EquiposValores where idEquipo = @idEquipo
		delete from dbo.UsuariosEquipos where idEquipo = @idEquipo
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Logros_Delete')
DROP PROCEDURE Logros_Delete
GO
create procedure [Logros_Delete]
@idLogro int
as
begin
	BEGIN TRY
		delete from dbo.Logros where idLogro = @idLogro
		delete from dbo.LogrosCondiciones where idLogro = @idLogro
		delete from dbo.LogrosUsuarios where idLogro = @idLogro
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Notas_Delete')
DROP PROCEDURE Notas_Delete
GO
create procedure [Notas_Delete]
@idNota int
as
begin
	BEGIN TRY
		delete from dbo.Notas where idNota = @idNota
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Pizarras_Delete')
DROP PROCEDURE Pizarras_Delete
GO
create procedure [Pizarras_Delete]
@idPizarra int
as
begin
	BEGIN TRY
		delete from dbo.Pizarras where idPizarra = @idPizarra
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Logeo')
DROP PROCEDURE Logeo
GO
create procedure Logeo
@nombre varchar(50),
@contrasenia varchar(30),
@logeado int output,
@mensaje varchar(40) output

as
begin
	select @logeado=COUNT(U.nombre) FROM Usuarios U where nombre = @nombre and contrasenia = @contrasenia
		if(@logeado>0) 
		begin
			select @mensaje= 'Bienvenido'+U.nombre from Usuarios U Where nombre = @nombre and contrasenia = @contrasenia
		end
end
go

IF EXISTS(select * from sys.procedures where name='Cambiar_Contraseña')
DROP PROCEDURE Cambiar_Contraseña
GO
create procedure Cambiar_Contraseña
@idUsuario int,
@contraseniaactual varchar(30),
@contrasenianueva varchar(30)

as
begin
	BEGIN TRY
		declare @@actual varchar(30)
		declare @@rescount tinyint

		set @@actual = (Select u.contrasenia from Usuarios u where u.idUsuario = @idUsuario)

		if (@@actual = @contraseniaactual)
			begin
			update Usuarios set contrasenia = @contrasenianueva where idUsuario = @idUsuario
			set @@rescount = 1
		end
		else
			begin
			set @@rescount = 0
		end
		select @@rescount as rescount
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end
go

IF EXISTS(select * from sys.procedures where name='Auditoria')
DROP TABLE Auditoria
GO
create table Auditoria(
	codigo_au INT IDENTITY(1,1) primary key,
	usuario_au varchar(50) not null,
	tabla varchar(20) not null,
	accion varchar(20) not null,
	registro varchar(20) not null,
	nombre varchar(50) not  null,
	descripcion varchar(50),
	fecha_hora datetime not null
	)
go
/*==============================================================*/
/* Trigger: Insertar                                              */
/*==============================================================*/

	IF EXISTS(select * from sys.procedures where name='AuditoriaUsuario_Insertar')
	DROP trigger AuditoriaUsuario_Insertarr
	GO
	CREATE trigger [AuditoriaUsuario_Insertar]
	ON Usuarios
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','USUARIOS','INSERTÓ',idUsuario,nombre, 
		'NINGUNA',GETDATE() from inserted
		END;

	GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaEquipo_Insertar')
	DROP trigger AuditoriaEquipo_Insertar
	GO
	CREATE trigger [AuditoriaEquipo_Insertar]
	ON Equipos
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Equipos','INSERTÓ',idEquipo,nombre, 
		'NINGUNA',GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaEmpresas_Insertar')
	DROP trigger AuditoriaEmpresas_Insertar
	GO
	CREATE trigger [AuditoriaEmpresas_Insertar]
	ON Empresas
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Empresas','INSERTÓ',idEmpresa,nombre, 
		'NINGUNA',GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaLogros_Insertar')
	DROP trigger AuditoriaLogros_Insertar
	GO
	CREATE trigger [AuditoriaLogros_Insertar]
	ON Logros
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Logros','INSERTÓ',idLogro,nombre, 
		'NINGUNA',GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaCondiciones_Insertar')
	DROP trigger AuditoriaCondiciones_Insertar
	GO
	CREATE trigger [AuditoriaCondiciones_Insertar]
	ON Condiciones
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Condiciones','INSERTÓ',idCondicion,'', 
		'NINGUNA',GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaNotas_Insertar')
	DROP trigger AuditoriaNotas_Insertar
	GO
	CREATE trigger [AuditoriaNotas_Insertar]
	ON Notas
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Notas','INSERTÓ',idNota,descripcion, 
		'NINGUNA',GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaPizarras_Insertar')
	DROP trigger AuditoriaPizarras_Insertar
	GO
	CREATE trigger [AuditoriaPizarras_Insertar]
	ON Pizarras
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Pizarras','INSERTÓ',idPizarra,titulo, 
		'NINGUNA',GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaValores_Insertar')
	DROP trigger AuditoriaValores_Insertar
	GO
	CREATE trigger [AuditoriaValores_Insertar]
	ON Valores
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Valores','INSERTÓ',idValor,nombre, 
		'NINGUNA',GETDATE() from inserted
		END;
GO

-- tablas intermedias 
	IF EXISTS(select * from sys.procedures where name='AuditoriaEmpresasValores_Insertar')
	DROP trigger AuditoriaEmpresasValores_Insertar
	GO
	CREATE trigger [AuditoriaEmpresasValores_Insertar]
	ON EmpresasValores
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EmpresasValores','INSERTÓ',idValor+''+idEmpresa,'valor y empresa', 
		'NINGUNA',GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaEquiposValores_Insertar')
	DROP trigger AuditoriaEquiposValores_Insertar
	GO
	CREATE trigger [AuditoriaEquiposValores_Insertar]
	ON EquiposValores
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EquiposValores','INSERTÓ',idEquipo+''+idValor,'Equipo y Valor', 
		'NINGUNA',GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaLogrosCondiciones_Insertar')
	DROP trigger AuditoriaLogrosCondiciones_Insertar
	GO
	CREATE trigger [AuditoriaLogrosCondiciones_Insertar]
	ON LogrosCondiciones
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosCondiciones','INSERTÓ',idCondicion+''+idLogro,'Condición y Logro', 
		'NINGUNA',GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaLogrosUsuarios_Insertar')
	DROP trigger AuditoriaLogrosUsuarios_Insertar
	GO
	CREATE trigger [AuditoriaLogrosUsuarios_Insertar]
	ON LogrosUsuarios
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosUsuarios','INSERTÓ',idLogro+''+idUsuario,'Logro y Usuario', 
		'NINGUNA',GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaUsuariosEmpresas_Insertar')
	DROP trigger AuditoriaUsuariosEmpresas_Insertar
	GO
	CREATE trigger [AuditoriaUsuariosEmpresas_Insertar]
	ON UsuariosEmpresas
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEmpresas','INSERTÓ',idEmpresa+''+idUsuario,'Empresa y Usuario', 
		'NINGUNA',GETDATE() from inserted
		END;
GO
	IF EXISTS(select * from sys.procedures where name='AuditoriaUsuariosEquipos_Insertar')
	DROP trigger AuditoriaUsuariosEquipos_Insertar
	GO
	CREATE trigger [AuditoriaUsuariosEquipos_Insertar]
	ON UsuariosEquipos
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEquipos','INSERTÓ',idEquipo+''+idUsuario,'Equipo y Usuario', 
		'NINGUNA',GETDATE() from inserted
		END;
GO
/*==============================================================*/
/* Trigger: Actualizar                                          */
/*==============================================================*/

	IF EXISTS(select * from sys.procedures where name='AuditoriaUsuarios_Actualizar')
	DROP trigger AuditoriaUsuarios_Actualizar
	GO
	CREATE trigger [AuditoriaUsuarios_Actualizar]
	ON Usuarios
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Usuarios','ACTUALIZÓ',idUsuario,nombre, 
		(select nombre from deleted),GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaEquipos_Actualizar')
	DROP trigger AuditoriaEquipos_Actualizar
	GO
	CREATE trigger [AuditoriaEquipos_Actualizar]
	ON Equipos
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Equipos','ACTUALIZÓ',idEquipo,nombre, 
		(select nombre from deleted),GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaEmpresas_Actualizar')
	DROP trigger AuditoriaEmpresas_Actualizar
	GO
	CREATE trigger [AuditoriaEmpresas_Actualizar]
	ON Empresas
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Empresas','ACTUALIZÓ',idEmpresa,nombre, 
		(select nombre from deleted),GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaLogros_Actualizar')
	DROP trigger AuditoriaLogros_Actualizar
	GO
	CREATE trigger [AuditoriaLogros_Actualizar]
	ON Logros
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Logros','ACTUALIZÓ',idLogro,nombre, 
		(select nombre from deleted),GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaNotas_Actualizar')
	DROP trigger AuditoriaNotas_Actualizar
	GO
	CREATE trigger [AuditoriaNotas_Actualizar]
	ON Notas
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Notas','ACTUALIZÓ',idNota,descripcion, 
		(select descripcion from deleted),GETDATE() from inserted
		END;

GO
	IF EXISTS(select * from sys.procedures where name='AuditoriaPizarras_Actualizar')
	DROP trigger AuditoriaPizarras_Actualizar
	GO
	CREATE trigger [AuditoriaPizarras_Actualizar]
	ON Pizarras
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Pizarras','ACTUALIZÓ',idPizarra,titulo, 
		(select titulo from deleted),GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaValores_Actualizar')
	DROP trigger AuditoriaValores_Actualizar
	GO
	CREATE trigger [AuditoriaValores_Actualizar]
	ON Valores
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Valores','ACTUALIZÓ',idValor,nombre, 
		(select nombre from deleted),GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaCondiciones_Actualizar')
	DROP trigger AuditoriaCondiciones_Actualizar
	GO
	CREATE trigger [AuditoriaCondiciones_Actualizar]
	ON Condiciones
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Condiciones','ACTUALIZÓ',idCondicion,RTRIM(puntuacion)+' '+RTRIM(modificador)+' '+RTRIM(excluyente), 
		(select RTRIM(puntuacion)+' '+RTRIM(modificador)+' '+RTRIM(excluyente) from deleted),GETDATE() from inserted
		END;
GO
--tablas intermedias

	IF EXISTS(select * from sys.procedures where name='AuditoriaEmpresasValores_Actualizar')
	DROP trigger AuditoriaEmpresasValores_Actualizar
	GO
	CREATE trigger [AuditoriaEmpresasValores_Actualizar]
	ON EmpresasValores
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EmpresasValores','ACTUALIZÓ',idEmpresa+''+idValor,'Empresa y Valor', 
		(select idEmpresa+''+idValor from deleted),GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaEquiposValores_Actualizar')
	DROP trigger AuditoriaEquiposValores_Actualizar
	GO
	CREATE trigger [AuditoriaEquiposValores_Actualizar]
	ON EquiposValores
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EquiposValores','ACTUALIZÓ',idEquipo+''+idValor,'Equipo y Valor', 
		(select idEquipo+''+idValor from deleted),GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaLogrosCondiciones_Actualizar')
	DROP trigger AuditoriaLogrosCondiciones_Actualizar
	GO
	CREATE trigger [AuditoriaLogrosCondiciones_Actualizar]
	ON LogrosCondiciones
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosCondiciones','ACTUALIZÓ',idLogro+''+idCondicion,'Equipo y Valor', 
		(select idLogro+''+idCondicion from deleted),GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaLogrosUsuarios_Actualizar')
	DROP trigger AuditoriaLogrosUsuarios_Actualizar
	GO
	CREATE trigger [AuditoriaLogrosUsuarios_Actualizar]
	ON LogrosUsuarios
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosUsuarios','ACTUALIZÓ',idLogro+''+idUsuario,'Logro y Usuario', 
		(select idLogro+''+idUsuario from deleted),GETDATE() from inserted
		END;
GO
	IF EXISTS(select * from sys.procedures where name='AuditoriaUsuariosEmpresas_Actualizar')
	DROP trigger AuditoriaUsuariosEmpresas_Actualizar
	GO
	CREATE trigger [AuditoriaUsuariosEmpresas_Actualizar]
	ON UsuariosEmpresas
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEmpresas','ACTUALIZÓ',idUsuario+''+idEmpresa,'Usuario y Empresa', 
		(select idUsuario+''+idEmpresa from deleted),GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaUsuariosEquipos_Actualizar')
	DROP trigger AuditoriaUsuariosEquipos_Actualizar
	GO
	CREATE trigger [AuditoriaUsuariosEquipos_Actualizar]
	ON UsuariosEquipos
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEquipos','ACTUALIZÓ',idUsuario+''+idEquipo,'Usuario y Equipo', 
		(select idUsuario+''+idEquipo from deleted),GETDATE() from inserted
		END;
GO
/*==============================================================*/
/* Trigger: Eliminar                                              */
/*==============================================================*/

	IF EXISTS(select * from sys.procedures where name='AuditoriaUsuarios_Eliminar')
	DROP trigger AuditoriaUsuarios_Eliminar
	GO
		CREATE trigger [AuditoriaUsuarios_Eliminar]
	ON Usuarios
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Usuarios','ELIMINÓ',idUsuario,nombre, 
		'NINGUNA',GETDATE() from deleted
		END;
GO
	IF EXISTS(select * from sys.procedures where name='AuditoriaEquipos_Eliminar')
	DROP trigger AuditoriaEquipos_Eliminar
	GO
		CREATE trigger [AuditoriaEquipos_Eliminar]
	ON Equipos
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Equipos','ELIMINÓ',idEquipo,nombre, 
		'NINGUNA',GETDATE() from deleted
		END;
GO
	IF EXISTS(select * from sys.procedures where name='AuditoriaEmpresas_Eliminar')
	DROP trigger AuditoriaEmpresas_Eliminar
	GO
		CREATE trigger [AuditoriaEmpresas_Eliminar]
	ON Empresas
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Empresas','ELIMINÓ',idEmpresa,nombre, 
		'NINGUNA',GETDATE() from deleted
		END;
GO
	IF EXISTS(select * from sys.procedures where name='AuditoriaLogros_Eliminar')
	DROP trigger AuditoriaLogros_Eliminar
	GO
		CREATE trigger [AuditoriaLogros_Eliminar]
	ON Logros
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Logros','ELIMINÓ',idLogro,nombre, 
		'NINGUNA',GETDATE() from deleted
		END;
GO
	IF EXISTS(select * from sys.procedures where name='AuditoriaNotas_Eliminar')
	DROP trigger AuditoriaNotas_Eliminar
	GO
		CREATE trigger [AuditoriaNotas_Eliminar]
	ON Notas
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Notas','ELIMINÓ',idNota,descripcion, 
		'NINGUNA',GETDATE() from deleted
		END;
GO
	IF EXISTS(select * from sys.procedures where name='AuditoriaPizarras_Eliminar')
	DROP trigger AuditoriaPizarras_Eliminar
	GO
		CREATE trigger [AuditoriaPizarras_Eliminar]
	ON Pizarras
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Pizarras','ELIMINÓ',idPizarra,titulo, 
		'NINGUNA',GETDATE() from deleted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaValores_Eliminar')
	DROP trigger AuditoriaValores_Eliminar
	GO
		CREATE trigger [AuditoriaValores_Eliminar]
	ON Valores
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Valores','ELIMINÓ',idValor,nombre, 
		'NINGUNA',GETDATE() from deleted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaCondiciones_Eliminar')
	DROP trigger AuditoriaCondiciones_Eliminar
	GO
		CREATE trigger [AuditoriaCondiciones_Eliminar]
	ON Condiciones
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Condiciones','ELIMINÓ',idCondicion,'', 
		'NINGUNA',GETDATE() from deleted
		END;
GO
--tablas intermedias

	IF EXISTS(select * from sys.procedures where name='AuditoriaEmpresasValores_Eliminar')
	DROP trigger AuditoriaEmpresasValores_Eliminar
	GO
		CREATE trigger [AuditoriaEmpresasValores_Eliminar]
	ON EmpresasValores
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EmpresasValores','ELIMINÓ',idEmpresa+''+idValor,'Empresa y Valor', 
		'NINGUNA',GETDATE() from deleted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaEquiposValores_Eliminar')
	DROP trigger AuditoriaEquiposValores_Eliminar
	GO
		CREATE trigger [AuditoriaEquiposValores_Eliminar]
	ON EquiposValores
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EquiposValores','ELIMINÓ',idEquipo+''+idValor,'Equipo y Valor', 
		'NINGUNA',GETDATE() from deleted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaLogrosCondiciones_Eliminar')
	DROP trigger AuditoriaLogrosCondiciones_Eliminar
	GO
		CREATE trigger [AuditoriaLogrosCondiciones_Eliminar]
	ON LogrosCondiciones
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosCondiciones','ELIMINÓ',idLogro+''+idCondicion,'Logro y Condición', 
		'NINGUNA',GETDATE() from deleted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaLogrosUsuarios_Eliminar')
	DROP trigger AuditoriaLogrosUsuarios_Eliminar
	GO
		CREATE trigger [AuditoriaLogrosUsuarios_Eliminar]
	ON LogrosUsuarios
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosUsuarios','ELIMINÓ',idLogro+''+idUsuario,'Logro y Usuario', 
		'NINGUNA',GETDATE() from deleted
		END;
GO

	IF EXISTS(select * from sys.procedures where name='AuditoriaUsuariosEmpresas_Eliminar')
	DROP trigger AuditoriaUsuariosEmpresas_Eliminar
	GO
		CREATE trigger [AuditoriaUsuariosEmpresas_Eliminar]
	ON UsuariosEmpresas
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEmpresas','ELIMINÓ',idUsuario+''+idEmpresa,'Usuario y Empresa', 
		'NINGUNA',GETDATE() from deleted
		END;
GO
	IF EXISTS(select * from sys.procedures where name='AuditoriaUsuariosEquipos_Eliminar')
	DROP trigger AuditoriaUsuariosEquipos_Eliminar
	GO
		CREATE trigger [AuditoriaUsuariosEquipos_Eliminar]
	ON UsuariosEquipos
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEquipos','ELIMINÓ',idUsuario+''+idEquipo,'Usuario y Equipo', 
		'NINGUNA',GETDATE() from deleted
		END;
GO