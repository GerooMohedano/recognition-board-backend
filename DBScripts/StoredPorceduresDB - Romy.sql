USE [OnBoardDataBase]
GO

IF EXISTS(select * from sys.procedures where name='insert_token')
DROP PROCEDURE insert_token
GO
CREATE PROCEDURE [dbo].[insert_token]
@nombre varchar(30),
@valorToken varchar(50)
as
begin

		begin try
			Insert dbo.Token(valorToken, nombre)
			values (@valorToken, @nombre)
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
GO

IF EXISTS(select * from sys.procedures where name='get_token')
DROP PROCEDURE get_token
GO
CREATE PROCEDURE [dbo].[get_token]
@nombre varchar(50),
@valorToken varchar(50)
as

begin

		begin try
			select Token.valorToken, Token.nombre from Token where @valorToken = valorToken and @nombre = nombre
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
END
go

IF EXISTS(select * from sys.procedures where name='get_user')
DROP PROCEDURE get_user
GO
CREATE PROCEDURE [dbo].[get_user]
@nombre varchar(50),
@contrasenia varchar(50)

as
declare @returnData varchar(30)
set @returnData = null
begin

		begin try
			select @returnData= u.nombre from Usuarios u WHERE @nombre = u.nombre and @contrasenia = u.contrasenia
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
		print @returnData
return @returnData
END
GO

IF EXISTS(select * from sys.procedures where name='Usuarios_Get')
DROP PROCEDURE Usuarios_Get
GO
CREATE procedure [Usuarios_Get]
@idUsuario int
as
begin

		begin try
			select U.nombre, U.mail, U.fotoPerfil, U.adminGeneral from Usuarios U where @idUsuario = U.idUsuario
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
end
GO

IF EXISTS(select * from sys.procedures where name='Usuarios_Insert')
DROP PROCEDURE Usuarios_Insert
GO
CREATE procedure [Usuarios_Insert]
@nombre varchar(50),
@contrasenia varchar(30),
@mail varchar(30),
@fotoPerfil image,
@adminGeneral bit
as
begin

		begin try
		
		if(LEN(@nombre) > 3 OR LEN(@contrasenia) > 30 OR LEN(@mail) > 30)
			RAISERROR('Excediste el número de caracteres permitido',11,1)

			Insert dbo.Usuarios(nombre,contrasenia,mail,fotoPerfil,adminGeneral)
			values (@nombre,@contrasenia,@mail,@fotoPerfil,@adminGeneral)
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
		
		if(LEN(@nombre) > 50 OR LEN(@contrasenia) > 30 OR LEN(@mail) > 30)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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

IF EXISTS(select * from sys.procedures where name='Usuarios_MailUpdate')
DROP PROCEDURE Usuarios_MailUpdate
GO
CREATE procedure [Usuarios_MailUpdate]
@idUsuario int,
@mail varchar(30)
as
begin
		begin try
		
		if(LEN(@mail) > 30)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

			update dbo.Usuarios
			set
			 mail= @mail
			where idUsuario = @idUsuario
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
end 
go

IF EXISTS(select * from sys.procedures where name='Usuarios_fotoPerfilUpdate')
DROP PROCEDURE Usuarios_fotoPerfilUpdate
GO
CREATE procedure [Usuarios_fotoPerfilUpdate]
@idUsuario int,
@fotoPerfil image
as
begin
		begin try
			update dbo.Usuarios
			set
			 fotoPerfil = @fotoPerfil
			where idUsuario = @idUsuario
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
end 
go

IF EXISTS(select * from sys.procedures where name='Empresas_Get')
DROP PROCEDURE Empresas_Get
GO
CREATE procedure [Empresas_Get]
@idEmpresa int
as
begin

		begin try
			select E.nombre as nombre_empresa, E.direccion, E.telefono, E.estado, E.logo from Empresas E where @idEmpresa = E.idEmpresa
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
end

IF EXISTS(select * from sys.procedures where name='Empresas_Insert')
DROP PROCEDURE Empresas_Insert
GO
CREATE PROCEDURE [dbo].[Empresas_Insert]
	@nombre nvarchar(50),
	@direccion nvarchar(50),
   	@telefono int,
	@logo image,
	@estado nvarchar(10)

AS
BEGIN

	BEGIN TRY
	
		if(LEN(@nombre) > 50 OR LEN(@direccion) > 50 OR LEN(@estado) > 10)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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
DROP PROCEDURE Empresas_Update
GO
CREATE PROCEDURE [dbo].[Empresas_Update]
	@idEmpresa int,
	--@nombre nvarchar(50),
	@direccion nvarchar(50),
   	@telefono int
AS
BEGIN

	BEGIN TRY
		if(LEN(@direccion) > 50) --LEN(@nombre) > 50 OR 
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)
		UPDATE dbo.Empresas
		SET 
		--nombre= @nombre,
		direccion= @direccion,
   		telefono= @telefono
		WHERE idEmpresa = @idEmpresa 
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)  
	END CATCH
END
GO


IF EXISTS(select * from sys.procedures where name='Empresas_ImageUpdate')
DROP PROCEDURE Empresas_ImageUpdate
GO
CREATE PROCEDURE [dbo].[Empresas_ImageUpdate]
	@idEmpresa int,
	@logo image
AS
BEGIN

	BEGIN TRY
		UPDATE dbo.Empresas
		SET 
			logo= @logo
		WHERE idEmpresa = @idEmpresa 
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)  
	END CATCH
END
GO

