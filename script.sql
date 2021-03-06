USE [master]
GO
/****** Object:  Database [luxury]    Script Date: 5/17/2018 9:25:26 AM ******/
CREATE DATABASE [luxury]
GO
ALTER DATABASE [luxury] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [luxury].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [luxury] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [luxury] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [luxury] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [luxury] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [luxury] SET ARITHABORT OFF 
GO
ALTER DATABASE [luxury] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [luxury] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [luxury] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [luxury] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [luxury] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [luxury] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [luxury] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [luxury] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [luxury] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [luxury] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [luxury] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [luxury] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [luxury] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [luxury] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [luxury] SET  MULTI_USER 
GO
ALTER DATABASE [luxury] SET DB_CHAINING OFF 
GO
ALTER DATABASE [luxury] SET ENCRYPTION ON
GO
ALTER DATABASE [luxury] SET QUERY_STORE = ON
GO
ALTER DATABASE [luxury] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [luxury]
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF TargetReplic;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF TargetReplic;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [luxury]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 5/17/2018 9:25:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[Branch_Id] [int] IDENTITY(1,1) NOT NULL,
	[Branch_Name] [nvarchar](30) NULL,
	[Branch_Address] [nvarchar](50) NULL,
	[Branch_Phone] [nvarchar](15) NULL,
	[Manager_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Branch_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranchProduct]    Script Date: 5/17/2018 9:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranchProduct](
	[BranchProduct_Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchProduct_Amount] [int] NULL,
	[BranchProduct_EXP] [date] NULL,
	[Product_Code] [int] NULL,
	[Branch_Id] [int] NULL,
	[Notifications_Exp1] [int] NULL,
	[Notifications_Exp2] [int] NULL,
	[Notifications_Exp3] [int] NULL,
	[Notifications_Amount1] [int] NULL,
	[Notifications_Amount2] [int] NULL,
	[Notifications_Amount3] [int] NULL,
	[note] [nchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BranchProduct_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/17/2018 9:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_Id] [int] IDENTITY(1,1) NOT NULL,
	[Course_Name] [nvarchar](100) NULL,
	[Course_Des] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Course_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseProduct]    Script Date: 5/17/2018 9:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseProduct](
	[CourseProduct_Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Code] [int] NULL,
	[Course_Id] [int] NULL,
	[Amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseProduct_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 5/17/2018 9:25:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[Manager_Id] [int] IDENTITY(1,1) NOT NULL,
	[Manager_FirstName] [nvarchar](30) NULL,
	[Manager_LastName] [nvarchar](30) NULL,
	[Manager_Gender] [bit] NULL,
	[Manager_Status] [int] NULL,
	[Manager_Address] [nvarchar](200) NULL,
	[Manager_Email] [nvarchar](30) NULL,
	[Manager_Username] [nvarchar](30) NULL,
	[Manager_Password] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Manager_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/17/2018 9:25:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Code] [int] NULL,
	[Product_Name] [nvarchar](15) NULL,
	[Product_Des] [nvarchar](300) NULL,
	[Product_Instruction] [nvarchar](300) NULL,
	[ProductType_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 5/17/2018 9:25:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductType_Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductType_Name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReqProduct]    Script Date: 5/17/2018 9:25:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReqProduct](
	[ReqProduct_Id] [int] IDENTITY(1,1) NOT NULL,
	[ReqDate] [date] NULL,
	[ReqQuantity] [int] NULL,
	[Branch_Id] [int] NULL,
	[Product_Code] [int] NULL,
	[statusReq] [bit] NULL,
	[QuantityUpdate] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReqProduct_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationCourse]    Script Date: 5/17/2018 9:25:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationCourse](
	[ReservationCourse_Id] [int] IDENTITY(1,1) NOT NULL,
	[ReservationCourse_Date] [date] NULL,
	[ReservationCourse_Status] [bit] NULL,
	[Course_Id] [int] NULL,
	[Branch_Id] [int] NULL,
	[currentDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationCourse_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplyProduct]    Script Date: 5/17/2018 9:25:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplyProduct](
	[SupplyProduct_Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplyDate] [date] NULL,
	[SupplyQuantity] [int] NULL,
	[Branch_Id] [int] NULL,
	[BranchProduct_Id] [int] NULL,
	[Product_Code] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplyProduct_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseProducts]    Script Date: 5/17/2018 9:25:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseProducts](
	[UseProduct_Id] [int] IDENTITY(1,1) NOT NULL,
	[UseDate] [date] NULL,
	[UseQuantity] [int] NULL,
	[use_key] [int] NULL,
	[Product_Code] [int] NULL,
	[Branch_Id] [int] NULL,
	[Course_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UseProduct_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([Branch_Id], [Branch_Name], [Branch_Address], [Branch_Phone], [Manager_Id]) VALUES (1, N'สาขาใหญ่', N'เซ็นทรัลซิตี้ บางนา ชั้น 16', N'02-745-6527', 1)
INSERT [dbo].[Branch] ([Branch_Id], [Branch_Name], [Branch_Address], [Branch_Phone], [Manager_Id]) VALUES (2, N'เซ็นทรัลซิตี้ บางนา', N'เซ็นทรัลซิตี้ บางนา ชั้น 16', N'02-745-6527', 2)
INSERT [dbo].[Branch] ([Branch_Id], [Branch_Name], [Branch_Address], [Branch_Phone], [Manager_Id]) VALUES (3, N'เซ็นทรัลปิ่นเกล้า', N'เซ็นทรัลปิ่นเกล้า ทาวเวอร์ เอ ชั้น 6', N'02-884-6799', 3)
INSERT [dbo].[Branch] ([Branch_Id], [Branch_Name], [Branch_Address], [Branch_Phone], [Manager_Id]) VALUES (4, N'ซีคอนสแควร์ ศรีนครินทร์', N'ซีคอนสแควร์ ศรีนครินทร์ ชั้น 3', N'02-720-2051-2', 4)
INSERT [dbo].[Branch] ([Branch_Id], [Branch_Name], [Branch_Address], [Branch_Phone], [Manager_Id]) VALUES (5, N'เดอะพรอมนาด รามอินทรา', N'เดอะพรอมนาด รามอินทรา ชั้น 4', N'02-108-6238', 5)
INSERT [dbo].[Branch] ([Branch_Id], [Branch_Name], [Branch_Address], [Branch_Phone], [Manager_Id]) VALUES (6, N'เซ็นทรัลพลาซาพระราม 2', N'เซ็นทรัลพลาซาพระราม 2 ชั้น 3', N'02-872-4514-15', 6)
SET IDENTITY_INSERT [dbo].[Branch] OFF
SET IDENTITY_INSERT [dbo].[BranchProduct] ON 

INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (261, 100, CAST(N'2018-05-24' AS Date), 1, 1, 45, 30, 15, 350, 200, 100, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (262, 470, CAST(N'2018-05-29' AS Date), 2, 1, 30, 20, 10, 123, 111, 90, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (263, 350, CAST(N'2018-06-14' AS Date), 3, 1, 45, 30, 15, 90, 80, 70, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (264, 1040, CAST(N'2018-06-28' AS Date), 4, 1, 45, 30, 15, 400, 300, 100, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (266, 140, CAST(N'2018-07-20' AS Date), 6, 1, 45, 30, 15, 300, 200, 100, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (267, 340, CAST(N'2018-06-18' AS Date), 7, 1, 45, 30, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (268, 550, CAST(N'2018-07-19' AS Date), 8, 1, 45, 30, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (269, 500, CAST(N'2018-09-20' AS Date), 9, 1, 45, 30, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (270, 880, CAST(N'2018-07-26' AS Date), 10, 1, 45, 30, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (271, 780, CAST(N'2018-10-26' AS Date), 11, 1, 45, 30, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (272, 540, CAST(N'2019-03-30' AS Date), 12, 1, 45, 30, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (273, 400, CAST(N'2018-05-27' AS Date), 13, 1, 45, 30, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (274, 250, CAST(N'2018-07-20' AS Date), 9, 1, 45, 30, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (275, 450, CAST(N'2018-06-25' AS Date), 5, 1, 45, 30, 15, 12, 11, 10, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (276, 530, CAST(N'2018-07-28' AS Date), 2, 1, 45, 30, 15, 90, 70, 50, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (277, 80, CAST(N'2018-06-12' AS Date), 8, 1, 45, 30, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (278, 180, CAST(N'2018-05-24' AS Date), 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (279, 200, CAST(N'2018-05-29' AS Date), 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (280, 100, CAST(N'2018-06-14' AS Date), 3, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (281, 200, CAST(N'2018-06-28' AS Date), 4, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (282, 120, CAST(N'2018-06-23' AS Date), 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (283, 200, CAST(N'2018-07-20' AS Date), 6, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (284, 160, CAST(N'2018-06-18' AS Date), 7, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (285, 290, CAST(N'2018-06-12' AS Date), 8, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (286, 150, CAST(N'2018-07-20' AS Date), 9, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (287, 100, CAST(N'2018-07-26' AS Date), 10, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (288, 100, CAST(N'2018-10-26' AS Date), 11, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (289, 150, CAST(N'2019-03-30' AS Date), 12, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'สินค้าไม่เพียงพอ                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (290, 120, CAST(N'2018-05-27' AS Date), 13, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (291, 180, CAST(N'2018-05-24' AS Date), 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (292, 200, CAST(N'2018-05-29' AS Date), 2, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (293, 100, CAST(N'2018-06-14' AS Date), 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (294, 190, CAST(N'2018-06-28' AS Date), 4, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (295, 230, CAST(N'2018-06-23' AS Date), 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (296, 200, CAST(N'2018-07-20' AS Date), 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (297, 170, CAST(N'2018-06-18' AS Date), 7, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (298, 120, CAST(N'2018-06-12' AS Date), 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (299, 100, CAST(N'2018-07-20' AS Date), 9, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (300, 130, CAST(N'2018-07-26' AS Date), 10, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (301, 190, CAST(N'2019-03-30' AS Date), 12, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (302, 200, CAST(N'2018-05-27' AS Date), 13, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (303, 210, CAST(N'2018-05-24' AS Date), 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (304, 200, CAST(N'2018-05-29' AS Date), 2, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (305, 100, CAST(N'2018-06-14' AS Date), 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (306, 190, CAST(N'2018-06-28' AS Date), 4, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (307, 180, CAST(N'2018-06-23' AS Date), 5, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (308, 200, CAST(N'2018-07-20' AS Date), 6, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (309, 170, CAST(N'2018-06-18' AS Date), 7, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (310, 120, CAST(N'2018-06-12' AS Date), 8, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (311, 100, CAST(N'2018-07-20' AS Date), 9, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (312, 130, CAST(N'2018-07-26' AS Date), 10, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (313, 140, CAST(N'2018-10-26' AS Date), 11, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (314, 190, CAST(N'2019-03-30' AS Date), 12, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (315, 200, CAST(N'2018-05-27' AS Date), 13, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (316, 400, CAST(N'2018-05-24' AS Date), 1, 5, NULL, NULL, NULL, 90, 70, 50, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (317, 120, CAST(N'2018-05-29' AS Date), 2, 5, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (318, 150, CAST(N'2018-06-14' AS Date), 3, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (319, 190, CAST(N'2018-06-28' AS Date), 4, 5, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (320, 100, CAST(N'2018-06-23' AS Date), 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (321, 380, CAST(N'2018-07-20' AS Date), 6, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (322, 100, CAST(N'2018-06-18' AS Date), 7, 5, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (323, 240, CAST(N'2018-06-12' AS Date), 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (324, 100, CAST(N'2018-07-20' AS Date), 9, 5, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (325, 120, CAST(N'2018-07-26' AS Date), 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (326, 140, CAST(N'2018-10-26' AS Date), 11, 5, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (327, 150, CAST(N'2019-03-30' AS Date), 12, 5, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (328, 300, CAST(N'2018-05-27' AS Date), 13, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (329, 190, CAST(N'2018-05-24' AS Date), 1, 6, 45, 30, 15, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (330, 230, CAST(N'2018-05-29' AS Date), 2, 6, 45, 30, 15, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (331, 100, CAST(N'2018-06-14' AS Date), 3, 6, 45, 30, 15, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (332, 190, CAST(N'2018-06-28' AS Date), 4, 6, 45, 30, 15, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (333, 250, CAST(N'2018-07-20' AS Date), 6, 6, 45, 30, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (334, 340, CAST(N'2018-06-18' AS Date), 7, 6, 45, 30, 15, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (335, 320, CAST(N'2018-06-12' AS Date), 8, 6, 45, 30, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (336, 200, CAST(N'2018-05-27' AS Date), 13, 6, 45, 30, 15, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (337, 190, CAST(N'2019-03-30' AS Date), 12, 6, 45, 30, 15, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (338, 140, CAST(N'2018-10-26' AS Date), 11, 6, 45, 30, 15, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (339, 130, CAST(N'2018-07-26' AS Date), 10, 6, 45, 30, 15, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (340, 150, CAST(N'2018-07-20' AS Date), 9, 6, 45, 30, 15, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (343, 30, CAST(N'2018-05-22' AS Date), 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (345, 50, CAST(N'2018-05-10' AS Date), 1, 5, 45, 30, 15, 50, 30, 20, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (347, 40, CAST(N'2018-05-19' AS Date), 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (348, 10, CAST(N'2018-06-25' AS Date), 5, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (350, 50, CAST(N'2018-05-21' AS Date), 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (351, 400, CAST(N'2018-09-20' AS Date), 14, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (352, 100, CAST(N'2018-09-20' AS Date), 14, 5, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
INSERT [dbo].[BranchProduct] ([BranchProduct_Id], [BranchProduct_Amount], [BranchProduct_EXP], [Product_Code], [Branch_Id], [Notifications_Exp1], [Notifications_Exp2], [Notifications_Exp3], [Notifications_Amount1], [Notifications_Amount2], [Notifications_Amount3], [note]) VALUES (353, 100, CAST(N'2018-09-20' AS Date), 14, 4, NULL, NULL, NULL, NULL, NULL, NULL, N'                                                                                                    ')
SET IDENTITY_INSERT [dbo].[BranchProduct] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Course_Id], [Course_Name], [Course_Des]) VALUES (1, N'Bird’s nest Fresh Collagen Serum', N'เซรั่มบำรุงผิวสูตรเข้มข้น อุดมด้วยคุณค่าจาก Collagen Capsule สารสกัดจากรังนกนางแอ่นตามธรรมชาติ ช่วยผลัดเซลล์ผิวอย่างอ่อนโยน เผยผิวใหม่ขาวกระจ่างใส')
INSERT [dbo].[Course] ([Course_Id], [Course_Name], [Course_Des]) VALUES (2, N'LUXURY CARBON PEEL', N'เป็นเทคโนโลยีล่าสุดในการผลัดเซลล์ผิวชั้นบนด้วยเลเซอร์ พร้อมกับการซ่อมแซมและกระตุ้นการสร้างคลออลาเจนไปพร้อมๆกัน คืนความอ่อนเยาว์ให้กับผิวทำให้ผิวเต่งตึงและอ่อนนุ่ม')
INSERT [dbo].[Course] ([Course_Id], [Course_Name], [Course_Des]) VALUES (3, N'LUXURY FAT BURN', N'เป็นการฉีดสลายไขมันเกิดสะสมตามจุดต่างๆ  การฉีดสลายไขมันถือเป็นหนึ่งนวัตกรรมที่จะช่วยแก้ปัญหาไขมันสะสมเฉพาะส่วนได้อย่างตรงจุด')
INSERT [dbo].[Course] ([Course_Id], [Course_Name], [Course_Des]) VALUES (4, N'RHINOPLASTY ', N'ศัลยกรรมเสริมจมูก การศัลยกรรมจมูกให้มีรูปร่าง และขนาดที่สอดคล้องกับใบหน้าก็จะช่วยให้เรามีรูปหน้าโดยรวที่สวยและสมส่วน')
INSERT [dbo].[Course] ([Course_Id], [Course_Name], [Course_Des]) VALUES (5, N'MICRO-FOCUS ULTRASOUND LIFTING', N'??????????????????????? Ultrasound ????????????????????????????????????????? ??????????????????????????????????????? ?????????????????????? ??????????????????????????? ???? ????????? ?????????????????????????????? ?????????????????????')
INSERT [dbo].[Course] ([Course_Id], [Course_Name], [Course_Des]) VALUES (6, N'LUXURY DEAD SEA MASK', N'Dead Sea ????????????????????????? ???????????????? ??? ??? ??????????? ????????????????????????? ????????????????????? ??????????????????????????????????? ???????????????????????????????????????????????????????????????????????????????????? ??? Dead Sea ???????????????????????? ?????????????????????')
INSERT [dbo].[Course] ([Course_Id], [Course_Name], [Course_Des]) VALUES (7, N'LUXURY LIGHT THERAPY', N'?????????????????????????????????? ?????????????????????????????????????????? ????????????????????????????????????????????????????????????????????????????????????? ??????????????')
INSERT [dbo].[Course] ([Course_Id], [Course_Name], [Course_Des]) VALUES (8, N'BOTULINUM FOR CALF REDUCTION', N'???????????????? ???????????????????????????????????????????????????????????????????????????????? ?????????????????????????????????? ????????????????????????????????????????????????????????????????????????? ??????? ???????????????')
INSERT [dbo].[Course] ([Course_Id], [Course_Name], [Course_Des]) VALUES (9, N'LUXURY MESO MUCIN SNAIL WHITE', N'??????????????????????????????????????????????????????? ????????????????????????????????????????????????? ????????????????????????????????????????????????????????????????????????????????????? 2 ???? ??????????????????????????????? ???????????????????????????????????????????? 2-3 ??.')
INSERT [dbo].[Course] ([Course_Id], [Course_Name], [Course_Des]) VALUES (10, N'LUXURY CHEEK LYSIS', N'??????????????????????????????? ??????????????????????????????????????????????????????????????????????? ???????????????????????? ???? Phophatidycholine,Deoxycholate,L-carntitine,Vitamon B complex, Amino acids, Minerals ??????????????????????????????????????????????????????????????????????????????????????????????????????? ?????????????????????? ??????? 0.1 ??.-12 ??.) ????????????????????? (Mesotherapy) ??????????????????????????????????(??????) ???????????????????????')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseProduct] ON 

INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (1, 1, 1, 15)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (2, 2, 1, 12)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (3, 2, 4, 40)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (4, 1, 4, 20)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (5, 2, 3, 20)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (6, 1, 2, 10)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (7, 2, 2, 20)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (8, 5, 5, 10)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (9, 6, 5, 8)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (10, 13, 5, 10)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (11, 3, 6, 8)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (12, 2, 6, 3)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (13, 13, 6, 5)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (14, 1, 7, 8)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (15, 2, 7, 9)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (16, 4, 7, 5)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (17, 10, 10, 3)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (18, 11, 10, 6)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (19, 12, 10, 5)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (20, 9, 10, 5)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (21, 13, 9, 8)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (22, 2, 9, 7)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (23, 7, 9, 5)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (24, 6, 9, 8)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (25, 2, 9, 7)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (26, 7, 9, 5)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (27, 8, 2, 10)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (28, 8, 5, 10)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (29, 8, 7, 5)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (30, 8, 2, 10)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (31, 8, 5, 10)
INSERT [dbo].[CourseProduct] ([CourseProduct_Id], [Product_Code], [Course_Id], [Amount]) VALUES (32, 8, 7, 5)
SET IDENTITY_INSERT [dbo].[CourseProduct] OFF
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([Manager_Id], [Manager_FirstName], [Manager_LastName], [Manager_Gender], [Manager_Status], [Manager_Address], [Manager_Email], [Manager_Username], [Manager_Password]) VALUES (1, N'กัลยา', N'ใจลูน', 0, 0, N'22 หมู่8 ต.แม่ทะ อ.แม่ทะ จ.ลำปาง 52150', N'kanlaya@gmail.com', N'kanlayoon', N'kanlaya123')
INSERT [dbo].[Manager] ([Manager_Id], [Manager_FirstName], [Manager_LastName], [Manager_Gender], [Manager_Status], [Manager_Address], [Manager_Email], [Manager_Username], [Manager_Password]) VALUES (2, N'กานดา', N'คงสวัส', 0, 1, N'345 เจริญกรุง กรุงเทพมหานคร', N'popiizee_sing@hotmail.com', N'kanda', N'kanda555')
INSERT [dbo].[Manager] ([Manager_Id], [Manager_FirstName], [Manager_LastName], [Manager_Gender], [Manager_Status], [Manager_Address], [Manager_Email], [Manager_Username], [Manager_Password]) VALUES (3, N'ธนวัตร', N'อยู่เย็น', 1, 2, N'333/3 ถนนวิภาวดีรังสิต แขวงจอมพล เขตจตุจักร กรุงเทพมหานคร 10900', N'thanawat@gmail.com', N'thanawat', N'thanawat123')
INSERT [dbo].[Manager] ([Manager_Id], [Manager_FirstName], [Manager_LastName], [Manager_Gender], [Manager_Status], [Manager_Address], [Manager_Email], [Manager_Username], [Manager_Password]) VALUES (4, N'สุจิรา', N'คงสวัสดิ์', 0, 3, N'1115 ถนนพระราม 3 แขวงช่องนนทรี เขตยานนาวา กรุงเทพ 10120', N'sujira@gmail.com', N'sujira', N'sujira123')
INSERT [dbo].[Manager] ([Manager_Id], [Manager_FirstName], [Manager_LastName], [Manager_Gender], [Manager_Status], [Manager_Address], [Manager_Email], [Manager_Username], [Manager_Password]) VALUES (5, N'มานะ', N'อนุรักษ์ไทย', 1, 4, N'	99/2 ถนนศรีจันทร์ ตำบลในเมือง อำเภอเมืองขอนแก่น จังหวัดขอนแก่น 40000', N'mana@gmail.com', N'mana', N'mana123')
INSERT [dbo].[Manager] ([Manager_Id], [Manager_FirstName], [Manager_LastName], [Manager_Gender], [Manager_Status], [Manager_Address], [Manager_Email], [Manager_Username], [Manager_Password]) VALUES (6, N'มานี', N'ขัติยะ', 0, 5, N'	เลขที่ 199/9 หมู่ที่ 13 ตำบลรอบเวียง อำเภอเมืองเชียงราย จังหวัดเชียงราย 57000', N'manee@gmail.com', N'manee', N'manee123')
SET IDENTITY_INSERT [dbo].[Manager] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (113, 1, N'เซรั่มผิวขาว', N'ช่วยให้ผิวขาวกระจ่างใส', N'ทาบริเวณใบหน้า', 1022)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (116, 3, N'โคลนมาร์ก', N'ช่วยให้หน้าเรียบเนียน', N'ทาบริเวณหน้า', 1027)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (117, 2, N'เซรั่มวิตามินซี', N'ช่วยให่ผิวกระจ่างใส', N'ทาบริเวณใบหน้า	', 1022)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (118, 4, N'เจลมาร์กสโนว์	', N'ช่วยผิวนุ่มชุ่มชชื่น', N'ทาบริเวณใบหน้า	', 1027)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (119, 5, N'โบท็อกซ์', N'ช่วยให้หน้ากระชับเต่งตึง', N'ฉีดเข้าบริเวณใบหน้า', 2)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (120, 6, N'FILLER', N'ช่วยลดริ้วรอย ผิวอิ่มน้ำ เต่งตึง', N'ฉีดเข้าบริเวณใบหน้า', 2)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (121, 7, N'อีลาสติน', N'ช่วยยับยั้งกระบวนการสร้างเม็ดสีเมลามิน', N'ทาบริเวณใบหน้า', 2)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (122, 8, N'ซิลิโคน', N'เสริมจมูก', N'เสริมจมูก', 2)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (123, 9, N'ยาชา', N'สำหรับฉีดเข้าร่างกาย', N'ฉีดเข้าร่างกาย', 3)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (124, 10, N'แอลกอฮอล้างแผล', N'ทาบริเวญแผล	', N'ทาบริเวญแผล	', 1010)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (125, 11, N'ไหมเย็บแผล', N'ใช้เย็บแผล', N'ร้อยแผลให้สมานกัน', 1)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (126, 12, N'เข็มฉีดยา', N'อุปกรณ์ฉีดยาเข้าร่างกาย', N'ใช้ฉีดยาเข้าร่างกาย', 1)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (127, 13, N'คอลลาเจน', N'ช่วยให้ผิวเด้ง เต่งตึง', N'ฉีดเข้าที่ใบหน้า', 2)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (130, 14, N'ยาสลบ', N'กดประสาทส่วนกลาง', N'สูดดม', 3)
INSERT [dbo].[Product] ([Product_Id], [Product_Code], [Product_Name], [Product_Des], [Product_Instruction], [ProductType_Id]) VALUES (131, 22, N'ยารักษาสิว1', N'รักษาสิว1', N'รักาาสิว1', 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductType_Id], [ProductType_Name]) VALUES (1, N'ใช้แล้วทิ้ง')
INSERT [dbo].[ProductType] ([ProductType_Id], [ProductType_Name]) VALUES (2, N'ผลิตภัณฑ์เสริมความงาม')
INSERT [dbo].[ProductType] ([ProductType_Id], [ProductType_Name]) VALUES (3, N'ยาระงับประสาทความรู้สึก')
INSERT [dbo].[ProductType] ([ProductType_Id], [ProductType_Name]) VALUES (1010, N'ยาสมานแผล')
INSERT [dbo].[ProductType] ([ProductType_Id], [ProductType_Name]) VALUES (1022, N'เซรัม')
INSERT [dbo].[ProductType] ([ProductType_Id], [ProductType_Name]) VALUES (1027, N'เจลมาร์ก')
INSERT [dbo].[ProductType] ([ProductType_Id], [ProductType_Name]) VALUES (1041, N'ปฎิชีวนะ')
SET IDENTITY_INSERT [dbo].[ProductType] OFF
SET IDENTITY_INSERT [dbo].[ReqProduct] ON 

INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (34, CAST(N'2018-05-06' AS Date), 100, 2, 12, 0, 50)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (35, CAST(N'2018-05-06' AS Date), 160, 2, 8, 0, 100)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (36, CAST(N'2018-05-06' AS Date), 150, 2, 7, 0, 150)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (37, CAST(N'2018-05-06' AS Date), 120, 3, 1, 0, 120)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (39, CAST(N'2018-05-06' AS Date), 150, 3, 9, 0, 150)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (40, CAST(N'2018-05-06' AS Date), 180, 3, 10, 0, 180)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (41, CAST(N'2018-05-06' AS Date), 110, 3, 12, 0, 110)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (42, CAST(N'2018-05-06' AS Date), 130, 4, 4, 0, 130)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (43, CAST(N'2018-05-06' AS Date), 170, 4, 5, 0, 170)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (44, CAST(N'2018-05-06' AS Date), 160, 4, 6, 0, 160)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (45, CAST(N'2018-05-06' AS Date), 200, 4, 12, 0, 200)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (46, CAST(N'2018-05-06' AS Date), 120, 5, 2, 0, 120)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (47, CAST(N'2018-05-06' AS Date), 100, 5, 3, 0, 100)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (48, CAST(N'2018-05-06' AS Date), 120, 5, 6, 0, 100)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (49, CAST(N'2018-05-06' AS Date), 130, 6, 5, 0, 130)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (50, CAST(N'2018-05-06' AS Date), 90, 6, 7, 0, 90)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (51, CAST(N'2018-05-06' AS Date), 120, 6, 8, 0, 90)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (52, CAST(N'2018-05-06' AS Date), 100, 6, 9, 0, 50)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (54, CAST(N'2018-05-07' AS Date), 200, 5, 6, 0, 10)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (55, CAST(N'2018-05-08' AS Date), 100, 5, 3, 0, 50)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (56, CAST(N'2018-05-09' AS Date), 40, 5, 13, 1, 0)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (57, CAST(N'2018-05-09' AS Date), 150, 5, 8, 1, 0)
INSERT [dbo].[ReqProduct] ([ReqProduct_Id], [ReqDate], [ReqQuantity], [Branch_Id], [Product_Code], [statusReq], [QuantityUpdate]) VALUES (58, CAST(N'2018-05-09' AS Date), 90, 5, 13, 1, 0)
SET IDENTITY_INSERT [dbo].[ReqProduct] OFF
SET IDENTITY_INSERT [dbo].[ReservationCourse] ON 

INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (1, CAST(N'2018-09-23' AS Date), 1, 1, 6, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (2, CAST(N'2018-09-23' AS Date), 1, 2, 6, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (3, CAST(N'2018-07-12' AS Date), 1, 2, 5, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (4, CAST(N'2018-07-12' AS Date), 1, 4, 5, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (5, CAST(N'2018-08-21' AS Date), 1, 2, 2, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (6, CAST(N'2018-08-21' AS Date), 1, 3, 2, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (7, CAST(N'2018-08-21' AS Date), 1, 1, 3, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (8, CAST(N'2018-08-21' AS Date), 1, 4, 3, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (9, CAST(N'2018-09-21' AS Date), 1, 3, 4, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (10, CAST(N'2018-09-21' AS Date), 1, 2, 4, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (11, CAST(N'2018-06-16' AS Date), 1, 3, 3, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (12, CAST(N'2018-05-02' AS Date), 1, 3, 3, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (13, CAST(N'2018-09-09' AS Date), 1, 1, 5, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (14, CAST(N'2018-04-20' AS Date), 1, 2, 4, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (15, CAST(N'2018-04-20' AS Date), 1, 2, 4, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (16, CAST(N'2018-05-20' AS Date), 1, 2, 4, CAST(N'2018-04-30' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (17, CAST(N'2018-06-20' AS Date), 1, 3, 5, CAST(N'2018-05-03' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (18, CAST(N'2018-09-09' AS Date), 1, 2, 5, CAST(N'2018-05-04' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (19, CAST(N'2018-06-19' AS Date), 1, 3, 5, CAST(N'2018-05-04' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (20, CAST(N'2018-12-28' AS Date), 1, 5, 1, CAST(N'2018-05-06' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (21, CAST(N'2018-12-27' AS Date), 1, 5, 1, CAST(N'2018-05-06' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (22, CAST(N'2018-10-09' AS Date), 1, 3, 5, CAST(N'2018-05-09' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (23, CAST(N'2018-10-09' AS Date), 1, 1, 5, CAST(N'2018-05-09' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (24, CAST(N'2018-10-09' AS Date), 1, 4, 3, CAST(N'2018-05-09' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (25, CAST(N'2018-10-09' AS Date), 1, 2, 3, CAST(N'2018-05-09' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (26, CAST(N'2018-03-09' AS Date), 1, 2, 3, CAST(N'2018-02-09' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (27, CAST(N'2018-01-23' AS Date), 1, 2, 3, CAST(N'2018-01-09' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (28, CAST(N'2018-01-23' AS Date), 1, 2, 5, CAST(N'2018-01-09' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (29, CAST(N'2018-02-19' AS Date), 1, 2, 5, CAST(N'2018-01-09' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (30, CAST(N'2018-09-19' AS Date), 1, 2, 5, CAST(N'2018-05-10' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (31, CAST(N'2018-09-19' AS Date), 1, 5, 5, CAST(N'2018-05-10' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (32, CAST(N'2018-12-12' AS Date), 1, 2, 5, CAST(N'2018-05-11' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (33, CAST(N'2018-11-23' AS Date), 1, 4, 5, CAST(N'2018-05-11' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (34, CAST(N'2018-08-07' AS Date), 1, 3, 4, CAST(N'2018-05-14' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (35, CAST(N'2018-08-19' AS Date), 1, 3, 4, CAST(N'2018-05-14' AS Date))
INSERT [dbo].[ReservationCourse] ([ReservationCourse_Id], [ReservationCourse_Date], [ReservationCourse_Status], [Course_Id], [Branch_Id], [currentDate]) VALUES (36, CAST(N'2018-08-19' AS Date), 1, 3, 4, CAST(N'2018-05-15' AS Date))
SET IDENTITY_INSERT [dbo].[ReservationCourse] OFF
SET IDENTITY_INSERT [dbo].[SupplyProduct] ON 

INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4320, CAST(N'2018-05-06' AS Date), 180, 2, 261, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4321, CAST(N'2018-05-06' AS Date), 200, 2, 262, 2)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4322, CAST(N'2018-05-06' AS Date), 100, 2, 263, 3)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4323, CAST(N'2018-05-06' AS Date), 200, 2, 264, 4)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4324, CAST(N'2018-05-06' AS Date), 120, 2, 265, 5)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4325, CAST(N'2018-05-06' AS Date), 200, 2, 266, 6)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4326, CAST(N'2018-05-06' AS Date), 160, 2, 267, 7)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4327, CAST(N'2018-05-06' AS Date), 190, 2, 277, 8)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4328, CAST(N'2018-05-06' AS Date), 150, 2, 274, 9)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4329, CAST(N'2018-05-06' AS Date), 100, 2, 270, 10)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4330, CAST(N'2018-05-06' AS Date), 100, 2, 271, 11)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4331, CAST(N'2018-05-06' AS Date), 100, 2, 272, 12)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4332, CAST(N'2018-05-06' AS Date), 120, 2, 273, 13)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4333, CAST(N'2018-05-06' AS Date), 180, 3, 261, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4334, CAST(N'2018-05-06' AS Date), 200, 3, 262, 2)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4335, CAST(N'2018-05-06' AS Date), 100, 3, 263, 3)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4336, CAST(N'2018-05-06' AS Date), 190, 3, 264, 4)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4337, CAST(N'2018-05-06' AS Date), 180, 3, 265, 5)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4338, CAST(N'2018-05-06' AS Date), 200, 3, 266, 6)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4339, CAST(N'2018-05-06' AS Date), 170, 3, 267, 7)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4340, CAST(N'2018-05-06' AS Date), 120, 3, 277, 8)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4341, CAST(N'2018-05-06' AS Date), 100, 3, 274, 9)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4342, CAST(N'2018-05-06' AS Date), 130, 3, 270, 10)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4343, CAST(N'2018-05-06' AS Date), 190, 3, 272, 12)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4344, CAST(N'2018-05-06' AS Date), 200, 3, 273, 13)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4345, CAST(N'2018-05-06' AS Date), 180, 4, 261, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4346, CAST(N'2018-05-06' AS Date), 200, 4, 262, 2)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4347, CAST(N'2018-05-06' AS Date), 100, 4, 263, 3)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4348, CAST(N'2018-05-06' AS Date), 190, 4, 264, 4)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4349, CAST(N'2018-05-06' AS Date), 180, 4, 265, 5)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4350, CAST(N'2018-05-06' AS Date), 200, 4, 266, 6)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4351, CAST(N'2018-05-06' AS Date), 170, 4, 267, 7)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4352, CAST(N'2018-05-06' AS Date), 120, 4, 277, 8)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4353, CAST(N'2018-05-06' AS Date), 100, 4, 274, 9)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4354, CAST(N'2018-05-06' AS Date), 130, 4, 270, 10)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4355, CAST(N'2018-05-06' AS Date), 140, 4, 271, 11)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4356, CAST(N'2018-05-06' AS Date), 190, 4, 272, 12)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4357, CAST(N'2018-05-06' AS Date), 200, 4, 273, 13)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4358, CAST(N'2018-05-06' AS Date), 180, 5, 261, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4359, CAST(N'2018-05-06' AS Date), 200, 5, 262, 2)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4360, CAST(N'2018-05-06' AS Date), 100, 5, 263, 3)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4361, CAST(N'2018-05-06' AS Date), 190, 5, 264, 4)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4362, CAST(N'2018-05-06' AS Date), 180, 5, 265, 5)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4363, CAST(N'2018-05-06' AS Date), 200, 5, 266, 6)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4364, CAST(N'2018-05-06' AS Date), 170, 5, 267, 7)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4365, CAST(N'2018-05-06' AS Date), 120, 5, 277, 8)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4366, CAST(N'2018-05-06' AS Date), 100, 5, 274, 9)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4367, CAST(N'2018-05-06' AS Date), 130, 5, 270, 10)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4368, CAST(N'2018-05-06' AS Date), 140, 5, 271, 11)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4369, CAST(N'2018-05-06' AS Date), 190, 5, 272, 12)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4370, CAST(N'2018-05-06' AS Date), 200, 5, 273, 13)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4371, CAST(N'2018-05-06' AS Date), 180, 6, 261, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4372, CAST(N'2018-05-06' AS Date), 200, 6, 262, 2)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4373, CAST(N'2018-05-06' AS Date), 100, 6, 263, 3)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4374, CAST(N'2018-05-06' AS Date), 190, 6, 264, 4)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4375, CAST(N'2018-05-06' AS Date), 200, 6, 266, 6)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4376, CAST(N'2018-05-06' AS Date), 170, 6, 267, 7)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4377, CAST(N'2018-05-06' AS Date), 120, 6, 277, 8)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4378, CAST(N'2018-05-06' AS Date), 200, 6, 273, 13)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4379, CAST(N'2018-05-06' AS Date), 190, 6, 272, 12)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4380, CAST(N'2018-05-06' AS Date), 140, 6, 271, 11)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4381, CAST(N'2018-05-06' AS Date), 130, 6, 270, 10)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4382, CAST(N'2018-05-06' AS Date), 100, 6, 274, 9)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4383, CAST(N'2018-05-06' AS Date), 120, 6, 277, 8)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4384, CAST(N'2018-05-06' AS Date), 170, 6, 267, 7)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4385, CAST(N'2018-05-06' AS Date), 30, 6, 262, 2)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4386, CAST(N'2018-05-06' AS Date), 50, 6, 277, 8)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4387, CAST(N'2018-05-06' AS Date), 60, 2, 277, 8)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4388, CAST(N'2018-05-06' AS Date), 30, 4, 342, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4389, CAST(N'2018-05-06' AS Date), 10, 4, 261, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4390, CAST(N'2018-05-06' AS Date), 50, 5, 344, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4391, CAST(N'2018-05-07' AS Date), 10, 5, 261, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4392, CAST(N'2018-05-06' AS Date), 40, 6, 346, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4393, CAST(N'2018-05-07' AS Date), 10, 6, 261, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4394, CAST(N'2018-05-07' AS Date), 50, 6, 266, 6)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4395, CAST(N'2018-05-06' AS Date), 40, 3, 265, 5)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4396, CAST(N'2018-05-06' AS Date), 10, 3, 275, 5)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4397, CAST(N'2018-05-07' AS Date), 50, 4, 349, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4398, CAST(N'2018-05-07' AS Date), 20, 4, 261, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4399, CAST(N'2018-05-07' AS Date), 50, 2, 272, 12)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4400, CAST(N'2018-05-07' AS Date), 250, 5, 261, 1)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4401, CAST(N'2018-05-09' AS Date), 40, 2, 277, 8)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4403, CAST(N'2018-05-09' AS Date), 40, 5, 273, 13)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4404, CAST(N'2018-05-09' AS Date), 150, 5, 277, 8)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4405, CAST(N'2018-05-09' AS Date), 90, 5, 273, 13)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4406, CAST(N'2018-05-10' AS Date), 100, 5, 351, 14)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4407, CAST(N'2018-05-10' AS Date), 50, 5, 266, 6)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4408, CAST(N'2018-05-10' AS Date), 30, 5, 263, 3)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4409, CAST(N'2018-05-10' AS Date), 100, 4, 351, 14)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4410, CAST(N'2018-05-10' AS Date), 20, 5, 266, 6)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4411, CAST(N'2018-05-10' AS Date), 50, 6, 274, 9)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4412, CAST(N'2018-05-10' AS Date), 20, 5, 263, 3)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4413, CAST(N'2018-05-10' AS Date), 20, 5, 266, 6)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4414, CAST(N'2018-05-10' AS Date), 30, 5, 266, 6)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4415, CAST(N'2018-05-10' AS Date), 30, 5, 266, 6)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4416, CAST(N'2018-05-10' AS Date), 30, 5, 266, 6)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4417, CAST(N'2018-05-10' AS Date), 30, 5, 266, 6)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4418, CAST(N'2018-05-10' AS Date), 20, 6, 277, 8)
INSERT [dbo].[SupplyProduct] ([SupplyProduct_Id], [SupplyDate], [SupplyQuantity], [Branch_Id], [BranchProduct_Id], [Product_Code]) VALUES (4419, CAST(N'2018-05-10' AS Date), 10, 6, 277, 8)
GO
SET IDENTITY_INSERT [dbo].[SupplyProduct] OFF
SET IDENTITY_INSERT [dbo].[UseProducts] ON 

INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (121, CAST(N'2018-05-06' AS Date), 50, 1, 2, 5, 3)
INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (122, CAST(N'2018-05-06' AS Date), 30, 1, 5, 5, 3)
INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (123, CAST(N'2018-05-06' AS Date), 20, 1, 7, 5, 3)
INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (124, CAST(N'2018-05-06' AS Date), 20, 2, 5, 5, 5)
INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (125, CAST(N'2018-05-06' AS Date), 30, 2, 8, 5, 5)
INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (126, CAST(N'2018-05-07' AS Date), 10, 3, 2, 5, 1)
INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (127, CAST(N'2018-05-07' AS Date), 10, 3, 5, 5, 1)
INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (128, CAST(N'2018-05-07' AS Date), 20, 3, 12, 5, 1)
INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (129, CAST(N'2018-05-06' AS Date), 40, 4, 1, 5, 6)
INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (130, CAST(N'2018-05-08' AS Date), 20, 5, 7, 5, 2)
INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (131, CAST(N'2018-05-08' AS Date), 10, 5, 2, 5, 2)
INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (132, CAST(N'2018-05-08' AS Date), 20, 5, 12, 5, 2)
INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (133, CAST(N'2018-05-09' AS Date), 10, 6, 10, 5, 4)
INSERT [dbo].[UseProducts] ([UseProduct_Id], [UseDate], [UseQuantity], [use_key], [Product_Code], [Branch_Id], [Course_Id]) VALUES (134, CAST(N'2018-05-09' AS Date), 30, 6, 13, 5, 4)
SET IDENTITY_INSERT [dbo].[UseProducts] OFF
/****** Object:  StoredProcedure [dbo].[sp_add_ProductAmount]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_add_ProductAmount]
@code int , @amount int ,@date date , @bid int
as
begin
		insert into BranchProduct
		(Product_Code,BranchProduct_Amount,BranchProduct_EXP,Branch_Id)
		values (@code,@amount,@date,@bid)

		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_add_productReq_into_BP]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_add_productReq_into_BP]
@code int , @amount int ,@date date , @bid int ,@note nvarchar(100)
as
begin
		insert into BranchProduct
		(Product_Code,BranchProduct_Amount,BranchProduct_EXP,Branch_Id,note)
		values (@code,@amount,@date,@bid,@note)

		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_check_amountReservation]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_check_amountReservation]
@bid int ,@code int
as
begin
		select BranchProduct.Product_Code,Product.Product_Name,ProductType.ProductType_Name ,sum(BranchProduct.BranchProduct_Amount) As sumAmount
		from BranchProduct 
		inner join  Product on BranchProduct.Product_Code = Product.Product_Code inner join  ProductType on Product.ProductType_Id = ProductType.ProductType_Id
		 where BranchProduct.Branch_Id = @bid  and BranchProduct.Product_Code = @code
		group by BranchProduct.Product_Code, Product.Product_Name, ProductType.ProductType_Name

end
GO
/****** Object:  StoredProcedure [dbo].[sp_check_email]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_check_email]
@email  nvarchar(30)  
as 

begin
	select Manager_Email
	from Manager
	where Manager_Email = @email
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_check_same_product]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_check_same_product]
@code int , @amount int ,@date date , @bid int ,@note nvarchar(100)
as
begin
		
		select *
		from BranchProduct
		where Branch_Id = @bid and Product_Code = @code And  BranchProduct_EXP = @date


end
GO
/****** Object:  StoredProcedure [dbo].[sp_check_supplyReq]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_check_supplyReq]
@Code int , @bid int
as
begin
		select top 1	BranchProduct_Id, BranchProduct_Amount,BranchProduct_EXP,Product_Code
		from BranchProduct
		where Product_Code = @Code and Branch_Id = @bid 
		ORDER BY CONVERT(datetime, BranchProduct_EXP ) ASC

end
GO
/****** Object:  StoredProcedure [dbo].[sp_check_suppy]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_check_suppy]
@code int  ,@date date ,@bid int
as
begin
	select COUNT(BranchProduct_Id) as countProduct from BranchProduct
	where Branch_Id = @bid And Product_Code = @code And BranchProduct_EXP = @date 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_del_Product]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_del_Product]
@code int
as
begin
	
		Delete  from BranchProduct
		where BranchProduct_Id = @code ;
		
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_del_ProductOnly]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_del_ProductOnly]
@id int
as
begin
	
		Delete  from Product
		where Product_Code = @id ;
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_del_typeProduct]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_del_typeProduct]
@code int 
as
begin


		delete  from ProductType
		where ProductType_Id = @code
		
		
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_edit_manage]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_edit_manage]
@first nvarchar(30) ,@last  nvarchar(30) , @gender int ,@status int ,@email  nvarchar(30)  ,@user  nvarchar(30) , @pass  nvarchar(30),@add  nvarchar(30) ,@mid int
as 

begin
	update Manager  
	set Manager_FirstName = @first , Manager_LastName = @last,Manager_Gender = @gender ,Manager_Email= @email ,
	Manager_Address =@add ,Manager_Username = @user ,Manager_Password = @pass
	where Manager_Id =@mid 
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_ALLCP]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_get_ALLCP]

as
begin
		select CourseProduct.CourseProduct_Id, CourseProduct.Product_Code , Product.Product_Name , Amount ,CourseProduct.Course_Id ,Course.Course_Name
		from CourseProduct ,Product , Course
		where CourseProduct.Product_Code =  Product.Product_Code and CourseProduct.Course_Id = Course.Course_Id
		GROUP BY CourseProduct.Course_Id, CourseProduct.CourseProduct_Id, CourseProduct.Product_Code , Product.Product_Name , Amount  ,Course.Course_Name
		ORDER BY CourseProduct.Course_Id ASC
		  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_Allmanager]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_Allmanager]
as
begin
		select Manager.Manager_Id, Manager.Manager_FirstName ,Manager.Manager_LastName ,Branch.Branch_Name,Manager.Manager_Gender,Manager.Manager_Status,Manager.Manager_Address,Manager.Manager_Email,Manager.Manager_Username
from Manager ,Branch
where Manager.Manager_Id = Branch.Manager_Id and Manager.Manager_Status > 0
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_Allreq]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_Allreq]

as
begin
		select Branch.Branch_Name,
				Product.Product_Name,
				ReqProduct.ReqDate,
				ReqProduct.QuantityUpdate,
				ReqProduct.Product_Code,
				ReqProduct.Branch_Id,
				ReqProduct.ReqProduct_Id
		from [dbo].[ReqProduct],[dbo].[Product],[dbo].[Branch]
		where [dbo].ReqProduct.Product_Code =Product.Product_Code 
		and [dbo].[ReqProduct].Branch_Id = [dbo].[Branch].Branch_Id  and statusReq = 0
		ORDER BY CONVERT(datetime, ReqProduct.ReqDate ) ASC
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_branch_Id]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_get_branch_Id]
	
	@m_id int
AS
BEGIN
	select Branch_Id
	from Branch
	where Manager_Id = @m_id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_Branch_req]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_get_Branch_req]
@b_id int
as
begin

		select 
				Product.Product_Name,
				ReqProduct.ReqDate,
				ReqProduct.ReqQuantity,
				ReqProduct.Product_Code
		from [dbo].[ReqProduct],[dbo].[Product]
		where [dbo].ReqProduct.Product_Code =Product.Product_Code 
		and [dbo].[ReqProduct].Branch_Id = @b_id

end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_branches]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_branches]
as
begin
	
		select * from [dbo].[Branch]
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_branchProduct]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_branchProduct]
@Manager_Status int
as
begin
	
		select [dbo].[BranchProduct].[Branch_Id],
		[dbo].[BranchProduct].[BranchProduct_Id],
		[dbo].[Product].Product_Code,
		[dbo].[Product].Product_Name,
		[dbo].[BranchProduct].BranchProduct_Amount,
		[dbo].[BranchProduct].BranchProduct_EXP,
		[dbo].[Product].Product_Des,
		[dbo].[Product].Product_Instruction,
		[dbo].[ProductType].ProductType_Name,
		[dbo].[BranchProduct].[Notifications_Amount1],
		[dbo].[BranchProduct].[Notifications_Amount2],
		[dbo].[BranchProduct].[Notifications_Amount3],
		[dbo].[BranchProduct].[Notifications_Exp1],
		[dbo].[BranchProduct].[Notifications_Exp2],
		[dbo].[BranchProduct].[Notifications_Exp3],
		[dbo].[BranchProduct].note
		
		from [dbo].[BranchProduct],[dbo].[Product],[dbo].[ProductType]
		where [dbo].BranchProduct.Branch_Id=@Manager_Status and [dbo].[BranchProduct].Product_Code = [dbo].[Product].Product_Code and [dbo].[Product].ProductType_Id = [dbo].ProductType.ProductType_Id and BranchProduct_Amount != 0
		 group by [dbo].[BranchProduct].[Branch_Id],
		[dbo].[BranchProduct].[BranchProduct_Id],
		[dbo].[Product].Product_Code,
		[dbo].[Product].Product_Name,
		[dbo].[BranchProduct].BranchProduct_Amount,
		[dbo].[BranchProduct].BranchProduct_EXP,
		[dbo].[Product].Product_Des,
		[dbo].[Product].Product_Instruction,
		[dbo].[ProductType].ProductType_Name,
		[dbo].[BranchProduct].[Notifications_Amount1],
		[dbo].[BranchProduct].[Notifications_Amount2],
		[dbo].[BranchProduct].[Notifications_Amount3],
		[dbo].[BranchProduct].[Notifications_Exp1],
		[dbo].[BranchProduct].[Notifications_Exp2],
		[dbo].[BranchProduct].[Notifications_Exp3],
		[dbo].[BranchProduct].note
		ORDER BY Product_Code asc , BranchProduct_EXP asc
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_check_req]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_check_req]
@Code int
as
begin


		select	Branch.Branch_Name,
				Product.Product_Name,
				ReqProduct.ReqDate,
				ReqProduct.ReqQuantity,
				ReqProduct.Product_Code
		from [dbo].[ReqProduct],[dbo].[Product],[dbo].[Branch]
		where [dbo].ReqProduct.Product_Code =Product.Product_Code 
		and [dbo].[ReqProduct].Branch_Id = [dbo].[Branch].Branch_Id  
		and  [dbo].ReqProduct.Product_Code = @Code
		ORDER BY CONVERT(datetime, ReqProduct.ReqDate ) ASC

end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_course]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_get_course]
as
begin
	
		select * from [dbo].Course
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_CP]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_CP]
@id_c int
as
begin
		select CourseProduct.Product_Code , Product.Product_Name , Amount
		from CourseProduct ,Product
		where CourseProduct.Course_Id = @id_c and CourseProduct.Product_Code = Product.Product_Code
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_Headmanager]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_Headmanager]
as
begin
	select Manager.Manager_Id, Manager.Manager_FirstName ,Manager.Manager_LastName ,Branch.Branch_Name,Manager.Manager_Gender,Manager.Manager_Status,Manager.Manager_Address,Manager.Manager_Email,Manager.Manager_Username
from Manager ,Branch
where Manager.Manager_Id = Branch.Manager_Id and Manager.Manager_Status =0
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_key]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_key]
as
begin
		select MAX(use_key) as useKey
		from dbo.UseProducts
		
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_manager]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_manager]

as
begin
	
		select * 
		from Manager

end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_password]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_get_password]
@email  nvarchar(30)  
as 
begin
	select Manager_Password
	from Manager
	where Manager_Email = @email
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_Product]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_Product]

as
begin
		select product.Product_Code,product.Product_Des,product.Product_Instruction,product.Product_Name,ProductType.ProductType_Name from product,ProductType
		where Product.ProductType_Id = ProductType.ProductType_Id
		ORDER BY Product_Code asc 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_Product_from_id]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_get_Product_from_id]
@Code int ,@bid int
as
begin


		select	BranchProduct_Id , BranchProduct_EXP
		from BranchProduct
		where Product_Code = @Code and Branch_Id = @bid
		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_ProductAddamount]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_ProductAddamount]
@bid int
as
begin
		select BranchProduct.Product_Code,Product.Product_Name,ProductType.ProductType_Name,Product.Product_Des,Product.Product_Instruction ,sum(BranchProduct.BranchProduct_Amount) As sumAmount
		from BranchProduct 
		inner join  Product on BranchProduct.Product_Code = Product.Product_Code inner join  ProductType on Product.ProductType_Id = ProductType.ProductType_Id
		 where BranchProduct.Branch_Id = @bid 
		group by BranchProduct.Product_Code, Product.Product_Name, ProductType.ProductType_Name,Product.Product_Des,Product.Product_Instruction

end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_ProductType]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_get_ProductType]

as
begin

		select * from [dbo].[ProductType]
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_report_total_reservation]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_report_total_reservation]
@dateStart date , @dateEnd date
as
begin
		
		select  Course.Course_Name,count(Course.Course_Name ) as numberOfCourse
		from ReservationCourse , Course
		where   ReservationCourse.Course_Id = Course.Course_Id  and ReservationCourse.ReservationCourse_Date BETWEEN @dateStart AND @dateEnd 
		group by Course.Course_Name
		order by Course.Course_Name

end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_ReqAmount]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_ReqAmount]
@code int , @bid int
as
begin
		select sum(BranchProduct_Amount) as BranchProduct_Amount
		from BranchProduct
		where Product_Code = @code and Branch_Id = @bid

		

		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_reservation]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_reservation]
@bid int ,@date date
as
begin


		select ReservationCourse.ReservationCourse_Date,ReservationCourse.ReservationCourse_Status,Course.Course_Name,ReservationCourse.Course_Id,ReservationCourse_Id
		from ReservationCourse , Course
		where ReservationCourse.Branch_Id = @bid and ReservationCourse.Course_Id = Course.Course_Id and ReservationCourse_Date >= @date
		order by ReservationCourse.ReservationCourse_Date

end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_status]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_status]
@user nvarchar
as
begin
	
		select Manager_Status
		from Manager
		where Manager_Username = @user

end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_status_req]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_status_req]
@req_id int
as
begin
	select QuantityUpdate, statusReq
	from ReqProduct
	where ReqProduct_Id =  @req_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_get_useProduct]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_get_useProduct]
as
	
	begin
		
		select * from [dbo].[UseProduct]
	end


------ execute -------------
exec sp_get_useProduct  -- insert self information
GO
/****** Object:  StoredProcedure [dbo].[sp_input_reqAmount]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_input_reqAmount]
@code int , @bid int ,@date date, @amount int ,@hid int
as
begin
		insert into SupplyProduct
		(Product_Code,Branch_Id,SupplyDate,SupplyQuantity)
		values (@code,@bid,@date,@amount)

		 update BranchProduct
		 set BranchProduct_Amount = BranchProduct_Amount  -  @amount
		 where Branch_Id =@hid  and Product_Code = @code

		 update BranchProduct
		 set BranchProduct_Amount = BranchProduct_Amount  +  @amount
		 where Branch_Id =@bid  and Product_Code = @code

		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_Product]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_insert_Product]
@code int ,@name nvarchar(30),@des nvarchar(200),@ins nvarchar(200),@typeid int , @idb int 
as
begin


		insert into [dbo].[Product]
		( 
		[Product_Code],
		[Product_Name],
		[Product_Des],
		[Product_Instruction],
		[ProductType_Id])
		values 
		(@code,@name,@des,@ins,@typeid);
		

		
		
		
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_ProductType]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_insert_ProductType]
@type nvarchar(30)
as
begin

		insert into [dbo].[ProductType]
		( 
		[ProductType_Name])
		values
		(@type)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_reservation]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_insert_reservation]
@date date , @status int, @bid int , @cid int 
as
begin

		insert into ReservationCourse (ReservationCourse_Date,ReservationCourse_Status,Branch_Id,Course_Id)
		values (@date  , @status , @bid  , @cid  )


end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_supply_REQ]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_insert_supply_REQ]
@code int ,@number int ,@branchid int ,@date date,@head_id int,@BP_id int,@amountUpdate int,@req_id int
as
begin
	
		insert into dbo.SupplyProduct
		 (SupplyDate,SupplyQuantity,Branch_Id,BranchProduct_Id,Product_Code) 
		 values (@date,@number, @branchid,@BP_id,@code)

		 update BranchProduct
		 set BranchProduct_Amount = BranchProduct_Amount - @number 
		 where Branch_Id =@head_id  and BranchProduct_Id = @BP_id

		 update ReqProduct 
		 set QuantityUpdate  = QuantityUpdate - @number
		 where ReqProduct_Id = @req_id

end
GO
/****** Object:  StoredProcedure [dbo].[sp_insert_supply_REQ_Equal]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_insert_supply_REQ_Equal]
@code int ,@number int ,@branchid int ,@date date,@head_id int,@BP_id int ,@req_id int
as
begin
	
		insert into dbo.SupplyProduct
		 (SupplyDate,SupplyQuantity,Branch_Id,BranchProduct_Id,Product_Code) 
		 values (@date,@number, @branchid,@BP_id,@code)

		 delete from BranchProduct
		 where Branch_Id =@head_id  and BranchProduct_Id = @BP_id
		 
		  update ReqProduct 
		 set QuantityUpdate  = QuantityUpdate - @number
		 where ReqProduct_Id = @req_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_login]
	-- Add the parameters for the stored procedure here
	@user nvarchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [dbo].[Manager].Manager_Username , [dbo].[Manager].[Manager_Password],[dbo].[Manager].Manager_Id  from [dbo].[Manager] where [dbo].[Manager].Manager_Username = @user;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_noti_reservation]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_noti_reservation]
@bid int ,@cDate date
as
begin


		select ReservationCourse.ReservationCourse_Date,ReservationCourse.ReservationCourse_Status,Course.Course_Name,ReservationCourse.Course_Id,ReservationCourse_Id
		from ReservationCourse , Course
		where ReservationCourse.Branch_Id = @bid and ReservationCourse.Course_Id = Course.Course_Id and currentDate = @Cdate

end
GO
/****** Object:  StoredProcedure [dbo].[sp_report_req]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_report_req]
 @dateStart date , @dateEnd date
as
begin
	select ReqProduct.ReqDate	,Branch.Branch_Name,Product.Product_Name,ReqProduct.ReqQuantity
		from ReqProduct,Branch,Product
		where   ReqProduct.Product_Code = Product.Product_Code and ReqProduct.Branch_Id = Branch.Branch_Id and ReqProduct.ReqDate BETWEEN  @dateStart AND @dateEnd
		ORDER BY CONVERT(date, ReqProduct.ReqDate ) ASC
end
GO
/****** Object:  StoredProcedure [dbo].[sp_report_req_branch]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_report_req_branch]
 @dateStart date , @dateEnd date ,@bid int 
as
begin
	select ReqProduct.ReqDate	,Branch.Branch_Name,Product.Product_Name,ReqProduct.ReqQuantity
		from ReqProduct,Branch,Product
		where   ReqProduct.Product_Code = Product.Product_Code and ReqProduct.Branch_Id = Branch.Branch_Id 
		and ReqProduct.ReqDate BETWEEN  @dateStart AND @dateEnd and ReqProduct.Branch_Id = @bid
		ORDER BY CONVERT(date, ReqProduct.ReqDate ) ASC
end
GO
/****** Object:  StoredProcedure [dbo].[sp_report_reservation]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_report_reservation]
 @dateStart date , @dateEnd date
as
begin
	select ReservationCourse.ReservationCourse_Date,Branch.Branch_Name,Course.Course_Name
		from ReservationCourse,Branch,Course
		where   ReservationCourse.Course_Id = Course.Course_Id and ReservationCourse.Branch_Id = Branch.Branch_Id and ReservationCourse.ReservationCourse_Date BETWEEN @dateStart AND @dateEnd
		ORDER BY CONVERT(date, ReservationCourse.ReservationCourse_Date  ) ASC
end
GO
/****** Object:  StoredProcedure [dbo].[sp_report_reservation_branch]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_report_reservation_branch]
 @dateStart date , @dateEnd date , @bid int 
as
begin
	select ReservationCourse.ReservationCourse_Date,Branch.Branch_Name,Course.Course_Name
		from ReservationCourse,Branch,Course
		where   ReservationCourse.Course_Id = Course.Course_Id and ReservationCourse.Branch_Id = Branch.Branch_Id
		 and ReservationCourse.ReservationCourse_Date BETWEEN @dateStart AND @dateEnd and ReservationCourse.branch_Id = @bid
		ORDER BY CONVERT(date, ReservationCourse.ReservationCourse_Date  ) ASC
end
GO
/****** Object:  StoredProcedure [dbo].[sp_report_supply]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_report_supply]
 @dateStart date , @dateEnd date
as
begin
		select SupplyProduct.SupplyDate	,Branch.Branch_Name,Product.Product_Name,SupplyProduct.SupplyQuantity
		from SupplyProduct,Branch,Product
		where   SupplyProduct.Product_Code = Product.Product_Code and SupplyProduct.Branch_Id = Branch.Branch_Id and SupplyProduct.SupplyDate BETWEEN  @dateStart AND @dateEnd
		ORDER BY CONVERT(date, SupplyProduct.SupplyDate ) ASC


end
GO
/****** Object:  StoredProcedure [dbo].[sp_report_supply_branch]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_report_supply_branch]
 @dateStart date , @dateEnd date ,@bid int 
as
begin
		select SupplyProduct.SupplyDate	,Branch.Branch_Name,Product.Product_Name,SupplyProduct.SupplyQuantity
		from SupplyProduct,Branch,Product
		where   SupplyProduct.Product_Code = Product.Product_Code and SupplyProduct.Branch_Id = Branch.Branch_Id 
		and SupplyProduct.SupplyDate BETWEEN  @dateStart AND @dateEnd
		and SupplyProduct.Branch_Id = @bid
		ORDER BY CONVERT(date, SupplyProduct.SupplyDate ) ASC


end
GO
/****** Object:  StoredProcedure [dbo].[sp_report_use]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_report_use]
 @dateStart date , @dateEnd date
as
begin

select  UseProducts.UseDate,UseProducts.UseQuantity,Branch.Branch_Name,Course.Course_Name,Product.Product_Name
		from UseProducts,Branch,Product,Course
		where   UseProducts.Product_Code = Product.Product_Code 
		and UseProducts.Branch_Id = Branch.Branch_Id
		 and UseProducts.UseDate BETWEEN  @dateStart AND @dateEnd
		and UseProducts.Course_Id=Course.Course_Id
		group by UseProducts.use_key,UseProducts.UseDate,UseProducts.UseQuantity,Branch.Branch_Name,Course.Course_Name,Product.Product_Name
		ORDER BY CONVERT(date, UseProducts.UseDate ) ASC ,UseProducts.use_key
end
GO
/****** Object:  StoredProcedure [dbo].[sp_report_use_branch]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_report_use_branch]
 @dateStart date , @dateEnd date , @bid int 
as
begin

select  UseProducts.UseDate,UseProducts.UseQuantity,Branch.Branch_Name,Course.Course_Name,Product.Product_Name
		from UseProducts,Branch,Product,Course
		where   UseProducts.Product_Code = Product.Product_Code 
		and UseProducts.Branch_Id = Branch.Branch_Id
		 and UseProducts.UseDate BETWEEN @dateStart AND @dateEnd
		and UseProducts.Course_Id=Course.Course_Id
		and UseProducts.Branch_Id = @bid
		group by UseProducts.use_key,UseProducts.UseDate,UseProducts.UseQuantity,Branch.Branch_Name,Course.Course_Name,Product.Product_Name
		ORDER BY CONVERT(date, UseProducts.UseDate ) ASC ,UseProducts.use_key
end
GO
/****** Object:  StoredProcedure [dbo].[sp_request]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_request]
@code int ,@amount int ,@bid int ,@date date , @status int 
as
begin
	
		
insert into dbo.ReqProduct
		 (ReqDate,ReqQuantity,Branch_Id,Product_Code,statusReq,QuantityUpdate) 
		 values (@date,@amount, @bid,@code,@status,@amount)


end
GO
/****** Object:  StoredProcedure [dbo].[sp_setting_amount1]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_setting_amount1]
@amount1 int ,@BP_id int 
as
begin
		update BranchProduct
		set Notifications_Amount1 = @amount1
		where BranchProduct_Id =@BP_id
		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_setting_amount2]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_setting_amount2]
@amount2 int ,@BP_id int 
as
begin
		update BranchProduct
		set Notifications_Amount2 = @amount2
		where BranchProduct_Id =@BP_id
		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_setting_amount3]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_setting_amount3]
@amount3 int ,@BP_id int 
as
begin
		update BranchProduct
		set Notifications_Amount3 = @amount3
		where BranchProduct_Id =@BP_id
		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_setting_exp1]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_setting_exp1]
@exp1 int ,@BP_id int 
as
begin
		update BranchProduct
		set Notifications_Exp1 = @exp1
		where BranchProduct_Id = @BP_id
		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_setting_exp2]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_setting_exp2]
@exp2 int ,@BP_id int 
as
begin
		update BranchProduct
		set Notifications_Exp2 = @exp2
		where BranchProduct_Id = @BP_id
		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_setting_exp3]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_setting_exp3]
@exp3 int ,@BP_id int 
as
begin
		update BranchProduct
		set Notifications_Exp3 = @exp3
		where BranchProduct_Id = @BP_id
		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_supply]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_supply]
@code int ,@number int ,@branchid int ,@date date,@head_id int
as
begin
	
		insert into dbo.SupplyProduct
		 (SupplyDate,SupplyQuantity,Branch_Id,Product_Code) 
		 values (@date,@number, @branchid,@code)

		 update BranchProduct
		 set BranchProduct_Amount = BranchProduct_Amount  +  @number
		 where Branch_Id =@branchid  and Product_Code = @code

		  update BranchProduct
		 set BranchProduct_Amount = BranchProduct_Amount  -  @number
		 where Branch_Id =@head_id  and Product_Code = @code

		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_supply_del]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_supply_del]

as
begin
		delete from BranchProduct
		where   BranchProduct_Amount = 0

end
GO
/****** Object:  StoredProcedure [dbo].[sp_supply_insert]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_supply_insert]
@code int ,@number int ,@branchid int ,@date date,@head_id int,@BP_id int,@exp date
as
begin
	
		insert into dbo.SupplyProduct
		 (SupplyDate,SupplyQuantity,Branch_Id,Product_Code) 
		 values (@date,@number, @branchid,@code)

		 insert into BranchProduct(Branch_Id,BranchProduct_Amount,BranchProduct_EXP,Product_Code)
		 values (@branchid,@number,@exp,@code)
		

		 update BranchProduct
		 set BranchProduct_Amount = BranchProduct_Amount  -  @number
		 where Branch_Id =@head_id  and BranchProduct_Id = @BP_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_supply_Req]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_supply_Req]
@code int ,@number int ,@branchid int ,@date date
as
begin
	
		 insert into dbo.SupplyProduct
		 (SupplyDate,SupplyQuantity,Branch_Id,Product_Code) 
		 values (@date,@number, @branchid,@code)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_supply_update]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_supply_update]
@code int ,@number int ,@branchid int ,@date date,@head_id int , @BP_id int,@exp date
as
begin
	
		insert into dbo.SupplyProduct
		 (SupplyDate,SupplyQuantity,Branch_Id,Product_Code) 
		 values (@date,@number, @branchid,@code)

		 update BranchProduct
		 set BranchProduct_Amount = BranchProduct_Amount  +  @number
		 where Branch_Id =@branchid  and Product_Code = @code and BranchProduct_EXP = @exp

		  update BranchProduct
		 set BranchProduct_Amount = BranchProduct_Amount  -  @number
		 where Branch_Id =@head_id  and BranchProduct_Id = @BP_id

		

end
GO
/****** Object:  StoredProcedure [dbo].[sp_supplyReq]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_supplyReq]
@reqPro_id int,@amount int ,@date date, @branchid int,@code int,@BP_id int
as
begin

	insert into dbo.SupplyProduct
		 (SupplyDate,SupplyQuantity,Branch_Id,Product_Code) 
		 values (@date,@amount, @branchid,@code)
		
		 delete from BranchProduct
		 where BranchProduct_Id = @BP_id and BranchProduct_Amount = 0 

end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_AmountCP]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_update_AmountCP]
@number int , @CP_id int
as
begin
		update CourseProduct
		set Amount =  @number
		where CourseProduct_Id = @CP_id
		
		  
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_BranchProduct]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_update_BranchProduct]
@BP_id int ,@id_input int ,@name nvarchar(30),@des nvarchar(200),@ins nvarchar(200),@type int,@exp date ,@amount int,@bid int , @id int
as
begin
		update [dbo].[Product]
		set  
		Product.[Product_Code] = @id_input,
		Product.[Product_Name]=@name,
		Product.[Product_Des]=@des,
		Product.[Product_Instruction]= @ins,
		Product.[ProductType_Id]= @type
		where [Product_Code] = @id 

		update [dbo].[BranchProduct]
		set  
		BranchProduct.BranchProduct_EXP = @exp,
		BranchProduct.BranchProduct_Amount = @amount,
		BranchProduct.Product_Code = @id_input
		where BranchProduct.Product_Code= @id  And BranchProduct.Branch_Id = @bid And BranchProduct.BranchProduct_Id = @BP_id
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_Product]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_update_Product]
@id_input int ,@name nvarchar(30),@des nvarchar(200),@ins nvarchar(200),@type int,@exp date ,@amount int,@bid int , @id int
as
begin
		update [dbo].[Product]
		set  
		Product.[Product_Code] = @id_input,
		Product.[Product_Name]=@name,
		Product.[Product_Des]=@des,
		Product.[Product_Instruction]= @ins,
		Product.[ProductType_Id]= @type
		where [Product_Code] = @id 

		update [dbo].[BranchProduct]
		set  
		BranchProduct.BranchProduct_EXP = @exp,
		BranchProduct.BranchProduct_Amount = @amount,
		BranchProduct.Product_Code = @id_input
		where BranchProduct.Product_Code= @id  And BranchProduct.Branch_Id = @bid
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_ProductOnly]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_update_ProductOnly]
@code int , @name  nvarchar(30) ,@des nvarchar(100),@ins nvarchar(100) , @typeId  int ,@code_update int
as
begin
		update Product
		set Product_Code = @code_update,Product_Name =@name ,Product_Des =@des ,Product_Instruction =@ins ,ProductType_Id = @typeId
		
		where Product_Code = @code
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_productReq_into_BP]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_update_productReq_into_BP]
@code int , @amount int ,@date date , @bid int ,@note nvarchar(100)
as
begin
		

		update BranchProduct 
		set BranchProduct_Amount = BranchProduct_Amount + @amount , note = @note
		where Product_Code = @code and BranchProduct_EXP = @date and Branch_Id = @bid

		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_reqAmount]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_update_reqAmount]
@reqPro_id int,@amountInput int 
as
begin
		 update ReqProduct
		 set QuantityUpdate = QuantityUpdate  -  @amountInput
		 where ReqProduct_Id =@reqPro_id 

		 update ReqProduct
		 set statusReq = 1
		 where QuantityUpdate = 0
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_status_req]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_update_status_req]
@req_id int
as
begin

	update ReqProduct
	set  statusReq = 1
	where ReqProduct_Id =  @req_id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_typeProduct]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_update_typeProduct]
@type nvarchar(50) , @id int
as
begin


	update ProductType
	set ProductType_Name = @type
	where 	ProductType_Id = @id
		
		
end
GO
/****** Object:  StoredProcedure [dbo].[sp_use_del]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_use_del]
 @BP_id int
as
begin
	
delete from BranchProduct
where BranchProduct_Id = @BP_id

end
GO
/****** Object:  StoredProcedure [dbo].[sp_use_product]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_use_product]
@code int ,@amount int ,@bid int ,@date date,@course int ,@key int
as
begin

		 insert into dbo.UseProducts
		 (use_key,Branch_Id,Course_Id,Product_Code,UseDate,UseQuantity) 
		 values (@key,@bid,@course,@code ,@date,@amount)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_use_update]    Script Date: 5/17/2018 9:25:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_use_update]
@inputAmount int , @BP_id int
as
begin
	
update BranchProduct
set BranchProduct_Amount = BranchProduct_Amount - @inputAmount
where BranchProduct_Id = @BP_id

end
GO
USE [master]
GO
ALTER DATABASE [luxury] SET  READ_WRITE 
GO
