USE [master]
GO
/****** Object:  Database [MyFirstDatabase]    Script Date: 2023-11-29 22:39:52 ******/
CREATE DATABASE [MyFirstDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyFirstDatabase', FILENAME = N'C:\Users\Anon\MyFirstDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyFirstDatabase_log', FILENAME = N'C:\Users\Anon\MyFirstDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyFirstDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyFirstDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyFirstDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MyFirstDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyFirstDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyFirstDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyFirstDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyFirstDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyFirstDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [MyFirstDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyFirstDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyFirstDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyFirstDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyFirstDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyFirstDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyFirstDatabase] SET QUERY_STORE = OFF
GO
USE [MyFirstDatabase]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 2023-11-29 22:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Alias] [varchar](60) NOT NULL,
	[FirstName] [nvarchar](60) NOT NULL,
	[LastName] [nvarchar](60) NOT NULL,
 CONSTRAINT [Players_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2023-11-29 22:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [Roles_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 2023-11-29 22:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](60) NULL,
	[WorldRanking] [int] NOT NULL,
 CONSTRAINT [Teams_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerContracts]    Script Date: 2023-11-29 22:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerContracts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PlayerContracts_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PlayerInfo]    Script Date: 2023-11-29 22:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE VIEW [dbo].[PlayerInfo] AS

SELECT Players.Alias AS 'Alias', Roles.Name AS 'Role Name', Teams.Name AS 'Team Name'
FROM PlayerContracts
JOIN Players ON PlayerContracts.PlayerId = Players.Id
JOIN Roles ON PlayerContracts.RoleId = Roles.Id
JOIN Teams ON PlayerContracts.TeamId = Teams.Id
GO
SET IDENTITY_INSERT [dbo].[PlayerContracts] ON 

INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (1, 2, 1, 1)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (2, 5, 2, 1)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (3, 3, 1, 1)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (4, 1, 3, 1)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (5, 4, 1, 1)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (6, 6, 3, 2)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (7, 7, 2, 2)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (8, 9, 1, 2)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (9, 8, 1, 2)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (10, 10, 1, 3)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (11, 11, 1, 3)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (12, 13, 2, 3)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (13, 15, 1, 3)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (14, 12, 3, 3)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (15, 14, 1, 3)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (16, 19, 1, 4)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (17, 18, 1, 4)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (18, 20, 2, 4)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (19, 17, 1, 4)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (20, 16, 3, 4)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (21, 22, 3, 5)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (22, 23, 1, 5)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (23, 25, 1, 5)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (24, 24, 2, 5)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (25, 21, 1, 5)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (26, 27, 1, 6)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (27, 26, 1, 6)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (28, 30, 2, 6)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (29, 29, 3, 6)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (30, 28, 3, 6)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (31, 33, 2, 7)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (32, 34, 1, 7)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (33, 35, 1, 7)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (34, 31, 3, 7)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (35, 32, 1, 7)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (36, 38, 1, 8)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (37, 36, 3, 8)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (38, 39, 1, 8)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (39, 37, 1, 8)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (40, 40, 1, 8)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (41, 44, 1, 9)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (42, 41, 1, 9)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (43, 42, 1, 9)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (44, 45, 1, 9)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (45, 43, 3, 9)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (46, 48, 3, 10)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (47, 47, 1, 10)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (48, 50, 1, 10)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (49, 49, 1, 10)
INSERT [dbo].[PlayerContracts] ([Id], [PlayerId], [RoleId], [TeamId]) VALUES (50, 46, 1, 10)
SET IDENTITY_INSERT [dbo].[PlayerContracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Players] ON 

INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (1, N'karrigan', N'Finn', N'Andersen')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (2, N'rain', N'HÃ¥vard', N'Nygaard')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (3, N'Twistzz', N'Russel', N'Van Dulken')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (4, N'ropz', N'Robin', N'Kool')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (5, N'broky', N'Helvijs', N'Saukants')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (6, N'apEX', N'Dan', N'Madesclaire')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (7, N'ZywOo', N'Mathieu', N'Herbaut')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (8, N'flameZ', N'Shahar', N'Shushan')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (9, N'Spinx', N'Lotan', N'Giladi')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (10, N'mezii', N'William', N'Merriman')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (11, N'frozen', N'David', N'CernanskÃ½')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (12, N'siuhy', N'Kamil', N'Szkaradek')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (13, N'torzsi', N'ÃdÃ¡m', N'TorzsÃ¡s')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (14, N'Jimpphat', N'Jimi', N'Salo')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (15, N'xertioN', N'Dorian', N'Berman')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (16, N'gla1ve', N'Lukas', N'Rossander')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (17, N'NertZ', N'Guy', N'Iluz')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (18, N'Maden', N'Pavle', N'BoÅ¡kovic')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (19, N'dycha', N'Pawel', N'Dycha')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (20, N'SunPayus', N'Alvaro', N'Garcia')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (21, N'EliGE', N'Jonathan', N'Jablonowski')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (22, N'JT', N'Johnny', N'Theodosiou')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (23, N'floppy', N'Ricky', N'Kemery')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (24, N'hallzerk', N'HÃ¥kon', N'FjÃ¦rli')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (25, N'Grim', N'Michael', N'Wince')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (26, N'NiKo', N'Nikola', N'Kovac')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (27, N'huNter-', N'Nemanja', N'Kovac')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (28, N'nexa', N'Nemanja', N'Isakovic')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (29, N'HooXi', N'Rasmus', N'Nielsen')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (30, N'm0NESY', N'Ilya', N'Osipov')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (31, N'sdy', N'Viktor', N'Orudzhev')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (32, N'br0', N'Alexander', N'Bro')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (33, N'Woro2k', N'Volodymyr', N'Veletniuk')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (34, N'DemQQ', N'Sergiy', N'Demchenko')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (35, N'kRaSnaL', N'Szymon', N'Mrozek')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (36, N'Aleksib', N'Aleksi', N'Virolainen')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (37, N'iM', N'Mihai', N'Ivan')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (38, N'b1t', N'Valeriy', N'Vakhovskiy')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (39, N'jL', N'Justinas', N'Lekavicius')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (40, N'w0nderful', N'Ihor', N'Zhdanov')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (41, N'HObbit', N'Abay', N'Khassenov')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (42, N'electroNic', N'Denis', N'Sharipov')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (43, N'Boombl4', N'Kirill', N'Mikhailov')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (44, N'Ax1Le', N'Sergey', N'Rykhtorov')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (45, N'Perfecto', N'Ilya', N'Zalutskiy')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (46, N'mir', N'Nikolay', N'Bityukov')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (47, N'FL1T', N'Evgenii', N'Lebedev')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (48, N'Jame', N'Dzhami', N'Ali')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (49, N'n0rb3r7', N'David', N'Danielyan')
INSERT [dbo].[Players] ([Id], [Alias], [FirstName], [LastName]) VALUES (50, N'fame', N'Petr', N'Bolyshev')
SET IDENTITY_INSERT [dbo].[Players] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'AWPer')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'In-game Leader')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Rifler')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Id], [Name], [WorldRanking]) VALUES (1, N'FaZe', 1)
INSERT [dbo].[Teams] ([Id], [Name], [WorldRanking]) VALUES (2, N'Vitality', 2)
INSERT [dbo].[Teams] ([Id], [Name], [WorldRanking]) VALUES (3, N'MOUZ', 3)
INSERT [dbo].[Teams] ([Id], [Name], [WorldRanking]) VALUES (4, N'ENCE', 4)
INSERT [dbo].[Teams] ([Id], [Name], [WorldRanking]) VALUES (5, N'Complexity', 5)
INSERT [dbo].[Teams] ([Id], [Name], [WorldRanking]) VALUES (6, N'G2', 6)
INSERT [dbo].[Teams] ([Id], [Name], [WorldRanking]) VALUES (7, N'Monte', 7)
INSERT [dbo].[Teams] ([Id], [Name], [WorldRanking]) VALUES (8, N'Natus Vincere', 8)
INSERT [dbo].[Teams] ([Id], [Name], [WorldRanking]) VALUES (9, N'Cloud9', 9)
INSERT [dbo].[Teams] ([Id], [Name], [WorldRanking]) VALUES (10, N'Virtus.pro', 10)
SET IDENTITY_INSERT [dbo].[Teams] OFF
GO
/****** Object:  Index [PlayerContracts_pk2]    Script Date: 2023-11-29 22:39:52 ******/
ALTER TABLE [dbo].[PlayerContracts] ADD  CONSTRAINT [PlayerContracts_pk2] UNIQUE NONCLUSTERED 
(
	[PlayerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Players_pk2]    Script Date: 2023-11-29 22:39:52 ******/
ALTER TABLE [dbo].[Players] ADD  CONSTRAINT [Players_pk2] UNIQUE NONCLUSTERED 
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Roles_pk2]    Script Date: 2023-11-29 22:39:52 ******/
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [Roles_pk2] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Teams_pk2]    Script Date: 2023-11-29 22:39:52 ******/
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [Teams_pk2] UNIQUE NONCLUSTERED 
(
	[WorldRanking] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PlayerContracts]  WITH CHECK ADD  CONSTRAINT [PlayerContracts_Players_Id_fk] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Players] ([Id])
GO
ALTER TABLE [dbo].[PlayerContracts] CHECK CONSTRAINT [PlayerContracts_Players_Id_fk]
GO
ALTER TABLE [dbo].[PlayerContracts]  WITH CHECK ADD  CONSTRAINT [PlayerContracts_Roles_Id_fk] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[PlayerContracts] CHECK CONSTRAINT [PlayerContracts_Roles_Id_fk]
GO
ALTER TABLE [dbo].[PlayerContracts]  WITH CHECK ADD  CONSTRAINT [PlayerContracts_Teams_Id_fk] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[PlayerContracts] CHECK CONSTRAINT [PlayerContracts_Teams_Id_fk]
GO
USE [master]
GO
ALTER DATABASE [MyFirstDatabase] SET  READ_WRITE 
GO