IF EXISTS(select * from sys.procedures where name='Empresas_StateUpdate')
DROP PROCEDURE Empresas_StateUpdate
GO
CREATE PROCEDURE [dbo].[Empresas_StateUpdate]
	@idEmpresa int,
	@estado nvarchar(50)
AS
BEGIN

	BEGIN TRY
		UPDATE dbo.Empresas
		SET 
			estado = @estado
		WHERE idEmpresa = @idEmpresa 
	END TRY
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)  
	END CATCH
END
GO

IF EXISTS(select * from sys.procedures where name='Equipos_Get')
DROP PROCEDURE Equipos_Get
GO
CREATE procedure [Equipos_Get]
@idEquipo int
as
begin

		begin try
			select E.idEquipo, E.nombre as nombre_equipo, E.imagen, E.estado, EM.idEmpresa, EM.nombre as nombre_empresa from Equipos E 
			inner join Empresas EM on E.idEmpresa = EM.idEmpresa
			where @idEquipo = E.idEquipo
		end try
		begin catch
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)  
		end catch
end

IF EXISTS(select * from sys.procedures where name='Equipos_Insert')
DROP PROCEDURE Equipos_Insert
GO
CREATE PROCEDURE [dbo].[Equipos_Insert]
	@nombre varchar(30),
	@imagen image,
	@estado varchar(10)

AS
BEGIN

	BEGIN TRY
		IF(LEN(@nombre) > 30 OR LEN(@estado) > 10)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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
			IF EXISTS(Select * from Equipos where idEquipo = @idEquipo)
				RAISERROR('Ya existe este equipo',@idEquipo,11,1)

			IF(LEN(@nombre) > 30 OR LEN(@estado) > 10)
				RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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
	@nombre nvarchar(30)

AS
BEGIN

	BEGIN TRY
		IF(LEN(@nombre) > 30)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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
	@nombre nvarchar(30)
AS
BEGIN

	BEGIN TRY
	
		IF EXISTS(Select * from Valores where idValor = @idValor)
			RAISERROR('Ya existe este Valor',@idValor,11,1)
		IF(LEN(@nombre) > 30)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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


IF EXISTS(select * from sys.procedures where name='Valores_Delete')
DROP PROCEDURE Valores_Delete
GO
CREATE PROCEDURE [dbo].[Valores_Delete]
	@idValor int,
	@nombre nvarchar(30)
AS
BEGIN

	BEGIN TRY
	
		IF EXISTS(Select * from Valores where idValor = @idValor)
			RAISERROR('Ya existe este Valor',@idValor,11,1)

		IF(LEN(@nombre) > 30)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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
	@estado nvarchar(10)

AS
BEGIN

	BEGIN TRY
			IF(LEN(@estado) > 10)
				RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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
		IF(LEN(@estado) > 10)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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


IF EXISTS(select * from sys.procedures where name='EquiposValores_Delete')
DROP PROCEDURE EquiposValores_Delete
GO
CREATE PROCEDURE [dbo].[EquiposValores_Delete]
	@idValor int,
	@idEquipo int
AS
BEGIN

	BEGIN TRY
		DELETE FROM dbo.EquiposValores  WHERE
		idValor = @idValor AND
		idEquipo = @idEquipo
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
	@nombre nvarchar(30),
	@descripcion nvarchar(50),
	@foto image

AS
BEGIN

	BEGIN TRY
		IF(LEN(@nombre) > 30 or LEN(@descripcion) > 50)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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
		IF EXISTS(Select * from Logros where idLogro = @idLogro)
			RAISERROR('Ya existe este Logro',@idLogro,11,1)

		IF(LEN(@nombre) > 30 or LEN(@descripcion) > 50)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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

IF EXISTS(select * from sys.procedures where name='Logros_EmpresaUsuario')
DROP PROCEDURE Logros_EmpresaUsuario
GO
CREATE PROCEDURE [dbo].[Logros_EmpresaUsuario]
	@idUsuario int

AS
BEGIN

	BEGIN TRY
		 select Logros.idLogro, Logros.nombre as nombre_logro from Empresas 
						inner join UsuariosEmpresas on Empresas.idEmpresa = UsuariosEmpresas.idEmpresa
						inner join Logros on Empresas.idEmpresa = Logros.idEmpresa
					    where idUsuario = @idUsuario
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
	@rol nvarchar(30),
	@estado nvarchar(10)

AS
BEGIN

	BEGIN TRY
		IF(LEN(@rol) > 30 or LEN(@estado) > 10)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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
		IF(LEN(@rol) > 30 or LEN(@estado) > 10)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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
		IF @fechaFin<@fechaInicio
			RAISERROR('La fecha no de inicio de no puede ser mayor a la fecha de fin',11,1)
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
	@titulo nvarchar(30),
	@idEquipo int,
	@fechaInicio datetime,
	@fechaFin datetime

AS
BEGIN


	BEGIN TRY
		IF @fechaFin<@fechaInicio
			RAISERROR('La fecha no de inicio de no puede ser mayor a la fecha de fin',11,1)
		IF EXISTS(Select * from Pizarras where idPizarra = @idPizarra)
			RAISERROR('Ya existe esta pizarra',@idPizarra,11,1)
		IF(LEN(@titulo) > 30)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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
		IF(LEN(@descripcion) > 50)
		RAISERROR('Excediste el n�mero de caracteres permitido',11,1)

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
		IF EXISTS(Select * from Notas where idNota = @idNota)
			RAISERROR('Ya existe esta nota',@idNota,11,1)
		IF(LEN(@descripcion) > 50)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)	

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
	@rol nvarchar(30)

