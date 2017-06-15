USE [master]
GO
/****** Object:  Database [charity_test]    Script Date: 6/15/2017 12:32:05 PM ******/
CREATE DATABASE [charity_test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'charity', FILENAME = N'C:\Users\epicodus\charity_test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'charity_log', FILENAME = N'C:\Users\epicodus\charity_test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [charity_test] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [charity_test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [charity_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [charity_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [charity_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [charity_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [charity_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [charity_test] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [charity_test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [charity_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [charity_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [charity_test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [charity_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [charity_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [charity_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [charity_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [charity_test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [charity_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [charity_test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [charity_test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [charity_test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [charity_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [charity_test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [charity_test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [charity_test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [charity_test] SET  MULTI_USER 
GO
ALTER DATABASE [charity_test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [charity_test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [charity_test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [charity_test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [charity_test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [charity_test] SET QUERY_STORE = OFF
GO
USE [charity_test]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [charity_test]
GO
/****** Object:  Table [dbo].[campaigns]    Script Date: 6/15/2017 12:32:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campaigns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[goal_amt] [int] NULL,
	[current_amt] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[category_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[categories]    Script Date: 6/15/2017 12:32:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 6/15/2017 12:32:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[role_id] [int] NULL,
	[contact_id] [int] NULL,
	[email_login] [varchar](255) NULL,
	[password] [varchar](100) NULL,
	[donate_amt] [int] NULL,
	[address] [varchar](255) NULL,
	[phone_number] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users_donator_campaigns]    Script Date: 6/15/2017 12:32:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_donator_campaigns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[campaign_id] [int] NULL,
	[user_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users_roles]    Script Date: 6/15/2017 12:32:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[role_id] [int] NULL
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [charity_test] SET  READ_WRITE 
GO
