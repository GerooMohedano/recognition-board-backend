USE [OnBoardDataBase]
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Deos', '123', 'deos@mail.com', 1)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Romy', '123', 'romi_tu_turritah@mail.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Gero', '123', 'gero_mohe2@hotmail.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Magui', '123', 'magui_kpo@mail.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Tony', '123', 'iaforms@mail.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Diego', '123', 'ds.campero@mail.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Franco', '123', 'franco_altovoltaje@mail.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Esclavo1', '123', 'nn1@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Esclavo2', '123', 'nn2@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Esclavo3', '123', 'nn3@sovos.com', 0)
GO

INSERT [dbo].[Empresas] ([nombre]) VALUES ('Sovos')
INSERT [dbo].[Empresas] ([nombre]) VALUES ('Scania')
GO

INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Elephants', 1)
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Octopus', 1)
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Barracudas', 1)
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Managers', 2)
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Programadores', 2)
GO

INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (4, 2, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (1, 3, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (2, 3, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (2, 4, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (2, 5, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (1, 6, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (3, 6, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (5, 7, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (5, 8, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (5, 9, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (5, 10, 0)
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
GO

INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Proffessional')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Collaborative')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Adaptable')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Be MalaLeche')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Amistoso')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Puntualidad')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Creativo')
GO

INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (5, 100)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (6, 100)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [modificador]) VALUES (2, 0, 0)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (1, 500)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [excluyente]) VALUES (5, 100, 1)
GO

INSERT [dbo].[Logros] ([nombre], [descripcion]) VALUES ('Mejor Amigo', 'Obtuviste mas de 100 puntos en Amistoso y Puntual')
INSERT [dbo].[Logros] ([nombre], [descripcion]) VALUES ('Miss Simpatia', 'Obtuviste mas de 100 puntos en el valor de Amistoso')
INSERT [dbo].[Logros] ([nombre], [descripcion]) VALUES ('Ninio Rata', 'Obtuviste un puntaje negativo en el valor Be Collaborative')
INSERT [dbo].[Logros] ([nombre], [descripcion]) VALUES ('SO GROSSO', 'Obtuviste mas de 500 puntos en el valor Be Proffessional')
INSERT [dbo].[Logros] ([nombre], [descripcion]) VALUES ('Reloj Atomico', 'Obtuviste mas de 100 puntos en el valor Puntualidadde alguien de otro equipo')
INSERT [dbo].[Logros] ([nombre], [descripcion]) VALUES ('Joven manos de tijera', 'Meter los dedos en el enchufe')
GO

INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (1, 1)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (2, 1)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (1, 2)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (3, 3)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (4, 4)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (5, 5)
GO

INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (1, 3, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (4, 2, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (3, 5, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (6, 7, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (5, 3, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (2, 6, CAST(N'2018-01-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (3, 4, CAST(N'2018-01-02' AS Date))
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
GO

INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (2, 3, 4, 4, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [puntuacion]) VALUES (1, 5, 4, 4, 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (2, 3, 5, 2, 'No entendi la explicacion que me diste', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (2, 6, 4, 1, 'Muy buenas las diapos que hiciste', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (1, 3, 6, 1, 'Aprendiste rapido', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (1, 3, 6, 3, 'Te adecuaste rapido al cambio de equipo', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (1, 5, 3, 1, 'Holvidar de schedulear la mitin', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (3, 4, 6, 1, 'No agregaste a nadie a tu equipo en esta app', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [puntuacion]) VALUES (4, 6, 3, 2, 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (4, 5, 3, 1, 'Este ves si scheduleaste la mitink', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (5, 3, 4, 4, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (5, 5, 4, 4, 'No me avisaste del deploy del martes', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (5, 6, 5, 1, 'No se dirige a mi apropiadamente', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (6, 3, 6, 1, 'Seguis sin agregar a tu equipo a la app', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (7, 2, 7, 5, 'Fortalecimos mucho nuestros lazos de amistad despues de que casi moris electrocutado', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (8, 7, 8, 6, 'Siempre sos el primero en llegar', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (8, 9, 10, 5, 'No sonreis nunca', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (8, 10, 9, 5, 'Tu vieja', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (8, 10, 9, 5, 'Tu vieja', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (8, 10, 9, 5, 'Tu vieja', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (8, 10, 9, 5, 'Tu vieja', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (9, 7, 2, 5, 'Gracias', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (9, 7, 2, 6, 'Levantate mas temprano', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (10, 7, 8, 7, 'Muy buena idea para resolver el login', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (10, 2, 8, 7, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (10, 9, 8, 7, 'CRACK!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (10, 10, 8, 7, 'Tu vieja', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (10, 10, 8, 7, 'Nah mentira, muy buena idea. Idolo!', 1)
GO

INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol]) VALUES (2, 2, 1)
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol]) VALUES (1, 3, 1)
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol]) VALUES (1, 4, 0)
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol]) VALUES (1, 5, 0)
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol]) VALUES (1, 6, 0)
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol]) VALUES (2, 7, 0)
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol]) VALUES (2, 8, 0)
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol]) VALUES (2, 9, 0)
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol]) VALUES (2, 10, 0)
GO

INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 1)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 2)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 3)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (2, 5)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (2, 6)
GO