AS
BEGIN

	BEGIN TRY
		IF(LEN(@rol) > 30)
			RAISERROR('Excediste el n�mero de caracteres permitido',11,1)	

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
	END TRY
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

IF EXISTS(select * from sys.procedures where name='Cambiar_Contrase�a')
DROP PROCEDURE Cambiar_Contrasenia
GO
create procedure Cambiar_Contrasenia
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
/*
IF EXISTS(select * from sys.tables where name='Auditoria')
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
go*/
/*==============================================================*/
/* Trigger: Insertar                                              */
/*==============================================================*/
/*
	IF EXISTS(select * from sys.triggers where name='AuditoriaUsuario_Insertar')
	DROP trigger AuditoriaUsuario_Insertar
	GO
	CREATE trigger [AuditoriaUsuario_Insertar]
	ON Usuarios
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','USUARIOS','INSERT�',idUsuario,nombre, 
		'NINGUNA',GETDATE() from inserted
		END;

	GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaEquipo_Insertar')
	DROP trigger AuditoriaEquipo_Insertar
	GO
	CREATE trigger [AuditoriaEquipo_Insertar]
	ON Equipos
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Equipos','INSERT�',idEquipo,nombre, 
		'NINGUNA',GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaEmpresas_Insertar')
	DROP trigger AuditoriaEmpresas_Insertar
	GO
	CREATE trigger [AuditoriaEmpresas_Insertar]
	ON Empresas
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Empresas','INSERT�',idEmpresa,nombre, 
		'NINGUNA',GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaLogros_Insertar')
	DROP trigger AuditoriaLogros_Insertar
	GO
	CREATE trigger [AuditoriaLogros_Insertar]
	ON Logros
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Logros','INSERT�',idLogro,nombre, 
		'NINGUNA',GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaCondiciones_Insertar')
	DROP trigger AuditoriaCondiciones_Insertar
	GO
	CREATE trigger [AuditoriaCondiciones_Insertar]
	ON Condiciones
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Condiciones','INSERT�',idCondicion,'', 
		'NINGUNA',GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaNotas_Insertar')
	DROP trigger AuditoriaNotas_Insertar
	GO
	CREATE trigger [AuditoriaNotas_Insertar]
	ON Notas
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Notas','INSERT�',idNota,descripcion, 
		'NINGUNA',GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaPizarras_Insertar')
	DROP trigger AuditoriaPizarras_Insertar
	GO
	CREATE trigger [AuditoriaPizarras_Insertar]
	ON Pizarras
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Pizarras','INSERT�',idPizarra,titulo, 
		'NINGUNA',GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaValores_Insertar')
	DROP trigger AuditoriaValores_Insertar
	GO
	CREATE trigger [AuditoriaValores_Insertar]
	ON Valores
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Valores','INSERT�',idValor,nombre, 
		'NINGUNA',GETDATE() from inserted
		END;
GO

-- tablas intermedias 
	IF EXISTS(select * from sys.triggers where name='AuditoriaEmpresasValores_Insertar')
	DROP trigger AuditoriaEmpresasValores_Insertar
	GO
	CREATE trigger [AuditoriaEmpresasValores_Insertar]
	ON EmpresasValores
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EmpresasValores','INSERT�',idValor+''+idEmpresa,'valor y empresa', 
		'NINGUNA',GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaEquiposValores_Insertar')
	DROP trigger AuditoriaEquiposValores_Insertar
	GO
	CREATE trigger [AuditoriaEquiposValores_Insertar]
	ON EquiposValores
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EquiposValores','INSERT�',idEquipo+''+idValor,'Equipo y Valor', 
		'NINGUNA',GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaLogrosCondiciones_Insertar')
	DROP trigger AuditoriaLogrosCondiciones_Insertar
	GO
	CREATE trigger [AuditoriaLogrosCondiciones_Insertar]
	ON LogrosCondiciones
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosCondiciones','INSERT�',idCondicion+''+idLogro,'Condici�n y Logro', 
		'NINGUNA',GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaLogrosUsuarios_Insertar')
	DROP trigger AuditoriaLogrosUsuarios_Insertar
	GO
	CREATE trigger [AuditoriaLogrosUsuarios_Insertar]
	ON LogrosUsuarios
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosUsuarios','INSERT�',idLogro+''+idUsuario,'Logro y Usuario', 
		'NINGUNA',GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaUsuariosEmpresas_Insertar')
	DROP trigger AuditoriaUsuariosEmpresas_Insertar
	GO
	CREATE trigger [AuditoriaUsuariosEmpresas_Insertar]
	ON UsuariosEmpresas
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEmpresas','INSERT�',idEmpresa+''+idUsuario,'Empresa y Usuario', 
		'NINGUNA',GETDATE() from inserted
		END;
GO
	IF EXISTS(select * from sys.triggers where name='AuditoriaUsuariosEquipos_Insertar')
	DROP trigger AuditoriaUsuariosEquipos_Insertar
	GO
	CREATE trigger [AuditoriaUsuariosEquipos_Insertar]
	ON UsuariosEquipos
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEquipos','INSERT�',idEquipo+''+idUsuario,'Equipo y Usuario', 
		'NINGUNA',GETDATE() from inserted
		END;
GO*/
/*==============================================================*/
/* Trigger: Actualizar                                          */
/*==============================================================*/
/*
	IF EXISTS(select * from sys.triggers where name='AuditoriaUsuarios_Actualizar')
	DROP trigger AuditoriaUsuarios_Actualizar
	GO
	CREATE trigger [AuditoriaUsuarios_Actualizar]
	ON Usuarios
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Usuarios','ACTUALIZ�',idUsuario,nombre, 
		(select nombre from deleted),GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaEquipos_Actualizar')
	DROP trigger AuditoriaEquipos_Actualizar
	GO
	CREATE trigger [AuditoriaEquipos_Actualizar]
	ON Equipos
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Equipos','ACTUALIZ�',idEquipo,nombre, 
		(select nombre from deleted),GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaEmpresas_Actualizar')
	DROP trigger AuditoriaEmpresas_Actualizar
	GO
	CREATE trigger [AuditoriaEmpresas_Actualizar]
	ON Empresas
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Empresas','ACTUALIZ�',idEmpresa,nombre, 
		(select nombre from deleted),GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaLogros_Actualizar')
	DROP trigger AuditoriaLogros_Actualizar
	GO
	CREATE trigger [AuditoriaLogros_Actualizar]
	ON Logros
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Logros','ACTUALIZ�',idLogro,nombre, 
		(select nombre from deleted),GETDATE() from inserted
		END;

GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaNotas_Actualizar')
	DROP trigger AuditoriaNotas_Actualizar
	GO
	CREATE trigger [AuditoriaNotas_Actualizar]
	ON Notas
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Notas','ACTUALIZ�',idNota,descripcion, 
		(select descripcion from deleted),GETDATE() from inserted
		END;

GO
	IF EXISTS(select * from sys.triggers where name='AuditoriaPizarras_Actualizar')
	DROP trigger AuditoriaPizarras_Actualizar
	GO
	CREATE trigger [AuditoriaPizarras_Actualizar]
	ON Pizarras
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Pizarras','ACTUALIZ�',idPizarra,titulo, 
		(select titulo from deleted),GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaValores_Actualizar')
	DROP trigger AuditoriaValores_Actualizar
	GO
	CREATE trigger [AuditoriaValores_Actualizar]
	ON Valores
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Valores','ACTUALIZ�',idValor,nombre, 
		(select nombre from deleted),GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaCondiciones_Actualizar')
	DROP trigger AuditoriaCondiciones_Actualizar
	GO
	CREATE trigger [AuditoriaCondiciones_Actualizar]
	ON Condiciones
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Condiciones','ACTUALIZ�',idCondicion,RTRIM(puntuacion)+' '+RTRIM(modificador)+' '+RTRIM(excluyente), 
		(select RTRIM(puntuacion)+' '+RTRIM(modificador)+' '+RTRIM(excluyente) from deleted),GETDATE() from inserted
		END;
GO
--tablas intermedias

	IF EXISTS(select * from sys.triggers where name='AuditoriaEmpresasValores_Actualizar')
	DROP trigger AuditoriaEmpresasValores_Actualizar
	GO
	CREATE trigger [AuditoriaEmpresasValores_Actualizar]
	ON EmpresasValores
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EmpresasValores','ACTUALIZ�',idEmpresa+''+idValor,'Empresa y Valor', 
		(select idEmpresa+''+idValor from deleted),GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaEquiposValores_Actualizar')
	DROP trigger AuditoriaEquiposValores_Actualizar
	GO
	CREATE trigger [AuditoriaEquiposValores_Actualizar]
	ON EquiposValores
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EquiposValores','ACTUALIZ�',idEquipo+''+idValor,'Equipo y Valor', 
		(select idEquipo+''+idValor from deleted),GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaLogrosCondiciones_Actualizar')
	DROP trigger AuditoriaLogrosCondiciones_Actualizar
	GO
	CREATE trigger [AuditoriaLogrosCondiciones_Actualizar]
	ON LogrosCondiciones
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosCondiciones','ACTUALIZ�',idLogro+''+idCondicion,'Equipo y Valor', 
		(select idLogro+''+idCondicion from deleted),GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaLogrosUsuarios_Actualizar')
	DROP trigger AuditoriaLogrosUsuarios_Actualizar
	GO
	CREATE trigger [AuditoriaLogrosUsuarios_Actualizar]
	ON LogrosUsuarios
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosUsuarios','ACTUALIZ�',idLogro+''+idUsuario,'Logro y Usuario', 
		(select idLogro+''+idUsuario from deleted),GETDATE() from inserted
		END;
GO
	IF EXISTS(select * from sys.triggers where name='AuditoriaUsuariosEmpresas_Actualizar')
	DROP trigger AuditoriaUsuariosEmpresas_Actualizar
	GO
	CREATE trigger [AuditoriaUsuariosEmpresas_Actualizar]
	ON UsuariosEmpresas
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEmpresas','ACTUALIZ�',idUsuario+''+idEmpresa,'Usuario y Empresa', 
		(select idUsuario+''+idEmpresa from deleted),GETDATE() from inserted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaUsuariosEquipos_Actualizar')
	DROP trigger AuditoriaUsuariosEquipos_Actualizar
	GO
	CREATE trigger [AuditoriaUsuariosEquipos_Actualizar]
	ON UsuariosEquipos
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEquipos','ACTUALIZ�',idUsuario+''+idEquipo,'Usuario y Equipo', 
		(select idUsuario+''+idEquipo from deleted),GETDATE() from inserted
		END;
GO*/
/*==============================================================*/
/* Trigger: Eliminar                                              */
/*==============================================================*/
/*
	IF EXISTS(select * from sys.triggers where name='AuditoriaUsuarios_Eliminar')
	DROP trigger AuditoriaUsuarios_Eliminar
	GO
		CREATE trigger [AuditoriaUsuarios_Eliminar]
	ON Usuarios
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Usuarios','ELIMIN�',idUsuario,nombre, 
		'NINGUNA',GETDATE() from deleted
		END;
GO
	IF EXISTS(select * from sys.triggers where name='AuditoriaEquipos_Eliminar')
	DROP trigger AuditoriaEquipos_Eliminar
	GO
		CREATE trigger [AuditoriaEquipos_Eliminar]
	ON Equipos
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Equipos','ELIMIN�',idEquipo,nombre, 
		'NINGUNA',GETDATE() from deleted
		END;
GO
	IF EXISTS(select * from sys.triggers where name='AuditoriaEmpresas_Eliminar')
	DROP trigger AuditoriaEmpresas_Eliminar
	GO
		CREATE trigger [AuditoriaEmpresas_Eliminar]
	ON Empresas
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Empresas','ELIMIN�',idEmpresa,nombre, 
		'NINGUNA',GETDATE() from deleted
		END;
GO
	IF EXISTS(select * from sys.triggers where name='AuditoriaLogros_Eliminar')
	DROP trigger AuditoriaLogros_Eliminar
	GO
		CREATE trigger [AuditoriaLogros_Eliminar]
	ON Logros
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Logros','ELIMIN�',idLogro,nombre, 
		'NINGUNA',GETDATE() from deleted
		END;
GO
	IF EXISTS(select * from sys.triggers where name='AuditoriaNotas_Eliminar')
	DROP trigger AuditoriaNotas_Eliminar
	GO
		CREATE trigger [AuditoriaNotas_Eliminar]
	ON Notas
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Notas','ELIMIN�',idNota,descripcion, 
		'NINGUNA',GETDATE() from deleted
		END;
GO
	IF EXISTS(select * from sys.triggers where name='AuditoriaPizarras_Eliminar')
	DROP trigger AuditoriaPizarras_Eliminar
	GO
		CREATE trigger [AuditoriaPizarras_Eliminar]
	ON Pizarras
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Pizarras','ELIMIN�',idPizarra,titulo, 
		'NINGUNA',GETDATE() from deleted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaValores_Eliminar')
	DROP trigger AuditoriaValores_Eliminar
	GO
		CREATE trigger [AuditoriaValores_Eliminar]
	ON Valores
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Valores','ELIMIN�',idValor,nombre, 
		'NINGUNA',GETDATE() from deleted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaCondiciones_Eliminar')
	DROP trigger AuditoriaCondiciones_Eliminar
	GO
		CREATE trigger [AuditoriaCondiciones_Eliminar]
	ON Condiciones
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Condiciones','ELIMIN�',idCondicion,'', 
		'NINGUNA',GETDATE() from deleted
		END;
GO
--tablas intermedias

	IF EXISTS(select * from sys.triggers where name='AuditoriaEmpresasValores_Eliminar')
	DROP trigger AuditoriaEmpresasValores_Eliminar
	GO
		CREATE trigger [AuditoriaEmpresasValores_Eliminar]
	ON EmpresasValores
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EmpresasValores','ELIMIN�',idEmpresa+''+idValor,'Empresa y Valor', 
		'NINGUNA',GETDATE() from deleted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaEquiposValores_Eliminar')
	DROP trigger AuditoriaEquiposValores_Eliminar
	GO
		CREATE trigger [AuditoriaEquiposValores_Eliminar]
	ON EquiposValores
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EquiposValores','ELIMIN�',idEquipo+''+idValor,'Equipo y Valor', 
		'NINGUNA',GETDATE() from deleted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaLogrosCondiciones_Eliminar')
	DROP trigger AuditoriaLogrosCondiciones_Eliminar
	GO
		CREATE trigger [AuditoriaLogrosCondiciones_Eliminar]
	ON LogrosCondiciones
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosCondiciones','ELIMIN�',idLogro+''+idCondicion,'Logro y Condici�n', 
		'NINGUNA',GETDATE() from deleted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaLogrosUsuarios_Eliminar')
	DROP trigger AuditoriaLogrosUsuarios_Eliminar
	GO
		CREATE trigger [AuditoriaLogrosUsuarios_Eliminar]
	ON LogrosUsuarios
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosUsuarios','ELIMIN�',idLogro+''+idUsuario,'Logro y Usuario', 
		'NINGUNA',GETDATE() from deleted
		END;
GO

	IF EXISTS(select * from sys.triggers where name='AuditoriaUsuariosEmpresas_Eliminar')
	DROP trigger AuditoriaUsuariosEmpresas_Eliminar
	GO
		CREATE trigger [AuditoriaUsuariosEmpresas_Eliminar]
	ON UsuariosEmpresas
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEmpresas','ELIMIN�',idUsuario+''+idEmpresa,'Usuario y Empresa', 
		'NINGUNA',GETDATE() from deleted
		END;
GO
	IF EXISTS(select * from sys.triggers where name='AuditoriaUsuariosEquipos_Eliminar')
	DROP trigger AuditoriaUsuariosEquipos_Eliminar
	GO
		CREATE trigger [AuditoriaUsuariosEquipos_Eliminar]
	ON UsuariosEquipos
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEquipos','ELIMIN�',idUsuario+''+idEquipo,'Usuario y Equipo', 
		'NINGUNA',GETDATE() from deleted
		END;
GO
*/
/*==============================================================*/
/*AUDITORIA SOBRE LAS NOTAS                                        */
/*==============================================================*/
IF EXISTS(select * from sys.tables where name='Auditoria_Notas')
DROP TABLE Auditoria_Notas
GO
create table Auditoria_Notas(
	[idNota] int NOT NULL,
	[idPizarra] int NOT NULL,
	[idAutor] int NOT NULL,
	[idDestinatario] int NOT NULL,
	[idValor] int NOT NULL,
	[descripcion] varchar(100),
	[puntuacion] int NOT NULL,
	[fechaAud] DATETIME NOT NULL,
	[usuarioAud] varchar(30) NOT NULL,
	[hostNameAud] varchar(40) NOT NULL,
	[motivoAud] varchar(100) DEFAULT NULL,

)
GO

