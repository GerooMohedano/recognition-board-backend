USE [OnBoardDataBase]
GO

CREATE procedure [Usuarios_Insert]
@nombre varchar(50),
@contraseña varchar(30),
@mail varchar(30),
@fotoPerfil image,
@adminGeneral bit
as
begin
		Insert dbo.Usuarios(nombre,contrasenia,mail,fotoPerfil,adminGeneral)
		values (@nombre,@contraseña,@mail,@fotoPerfil,@adminGeneral)
end
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
		update dbo.Usuarios
		set
		 nombre=@nombre,
		 contrasenia= @contrasenia,
		 mail= @mail,
		 fotoPerfil= @fotoPerfil,
		 adminGeneral = @adminGeneral
		where idUsuario = @idUsuario
end 
go


CREATE PROCEDURE [dbo].[Empresas_Insert]
	@nombre nvarchar(50),
	@direccion nvarchar(50),
   	@telefono int,
	@logo image,
	@estado nvarchar(50)

AS
BEGIN
	INSERT INTO dbo.Empresas(nombre,direccion,telefono,logo,estado)
	VALUES(@nombre,@direccion, @telefono, @logo, @estado)

RETURN SCOPE_IDENTITY();
END
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
	UPDATE dbo.Empresas
	SET 
	nombre= @nombre,
	direccion= @direccion,
   	telefono= @telefono,
	logo= @logo,
	Estado= @estado	
		
	WHERE idEmpresa = @idEmpresa 

	RETURN @@RowCount
END
GO

CREATE PROCEDURE [dbo].[Equipos_Insert]
	@nombre varchar(30),
	@imagen image,
	@estado varchar(30)

AS
BEGIN
	INSERT INTO dbo.Equipos(nombre,imagen,estado)
	VALUES(@nombre,@imagen,@estado)

RETURN SCOPE_IDENTITY();
END
go

CREATE PROCEDURE [dbo].[Equipos_Update]
	@idEquipo int,
	@nombre nvarchar(50),
	@imagen image,
	@estado nvarchar(50)
AS
BEGIN
	UPDATE dbo.Equipos
	SET 
	nombre= @nombre,
	imagen= @imagen,
	estado= @estado	
		
	WHERE idEquipo = @idEquipo 

	RETURN @@RowCount
END
go

CREATE PROCEDURE [dbo].[Valores_Insert]
	@nombre nvarchar(50)

AS
BEGIN
	INSERT INTO dbo.Valores(nombre)
	VALUES(@nombre)

RETURN SCOPE_IDENTITY();
END
go

CREATE PROCEDURE [dbo].[Valores_Update]
	@idValor int,
	@nombre nvarchar(50)
AS
BEGIN
	UPDATE dbo.Valores
	SET 
	nombre= @nombre	
	WHERE idValor = @idValor 

	RETURN @@RowCount
END
go

CREATE PROCEDURE [dbo].[EquiposValores_Insert]
	@idValor int,
	@idEquipo int,
	@estado nvarchar(50)

AS
BEGIN
	INSERT INTO dbo.EquiposValores(idValor,idEquipo,estado)
	VALUES(@idValor,@idEquipo,@estado)

RETURN SCOPE_IDENTITY();
END
go


CREATE PROCEDURE [dbo].[EquiposValores_Update]
	@idValor int,
	@idEquipo int,
	@estado nvarchar(30)
AS
BEGIN
	UPDATE dbo.EquiposValores
	SET 
	idValor = @idValor,
	idEquipo = @idEquipo,  
	estado= @estado		
	WHERE idValor = @idValor and idEquipo = @idEquipo

	RETURN @@RowCount
END
go


CREATE PROCEDURE [dbo].[EmpresasValores_Insert]
	@idValor int,
	@idEmpresa int

AS
BEGIN
	INSERT INTO dbo.EmpresasValores(idValor,idEmpresa)
	VALUES(@idValor,@idEmpresa)

RETURN SCOPE_IDENTITY();
END
go

CREATE PROCEDURE [dbo].[EmpresasValores_Update]
	@idValor int,
	@idEmpresa int
