USE [master]
GO
/****** Object:  Database [JAlmarazDOCSOLUTIONS]    Script Date: 8/12/2022 6:48:10 PM ******/
CREATE DATABASE [JAlmarazDOCSOLUTIONS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JAlmarazDOCSOLUTIONS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JAlmarazDOCSOLUTIONS.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JAlmarazDOCSOLUTIONS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JAlmarazDOCSOLUTIONS_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JAlmarazDOCSOLUTIONS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET ARITHABORT OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET RECOVERY FULL 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET  MULTI_USER 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JAlmarazDOCSOLUTIONS', N'ON'
GO
USE [JAlmarazDOCSOLUTIONS]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioAdd]    Script Date: 8/12/2022 6:48:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioDelete]    Script Date: 8/12/2022 6:48:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioGetAll]    Script Date: 8/12/2022 6:48:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioGetById]    Script Date: 8/12/2022 6:48:10 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioUpdate]    Script Date: 8/12/2022 6:48:10 PM ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 8/12/2022 6:48:10 PM ******/
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
USE [master]
GO
ALTER DATABASE [JAlmarazDOCSOLUTIONS] SET  READ_WRITE 
GO