--Trigger de inserci�n 
IF EXISTS(select * from sys.triggers where name='trig_insercion_Notas')
DROP TRIGGER [trig_insercion_Notas];
GO
CREATE TRIGGER [trig_insercion_Notas]
	ON Notas 
	FOR insert
AS 
BEGIN
	INSERT INTO Auditoria_Notas([idNota], [idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion], fechaAud, usuarioAud, hostnameAud, motivoAud)
	SELECT idNota, [idPizarra], idAutor, idDestinatario, idValor, descripcion, puntuacion, GETDATE(), CURRENT_USER, HOST_NAME(), 'Alta' from inserted;
END
GO

--Trigger de modificacion
IF EXISTS(select * from sys.triggers where name='Trig_Modificacion_Notas')
DROP TRIGGER [Trig_Modificacion_Notas];
GO
CREATE TRIGGER Trig_Modificacion_Notas
	ON Notas 
	FOR insert
AS 
BEGIN
	INSERT INTO Auditoria_Notas([idNota], [idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion], fechaAud, usuarioAud, hostnameAud, motivoAud)
	SELECT idNota, idPizarra, idAutor, idDestinatario, idValor, descripcion, puntuacion, GETDATE(), CURRENT_USER, HOST_NAME(), 'Modificaci�n' from inserted;
