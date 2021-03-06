USE [master]
GO
/****** Object:  Database [AplicacionHoteleraWeb]    Script Date: 09/11/2021 11:53:27 ******/
CREATE DATABASE [AplicacionHoteleraWeb]
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
ALTER DATABASE [AplicacionHoteleraWeb] SET AUTO_CLOSE ON 
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
ALTER DATABASE [AplicacionHoteleraWeb] SET  ENABLE_BROKER 
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
ALTER DATABASE [AplicacionHoteleraWeb] SET RECOVERY SIMPLE 
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
ALTER DATABASE [AplicacionHoteleraWeb] SET QUERY_STORE = OFF
GO
USE [AplicacionHoteleraWeb]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 09/11/2021 11:53:27 ******/
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
/****** Object:  Table [dbo].[Bitacora]    Script Date: 09/11/2021 11:53:27 ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 09/11/2021 11:53:27 ******/
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
/****** Object:  Table [dbo].[Hospedaje]    Script Date: 09/11/2021 11:53:27 ******/
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
/****** Object:  Table [dbo].[Hotel]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Id] [int] NOT NULL,
	[Localidad] [varchar](64) NOT NULL,
	[Calificación] [int] NULL,
	[Correo] [varchar](64) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Imagen] [varchar](max) NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservacion]    Script Date: 09/11/2021 11:53:27 ******/
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
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
	[Usuario] [varchar](64) NOT NULL,
	[Contraseña] [varchar](64) NOT NULL,
	[IdTipoUsuario] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_Usuario] FOREIGN KEY([Id])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_Usuario]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Usuario]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Usuario] FOREIGN KEY([Id])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Usuario]
