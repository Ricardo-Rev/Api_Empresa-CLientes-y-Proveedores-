USE [master]
GO
/****** Object:  Database [db_empresa]    Script Date: 20/10/2024 14:42:51 ******/
CREATE DATABASE [db_empresa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_empresa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\db_empresa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_empresa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\db_empresa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_empresa] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_empresa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_empresa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_empresa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_empresa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_empresa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_empresa] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_empresa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_empresa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_empresa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_empresa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_empresa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_empresa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_empresa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_empresa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_empresa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_empresa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_empresa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_empresa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_empresa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_empresa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_empresa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_empresa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_empresa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_empresa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_empresa] SET  MULTI_USER 
GO
ALTER DATABASE [db_empresa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_empresa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_empresa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_empresa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_empresa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_empresa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_empresa] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_empresa] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_empresa]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 20/10/2024 14:42:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nit] [varchar](10) NOT NULL,
	[nombres] [varchar](60) NOT NULL,
	[apellidos] [varchar](60) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](12) NULL,
	[fecha_nacimiento] [date] NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 20/10/2024 14:42:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](10) NOT NULL,
	[nombres] [varchar](60) NOT NULL,
	[apellido] [varchar](60) NOT NULL,
	[direccion] [varchar](100) NULL,
	[telefono] [varchar](12) NULL,
	[fecha_nacimiento] [date] NULL,
	[id_puesto] [smallint] NULL,
 CONSTRAINT [PK_empleados] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedores]    Script Date: 20/10/2024 14:42:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedores](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[nit] [varchar](10) NOT NULL,
	[proveedor] [varchar](60) NOT NULL,
	[direccion] [varchar](100) NULL,
	[razon_social] [varchar](60) NULL,
	[fecha_creacion] [date] NULL,
 CONSTRAINT [PK_proveedores] PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[puestos]    Script Date: 20/10/2024 14:42:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[puestos](
	[id_puesto] [smallint] IDENTITY(1,1) NOT NULL,
	[puesto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_puestos] PRIMARY KEY CLUSTERED 
(
	[id_puesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [FK_empleados_puestos] FOREIGN KEY([id_puesto])
REFERENCES [dbo].[puestos] ([id_puesto])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [FK_empleados_puestos]
GO
USE [master]
GO
ALTER DATABASE [db_empresa] SET  READ_WRITE 
GO