AS
BEGIN
	UPDATE dbo.EmpresasValores
	SET 
	idValor = @idValor,
	idEmpresa = @idEmpresa 

	WHERE 	idValor = @idValor and idEmpresa = @idEmpresa

	RETURN @@RowCount
END
go

CREATE PROCEDURE [dbo].[Logros_Insert]
	@nombre nvarchar(50),
	@descripcion nvarchar(50),
	@foto image

AS
BEGIN
	INSERT INTO dbo.Logros(nombre,descripcion,foto)
	VALUES(@nombre, @descripcion, @foto)

RETURN SCOPE_IDENTITY();
END
go

CREATE PROCEDURE [dbo].[Logros_Update]
	@idLogro int,
	@nombre nvarchar(50),
	@descripcion nvarchar(50),
	@foto image
	
AS
BEGIN
	UPDATE dbo.Logros
	SET 
	nombre= @nombre,
	descripcion = @descripcion,
	foto = @foto

		
	WHERE idLogro = @idLogro

	RETURN @@RowCount
END
go

CREATE PROCEDURE [dbo].[UsuariosEquipos_Insert]
	@idEquipo int,
	@idUsuario int,
	@rol nvarchar(50),
	@estado nvarchar(50)

AS
BEGIN
	INSERT INTO dbo.UsuariosEquipos(idEquipo, idUsuario, rol, estado)
	VALUES(@idEquipo, @idUsuario, @rol, @estado)

RETURN SCOPE_IDENTITY();
END
go

CREATE PROCEDURE [dbo].[UsuariosEquipos_Update]
	@idEquipo int,
	@idUsuario int,
	@rol nvarchar(50),
	@estado nvarchar(50)
	
AS
BEGIN
	UPDATE dbo.UsuariosEquipos
	SET 
	idEquipo = @idEquipo,
	idUsuario = @idUsuario,
	rol= @rol,
	estado = @estado

		
	WHERE 	idEquipo = @idEquipo and idUsuario = @idUsuario

	RETURN @@RowCount
END
go

CREATE PROCEDURE [dbo].[Pizarras_Insert]
	@titulo nvarchar(50),
	@idEquipo int,
	@fechaInicio datetime,
	@fechaFin datetime

AS
BEGIN
	INSERT INTO dbo.Pizarras(titulo,idEquipo,fechaInicio,fechaFin)
	VALUES(@titulo, @idEquipo, @fechaInicio, @fechaFin)

RETURN SCOPE_IDENTITY();
END
go

CREATE PROCEDURE [dbo].[Pizarras_Update]
	@idPizarra int,
	@titulo nvarchar(50),
	@idEquipo int,
	@fechaInicio datetime,
	@fechaFin datetime

AS
BEGIN
	UPDATE dbo.Pizarras
	SET 
	titulo = @titulo,
	idEquipo= @idEquipo,
	fechaInicio= @fechaInicio,
	fechaFin= @fechaFin

		
	WHERE idPizarra= @idPizarra

	RETURN @@RowCount
END
go

CREATE PROCEDURE [dbo].[Notas_Insert]
	@idPizarra int,
	@idAutor int,
	@idDestinatario int,
	@idValor int,
	@descripcion nvarchar(50),
	@puntuacion int

AS
BEGIN
	INSERT INTO dbo.Notas(idPizarra,idAutor,idDestinatario, idValor, descripcion, puntuacion)
	VALUES(@idPizarra, @idAutor, @idDestinatario, @idValor, @descripcion, @puntuacion)

RETURN SCOPE_IDENTITY();
END
go

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
	UPDATE dbo.Notas
	SET 
	idPizarra= @idPizarra,
	idAutor = @idAutor,
	idDestinatario= @idDestinatario,
	idValor= @idValor,
	descripcion= @descripcion,
	puntuacion= @puntuacion

		
	WHERE idNota= @idNota

	RETURN @@RowCount
END
go

CREATE PROCEDURE [dbo].[UsuariosEmpresas_Insert]
	@idUsuario int,
	@idEmpresa int,
	@rol nvarchar(50)

AS
BEGIN
	INSERT INTO dbo.UsuariosEmpresas(idUsuario, idEmpresa, rol)
	VALUES(@idUsuario,@idEmpresa,@rol)

