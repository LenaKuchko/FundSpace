USE [master]
GO
/****** Object:  Database [charity]    Script Date: 6/21/2017 5:31:17 PM ******/
CREATE DATABASE [charity]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'charity', FILENAME = N'C:\Users\epicodus\charity.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'charity_log', FILENAME = N'C:\Users\epicodus\charity_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [charity] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [charity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [charity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [charity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [charity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [charity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [charity] SET ARITHABORT OFF 
GO
ALTER DATABASE [charity] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [charity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [charity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [charity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [charity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [charity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [charity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [charity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [charity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [charity] SET  ENABLE_BROKER 
GO
ALTER DATABASE [charity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [charity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [charity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [charity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [charity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [charity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [charity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [charity] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [charity] SET  MULTI_USER 
GO
ALTER DATABASE [charity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [charity] SET DB_CHAINING OFF 
GO
ALTER DATABASE [charity] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [charity] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [charity] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [charity] SET QUERY_STORE = OFF
GO
USE [charity]
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
USE [charity]
GO
/****** Object:  Table [dbo].[campaigns]    Script Date: 6/21/2017 5:31:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campaigns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[description] [varchar](max) NULL,
	[goal_amt] [int] NULL,
	[current_amt] [int] NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[category_id] [int] NULL,
	[owner_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[categories]    Script Date: 6/21/2017 5:31:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[donations]    Script Date: 6/21/2017 5:31:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[donations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[campaign_id] [int] NULL,
	[donation_amount] [int] NULL,
	[donation_date] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles]    Script Date: 6/21/2017 5:31:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 6/21/2017 5:31:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NULL,
	[name] [varchar](255) NULL,
	[login] [varchar](255) NULL,
	[password] [varchar](100) NULL,
	[address] [varchar](255) NULL,
	[phone_number] [varchar](50) NULL,
	[email] [varchar](50) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[campaigns] ON 

INSERT [dbo].[campaigns] ([id], [name], [description], [goal_amt], [current_amt], [start_date], [end_date], [category_id], [owner_id]) VALUES (1, N'Jun''s Broken Foot', N'Jun broke his foot', 50, 647, CAST(N'2017-06-20T00:00:00.000' AS DateTime), CAST(N'2017-06-25T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[campaigns] ([id], [name], [description], [goal_amt], [current_amt], [start_date], [end_date], [category_id], [owner_id]) VALUES (2, N'Epicodus Course', N'I need a new mac book!', 5000, 103, CAST(N'2017-06-20T00:00:00.000' AS DateTime), CAST(N'2017-06-25T00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[campaigns] ([id], [name], [description], [goal_amt], [current_amt], [start_date], [end_date], [category_id], [owner_id]) VALUES (11, N'hi tyler', N'asdfasdfas', 500, 0, CAST(N'2017-06-22T00:00:00.000' AS DateTime), CAST(N'2017-09-29T00:00:00.000' AS DateTime), 2, 9)
INSERT [dbo].[campaigns] ([id], [name], [description], [goal_amt], [current_amt], [start_date], [end_date], [category_id], [owner_id]) VALUES (5, N'Kim Shut UP', N'success', 1, 0, CAST(N'2017-01-01T00:00:00.000' AS DateTime), CAST(N'2018-01-01T00:00:00.000' AS DateTime), 1, 14)
INSERT [dbo].[campaigns] ([id], [name], [description], [goal_amt], [current_amt], [start_date], [end_date], [category_id], [owner_id]) VALUES (6, N'asdfasdf', N'asdfasdfasdfasdf', 12, 136667, CAST(N'2017-06-22T00:00:00.000' AS DateTime), CAST(N'2017-06-23T00:00:00.000' AS DateTime), 2, 14)
INSERT [dbo].[campaigns] ([id], [name], [description], [goal_amt], [current_amt], [start_date], [end_date], [category_id], [owner_id]) VALUES (7, N'asdfasdf', N'asdfasdfasdfasdf', 12, 0, CAST(N'2017-06-22T00:00:00.000' AS DateTime), CAST(N'2017-06-23T00:00:00.000' AS DateTime), 2, 14)
INSERT [dbo].[campaigns] ([id], [name], [description], [goal_amt], [current_amt], [start_date], [end_date], [category_id], [owner_id]) VALUES (8, N'asdf', N'asdf', 1, 0, CAST(N'2017-06-23T00:00:00.000' AS DateTime), CAST(N'2017-06-30T00:00:00.000' AS DateTime), 4, 14)
INSERT [dbo].[campaigns] ([id], [name], [description], [goal_amt], [current_amt], [start_date], [end_date], [category_id], [owner_id]) VALUES (9, N'asdfasdf', N'asdfasdasd', 1, 1234124, CAST(N'2017-06-02T00:00:00.000' AS DateTime), CAST(N'2017-06-09T00:00:00.000' AS DateTime), 2, 14)
SET IDENTITY_INSERT [dbo].[campaigns] OFF
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'medical')
INSERT [dbo].[categories] ([id], [name]) VALUES (2, N'education')
INSERT [dbo].[categories] ([id], [name]) VALUES (3, N'animals')
INSERT [dbo].[categories] ([id], [name]) VALUES (4, N'emergencies')
INSERT [dbo].[categories] ([id], [name]) VALUES (5, N'art')
INSERT [dbo].[categories] ([id], [name]) VALUES (6, N'charity')
SET IDENTITY_INSERT [dbo].[categories] OFF
SET IDENTITY_INSERT [dbo].[donations] ON 

INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (1, 1, 1, 50, CAST(N'2017-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (2, 2, 1, 123, CAST(N'2017-06-20T16:24:32.477' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (3, 2, 1, 134142, CAST(N'2017-06-20T17:09:03.907' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (4, 2, 1, 100, CAST(N'2017-06-20T17:13:22.773' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (17, 9, 6, 12312, CAST(N'2017-06-21T17:11:54.940' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (5, 2, 1, 1, CAST(N'2017-06-20T17:20:29.163' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (19, 9, 6, 123123, CAST(N'2017-06-21T17:12:15.553' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (8, 13, 1, 1, CAST(N'2017-06-21T08:34:18.247' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (9, 9, 2, 100, CAST(N'2017-06-21T10:32:24.103' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (10, 9, 2, 1, CAST(N'2017-06-21T10:33:43.167' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (11, 14, 9, 1234124, CAST(N'2017-06-21T10:50:23.770' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (12, 9, 1, 500, CAST(N'2017-06-21T13:07:51.603' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (13, 9, 1, 45, CAST(N'2017-06-21T13:08:16.670' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (18, 9, 6, 1232, CAST(N'2017-06-21T17:12:03.073' AS DateTime))
INSERT [dbo].[donations] ([id], [user_id], [campaign_id], [donation_amount], [donation_date]) VALUES (20, 9, 2, 2, CAST(N'2017-06-21T17:25:42.543' AS DateTime))
SET IDENTITY_INSERT [dbo].[donations] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (1, 1, N'a', N'a', N'b', N'a', N'asdf', N'asdf')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (2, 1, N'a', N'a', N'b', N'a', N'a', N'a')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (3, 1, N'Lena', N'lena123', N'123', N'asdfasdf', N'123123', N'asdfsdaf')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (4, 1, N'daniela', N'd123', N'123', N'asdf', N'asdfasd', N'afsdf')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (5, 1, N'asdf', N'asdf', N'asdf', N'asdf', N'asdf', N'asdf')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (6, 1, N'sfds', N'asdf', N'asdf', N'asdf', N'asdf', N'asdf')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (7, 1, N'asdf', N'asdfasdf', N'asdf', N'asdf', N'asdf', N'asdf')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (8, 1, N'Lena', N'b', N'a', N'asdfsa', N'asdfs', N'asdfsdf')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (9, 1, N'Lena', N'a', N'b', N'asdf', N'asdf', N'asdf')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (10, 1, N'asdf', N'asdf', N'asdf', N'asdf', N'adsf', N'asdf')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (11, 1, N'asdf', N'asdf', N'asdf', N'asdf', N'adsf', N'asdf')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (12, 1, N'w', N'w', N'w', N'q', N'w', N'e')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (13, 1, N'h', N'j', N'j', N'j', N'j', N'j')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (14, 1, N'Jun', N'Jun', N'Jun', N'asdfasdfas', N'adsfasd', N'asdfasdf')
INSERT [dbo].[users] ([id], [role_id], [name], [login], [password], [address], [phone_number], [email]) VALUES (15, 1, N'Jun', N'jun', N'jun', N'adsfasdf', N'asdfasdf', N'asdfsda')
SET IDENTITY_INSERT [dbo].[users] OFF
USE [master]
GO
ALTER DATABASE [charity] SET  READ_WRITE 
GO
