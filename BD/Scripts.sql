USE [JAlmarazDOCSOLUTIONS]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioAdd]    Script Date: 8/12/2022 6:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioAdd]
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50) ,
@Edad INT,
@FechaNacimiento DATE
AS
INSERT INTO [dbo].[Usuario]
           ([Nombre]
           ,[ApellidoPaterno]
           ,[ApellidoMaterno]
           ,[Edad]
           ,[FechaNacimiento])
     VALUES
           (@Nombre
           ,@ApellidoPaterno
           ,@ApellidoMaterno
           ,@Edad
           ,@FechaNacimiento)
GO
/****** Object:  StoredProcedure [dbo].[UsuarioDelete]    Script Date: 8/12/2022 6:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[UsuarioDelete]
 @IdUsuario INT
 AS
 DELETE FROM [dbo].[Usuario]
      WHERE [IdUsuario] = @IdUsuario
GO
/****** Object:  StoredProcedure [dbo].[UsuarioGetAll]    Script Date: 8/12/2022 6:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioGetAll]
@Nombre VARCHAR(50)
AS
--IF(@Nombre = '')
BEGIN 
SELECT [IdUsuario]
      ,[Nombre]
      ,[ApellidoPaterno]
      ,[ApellidoMaterno]
      ,[Edad]
      ,[FechaNacimiento]
  FROM [Usuario]
  WHERE Usuario.Nombre LIKE '%' + @Nombre + '%'
 END
GO
/****** Object:  StoredProcedure [dbo].[UsuarioGetById]    Script Date: 8/12/2022 6:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioGetById]
@IdUsuario INT
AS
SELECT [IdUsuario]
      ,[Nombre]
      ,[ApellidoPaterno]
      ,[ApellidoMaterno]
      ,[Edad]
      ,[FechaNacimiento]
  FROM [dbo].[Usuario]
  WHERE [IdUsuario] = @IdUsuario
GO
/****** Object:  StoredProcedure [dbo].[UsuarioUpdate]    Script Date: 8/12/2022 6:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioUpdate]
@IdUsuario INT,
@Nombre VARCHAR(50),
@ApellidoPaterno VARCHAR(50),
@ApellidoMaterno VARCHAR(50) ,
@Edad INT,
@FechaNacimiento DATE
AS
UPDATE [dbo].[Usuario]
   SET [Nombre] = @Nombre
      ,[ApellidoPaterno] = @ApellidoPaterno
      ,[ApellidoMaterno] = @ApellidoMaterno
      ,[Edad] = @Edad
      ,[FechaNacimiento] = @FechaNacimiento
 WHERE [IdUsuario] = @IdUsuario
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/12/2022 6:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[Edad] [int] NULL,
	[FechaNacimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Edad], [FechaNacimiento]) VALUES (1, N'Jarim', N'Cañas', N'Almaraz', 21, CAST(0xDA3E0B00 AS Date))
INSERT [dbo].[Usuario] ([IdUsuario], [Nombre], [ApellidoPaterno], [ApellidoMaterno], [Edad], [FechaNacimiento]) VALUES (7, N'Maria', N'Godinez', N'Salas', 18, CAST(0x00000000 AS Date))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
