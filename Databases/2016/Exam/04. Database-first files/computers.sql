USE [master]
GO
/****** Object:  Database [Computers]    Script Date: 11/8/2016 6:09:38 PM ******/
CREATE DATABASE [Computers]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Computers', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Computers.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Computers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Computers_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Computers] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Computers].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Computers] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Computers] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Computers] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Computers] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Computers] SET ARITHABORT OFF 
GO
ALTER DATABASE [Computers] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Computers] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Computers] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Computers] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Computers] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Computers] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Computers] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Computers] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Computers] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Computers] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Computers] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Computers] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Computers] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Computers] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Computers] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Computers] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Computers] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Computers] SET RECOVERY FULL 
GO
ALTER DATABASE [Computers] SET  MULTI_USER 
GO
ALTER DATABASE [Computers] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Computers] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Computers] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Computers] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Computers] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Computers', N'ON'
GO
USE [Computers]
GO
/****** Object:  Table [dbo].[Computers]    Script Date: 11/8/2016 6:09:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Computers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NULL,
	[ModelId] [int] NULL,
	[TypeId] [int] NULL,
 CONSTRAINT [PK_Computers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComputerTypes]    Script Date: 11/8/2016 6:09:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComputerTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ComputerTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CPUs]    Script Date: 11/8/2016 6:09:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CPUs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NULL,
	[ModelId] [int] NULL,
	[CoreNumber] [int] NULL,
	[ClockCycles] [real] NULL,
	[ComputerId] [int] NULL,
 CONSTRAINT [PK_CPUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GPUs]    Script Date: 11/8/2016 6:09:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPUs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NULL,
	[VendorId] [int] NULL,
	[ModelId] [int] NULL,
	[Memory] [int] NULL,
	[ComputerId] [int] NULL,
 CONSTRAINT [PK_GPUs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GPUTypes]    Script Date: 11/8/2016 6:09:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GPUTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_GPUTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Models]    Script Date: 11/8/2016 6:09:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Models] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RAMs]    Script Date: 11/8/2016 6:09:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAMs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [int] NULL,
	[VendorId] [int] NULL,
	[ComputerId] [int] NULL,
 CONSTRAINT [PK_RAMs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StorageDevices]    Script Date: 11/8/2016 6:09:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageDevices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [int] NULL,
	[ModelId] [int] NULL,
	[Size] [int] NULL,
	[ComputerId] [int] NULL,
 CONSTRAINT [PK_StorageDevices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 11/8/2016 6:09:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [FK_Computers_ComputerTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[ComputerTypes] ([Id])
GO
ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [FK_Computers_ComputerTypes]
GO
ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [FK_Computers_Models] FOREIGN KEY([ModelId])
REFERENCES [dbo].[Models] ([Id])
GO
ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [FK_Computers_Models]
GO
ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [FK_Computers_Vendors] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([Id])
GO
ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [FK_Computers_Vendors]
GO
ALTER TABLE [dbo].[CPUs]  WITH CHECK ADD  CONSTRAINT [FK_CPUs_Computers] FOREIGN KEY([ComputerId])
REFERENCES [dbo].[Computers] ([Id])
GO
ALTER TABLE [dbo].[CPUs] CHECK CONSTRAINT [FK_CPUs_Computers]
GO
ALTER TABLE [dbo].[CPUs]  WITH CHECK ADD  CONSTRAINT [FK_CPUs_Models] FOREIGN KEY([ModelId])
REFERENCES [dbo].[Models] ([Id])
GO
ALTER TABLE [dbo].[CPUs] CHECK CONSTRAINT [FK_CPUs_Models]
GO
ALTER TABLE [dbo].[CPUs]  WITH CHECK ADD  CONSTRAINT [FK_CPUs_Vendors] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([Id])
GO
ALTER TABLE [dbo].[CPUs] CHECK CONSTRAINT [FK_CPUs_Vendors]
GO
ALTER TABLE [dbo].[GPUs]  WITH CHECK ADD  CONSTRAINT [FK_GPUs_Computers] FOREIGN KEY([ComputerId])
REFERENCES [dbo].[Computers] ([Id])
GO
ALTER TABLE [dbo].[GPUs] CHECK CONSTRAINT [FK_GPUs_Computers]
GO
ALTER TABLE [dbo].[GPUs]  WITH CHECK ADD  CONSTRAINT [FK_GPUs_GPUTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[GPUTypes] ([Id])
GO
ALTER TABLE [dbo].[GPUs] CHECK CONSTRAINT [FK_GPUs_GPUTypes]
GO
ALTER TABLE [dbo].[GPUs]  WITH CHECK ADD  CONSTRAINT [FK_GPUs_Models] FOREIGN KEY([ModelId])
REFERENCES [dbo].[Models] ([Id])
GO
ALTER TABLE [dbo].[GPUs] CHECK CONSTRAINT [FK_GPUs_Models]
GO
ALTER TABLE [dbo].[GPUs]  WITH CHECK ADD  CONSTRAINT [FK_GPUs_Vendors] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([Id])
GO
ALTER TABLE [dbo].[GPUs] CHECK CONSTRAINT [FK_GPUs_Vendors]
GO
ALTER TABLE [dbo].[RAMs]  WITH CHECK ADD  CONSTRAINT [FK_RAMs_Computers] FOREIGN KEY([ComputerId])
REFERENCES [dbo].[Computers] ([Id])
GO
ALTER TABLE [dbo].[RAMs] CHECK CONSTRAINT [FK_RAMs_Computers]
GO
ALTER TABLE [dbo].[RAMs]  WITH CHECK ADD  CONSTRAINT [FK_RAMs_Vendors] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([Id])
GO
ALTER TABLE [dbo].[RAMs] CHECK CONSTRAINT [FK_RAMs_Vendors]
GO
ALTER TABLE [dbo].[StorageDevices]  WITH CHECK ADD  CONSTRAINT [FK_StorageDevices_Computers] FOREIGN KEY([ComputerId])
REFERENCES [dbo].[Computers] ([Id])
GO
ALTER TABLE [dbo].[StorageDevices] CHECK CONSTRAINT [FK_StorageDevices_Computers]
GO
ALTER TABLE [dbo].[StorageDevices]  WITH CHECK ADD  CONSTRAINT [FK_StorageDevices_Models] FOREIGN KEY([ModelId])
REFERENCES [dbo].[Models] ([Id])
GO
ALTER TABLE [dbo].[StorageDevices] CHECK CONSTRAINT [FK_StorageDevices_Models]
GO
ALTER TABLE [dbo].[StorageDevices]  WITH CHECK ADD  CONSTRAINT [FK_StorageDevices_Vendors] FOREIGN KEY([VendorId])
REFERENCES [dbo].[Vendors] ([Id])
GO
ALTER TABLE [dbo].[StorageDevices] CHECK CONSTRAINT [FK_StorageDevices_Vendors]
GO
USE [master]
GO
ALTER DATABASE [Computers] SET  READ_WRITE 
GO
