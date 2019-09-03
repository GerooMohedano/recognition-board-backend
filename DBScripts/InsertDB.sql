USE [OnBoardDataBase]
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('adminGeneral', '123', 'ag@mail.com', 1)

INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Luciana', '123', 'lucianasoria@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Gero', '123', 'gero_mohe2@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Magui', '123', 'magui_kpo@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Tony', '123', 'iaforns@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Diego', '123', 'ds.campero@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Pamela', '123', 'pameruiz@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Mauricio', '123', 'mauperez@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Marcio', '123', 'marciobautista@sovos.com', 0)
INSERT [dbo].[Usuarios] ([nombre], [contrasenia], [mail], [adminGeneral]) VALUES ('Natalia', '123', 'nataliaburgio@sovos.com', 0)
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
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('CSharks', 1)--4
--equipos scania
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Programadores', 2)--5
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Analistas', 2)
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Mecatrónica', 2)
INSERT [dbo].[Equipos] ([nombre], [idEmpresa]) VALUES ('Managers', 2)
GO

INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (1, 2, 1)--elephant
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (1, 3, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (1, 4, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (1, 7, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (2, 3, 1)--octopus
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (2, 5, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (2, 6, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (2, 8, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (3, 7, 1)--barracudas
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (3, 9, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (3, 10, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (4, 2, 1)--chsarks
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (4, 11, 0)
----------
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (5, 12, 1)--1
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (5, 13, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (5, 14, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (6, 15, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (6, 16, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (7, 17, 1)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (7, 18, 0)
INSERT [dbo].[UsuariosEquipos] ([idEquipo], [idUsuario], [rol]) VALUES (8, 19, 1)
GO

INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 2, 1, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 3, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 4, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 5, 0, 'inactivo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 6, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 7, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 8, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 9, 0, 'inactivo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 10, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (1, 11, 0, 'activo')

INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 12, 1, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 13, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 14, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 15, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 16, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 18, 0, 'activo')
INSERT [dbo].[UsuariosEmpresas] ([idEmpresa], [idUsuario], [rol], [estado]) VALUES (2, 19, 0, 'activo')
GO

INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190702', 1, CAST(N'2019-07-15' AS Date), CAST(N'2019-07-31' AS Date))--1
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190801', 1, CAST(N'2019-08-01' AS Date), CAST(N'2019-08-15' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190802', 1, CAST(N'2019-08-16' AS Date), CAST(N'2019-08-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190901', 1, CAST(N'2019-09-01' AS Date), CAST(N'2019-09-15' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190502', 2, CAST(N'2019-05-16' AS Date), CAST(N'2019-05-31' AS Date))--5
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190601', 2, CAST(N'2019-06-01' AS Date), CAST(N'2019-06-15' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190602', 2, CAST(N'2019-06-16' AS Date), CAST(N'2019-06-30' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190701', 2, CAST(N'2019-07-01' AS Date), CAST(N'2019-07-15' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190702', 2, CAST(N'2019-07-16' AS Date), CAST(N'2019-07-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190801', 2, CAST(N'2019-08-01' AS Date), CAST(N'2019-08-15' AS Date))--10
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190802', 2, CAST(N'2019-08-16' AS Date), CAST(N'2019-08-31' AS Date))--11
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190901', 2, CAST(N'2019-09-01' AS Date), CAST(N'2019-09-15' AS Date))--11
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190801', 3, CAST(N'2019-08-01' AS Date), CAST(N'2019-08-15' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190802', 3, CAST(N'2019-08-16' AS Date), CAST(N'2019-08-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190801', 4, CAST(N'2019-08-01' AS Date), CAST(N'2019-08-15' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('Sprint 190802', 4, CAST(N'2019-08-16' AS Date), CAST(N'2019-08-31' AS Date))--15
---
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('mayo 19', 5, CAST(N'2019-05-01' AS Date), CAST(N'2019-05-31' AS Date))--16
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('mayo 19', 6, CAST(N'2019-05-01' AS Date), CAST(N'2019-05-31' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('junio 19', 7, CAST(N'2019-06-01' AS Date), CAST(N'2019-06-30' AS Date))
INSERT [dbo].[Pizarras] ([titulo], [idEquipo], [fechaInicio], [fechaFin]) VALUES ('junio 19', 8, CAST(N'2019-06-01' AS Date), CAST(N'2019-06-30' AS Date))--19
GO

INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Proffessional')--1
INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Collaborative')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Adaptable')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Accountable')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Proactive')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Punctual')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Be Friendly')--7
INSERT [dbo].[Valores] ([nombre]) VALUES ('Puntual')--8
INSERT [dbo].[Valores] ([nombre]) VALUES ('Creativo')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Divertido')
INSERT [dbo].[Valores] ([nombre]) VALUES ('Educado')--11
INSERT [dbo].[Valores] ([nombre]) VALUES ('Eficiente')--12
INSERT [dbo].[Valores] ([nombre]) VALUES ('Ordenado')--13
GO

INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 1)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 2)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 3)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 4)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (1, 5)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (2, 8)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (2, 13)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (2, 12)
INSERT [dbo].[EmpresasValores] ([idEmpresa], [idValor]) VALUES (2, 11)
GO

INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (1, 6)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (2, 7)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (5, 9)
INSERT [dbo].[EquiposValores] ([idEquipo], [idValor]) VALUES (5, 10)
GO

INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1,'Excelence', 'More than 20 points in Be Proffesional')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1,'Team Player!', 'More than 20 points in Be Collaborative')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'Ditto', 'More than 20 points in Be Adaptable')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'You can do it!', 'More than 20 points in Be Accountable')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'Solo player', 'More than 20 points in Be Proactive')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'Bronze Sovosian', 'More than 25 points in all 5 Core Values')--6
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'Silver Sovosian', 'More than 50 points in all 5 Core Values')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'Golden Sovosian', 'More than 100 points in all 5 Core Values')--8
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'International friend', 'More than 20 points in Be Collaborative from other teams')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'Wake up, Pearl!', 'Less than 0 points in all 5 Core Values')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (1, 'Social weirdo', 'More than 30 points in Be Proffesional, but less than -5 in Be Collaborative')--11
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (2, 'Reloj Atomico', 'Obtuviste mas de 50 puntos en Puntual')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (2, 'Excelente trabajador', 'Obtuviste mas de 30 puntos en Eficiente')
INSERT [dbo].[Logros] ([idEmpresa], [nombre], [descripcion]) VALUES (2, 'Increiblemente organizado', 'Obtuviste mas de 30 puntos en Ordenado')--14
GO

INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (1, 20)--1
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (2, 20)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (3, 20)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (4, 20)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (5, 20)--5
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (1, 25)--6
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (2, 25)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (3, 25)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (4, 25)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (5, 25)--10
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (1, 50)--11
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (2, 50)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (3, 50)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (4, 50)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (5, 50)--15
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (1, 100)--16
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (2, 100)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (3, 100)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (4, 100)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (5, 100)--20
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [modificador]) VALUES (1, 0, 0)--21
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [modificador]) VALUES (2, 0, 0)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [modificador]) VALUES (3, 0, 0)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [modificador]) VALUES (4, 0, 0)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [modificador]) VALUES (5, 0, 0)--25
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [excluyente]) VALUES (2, 20, 1)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion], [modificador]) VALUES (2, -5, 0)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (1, 30)--28

INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (8, 50)--29
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (12, 30)
INSERT [dbo].[Condiciones] ([idValor], [puntuacion]) VALUES (13, 30)--31
GO
---

INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (1, 1)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (2, 2)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (3, 3)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (4, 4)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (5, 5)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (6, 6)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (7, 6)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (8, 6)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (9, 6)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (10, 6)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (11, 7)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (12, 7)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (13, 7)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (14, 7)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (15, 7)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (16, 8)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (17, 8)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (18, 8)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (19, 8)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (20, 8)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (26, 9)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (21, 10)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (22, 10)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (23, 10)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (24, 10)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (25, 10)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (27, 11)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (28, 11)

INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (29, 12)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (30, 13)
INSERT [dbo].[LogrosCondiciones] ([idCondicion], [idLogro]) VALUES (31, 14)
GO

INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (2, 6, CAST(N'2019-07-10' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (4, 6, CAST(N'2019-07-15' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (5, 6, CAST(N'2019-08-20' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (10, 3, CAST(N'2019-08-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (1, 2, CAST(N'2019-06-02' AS Date))
INSERT [dbo].[LogrosUsuarios] ([idLogro], [idUsuario], [fecha]) VALUES (11, 2, CAST(N'2019-07-12' AS Date))
GO

INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (1, 4, 2, 1, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (1, 4, 2, 6, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (1, 4, 3, 4, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (2, 4, 2, 6, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (2, 4, 3, 2, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (2, 4, 3, 6, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (3, 7, 5, 6, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (3, 4, 8, 5, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (3, 4, 3, 4, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (4, 5, 5, 6, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (4, 4, 3, 3, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (4, 4, 2, 6, 'Por no contarme las horas extras', 1)

INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (5, 5, 3, 1, 'No entendi la explicacion que me diste', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (5, 4, 3, 2, 'Muy buenas las diapos que hiciste', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (5, 6, 3, 7, 'Aprendiste rapido', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (5, 7, 6, 2, 'Te adecuaste rapido al cambio de equipo', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (5, 3, 6, 3, 'Holvidar de schedulear la mitin', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (6, 6, 3, 3, 'No agregaste a nadie a tu equipo en esta app', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (6, 3, 6, 1, 'Este ves si scheduleaste la mitink', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (6, 4, 6, 7, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (6, 4, 8, 4, 'No me avisaste del deploy del martes', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (6, 5, 8, 5, 'No se dirige a mi apropiadamente', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (7, 6, 3, 1, 'Seguis sin agregar a tu equipo a la app', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (7, 7, 5, 5, 'Fortalecimos mucho nuestros lazos de amistad despues de que casi moris electrocutado', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (7, 8, 5, 7, 'Siempre sos el primero en llegar', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (7, 10, 8, 5, 'No sonreis nunca', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (7, 11, 8, 5, 'Gracias', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (8, 2, 3, 1, 'Levantate mas temprano', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (8, 2, 5, 3, 'Levantate mas temprano', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (8, 2, 5, 7, 'Levantate mas temprano', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (8, 2, 5, 3, 'Levantate mas temprano', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (8, 2, 5, 3, 'Levantate mas temprano', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (9, 2, 5, 2, 'Levantate mas temprano', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (9, 2, 6, 1, 'Levantate mas temprano', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (9, 2, 6, 7, 'Levantate mas temprano', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (9, 3, 8, 3, 'Muy buena idea para resolver el login', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (9, 2, 8, 1, 'Muy buena idea para resolver el login', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (10, 8, 3, 1, 'Muy buena idea para resolver el login', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (10, 8, 5, 4, 'Muy buena idea para resolver el login', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (10, 8, 6, 7, 'Muy buena idea para resolver el login', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (10, 8, 6, 4, 'Muy buena idea para resolver el login', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (10, 5, 8, 1, 'Muy buena idea para resolver el login', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (11, 5, 6, 1, 'Aprendiste rapido', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (11, 8, 6, 1, 'Muy buena idea para resolver el login', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (11, 3, 7, 7, 'Fortalecimos mucho nuestros lazos de amistad despues de que casi moris electrocutado', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (11, 2, 6, 1, 'No me avisaste del deploy del martes', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (11, 11, 6, 1, 'Muy buenas las diapos que hiciste', 1)

INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (12, 8, 7, 1, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (12, 8, 7, 2, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (12, 8, 10, 3, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (13, 8, 9, 4, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (13, 8, 10, 5, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (13, 8, 10, 1, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (14, 8, 2, 2, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (14, 8, 2, 3, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (14, 8, 11, 4, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (15, 8, 11, 5, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (15, 8, 11, 1, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (15, 8, 2, 2, 'Nos salvaste mucho esfuerzo! Bien hecho!', 1)
GO

INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (16, 12, 13, 10, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (16, 12, 14, 8, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (16, 12, 15, 9, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (16, 13, 15, 9, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (16, 14, 15, 10, 'Por no contarme las horas extras', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (16, 14, 12, 11, 'Por no contarme las horas extras', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (16, 14, 19, 10, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (17, 15, 3, 11, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (17, 15, 16, 8, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (17, 15, 12, 12, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (17, 15, 13, 13, 'Por no contarme las horas extras', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (17, 16, 14, 13, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (18, 17, 19, 13, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (18, 17, 18, 13, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (18, 18, 16, 12, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (18, 18, 12, 8, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (18, 18, 13, 11, 'Por no contarme las horas extras', 1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (19, 19, 12, 12, 'Por no contarme las horas extras', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (19, 19, 12, 13, 'Por no contarme las horas extras', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (19, 19, 13, 8, 'Por no contarme las horas extras', -1)
INSERT [dbo].[Notas] ([idPizarra], [idAutor], [idDestinatario], [idValor], [descripcion], [puntuacion]) VALUES (19, 19, 15, 8, 'Por no contarme las horas extras', -1)
GO