END
GO

--Trigger de eliminaci�n
IF EXISTS(select * from sys.triggers where name='Trig_Eliminacion_Notas')
DROP TRIGGER [Trig_Eliminacion_Notas];
GO
CREATE TRIGGER Trig_Eliminacion_Notas
	ON Notas 
	FOR delete
AS 
BEGIN
INSERT INTO Auditoria_Notas([idNota], [idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion], fechaAud, usuarioAud, hostnameAud, motivoAud)
	SELECT idNota, idPizarra, idAutor, idDestinatario, idValor, descripcion, puntuacion, GETDATE(), CURRENT_USER, HOST_NAME(), 'Eliminaci�n' from deleted;
END
GO

/*==============================================================*/
/*AUDITORIA SOBRE LOS LOGROS DE LOS USUARIOS                    */
/*==============================================================*/
IF EXISTS(select * from sys.tables where name='Auditoria_LogrosUsuarios')
DROP TABLE Auditoria_LogrosUsuarios
GO
create table Auditoria_LogrosUsuarios(
	[idLogro] int NOT NULL,
	[idUsuario] int NOT NULL,
	[fecha] DATETIME NOT NULL,
	[fechaAud] DATETIME NOT NULL,
	[usuarioAud] varchar(30) NOT NULL,
	[hostNameAud] varchar(40) NOT NULL,
	[motivoAud] varchar(100) DEFAULT NULL,

)
GO

