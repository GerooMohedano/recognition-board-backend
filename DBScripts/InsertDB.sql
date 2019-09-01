USE [OnBoardDataBase]
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Deos', '123', 'deos@mail.com', 1)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Luciana', '123', 'lucianasoria@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Gero', '123', 'gero_mohe2@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Magui', '123', 'magui_kpo@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Tony', '123', 'iaforns@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Diego', '123', 'ds.campero@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Pamela', '147', 'pameruiz@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Mauricio', '258', 'mauperez@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Marcio', '255', 'marciobautista@sovos.com', 1)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Natalia', '111', 'nataliaburgio@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Maxi', '123', 'mmaximiliano@sovos.com', 0)
--USUARIOS SCANIA
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Romina', '123', 'rominaruiz93@sovos.com', 0)--12
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Matias', '123', 'matiasledesma@scania.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Juan', '123', 'juanbustamente@scania.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Fernando', '123', 'fernandito@scania.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Joaquin', '123', 'joaco389@scania.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('JoseMaria', '123', 'josemariantunez@scania.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Giselle', '123', 'giselldoblel@scania.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Franco', '123', 'franco_altovoltaje@scania.com', 0)--19
GO

INSERT [dbo].[Empresas] ([nombre], [direccion], [telefono], [estado], [logo]) VALUES ('Sovos','Belgrano',4250685,'activo',null)
INSERT [dbo].[Empresas] ([nombre], [direccion], [telefono], [estado], [logo]) VALUES ('Scania','Cruz Alta',1254786,'activo',null)
GO

INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Elephants', 1)--1
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Octopus', 1)--2
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Barracudas', 1)--3
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Managers', 1)--4
--equipos scania
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Programadores', 2)--5
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Analistas', 2)
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Mecatrónica', 2)
GO

INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (1, 1, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (2, 2, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (3, 3, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (4, 4, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (1, 5, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (2, 6, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (3, 6, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (4, 6, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (1, 7, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (2, 8, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (3, 9, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (4, 10, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (4, 11, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (2, 11, 0)
----------
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (5, 12, 0)--1
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (6, 12, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (7, 13, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (5, 14, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (6, 15, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (7, 16, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (5, 17, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (6, 18, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (7, 19, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (5, 13, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (7, 18, 0)--11
GO

INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181201', 1, CAST(N'2018-12-02' AS Date), CAST(N'2018-12-16' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181201', 2, CAST(N'2018-12-02' AS Date), CAST(N'2018-12-16' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181201', 3, CAST(N'2018-12-02' AS Date), CAST(N'2018-12-16' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181202', 1, CAST(N'2018-12-17' AS Date), CAST(N'2018-12-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181202', 2, CAST(N'2018-12-17' AS Date), CAST(N'2018-12-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181202', 3, CAST(N'2018-12-17' AS Date), CAST(N'2018-12-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Diciembre 18', 4, CAST(N'2018-12-01' AS Date), CAST(N'2018-12-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Diciembre 18', 5, CAST(N'2018-12-01' AS Date), CAST(N'2018-12-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Enero 19', 4, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Enero 19', 5, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))
---
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('mayo 19', 6, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))--11
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('mayo 19', 6, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('junio 19', 6, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('junio 19', 7, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('junio 19', 7, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('agosto 19', 7, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('agosto 19', 7, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('septiembre 19', 5, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('septiembre 19', 5, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('octubre 19', 5, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('octubre 19', 5, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('noviembre 19', 5, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-31' AS Date))--22
GO

INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Proffessional')--1
INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Collaborative')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Adaptable')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Hardito')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Amistoso')--5
INSERT [dbo].[Valores] ([nombre]) VALUES ('Puntualidad')--6
INSERT [dbo].[Valores] ([nombre]) VALUES ('Creativo')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Divertido')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Educado')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Eficiente')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Ordenado')--11
GO

INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (5, 100)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (6, 100)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [modificador]) VALUES (2, 0, 0)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (1, 500)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [excluyente]) VALUES (5, 100, 1)
---
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (1, 10) --profesional 6
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [modificador]) VALUES (2, 10, 0)--colaborative 7
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [excluyente]) VALUES (3, 20, 1)--adaptable 8
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (4, 10) --hardito 9
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [modificador]) VALUES (5, 10, 0) --amistoso 10
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (7, 20)-- creativo 11
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (8, 10) --divertido 12
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [modificador]) VALUES (9, 20, 1)--educado 13
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [excluyente]) VALUES (10, 20, 0)--eficiente 14
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [excluyente]) VALUES (11, 15, 1)--ordenado 15
GO

INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1,'Mejor Amigo', 'Obtuviste mas de 100 puntos en Amistoso y Puntual')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1,'Miss Simpatia', 'Obtuviste mas de 100 puntos en el valor de Amistoso')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (2, 'Ninio Rata', 'Obtuviste un puntaje negativo en el valor Be Collaborative')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'GROSSO', 'Obtuviste mas de 500 puntos en el valor Be Proffessional')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (2, 'Reloj Atomico', 'Obtuviste mas de 100 puntos en el valor Puntualida de alguien de otro equipo')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'Joven manos de tijera', 'Meter los dedos en el enchufe')--6
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (2, 'PRO EFFICIENT', 'Obtuviste 20 puntos por cumplir los objetivos en tiempo y forma')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'Mejor trato', 'Obtuviste 20 puntos por ser educado y tener buena predisposición')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (2, 'JAJAJA', 'Obtuviste 10 puntos por ser divertido y bromista')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'Mister Creativo', 'Obtuviste 20 puntos por tu creatividad')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'Rey Estructurado', 'Obtuviste 15 puntos por ser ordenado en tu forma de trabajar y lugar de trabajo')
GO

INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (1, 1)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (2, 1)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (1, 2)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (3, 3)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (4, 4)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (5, 5)

INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (14, 7)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (13, 8)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (12, 9)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (11, 10)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (15, 11)
GO

INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (1, 3, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (2, 2, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (3, 5, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (1, 7, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (2, 3, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (3, 6, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (2, 4, CAST(N'2018-01-02' AS Date))

INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (4, 8, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (5, 9, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (6, 10, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (7, 11, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (8, 12, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (9, 13, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (10, 14, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (11, 14, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (8, 15, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (9, 15, CAST(N'2018-01-02' AS Date))
GO

INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (1, 1)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (2, 1)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (3, 1)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (1, 2)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (2, 2)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (3, 2)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (1, 3)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (2, 3)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (3, 3)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (2, 4)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (4, 5)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (5, 5)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (4, 6)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (5, 6)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (5, 7)

INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (1, 6)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (2, 7)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (3, 8)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (4, 9)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (5, 10)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (6, 11)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (7, 6)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (1, 7)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (2, 8)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (7, 9)
GO

INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (7, 3, 4, 4, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (4, 3, 5, 2, 'No entendi la explicacion que me diste', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (7, 6, 4, 1, 'Muy buenas las diapos que hiciste', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (2, 3, 6, 1, 'Aprendiste rapido', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (2, 3, 6, 3, 'Te adecuaste rapido al cambio de equipo', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (4, 5, 3, 1, 'Holvidar de schedulear la mitin', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (5, 4, 6, 1, 'No agregaste a nadie a tu equipo en esta app', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [puntuacion]) VALUES (3, 6, 3, 2, 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (3, 5, 3, 1, 'Este ves si scheduleaste la mitink', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (7, 3, 4, 4, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (7, 5, 4, 4, 'No me avisaste del deploy del martes', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (1, 6, 5, 1, 'No se dirige a mi apropiadamente', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (5, 3, 6, 1, 'Seguis sin agregar a tu equipo a la app', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (1, 2, 7, 5, 'Fortalecimos mucho nuestros lazos de amistad despues de que casi moris electrocutado', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (2, 7, 8, 6, 'Siempre sos el primero en llegar', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (7, 9, 10, 5, 'No sonreis nunca', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (2, 7, 2, 5, 'Gracias', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (2, 7, 2, 6, 'Levantate mas temprano', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (2, 7, 8, 7, 'Muy buena idea para resolver el login', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (5, 2, 8, 7, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (2, 9, 8, 7, 'CRACK!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (5, 10, 8, 7, 'LAS MEJORES', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (5, 10, 8, 7, 'Nah mentira, muy buena idea. Idolo!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (6, 2, 3, 1, 'Muy comprometido con el proyecto', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (1, 4, 5, 2, 'Me ayudo en resolver unos bugs del proyecto onboard', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (4, 6, 7, 3, 'Supo cambiar el proyecto en base a los nuevos requerimientos', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (3, 8, 9, 4, 'Se distrae por cualquier cosa', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (7, 10, 11, 5, 'Siempre con la mejor onda, organiza todos los eventos', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (7, 2, 4, 6, 'LLega 15 minutos tarde del almuerzo por lo menos 3 veces a la semana', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (14, 12, 13, 7, 'Las mejores ideas, ej:pochoclos salados 24/7', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (11, 14, 15, 8, 'No sonreis nunca', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (14, 18, 19, 10, 'Es muy inteligente y resuelve todo rápido', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (10, 18, 12, 11, 'Deja migas de lo q come sobre el escritorio y dentro del cajón', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (14, 16, 18, 7, 'Muy buena idea del cambio de app!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (14, 14, 13, 9, 'Tu vieja', 1)

GO

INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 2, 1, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 3, 1, 'inactivo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 4, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 5, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 6, 0, 'inactivo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 7, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 8, 0, 'inactivo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 9, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 10, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 11, 0, 'activo')

INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 12, 1, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 13, 1, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 14, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 15, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 16, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 18, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 19, 0, 'activo')
GO

INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 1)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 2)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 3)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 4)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 5)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 6)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 7)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (2, 7)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (2, 8)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (2, 9)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (2, 10)
GO

INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181203', 2, CAST(N'2018-12-17' AS Date), CAST(N'2018-12-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181204', 2, CAST(N'2018-12-19' AS Date), CAST(N'2018-12-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181205', 2, CAST(N'2018-12-20' AS Date), CAST(N'2018-12-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181206', 2, CAST(N'2018-12-21' AS Date), CAST(N'2018-12-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181207', 2, CAST(N'2018-12-22' AS Date), CAST(N'2018-12-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181208', 2, CAST(N'2018-12-23' AS Date), CAST(N'2018-12-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181209', 2, CAST(N'2018-12-24' AS Date), CAST(N'2018-12-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('181210', 2, CAST(N'2018-12-25' AS Date), CAST(N'2018-12-31' AS Date))
GO

INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (11, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (11, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (11, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (12, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (13, 4, 3, 2, 'Por no contarme las horas extras', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (13, 4, 3, 2, 'Por no contarme las horas extras', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (14, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (14, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (14, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (14, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (15, 4, 3, 2, 'Por no contarme las horas extras', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (16, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (16, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (16, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (16, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (17, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (17, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (18, 4, 3, 2, 'Por no contarme las horas extras', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (18, 4, 3, 2, 'Por no contarme las horas extras', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (18, 4, 3, 2, 'Por no contarme las horas extras', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (18, 4, 3, 2, 'Por no contarme las horas extras', -1)
GO