GO
ALTER TABLE [dbo].[Hospedaje]  WITH CHECK ADD  CONSTRAINT [FK_Hospedaje_Hotel] FOREIGN KEY([IdHotel])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[Hospedaje] CHECK CONSTRAINT [FK_Hospedaje_Hotel]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Usuario] FOREIGN KEY([Id])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Usuario]
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
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarAdministrador]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarAdministrador]
	@inNombre VARCHAR(64),
	@inUsuario VARCHAR(64),
	@inContraseña VARCHAR(64)
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;

	BEGIN TRY
		IF EXISTS (SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario)
		BEGIN
			
			SET @idUsuario =(SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario);

			EXEC sp_ActualizarUsuario @inNombre, @inUsuario, @inContraseña, @idUsuario;

			EXEC sp_InsertarBitacora 'Actualizacion de administrador ', @idUsuario

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
/****** Object:  StoredProcedure [dbo].[sp_ActualizarCliente]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarCliente]
	@inNombre VARCHAR(64),
	@inUsuario VARCHAR(64),
	@inContraseña VARCHAR(64),
	@inCedula INT,
	@inFechaNacimiento DATE,
	@inCorreo VARCHAR(64)
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;

	BEGIN TRY
		IF EXISTS (SELECT Id FROM dbo.Cliente WHERE Cedula = @inCedula) OR
		   EXISTS (SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario)
		BEGIN

			SET @idUsuario =(SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario);
			
			EXEC sp_ActualizarUsuario @inNombre, @inUsuario, @inContraseña, @idUsuario;
			
			UPDATE dbo.Cliente 
			SET 
				Cedula = @inCedula,
				FechaNacimiento = @inFechaNacimiento,
				Correo = @inCorreo
			WHERE Id = @idUsuario

			EXEC sp_InsertarBitacora 'Actualizacion de Cliente ', @idUsuario

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
/****** Object:  StoredProcedure [dbo].[sp_ActualizarHotel]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarHotel]
	@inUsuarioActual VARCHAR(64),
	@inNombre VARCHAR(64),
	@inUsuario VARCHAR(64),
	@inContraseña VARCHAR(64),
	@inLocalidad VARCHAR(64),
	@inCorreo VARCHAR(64),
	@inTelefono INT, 
	@inImage VARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;



	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;

	BEGIN TRY
		IF EXISTS (SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuarioActual)
		BEGIN
			SET @idUsuario =(SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuarioActual);

			IF EXISTS(SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario) AND (@inUsuarioActual != @inUsuario)
			BEGIN
				SET @OutResultCode = 1;
			END
			ELSE
			BEGIN
				EXEC sp_ActualizarUsuario @inNombre, @inUsuario, @inContraseña, @idUsuario;

				UPDATE dbo.Hotel
				SET
					Localidad = @inLocalidad,
					Correo = @inCorreo,
					Telefono = @inTelefono,
					Imagen = @inImage
				WHERE Id = @idUsuario


				EXEC sp_InsertarBitacora 'Actualizacion de Hotel ', @idUsuario
			END
		END
		ELSE
		BEGIN
			SET @OutResultCode = 1;
		END


	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode AS Codigo;


	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarUsuario]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarUsuario]
	@inNombre VARCHAR(64),
	@inUsuario VARCHAR(64),
	@inContraseña VARCHAR(64),
	@inIdUsuario INT
AS
BEGIN
	DECLARE @OutResultCode INT = 0;

	BEGIN TRY
		-- Actualizacion de un Usuario
		UPDATE dbo.Usuario 
		SET 
			Nombre = @inNombre,
			Usuario = @inUsuario,
			Contraseña = @inContraseña
		WHERE Id = @inIdUsuario

	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultaBitacora]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultaBitacora]
AS
BEGIN
	DECLARE @OutResultCode INT = 0;


	BEGIN TRY

		SELECT 
			Id,
			Fecha,
			Detalle,
			IdUsuario
		FROM Bitacora



	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultaClienteEspecifico]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultaClienteEspecifico]
    @inUsuario VARCHAR(64)
AS
BEGIN
    DECLARE @OutResultCode INT = 0;


    BEGIN TRY

        SELECT 
            C.Id,
            U.Nombre as Nombre,
            Cedula,
            FechaNacimiento,
            Correo,
            Usuario,
            Contraseña
        FROM Cliente as C
        INNER JOIN Usuario as U
        ON C.Id = U.Id
        INNER JOIN TipoUsuario as TU
        ON U.IdTipoUsuario = TU.Id
        WHERE U.Usuario = @inUsuario



    END TRY
    BEGIN CATCH
        SET @OutResultCode = 505;
    END CATCH

    SELECT @OutResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultaClientes]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultaClientes]
AS
BEGIN
	DECLARE @OutResultCode INT = 0;


	BEGIN TRY

		SELECT 
			C.Id,
			U.Nombre,
			Cedula,
			FechaNacimiento,
			Correo,
			Usuario,
			Contraseña
		FROM Cliente as C
		INNER JOIN Usuario as U
		ON C.Id = U.Id
		INNER JOIN TipoUsuario as TU
		ON U.IdTipoUsuario = TU.Id



	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultaHospedajeHotel]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultaHospedajeHotel]
	@inIdHotel INT
AS
BEGIN
	DECLARE @OutResultCode INT = 0;


	BEGIN TRY

		SELECT
			U.Nombre as NombreHotel,
			H2.Id,
			H2.Nombre,
			Localidad,
			Calificación,
			Correo,
			Telefono,
			Descripcion,
			Precio,
			Espacios
		FROM Hotel as H
		INNER JOIN Hospedaje as H2 
		ON H.Id = H2.IdHotel
		INNER JOIN Usuario as U
		ON H.Id = U.Id
		WHERE H.Id = @inIdHotel



	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultaHotel]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultaHotel]
AS
BEGIN
	DECLARE @OutResultCode INT = 0;


	BEGIN TRY

		SELECT
			H.Id,
			Nombre,
			Localidad,
			Correo,
			Telefono,
			Usuario,
			Contraseña,
			Imagen
		FROM Hotel as H
		INNER JOIN Usuario as U
		ON H.Id = U.Id



	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultaHotelEspecifica]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultaHotelEspecifica]
	@inUsuarioHotel VARCHAR(64)
AS
BEGIN
	DECLARE @OutResultCode INT = 0;


	BEGIN TRY

		SELECT 
			Nombre,
			Localidad,
			Calificación,
			Correo,
			Telefono,
			Imagen,
			Usuario,
			Contraseña
		FROM Hotel as H
		INNER JOIN Usuario as U
		ON H.Id = U.Id
		WHERE U.Usuario = @inUsuarioHotel


	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarHospedaje]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultarHospedaje]
	@inIdHospedaje INT

AS
BEGIN
	DECLARE @OutResultCode INT = 0;

	BEGIN TRY
		SELECT	
			Nombre,
			Descripcion,
			Precio,
			Espacios
		FROM Hospedaje
		WHERE Id = @inIdHospedaje



	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarHospedajeAReservar]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultarHospedajeAReservar]
	@inIdHospedaje INT

AS
BEGIN
	DECLARE @OutResultCode INT = 0;

	BEGIN TRY
		SELECT
			U.Nombre as NombreHotel,
			H2.Id,
			H2.Nombre,
			Localidad,
			Calificación,
			Correo,
			Telefono,
			Descripcion,
			Precio,
			Espacios
		FROM Hotel as H
		INNER JOIN Hospedaje as H2 
		ON H.Id = H2.IdHotel
		INNER JOIN Usuario as U
		ON H.Id = U.Id
		WHERE H2.Id = @inIdHospedaje



	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarReservacion]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ConsultarReservacion]
AS
BEGIN
	DECLARE @OutResultCode INT = 0;


	BEGIN TRY
		
		SELECT 
			Res.Id AS IdReservacion,

			Cli.Cedula AS CedulaCliente,

			Res.FechaInicio AS FechaInicio,
			Res.FechaFin AS FechaFinal,
			Res.PrecioTotal AS PrecioTotal,

			Usu.Nombre AS NombreHotel,
			Hos.Nombre AS NombreHospedaje,
			Hos.Precio AS PrecioHospedaje

		FROM dbo.Reservacion AS Res
		INNER JOIN dbo.Cliente AS Cli
		ON Res.IdCliente = Cli.Id
		INNER JOIN dbo.Hospedaje AS Hos
		ON Hos.Id = Res.IdHospedaje
		INNER JOIN dbo.Hotel AS Hot
		ON Hot.Id = Hos.IdHotel
		INNER JOIN dbo.Usuario AS Usu
		ON Usu.Id = Hot.Id

	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarReservacionXCliente]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_ConsultarReservacionXCliente]
		@inUsuario VARCHAR(64)
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @inIdCliente INT;

	SET @inIdCliente = (SELECT Id FROM Usuario WHERE Usuario = @inUsuario) 


	BEGIN TRY
		
		SELECT 
			Res.Id AS IdReservacion,

			Cli.Cedula AS CedulaCliente,

			Res.FechaInicio AS FechaInicio,
			Res.FechaFin AS FechaFinal,
			Res.PrecioTotal AS PrecioTotal,

			Usu.Nombre AS NombreHotel,
			Hos.Nombre AS NombreHospedaje,
			Hos.Precio AS PrecioHospedaje

		FROM dbo.Reservacion AS Res
		INNER JOIN dbo.Cliente AS Cli
		ON Res.IdCliente = Cli.Id
		INNER JOIN dbo.Hospedaje AS Hos
		ON Hos.Id = Res.IdHospedaje
		INNER JOIN dbo.Hotel AS Hot
		ON Hot.Id = Hos.IdHotel
		INNER JOIN dbo.Usuario AS Usu
		ON Usu.Id = Hot.Id
		WHERE Cli.Id = @inIdCliente

	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarReservacionXHotel]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ConsultarReservacionXHotel]
	@inIdHotel INT
AS
BEGIN
	DECLARE @OutResultCode INT = 0;


	BEGIN TRY
		
		SELECT 
			Res.Id AS IdReservacion,

			Cli.Cedula AS CedulaCliente,

			Res.FechaInicio AS FechaInicio,
			Res.FechaFin AS FechaFinal,
			Res.PrecioTotal AS PrecioTotal,

			Usu.Nombre AS NombreHotel,
			Hos.Nombre AS NombreHospedaje,
			Hos.Precio AS PrecioHospedaje

		FROM dbo.Reservacion AS Res
		INNER JOIN dbo.Cliente AS Cli
		ON Res.IdCliente = Cli.Id
		INNER JOIN dbo.Hospedaje AS Hos
		ON Hos.Id = Res.IdHospedaje
		INNER JOIN dbo.Hotel AS Hot
		ON Hot.Id = Hos.IdHotel
		INNER JOIN dbo.Usuario AS Usu
		ON Usu.Id = Hot.Id
		WHERE Hot.Id = @inIdHotel

	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearHospedaje]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearHospedaje]
	@inUsuario VARCHAR(64),
	@inNombre VARCHAR(64),
	@inDescripcion VARCHAR(MAX),
	@inEspacios INT,
	@inPrecio MONEY
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;

	BEGIN TRY
		IF EXISTS (SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario)
		BEGIN
			SET @idUsuario =(SELECT (Id) FROM dbo.Usuario WHERE Usuario = @inUsuario);

			INSERT INTO dbo.Hospedaje(
				IdHotel,
				Nombre,
				Descripcion,
				Espacios,
				Precio
			)VALUES(
				@idUsuario,
				@inNombre,
				@inDescripcion,
				@inEspacios,
				@inPrecio
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

	SELECT @OutResultCode AS Codigo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearReserva]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CrearReserva]
	@inIdHospedaje INT,
	@inUsuario VARCHAR(64),
	@inFechaInicio DATE,
	@inFechaFin DATE
	AS
	BEGIN
		DECLARE @Reservaciones TABLE(
			Id INT
		)

		DECLARE @OutResultCode INT = 0;
		DECLARE @inIdCliente INT;
		DECLARE @espaciosHospedaje INT;
		DECLARE @precio MONEY;

		SET @inIdCliente = (SELECT Id FROM Usuario WHERE Usuario = @inUsuario) 

		BEGIN TRY
			IF EXISTS (SELECT Id FROM dbo.Cliente WHERE Id = @inIdCliente) AND
			   EXISTS (SELECT Id FROM dbo.Hospedaje WHERE Id = @inIdHospedaje)
			BEGIN
				SELECT 
					@espaciosHospedaje = Espacios,
					@precio = Precio
				FROM dbo.Hospedaje 
				WHERE Id = @inIdHospedaje

				INSERT INTO @Reservaciones 
					SELECT
						Id
					FROM dbo.Reservacion 
					WHERE Id = @inIdHospedaje AND
					      (@inFechaInicio NOT BETWEEN FechaInicio AND FechaFin) AND
					      (@inFechaFIN NOT BETWEEN FechaInicio AND FechaFin) AND
						  (FechaInicio NOT BETWEEN @inFechaInicio AND @inFechaFin) AND
					      (FechaFin NOT BETWEEN @inFechaInicio AND @inFechaFin)

				IF @espaciosHospedaje > (SELECT COUNT(*) FROM @Reservaciones)
				BEGIN
					INSERT INTO dbo.Reservacion(
						IdHospedaje,
						IdCliente,
						FechaInicio,
						FechaFin,
						PrecioTotal
					)VALUES(
						@inIdHospedaje,
						@inIdCliente,
						@inFechaInicio,
						@inFechaFin,
						@precio * (SELECT DATEDIFF(DAY, @inFechaInicio, @inFechaFin))
					)
				END
				ELSE
				BEGIN
					SET @OutResultCode = 1;
				END

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
/****** Object:  StoredProcedure [dbo].[sp_EliminarAdministrador]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarAdministrador]
	@inUsuario VARCHAR(64),
	@inContraseña VARCHAR(64)
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;

	BEGIN TRY
		IF EXISTS (SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario AND Contraseña = @inContraseña)
		BEGIN

			SET @idUsuario =(SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario);
			
			EXEC sp_EliminarUsuario @idUsuario
			
			DELETE FROM Administrador WHERE Id = @idUsuario

			EXEC sp_InsertarBitacora 'Eliminacion de Administrador ', @idUsuario

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
/****** Object:  StoredProcedure [dbo].[sp_EliminarCliente]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarCliente]
	@inIdUsuario INT
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;

	BEGIN TRY
		IF EXISTS (SELECT Id FROM dbo.Usuario WHERE Id = @inIdUsuario)
		BEGIN

			EXEC sp_EliminarUsuario @inIdUsuario
			
			DELETE FROM Cliente WHERE Id = @inIdUsuario

			EXEC sp_InsertarBitacora 'Eliminacion de Cliente ', @idUsuario

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
/****** Object:  StoredProcedure [dbo].[sp_EliminarHospedaje]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarHospedaje]
	@inIdHospedaje INT
AS
BEGIN
	DECLARE @OutResultCode INT = 0;

	BEGIN TRY
		IF NOT EXISTS (SELECT Id FROM dbo.Usuario WHERE Usuario = @inIdHospedaje)
		BEGIN
			DELETE dbo.Hospedaje
			WHERE Id = @inIdHospedaje

		END
		ELSE
		BEGIN
			SET @OutResultCode = 1;
		END


	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode AS Codigo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarHotel]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarHotel]
	@inUsuario VARCHAR(64)
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;
	DECLARE @idHospedaje INT;
	DECLARE @TablaReservaciones TABLE				-- Tabla con Reservaciones pendientes
			(	
				IdReserva INT
			);
	DECLARE @Count INT

	BEGIN TRY
	--ELIMINACION DE HOTEL
		IF EXISTS (SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario)
		BEGIN

			SET @idUsuario =(SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario);
			SET @idHospedaje =(SELECT Id FROM dbo.Hospedaje WHERE IdHotel = @idUsuario);

			INSERT INTO @TablaReservaciones			-- Se cargan todas las reservaciones en dicha fecha
				SELECT Id
				FROM dbo.Reservacion AS Res
			WHERE res.IdHospedaje = @idHospedaje AND (GETDATE() BETWEEN GETDATE() AND FechaFin)

			SELECT								-- Contador para iterar sobre la tabla @@TablaReservaciones
				@Count = COUNT(*) 
			FROM @TablaReservaciones
			

			--VALIDO QUE NO HAYAN RESERVACIONES PENDIENTES
			IF (@Count > 0)
			BEGIN
				
				WHILE @Count > 0
				BEGIN

					DELETE FROM Reservacion WHERE Id = (SELECT TOP (1) IdReserva FROM @TablaReservaciones) --elimino reservacion
					EXEC sp_InsertarBitacora 'Eliminacion de Reservacion ', @idUsuario --agregrar detalles

					DELETE TOP (1) FROM @TablaReservaciones
					SELECT @Count = COUNT(*) FROM @TablaReservaciones;


				END

			END

		EXEC sp_EliminarUsuario @idUsuario; --elimino usuario		
		DELETE FROM Hospedaje Where IdHotel = @idUsuario; --Elimino hospedaje y hotel
		DELETE FROM Hotel WHERE Id = @idUsuario;
		EXEC sp_InsertarBitacora 'Eliminacion de Hotel ', @idUsuario
			
			
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
/****** Object:  StoredProcedure [dbo].[sp_EliminarUsuario]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EliminarUsuario]

	@inIdUsuario INT
AS
BEGIN
	DECLARE @OutResultCode INT = 0;

	BEGIN TRY
		-- Actualizacion de un Usuario
		DELETE FROM Usuario WHERE Id = @inIdUsuario

	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarAdministrador]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarAdministrador]
	@inNombre VARCHAR(64),
	@inUsuario VARCHAR(64),
	@inContraseña VARCHAR(64)
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;

	BEGIN TRY
		IF NOT EXISTS (SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario)
		BEGIN
			EXEC sp_InsertarUsuario @inNombre, @inUsuario, @inContraseña, 1;

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

	SELECT @OutResultCode AS Codigo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarBitacora]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarBitacora]
	@inDetalle VARCHAR (MAX),
	@inIdUsuario INT
AS
BEGIN
	DECLARE @OutResultCode INT = 0;

	BEGIN TRY
		-- Inserción de un detalle bitacora
		INSERT INTO Bitacora
		(
			Fecha,
			Detalle,
			IdUsuario
		)VALUES
		(
				GETDATE(),
				@inDetalle,
				@inIdUsuario
		)
		
	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarCliente]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarCliente]
	@inNombre VARCHAR(64),
	@inUsuario VARCHAR(64),
	@inContraseña VARCHAR(64),
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
			EXEC sp_InsertarUsuario @inNombre, @inUsuario, @inContraseña, 3;

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

	SELECT @OutResultCode AS Codigo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarHotel]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarHotel]
	@inNombre VARCHAR(64),
	@inUsuario VARCHAR(64),
	@inContraseña VARCHAR(64),
	@inLocalidad VARCHAR(64),
	@inCorreo VARCHAR(64),
	@inTelefono INT,
	@url VARCHAR(MAX)
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;

	BEGIN TRY
		IF NOT EXISTS (SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario)
		BEGIN
			EXEC sp_InsertarUsuario @inNombre, @inUsuario, @inContraseña, 2;

			SET @idUsuario =(SELECT MAX(Id) FROM dbo.Usuario);

			INSERT INTO dbo.Hotel(
				Id,
				Localidad,
				Calificación,
				Correo,
				Telefono,
				Imagen
			)VALUES(
				@idUsuario,
				@inLocalidad,
				5,
				@inCorreo,
				@inTelefono,
				@url
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

	SELECT @OutResultCode AS Codigo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarUsuario]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarUsuario]
	@inNombre VARCHAR(64),
	@inUsuario VARCHAR(64),
	@inContraseña VARCHAR(64),
	@inIdTipoUsuario INT
AS
BEGIN
	DECLARE @OutResultCode INT = 0;

	BEGIN TRY
		-- Inserción de un Usuario
		INSERT INTO dbo.Usuario(
			Nombre,
			Usuario,
			Contraseña,
			IdTipoUsuario
		)VALUES(
			@inNombre,
			@inUsuario,
			@inContraseña,
			@inIdTipoUsuario
		)
	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarHospedaje]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarHospedaje]
	@inIdHospedaje INT,
	@inNombre VARCHAR(64),
	@inDescripcion VARCHAR(MAX),
	@inEspacios INT,
	@inPrecio VARCHAR(64)
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;

	BEGIN TRY
		IF EXISTS (SELECT Id FROM dbo.Hospedaje WHERE Id = @inIdHospedaje)
		BEGIN
			UPDATE dbo.Hospedaje
			SET
				Nombre = @inNombre,
				Descripcion = @inDescripcion,
				Espacios = @inEspacios,
				Precio = @inPrecio
			WHERE Id = @inIdHospedaje

		END
		ELSE
		BEGIN
			SET @OutResultCode = 1;
		END


	END TRY
	BEGIN CATCH
		SET @OutResultCode = 505;
	END CATCH

	SELECT @OutResultCode AS Codigo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarUsuario]    Script Date: 09/11/2021 11:53:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ValidarUsuario]
	@inUsuario VARCHAR(64),
	@inContrasena VARCHAR (64)
AS
BEGIN
	DECLARE @OutResultCode INT = 0;
	DECLARE @idUsuario INT;

	BEGIN TRY
		IF EXISTS (SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario AND Contraseña = @inContrasena)
		BEGIN 
			SET @idUsuario =(SELECT Id FROM dbo.Usuario WHERE Usuario = @inUsuario);

			IF EXISTS (SELECT Id FROM dbo.Cliente WHERE Id = @idUsuario)
			BEGIN
				SET @OutResultCode = 3;
			END 
			ELSE IF EXISTS (SELECT Id FROM dbo.Hotel WHERE Id = @idUsuario)
			BEGIN
				SET @OutResultCode = 2;
			END
			ELSE
			BEGIN
				SET @OutResultCode = 1;
			END

		END
		ELSE
		BEGIN
			SET @OutResultCode = 0;
		END


	END TRY

	BEGIN CATCH
		SET @OutResultCode = 0;
	END CATCH

	SELECT @OutResultCode AS TipoUsuario;
END
GO
USE [master]
GO
ALTER DATABASE [AplicacionHoteleraWeb] SET  READ_WRITE 
GO
