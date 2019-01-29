USE [OnBoardDataBase]
GO

ALTER procedure [Usuarios_Insert]

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

ALTER procedure [Usuarios_Update]
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


ALTER procedure [Usuarios_Delete]
@idUsuario int
as
begin

	delete from dbo.Usuarios where idUsuario = @idUsuario

end 
go