--Trigger de inserci�n 
IF EXISTS(select * from sys.triggers where name='trig_insercion_LogrosUsuarios')
DROP TRIGGER [trig_insercion_LogrosUsuarios];
GO
CREATE TRIGGER [trig_insercion_LogrosUsuarios]
	ON LogrosUsuarios 
	FOR insert
AS 
BEGIN
	INSERT INTO Auditoria_LogrosUsuarios([idLogro], [idUsuario], [fecha], fechaAud, usuarioAud, hostnameAud, motivoAud)
	SELECT idLogro, idUsuario, fecha, GETDATE(), CURRENT_USER, HOST_NAME(), 'Alta' from inserted;
END
GO

--Trigger de modificacion
IF EXISTS(select * from sys.triggers where name='Trig_Modificacion_LogrosUsuarios')
DROP TRIGGER [Trig_Modificacion_LogrosUsuarios];
GO
CREATE TRIGGER Trig_Modificacion_LogrosUsuarios
ON LogrosUsuarios 
	FOR insert
AS 
BEGIN
	INSERT INTO Auditoria_LogrosUsuarios([idLogro], [idUsuario], [fecha], fechaAud, usuarioAud, hostnameAud, motivoAud)
	SELECT idLogro, idUsuario, fecha, GETDATE(), CURRENT_USER, HOST_NAME(), 'Modificaci�n' from inserted;
END
GO

--Trigger de eliminaci�n
IF EXISTS(select * from sys.triggers where name='Trig_Eliminacion_LogrosUsuarios')
DROP TRIGGER [Trig_Eliminacion_LogrosUsuarios];
GO
CREATE TRIGGER Trig_Eliminacion_LogrosUsuarios
	ON LogrosUsuarios 
	FOR delete
AS 
BEGIN
	INSERT INTO Auditoria_LogrosUsuarios([idLogro], [idUsuario], [fecha], fechaAud, usuarioAud, hostnameAud, motivoAud)
	SELECT idLogro, idUsuario, fecha, GETDATE(), CURRENT_USER, HOST_NAME(), 'Eliminaci�n' from deleted;
END
GO


