USE [master]
GO
/****** Object:  Database [AplicacionHoteleraWeb]    Script Date: 23/10/2021 8:48:35 ******/
CREATE DATABASE [AplicacionHoteleraWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AplicacionHoteleraWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AplicacionHoteleraWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AplicacionHoteleraWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AplicacionHoteleraWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AplicacionHoteleraWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET  MULTI_USER 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AplicacionHoteleraWeb', N'ON'
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET QUERY_STORE = OFF
GO
USE [AplicacionHoteleraWeb]
GO
/****** Object:  User [RolbinMendez]    Script Date: 23/10/2021 8:48:36 ******/
CREATE USER [RolbinMendez] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [R]    Script Date: 23/10/2021 8:48:36 ******/
CREATE USER [R] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 23/10/2021 8:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 23/10/2021 8:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Detalle] [varchar](max) NOT NULL,
	[IdUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 23/10/2021 8:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id] [int] NOT NULL,
	[Cedula] [int] NOT NULL,
	[FechaNacimiento] [date] NULL,
	[Correo] [varchar](64) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospedaje]    Script Date: 23/10/2021 8:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospedaje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdHotel] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[Espacios] [int] NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_Hospedaje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 23/10/2021 8:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Id] [int] NOT NULL,
	[Localidad] [varchar](64) NOT NULL,
	[Calificación] [decimal](2, 2) NOT NULL,
	[Correo] [varchar](64) NOT NULL,
	[Telefono] [int] NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservacion]    Script Date: 23/10/2021 8:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdHospedaje] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFin] [date] NOT NULL,
	[PrecioTotal] [money] NOT NULL,
 CONSTRAINT [PK_Reservacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/10/2021 8:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Usuario] [varchar](64) NOT NULL,
	[Contraseña] [varchar](64) NOT NULL,
	[TipoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Usuario]
GO
ALTER TABLE [dbo].[Hospedaje]  WITH CHECK ADD  CONSTRAINT [FK_Hospedaje_Hotel] FOREIGN KEY([IdHotel])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[Hospedaje] CHECK CONSTRAINT [FK_Hospedaje_Hotel]
GO
ALTER TABLE [dbo].[Reservacion]  WITH CHECK ADD  CONSTRAINT [FK_Reservacion_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Reservacion] CHECK CONSTRAINT [FK_Reservacion_Cliente]
GO
ALTER TABLE [dbo].[Reservacion]  WITH CHECK ADD  CONSTRAINT [FK_Reservacion_Hospedaje] FOREIGN KEY([IdHospedaje])
REFERENCES [dbo].[Hospedaje] ([Id])
GO
ALTER TABLE [dbo].[Reservacion] CHECK CONSTRAINT [FK_Reservacion_Hospedaje]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Administrador] FOREIGN KEY([Id])
REFERENCES [dbo].[Administrador] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Administrador]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Cliente] FOREIGN KEY([Id])
REFERENCES [dbo].[Cliente] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Cliente]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Hotel] FOREIGN KEY([Id])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Hotel]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarAdministrador]    Script Date: 23/10/2021 8:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarAdministrador]
	@inNombre VARCHAR(64),
	@inUsuario VARCHAR(64),
	@inContraseña VARCHAR(64),
	@inTipoUsuario INT
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;

	BEGIN TRY
		IF NOT EXISTS (SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario)
		BEGIN
			EXEC sp_InsertarUsuario @inNombre, @inUsuario, @inContraseña, @inTipoUsuario;

			SET @idUsuario =(SELECT MAX(Id) FROM dbo.Usuario);

			INSERT INTO dbo.Administrador(
				Id
			)VALUES(
				@idUsuario
			)
		END
		ELSE
		BEGIN
			SET @OutResultCode = 1;
		END


	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCliente]    Script Date: 23/10/2021 8:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarCliente]
	@inNombre VARCHAR(64),
	@inUsuario VARCHAR(64),
	@inContraseña VARCHAR(64),
	@inTipoUsuario INT,
	@inCedula INT,
	@inFechaNacimiento DATE,
	@inCorreo VARCHAR(64)
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;

	BEGIN TRY
		IF NOT EXISTS (SELECT Id FROM dbo.Cliente WHERE Cedula = @inCedula) OR
		   NOT EXISTS (SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario)
		BEGIN
			EXEC sp_InsertarUsuario @inNombre, @inUsuario, @inContraseña, @inTipoUsuario;

			SET @idUsuario =(SELECT MAX(Id) FROM dbo.Usuario);

			INSERT INTO dbo.Cliente(
				Id,
				Cedula,
				FechaNacimiento,
				Correo
			)VALUES(
				@idUsuario,
				@inCedula,
				@inFechaNacimiento,
				@inCorreo
			)
		END
		ELSE
		BEGIN
			SET @OutResultCode = 1
		END


	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarHotel]    Script Date: 23/10/2021 8:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarHotel]
	@inNombre VARCHAR(64),
	@inUsuario VARCHAR(64),
	@inContraseña VARCHAR(64),
	@inTipoUsuario INT,
	@inLocalidad VARCHAR(64),
	@inCorreo VARCHAR(64),
	@inTelefono INT
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;

	BEGIN TRY
		IF NOT EXISTS (SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario)
		BEGIN
			EXEC sp_InsertarUsuario @inNombre, @inUsuario, @inContraseña, @inTipoUsuario;

			SET @idUsuario =(SELECT MAX(Id) FROM dbo.Usuario);

			INSERT INTO dbo.Hotel(
				Id,
				Localidad,
				Calificación,
				Correo,
				Telefono
			)VALUES(
				@idUsuario,
				@inLocalidad,
				5,
				@inCorreo,
				@inTelefono
			)
		END
		ELSE
		BEGIN
			SET @OutResultCode = 1;
		END


	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarUsuario]    Script Date: 23/10/2021 8:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarUsuario]
	@inNombre VARCHAR(64),
	@inUsuario VARCHAR(64),
	@inContraseña VARCHAR(64),
	@inTipoUsuario INT
AS
BEGIN
	DECLARE @OutResultCode INT = 0;

	BEGIN TRY
		-- Inserción de un Usuario
		INSERT INTO dbo.Usuario(
			Nombre,
			Usuario,
			Contraseña,
			TipoUsuario
		)VALUES(
			@inNombre,
			@inUsuario,
			@inContraseña,
			@inTipoUsuario
		)
	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END
GO
USE [master]
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET  READ_WRITE 
GO