RETURN SCOPE_IDENTITY();
END
go

CREATE PROCEDURE [dbo].[UsuariosEmpresas_Update]
	@idUsuario int,
	@idEmpresa int,
	@rol nvarchar(50)

AS
BEGIN
	UPDATE dbo.UsuariosEmpresas
	SET 
	idUsuario= @idUsuario,
	idEmpresa= @idEmpresa,
	rol= @rol

	WHERE 	idUsuario= @idUsuario and idEmpresa= @idEmpresa 

	RETURN @@RowCount
END
go

CREATE procedure [Usuarios_Delete]
@idUsuario int
as
begin
	delete from dbo.Usuarios where idUsuario = @idUsuario
	delete from dbo.LogrosUsuarios where idUsuario = @idUsuario
	delete from dbo.UsuariosEmpresas where idUsuario = @idUsuario
	delete from dbo.UsuariosEquipos where idUsuario = @idUsuario
end 
go

create procedure [Empresas_Delete]
@idEmpresa int
as
begin
	delete from dbo.Empresas where idEmpresa = @idEmpresa
	delete from dbo.EmpresasValores where idEmpresa = @idEmpresa
	delete from dbo.UsuariosEmpresas where idEmpresa = @idEmpresa
end 
go

create procedure [Equipos_Delete]
@idEquipo int
as
begin
	delete from dbo.Equipos where idEquipo = @idEquipo
	delete from dbo.EquiposValores where idEquipo = @idEquipo
	delete from dbo.UsuariosEquipos where idEquipo = @idEquipo
end 
go

create procedure [Logros_Delete]
@idLogro int
as
begin
	delete from dbo.Logros where idLogro = @idLogro
	delete from dbo.LogrosCondiciones where idLogro = @idLogro
	delete from dbo.LogrosUsuarios where idLogro = @idLogro
end 
go

create procedure [Notas_Delete]
@idNota int
as
begin
	delete from dbo.Notas where idNota = @idNota
end 
go

create procedure [Pizarras_Delete]
@idPizarra int
as
begin
	delete from dbo.Pizarras where idPizarra = @idPizarra
end 
go

create procedure Logeo
@nombre varchar(50),
@contrasenia varchar(30),
@logeado int output,
@mensaje varchar(40) output

as
begin
select @logeado=COUNT(U.nombre) FROM Usuarios U where nombre = @nombre and contrasenia = @contrasenia
if(@logeado>0) begin
select @mensaje= 'Bienvenido'+U.nombre from Usuarios U Where nombre = @nombre and contrasenia = @contrasenia
end
end
go

create procedure Cambiar_Contraseña
@idUsuario int,
@contraseniaactual varchar(30),
@contrasenianueva varchar(30)