/*==============================================================*/
/*AUDITORIA SOBRE LOS VALORES DE LOS EQUIPOS                    */
/*==============================================================*/
IF EXISTS(select * from sys.tables where name='Auditoria_EquiposValores')
DROP TABLE Auditoria_EquiposValores
GO
create table Auditoria_EquiposValores(
	[idEquipo] int NOT NULL,
	[idValor] int NOT NULL,
	[estado] varchar(30) NOT NULL,
	[fechaAud] DATETIME NOT NULL,
	[usuarioAud] varchar(30) NOT NULL,
	[hostNameAud] varchar(40) NOT NULL,
	[motivoAud] varchar(100) DEFAULT NULL,

)
GO

--Trigger de inserci�n
IF EXISTS(select * from sys.triggers where name='trig_insercion_EquiposValores')
DROP TRIGGER [trig_insercion_EquiposValores];
GO
CREATE TRIGGER [trig_insercion_EquiposValores]
	ON EquiposValores 
	FOR insert
AS 
BEGIN
	INSERT INTO Auditoria_EquiposValores([idEquipo], [idValor], [estado], fechaAud, usuarioAud, hostnameAud, motivoAud)
	SELECT idEquipo, idValor, estado, GETDATE(), CURRENT_USER, HOST_NAME(), 'Alta' from inserted;
END
GO

--Trigger de modificacion
IF EXISTS(select * from sys.triggers where name='Trig_Modificacion_EquiposValores')
DROP TRIGGER [Trig_Modificacion_EquiposValores];
GO
CREATE TRIGGER Trig_Modificacion_EquiposValores
ON EquiposValores 
	FOR insert
AS 
BEGIN
	INSERT INTO Auditoria_EquiposValores([idEquipo], [idValor], [estado], fechaAud, usuarioAud, hostnameAud, motivoAud)
	SELECT [idEquipo], [idValor], [estado], GETDATE(), CURRENT_USER, HOST_NAME(), 'Modificaci�n' from inserted;
END
GO

--Trigger de eliminaci�n
IF EXISTS(select * from sys.triggers where name='Trig_Eliminacion_EquiposValores')
DROP TRIGGER [Trig_Eliminacion_EquiposValores];
GO
CREATE TRIGGER Trig_Eliminacion_EquiposValores
	ON EquiposValores 
	FOR delete
AS 
BEGIN
	INSERT INTO Auditoria_EquiposValores([idEquipo], [idValor], [estado], fechaAud, usuarioAud, hostnameAud, motivoAud)
	SELECT [idEquipo], [idValor], [estado], GETDATE(), CURRENT_USER, HOST_NAME(), 'Eliminaci�n' from deleted;
END
GO

/*==============================================================*/
/*Listados y busquedas                                            */
/*==============================================================*/


IF EXISTS(select * from sys.procedures where name='Listar_EquiposPorUsuario')
DROP PROCEDURE Listar_EquiposPorUsuario
GO
create procedure [Listar_EquiposPorUsuario]
@idUsuario int
as
begin
	BEGIN TRY
		Select U.idUsuario, U.nombre as nombre_usuario, UE.idEquipo, E.nombre as nombre_equipo
		from Usuarios U inner join UsuariosEquipos UE on U.idUsuario = UE.idUsuario
						inner join Equipos E on UE.idEquipo = E.idEquipo
	    where U.idUsuario = @idUsuario
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
GO

IF EXISTS(select * from sys.procedures where name='Listar_Empresas')
DROP PROCEDURE Listar_Empresas
GO
create procedure [Listar_Empresas]
as
begin
	BEGIN TRY
		Select E.idEmpresa, E.nombre from Empresas E
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go


IF EXISTS(select * from sys.procedures where name='Listar_LogrosEmpresas')
DROP PROCEDURE Listar_LogrosEmpresas
GO
create procedure [Listar_LogrosEmpresas]
@idEmpresa int
as
begin
	BEGIN TRY
		Select L.idLogro, L.nombre as nombre_logro
		from Logros L inner join Empresas E on L.idEmpresa = E.idEmpresa
		where L.idEmpresa = @idEmpresa
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Listar_ValoresEmpresa')
DROP PROCEDURE Listar_ValoresEmpresa
GO
create procedure Listar_ValoresEmpresa
@idEmpresa int
as
begin
		BEGIN TRY
			Select EV.idValor, V.nombre as Valor
			from EmpresasValores EV inner join Empresas E on EV.idEmpresa = E.idEmpresa
									inner join Valores V on EV.idValor = V.idValor
			where EV.idEmpresa = @idEmpresa
		END TRY	
		BEGIN CATCH
			declare @error varchar(100)= ERROR_MESSAGE()
			RAISERROR(@error,11,1)
		END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Buscar_Empresa')
DROP PROCEDURE Buscar_Empresa
GO
create procedure [Buscar_Empresa]
@nombre varchar(30)
as
begin
	BEGIN TRY
		Select E.idEmpresa, E.nombre from Empresas E where E.nombre = @nombre
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Listar_Equipos')
DROP PROCEDURE Listar_Equipos
GO
create procedure [Listar_Equipos]
as
begin
	BEGIN TRY
		Select E.idEquipo, E.nombre from Equipos E
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go


IF EXISTS(select * from sys.procedures where name='Listar_EquiposPorEmpresa')
DROP PROCEDURE Listar_EquiposPorEmpresa
GO
create procedure [Listar_EquiposPorEmpresa]
@idEmpresa int
as
begin
	BEGIN TRY
		Select E.nombre as nombre_equipo 
		from Equipos E inner join Empresas on E.idEmpresa = Empresas.idEmpresa
	    where E.idEmpresa = @idEmpresa
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Buscar_Equipo')
DROP PROCEDURE Buscar_Equipo
GO
create procedure [Buscar_Equipo]
@nombre varchar(30)
as
begin
	BEGIN TRY
		Select E.nombre from Equipos E where E.nombre = @nombre
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Listar_Usuarios')
DROP PROCEDURE Listar_Usuarios
GO
create procedure [Listar_Usuarios]
as
begin
	BEGIN TRY
		Select u.idUsuario,u.nombre from Usuarios U
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Listar_UsuariosPorEmpresa')
DROP PROCEDURE Listar_UsuariosPorEmpresa
GO
create procedure [Listar_UsuariosPorEmpresa]
@idEmpresa int
as
begin
	BEGIN TRY
		Select u.idUsuario, Usuarios.nombre as nombre_usuario
		from UsuariosEmpresas U inner join Usuarios on u.idUsuario = Usuarios.idUsuario
	    where u.idEmpresa = @idEmpresa
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go


IF EXISTS(select * from sys.procedures where name='Buscar_UsuarioPorEmpresa')
DROP PROCEDURE Buscar_UsuarioPorEmpresa
GO
create procedure [Buscar_UsuarioPorEmpresa]
@idEmpresa int,
@idUsuario int
as
begin
	BEGIN TRY
		Select u.idUsuario , u.idEmpresa
		from UsuariosEmpresas U
	    where u.idUsuario = @idUsuario and u.idEmpresa = @idEmpresa
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go


IF EXISTS(select * from sys.procedures where name='Listar_UsuariosPorResponsable')
DROP PROCEDURE Listar_UsuariosPorResponsable
GO
create procedure [Listar_UsuariosPorResponsable]
@idUsuario int
as
begin
	BEGIN TRY
	declare @equipo int

		Select @equipo=ue.idEquipo
		from Usuarios u inner join UsuariosEquipos UE on u.idUsuario = ue.idUsuario
		where u.idUsuario = 2 and ue.rol=1 
		exec Listar_UsuariosPorEquipo @equipo
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Listar_UsuariosPorEquipo')
DROP PROCEDURE Listar_UsuariosPorEquipo
GO
create procedure [Listar_UsuariosPorEquipo](@idEquipo int)
as
begin
	BEGIN TRY
		Select u.idUsuario, Usuarios.nombre, u.rol 
		from UsuariosEquipos U inner join Usuarios on u.idUsuario = Usuarios.idUsuario
	    where u.idEquipo = @idEquipo
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Listar_UsuariosPorRol')
DROP PROCEDURE Listar_UsuariosPorRol
GO
create procedure [Listar_UsuariosPorRol]
@rol bit
as
begin
	BEGIN TRY
		Select u.idUsuario, Usuarios.nombre 
		from UsuariosEmpresas U inner join Usuarios on u.idUsuario = Usuarios.idUsuario
	    where u.rol = @rol
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Buscar_Usuario')
DROP PROCEDURE Buscar_Usuario
GO
create procedure [Buscar_Usuario]
@nombre varchar(30)
as
begin
	BEGIN TRY
		Select u.idUsuario,u.nombre from Usuarios U where u.nombre = @nombre
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Buscar_UsuarioPorMail')
DROP PROCEDURE Buscar_UsuarioPorMail
GO
create procedure [Buscar_UsuarioPorMail]
@mail varchar(50)
as
begin
	BEGIN TRY
		Select u.idUsuario, U.nombre
		from Usuarios U
	    where u.mail = @mail
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Listar_LogrosDeUnUsuario')
DROP PROCEDURE Listar_LogrosDeUnUsuario
GO
create procedure [Listar_LogrosDeUnUsuario]
@idUsuario int
as
begin
	BEGIN TRY
		Select Usuarios.nombre as Usuario, logros.nombre as Logro
		from LogrosUsuarios L inner join Usuarios on L.idUsuario = Usuarios.idUsuario
		inner join logros on l.idLogro=logros.idLogro
	    where l.idUsuario = @idUsuario
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Listar_ValoresDeUnEquipo')
DROP PROCEDURE Listar_ValoresDeUnEquipo
GO
create procedure [Listar_ValoresDeUnEquipo]
@idEquipo int
as
begin
	BEGIN TRY
		Select Valores.nombre as Valor, eq.nombre 
		from EquiposValores E inner join Equipos EQ on e.idEquipo = EQ.idEquipo
		inner join Valores on e.idValor = Valores.idValor
	    where e.idEquipo = @idEquipo
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Listar_NotasDeUnUsuario')
DROP PROCEDURE Listar_NotasDeUnUsuario
GO
create procedure [Listar_NotasDeUnUsuario]
@idUsuario int
as
begin
	BEGIN TRY
		Select n.idNota,n.descripcion, Usuarios.nombre as Destinatario
		from Notas N inner join Usuarios on n.idDestinatario = usuarios.idUsuario
	    where n.idDestinatario = @idUsuario
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go

IF EXISTS(select * from sys.procedures where name='Listar_PizarrasDeUnEquipo')
DROP PROCEDURE Listar_PizarrasDeUnEquipo
GO
create procedure [Listar_PizarrasDeUnEquipo]
@idEquipo int
as
begin
	BEGIN TRY
		Select p.titulo,e.nombre
		from Pizarras P inner join Equipos E on p.idEquipo=e.idEquipo
	    where p.idEquipo = @idEquipo
	order by p.fechaInicio asc
	END TRY	
	BEGIN CATCH
		declare @error varchar(100)= ERROR_MESSAGE()
		RAISERROR(@error,11,1)
	END CATCH 
end 
go