as
begin
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
end
go

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

	CREATE trigger [AuditoriaUsuario_Inseratr]
	ON Usuarios
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','USUARIOS','INSERTÓ',idUsuario,nombre, 
		'NINGUNA',GETDATE() from inserted
		END;

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
	CREATE trigger [AuditoriaEmpresas_Insertar]
	ON Empresas
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Empresas','INSERTÓ',idEmpresa,nombre, 
		'NINGUNA',GETDATE() from inserted
		END;

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
	CREATE trigger [AuditoriaCondiciones_Insertar]
	ON Condiciones
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Condiciones','INSERTÓ',idCondicion,'', 
		'NINGUNA',GETDATE() from inserted
		END;

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
	CREATE trigger [AuditoriaPizarras_Insertar]
	ON Pizarras
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Pizarras','INSERTÓ',idPizarra,titulo, 
		'NINGUNA',GETDATE() from inserted
		END;

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
	CREATE trigger [AuditoriaEmpresasValores_Insertar]
	ON EmpresasValores
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EmpresasValores','INSERTÓ',idValor+''+idEmpresa,'valor y empresa', 
		'NINGUNA',GETDATE() from inserted
		END;
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

	CREATE trigger [AuditoriaLogrosCondiciones_Insertar]
	ON LogrosCondiciones
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosCondiciones','INSERTÓ',idCondicion+''+idLogro,'Condición y Logro', 
		'NINGUNA',GETDATE() from inserted
		END;
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

	CREATE trigger [AuditoriaUsuariosEmpresas_Insertar]
	ON UsuariosEmpresas
	FOR INSERT
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEmpresas','INSERTÓ',idEmpresa+''+idUsuario,'Empresa y Usuario', 
		'NINGUNA',GETDATE() from inserted
		END;
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

	CREATE trigger [AuditoriaUsuarios_Actualizar]
	ON Usuarios
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Usuarios','ACTUALIZÓ',idUsuario,nombre, 
		(select nombre from deleted),GETDATE() from inserted
		END;

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

	CREATE trigger [AuditoriaEmpresas_Actualizar]
	ON Empresas
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Empresas','ACTUALIZÓ',idEmpresa,nombre, 
		(select nombre from deleted),GETDATE() from inserted
		END;

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

	CREATE trigger [AuditoriaNotas_Actualizar]
	ON Notas
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Notas','ACTUALIZÓ',idNota,descripcion, 
		(select descripcion from deleted),GETDATE() from inserted
		END;

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

	CREATE trigger [AuditoriaValores_Actualizar]
	ON Valores
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Valores','ACTUALIZÓ',idValor,nombre, 
		(select nombre from deleted),GETDATE() from inserted
		END;
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
	CREATE trigger [AuditoriaEmpresasValores_Actualizar]
	ON EmpresasValores
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EmpresasValores','ACTUALIZÓ',idEmpresa+''+idValor,'Empresa y Valor', 
		(select idEmpresa+''+idValor from deleted),GETDATE() from inserted
		END;
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
	CREATE trigger [AuditoriaLogrosCondiciones_Actualizar]
	ON LogrosCondiciones
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosCondiciones','ACTUALIZÓ',idLogro+''+idCondicion,'Equipo y Valor', 
		(select idLogro+''+idCondicion from deleted),GETDATE() from inserted
		END;
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
	CREATE trigger [AuditoriaUsuariosEmpresas_Actualizar]
	ON UsuariosEmpresas
	FOR UPDATE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEmpresas','ACTUALIZÓ',idUsuario+''+idEmpresa,'Usuario y Empresa', 
		(select idUsuario+''+idEmpresa from deleted),GETDATE() from inserted
		END;
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
		CREATE trigger [AuditoriaUsuarios_Eliminar]
	ON Usuarios
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Usuarios','ELIMINÓ',idUsuario,nombre, 
		'NINGUNA',GETDATE() from deleted
		END;
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

		CREATE trigger [AuditoriaEmpresas_Eliminar]
	ON Empresas
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Empresas','ELIMINÓ',idEmpresa,nombre, 
		'NINGUNA',GETDATE() from deleted
		END;
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
		CREATE trigger [AuditoriaNotas_Eliminar]
	ON Notas
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Notas','ELIMINÓ',idNota,descripcion, 
		'NINGUNA',GETDATE() from deleted
		END;
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

		CREATE trigger [AuditoriaValores_Eliminar]
	ON Valores
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','Valores','ELIMINÓ',idValor,nombre, 
		'NINGUNA',GETDATE() from deleted
		END;
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
		CREATE trigger [AuditoriaEmpresasValores_Eliminar]
	ON EmpresasValores
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','EmpresasValores','ELIMINÓ',idEmpresa+''+idValor,'Empresa y Valor', 
		'NINGUNA',GETDATE() from deleted
		END;
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
		CREATE trigger [AuditoriaLogrosCondiciones_Eliminar]
	ON LogrosCondiciones
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','LogrosCondiciones','ELIMINÓ',idLogro+''+idCondicion,'Logro y Condición', 
		'NINGUNA',GETDATE() from deleted
		END;
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
		CREATE trigger [AuditoriaUsuariosEmpresas_Eliminar]
	ON UsuariosEmpresas
	FOR DELETE
	AS 
		BEGIN
		INSERT AUDITORIA SELECT 'DESCONOCIDO','UsuariosEmpresas','ELIMINÓ',idUsuario+''+idEmpresa,'Usuario y Empresa', 
		'NINGUNA',GETDATE() from deleted
		END;
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