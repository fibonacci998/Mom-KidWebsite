USE [master]
GO
/****** Object:  Database [OnlineShopMomAndKid]    Script Date: 07/11/2018 11:05:52 PM ******/
CREATE DATABASE [OnlineShopMomAndKid] ON  PRIMARY 
( NAME = N'OnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER\MSSQL\DATA\OnlineShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER\MSSQL\DATA\OnlineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShopMomAndKid].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShopMomAndKid] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShopMomAndKid] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineShopMomAndKid', N'ON'
GO
USE [OnlineShopMomAndKid]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 07/11/2018 11:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailContact]    Script Date: 07/11/2018 11:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailContact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmailContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 07/11/2018 11:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 07/11/2018 11:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 07/11/2018 11:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](max) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](max) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 07/11/2018 11:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07/11/2018 11:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](10) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludeVAT] [bit] NULL,
	[Quantity] [int] NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nchar](250) NULL,
	[Status] [bit] NULL,
	[TopHot] [bit] NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 07/11/2018 11:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 07/11/2018 11:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 07/11/2018 11:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Value] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 07/11/2018 11:05:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
	[Type] [varchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EmailContact] ON 

INSERT [dbo].[EmailContact] ([Id], [Email]) VALUES (1, N'rgd@ueg')
INSERT [dbo].[EmailContact] ([Id], [Email]) VALUES (2, N'rgd@ueg')
INSERT [dbo].[EmailContact] ([Id], [Email]) VALUES (3, N'rgd@ueg')
INSERT [dbo].[EmailContact] ([Id], [Email]) VALUES (4, N'kkk@giueab')
SET IDENTITY_INSERT [dbo].[EmailContact] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'TRANG CHỦ', N'/', 1, N'_blank', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'SẢN PHẨM NỔI BẬT', N'#san-pham-hot', 2, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'TIN TỨC', N'/tin-tuc', 3, N'_self', 0, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'LIÊN HỆ', N'#lien-he', 5, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Đăng nhập', N'/khach-hang', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Đăng kí', N'/khach-hang', 2, N'_self', 1, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu chính')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu top')
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (1, CAST(N'2018-10-03T23:03:37.410' AS DateTime), 10002, N'Phan Anh Tuan', N'12345567', N'Hoa Binh', N'tuan@gmail.com', 1)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (2, CAST(N'2018-11-03T23:03:37.410' AS DateTime), 10003, N'Phan Anh Tuan 2', N'12345', N'Hoa Binh', N'isue@iusg', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (49, 1, 3, CAST(120000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (49, 2, 5, CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (50, 1, 3, CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (50, 2, 4, CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10061, 10007, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (10067, 10007, 1, CAST(25000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (45, N'Bộ trang sức PNJ vàng trắng', N'Jewelry3', N'trang-suc', N'14K đính đá Topaz', N'/Data/images/ad/Jewelry07.jpg', NULL, CAST(22761000 AS Decimal(18, 0)), NULL, NULL, 5, 4, N'Sản Phẩm Bộ, chất liệu vàng 18K, gắn đá Ruby.Giá bán sản phẩm mang tính chất tham khảo, phụ thuộc trọng lượng vàng và giá vàng thời điểm giao dịch.Giá bán bao gồm cả bộ.', NULL, CAST(N'2018-10-28T20:03:58.297' AS DateTime), NULL, CAST(N'2018-11-07T09:27:44.760' AS DateTime), NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (47, N'Hạt Charm Me PNJ', N'Jewelry2', N'trang-suc', N'Vàng ý 18K đính đá', N'/Data/images/ad/Jewelry02.jpg', NULL, CAST(1667000 AS Decimal(18, 0)), NULL, NULL, 10, 4, N'Chiếc vòng tay với những hạt charm Me độc đáo không chỉ là món trang sức có thể thay đổi hàng ngày theo sở thích hoặc phong cách mà còn giúp bạn tô điểm thêm nét cá tính, sang trọng. Từng hạt charm nhỏ xinh được gắn trên chiếc vòng tay chính là thứ giúp bạn lưu giữ những khoảnh khắc, những kỷ niệm, những hồi ức khó quên.', NULL, NULL, NULL, CAST(N'2018-11-07T09:25:43.480' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (48, N'Bộ trang sức PNJ', N'Jewelry1', N'trang-suc', N'Vàng 18K đính Ruby', N'/Data/images/ad/Jewelry01.jpg', NULL, CAST(23480000 AS Decimal(18, 0)), NULL, NULL, 5, 4, N'Sản Phẩm Bộ, chất liệu vàng 18K, gắn đá Ruby.Giá bán sản phẩm mang tính chất tham khảo, phụ thuộc trọng lượng vàng và giá vàng thời điểm giao dịch.Giá bán bao gồm cả bộ.', NULL, NULL, NULL, CAST(N'2018-11-07T09:24:13.953' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (49, N'Hộp đất nặn nhiều màu', N'DC-00001', N'dat-nan', N'Chất liệu: Bột mì, màu Độ tuổi: 3 tuổi. Rèn luyện tính khéo léo, sáng tạo của bé. Có nhiều màu khác nhau. Kích thước hộp: 18x4x18 (cm). Xuất xứ: Trung Quốc', N'/Data/images/ad/dochoi1.jpg', NULL, CAST(40000 AS Decimal(18, 0)), NULL, 1, 99, 3, N'Hộp đất nặn nhiều màu được làm từ bột mì an toàn, có nhiều màu khác nhau nên bé có thể nặn thành nhiều hình hoa quả, con vật...rèn luyện khả năng khéo léo, trí tưởng tưởng khi chơi. Sản phẩm thích hợp làm quà tặng cho bé từ 3 tuổi trở lên.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (50, N'Bộ đồ chơi xếp hình', N'DC-00002', N'xep-hinh', N'Chất liệu: Nhựa cao cấp. Số chi tiết: 174. Độ tuổi: 6 - 12 tuổi. Mảnh ghép nhiều màu sắc. Giúp phát triển trí tuệ, tư duy. Xuất xứ: Trung Quốc', N'/Data/images/ad/dochoi2.jpg', NULL, CAST(50000 AS Decimal(18, 0)), NULL, 1, 99, 3, N'Bộ đồ chơi xếp hình gồm 174 miếng ghép nhiều màu sắc, bằng nhựa an toàn, để bé có thể ráp thành mô hình tàu thủy, máy bay, cano. Đồ chơi lắp ráp giúp bé phát triển trí tuệ, tư duy cũng như khả năng sáng tạo, bé có thể xây dựng nên những câu chuyện của riêng mình.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (51, N'Quần áo liền Carminas', N'QA-00001', N'quan-ao', N'Chất liệu vải cotton. Thiết kế kiểu cúc bấm. Xinh xắn, đáng yêu', N'/Data/images/ad/quanao1.jpg', NULL, CAST(100000 AS Decimal(18, 0)), NULL, 1, 99, 2, N'Quần áo Carminas với nhiều màu và họa tiết, được may từ chất liệu vải cotton mềm mại, thấm hút mồ hôi và giữ ấm cho bé. Body có kiểu liền tất thích hợp cho trẻ mặc vào mùa đông, mẹ không sợ bé bị lạnh khi ngủ hay vận động mạnh. Body có thiết kế kiểu khuy bấm, không làm bé bị đau, rất tiện lợi cho các mẹ khi thay bỉm cho bé.', NULL, CAST(N'2018-10-29T21:39:02.733' AS DateTime), NULL, CAST(N'2018-10-29T21:39:02.733' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (52, N'Quần áo liền Carminas 2', N'QA-00002', N'quan-ao', N'Chất liệu vải cotton. Thiết kế kiểu cúc bấm. Xinh xắn, đáng yêu', N'/Data/images/ad/quanao2.jpg', NULL, CAST(120000 AS Decimal(18, 0)), NULL, 1, 99, 2, N'Quần áo Carminas với nhiều màu và họa tiết, được may từ chất liệu vải cotton mềm mại, thấm hút mồ hôi và giữ ấm cho bé. Body có kiểu liền tất thích hợp cho trẻ mặc vào mùa đông, mẹ không sợ bé bị lạnh khi ngủ hay vận động mạnh. Body có thiết kế kiểu khuy bấm, không làm bé bị đau, rất tiện lợi cho các mẹ khi thay bỉm cho bé.', NULL, CAST(N'2018-10-29T21:39:02.733' AS DateTime), NULL, CAST(N'2018-10-29T21:38:51.913' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (53, N'Quần áo liền Carminas 3', N'QA-00003', N'quan-ao', N'Chất liệu vải cotton. Thiết kế kiểu cúc bấm. Xinh xắn, đáng yêu', N'/Data/images/ad/quanao3.jpg', NULL, CAST(120000 AS Decimal(18, 0)), NULL, 1, 99, 2, N'Quần áo Carminas với nhiều màu và họa tiết, được may từ chất liệu vải cotton mềm mại, thấm hút mồ hôi và giữ ấm cho bé. Body có kiểu liền tất thích hợp cho trẻ mặc vào mùa đông, mẹ không sợ bé bị lạnh khi ngủ hay vận động mạnh. Body có thiết kế kiểu khuy bấm, không làm bé bị đau, rất tiện lợi cho các mẹ khi thay bỉm cho bé.', NULL, CAST(N'2018-10-29T21:39:02.733' AS DateTime), NULL, CAST(N'2018-10-29T21:38:39.603' AS DateTime), NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10054, N'SỮA GLICO ', N'GLICO 01', N'sua', N'Khối Lượng 820G - Do SnB Phân Phối chính hãng', N'/Data/images/ad/GLICO.jpg', NULL, CAST(430000 AS Decimal(18, 0)), NULL, NULL, 40, 1, N'Thành phần: Bột bơ sữa, Protein sữa tươi, bơ sữa, bột béo, muối ăn, chất béo, các Vitamin và khoáng chất…', NULL, CAST(N'2018-11-07T07:16:45.900' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10055, N'Sữa Physiolac', N'Physiolac3', N'sua', N'Khối Lượng Tịnh 900g', N'/Data/images/ad/Physiolac.jpg', NULL, CAST(305000 AS Decimal(18, 0)), NULL, NULL, 42, 1, N'Trong thành phần Sữa Physiolac số 3 900g có hàm lượng Calci, Vitamin D, Phospho và Magiê cao. Tỷ lệ tối ưu giữa Calci và Phospho. Giúp cho xương và răng chắc khỏe.', NULL, CAST(N'2018-11-07T07:18:43.303' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10056, N'Sữa Nan Nga', N'Nan', N'sua', N'Khối Lượng Tịnh: 800g', N'/Data/images/ad/NAN.jpg', NULL, CAST(369000 AS Decimal(18, 0)), NULL, NULL, 50, 1, N'Sữa Nan Nga chứa hỗn hợp axit béo DHA và ARA là những dưỡng chất thiết yếu cho cấu trúc não bộ chức năng thị giác và sức khoẻ toàn diện của trẻ. Giúp phát triển trí não và thị lực cho trẻ. ', NULL, CAST(N'2018-11-07T07:20:12.127' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10057, N'GRAND NOBLE', N'NOBLE', N'sua', N'Khối Lượng Tịnh: 750gr', N'/Data/images/ad/GRAND%20NOBLE.jpg', NULL, CAST(700000 AS Decimal(18, 0)), NULL, NULL, 50, 1, N'Sữa hương vị thơm, hòa tan luôn, dễ uống. Không táo bón, không nôn chớ, gồm 58 thành phần đầy đủ các dưỡng chất. Làm da em bé trắng hồng mịn màng', NULL, CAST(N'2018-11-07T07:21:57.897' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10058, N'Kid Essentials', N'Kidess', N'sua', N'Khối Lượng Tịnh: 800g', N'/Data/images/ad/KidEss.jpg', NULL, CAST(500000 AS Decimal(18, 0)), NULL, NULL, 45, 1, N'Đây là dòng sữa giành cho bé biếng ăn từ 1-10 tuổi CÓ MEN VI SINH (PROBIOTICS) .Giúp bé vừa tiêu hoá tốt mà đảm bảo các chất dinh dưỡng cần thiết.Ggiống Pediasure nhưng lại có thêm MEN để hỗ trợ ko táo. Hương vị vani rất dễ uống', NULL, CAST(N'2018-11-07T07:23:30.720' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10059, N'Growplus', N'Growplus', N'sua', N'Khối Lượng Tịnh 900g - Nhà sản xuất Nutifood', N'/Data/images/ad/Growplus.jpg', NULL, CAST(350000 AS Decimal(18, 0)), NULL, NULL, 54, 1, N'Sữa cho trẻ 1-10 tuổi bị suy dinh dưỡng. Sữa cho trẻ suy dinh dưỡng thấp còi -  Nutifood Grow Plus + Đỏ. Với công thức Weight Pro+ giàu dinh dưỡng, đầy đủ hàm lượng đạm, béo. Giúp trẻ tăng cân, tăng chiều cao tốt', NULL, CAST(N'2018-11-07T07:24:41.117' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10060, N'Frisolac Gold', N'Frisolac', N'sua', N'Khối Lượng Tịnh 900g. ', N'/Data/images/ad/Physiolac.jpg', NULL, CAST(455000 AS Decimal(18, 0)), NULL, NULL, 60, 1, N'Frisolac gold 2 là sữa công thức dinh dưỡng cho trẻ từ 6-12 tháng. Frisolac gold 2 cung cấp nhiều vi chất dinh dưỡng vitamin A, C, E và các khoáng chất selen, kẽm, chất xơ GOS giúp hổ trợ sức khỏe đường ruột cho trẻ. DHA và AA hỗ trợ phát triển trí não. ', NULL, CAST(N'2018-11-07T07:41:28.510' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10061, N'Áo mẹ và bé in logo', N'kit1', N'quan-ao', N'Set 2 áo + 1 quần + 1 yếm', N'/Data/images/ad/Set01.jpg', NULL, CAST(300000 AS Decimal(18, 0)), NULL, NULL, 40, 2, N'Không biết tự bao giờ đồ đôi áo gia đình xuất hiện như sợi dây vô hình gắn kết các đôi lứa yêu nhau và thành viên trong một gia đình. Một hành động nhỏ nhưng lại ý nghĩa lớn. Sẽ thật thú vị nếu các thành viên trong gia đình bạn cùng nhau mặc hai chiếc áo/quần giống nhau xuất hiện ở nơi đông người.', NULL, CAST(N'2018-11-07T07:43:41.017' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10062, N'Áo bô va bé rêu in họa tiết', N'MB071', N'quan-ao', N'Set 2 áo + 2 quần. ', N'/Data/images/ad/Set02.jpg', NULL, CAST(300000 AS Decimal(18, 0)), NULL, NULL, 39, 2, N'Không biết tự bao giờ đồ đôi áo gia đình xuất hiện như sợi dây vô hình gắn kết các đôi lứa yêu nhau và thành viên trong một gia đình. Một hành động nhỏ nhưng lại ý nghĩa lớn. Sẽ thật thú vị nếu các thành viên trong gia đình bạn cùng nhau mặc hai chiếc áo/quần giống nhau xuất hiện ở nơi đông người.', NULL, CAST(N'2018-11-07T07:45:30.763' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10063, N'Áo mẹ và bé họa tiết July', N'MB066', N'quan-ao', N'Set 2 áo + 2 quần. ', N'/Data/images/ad/Set03.jpg', NULL, CAST(299000 AS Decimal(18, 0)), NULL, NULL, 50, 2, N'Không biết tự bao giờ đồ đôi áo gia đình xuất hiện như sợi dây vô hình gắn kết các đôi lứa yêu nhau và thành viên trong một gia đình. Một hành động nhỏ nhưng lại ý nghĩa lớn. Sẽ thật thú vị nếu các thành viên trong gia đình bạn cùng nhau mặc hai chiếc áo/quần giống nhau xuất hiện ở nơi đông người.', NULL, CAST(N'2018-11-07T07:47:01.843' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10064, N'Áo mẹ và bé họa tiết Gom', N'MB065', N'quan-ao', N'Set 2 áo + 2 quần', N'/Data/images/ad/Set04.jpg', NULL, CAST(320000 AS Decimal(18, 0)), NULL, NULL, 30, 2, N'Không biết tự bao giờ đồ đôi áo gia đình xuất hiện như sợi dây vô hình gắn kết các đôi lứa yêu nhau và thành viên trong một gia đình. Một hành động nhỏ nhưng lại ý nghĩa lớn. Sẽ thật thú vị nếu các thành viên trong gia đình bạn cùng nhau mặc hai chiếc áo/quần giống nhau xuất hiện ở nơi đông người.', NULL, CAST(N'2018-11-07T07:48:42.730' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10065, N'Áo có cổ mẹ và bé họa tiết cam', N'MB054', N'quan-ao', N'Set 2 áo', N'/Data/images/ad/Set05.jpg', NULL, CAST(165000 AS Decimal(18, 0)), NULL, NULL, 30, 2, N'Sản phẩm làm từ chất liệu thun cotton 4 chiều co giãn và thấm hút mồ hôi tốt, nam form rộng nữ form có eo. Sử dụng mẫu này làm đồng phục công ty, nhóm, lớp .', NULL, CAST(N'2018-11-07T07:49:56.007' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10066, N'Áo mẹ và bé sọc lính', N'MB052', N'quan-ao', N'Set 2 áo', N'/Data/images/ad/Set07.jpg', NULL, CAST(165000 AS Decimal(18, 0)), NULL, NULL, 30, 2, N'Sản phẩm làm từ chất liệu thun cotton 4 chiều co giãn và thấm hút mồ hôi tốt, nam form rộng nữ form có eo. Sử dụng mẫu này làm đồng phục công ty, nhóm, lớp', NULL, CAST(N'2018-11-07T07:52:53.200' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10067, N'Bộ 6 ô tô mini cho bé', N'Toy01', N'do-choi', N'Bộ gồm 6 mô hình xe các loại', N'/Data/images/ad/Toy01.jpg', NULL, CAST(25000 AS Decimal(18, 0)), NULL, NULL, 30, 3, N'Bộ gồm 6 mô hình xe các loại. Được làm từ chất liệu nhựa không độc hại ảnh hưởng đến sức khỏe của bé.Phát triển khả năng vận động, hoạt bát và trí thông minh cho bé.Kích thích bé khả năng tư duy sáng tạo, nhận biết hình khối với mô hình xe ô tô, xe xúc. Nắm rõ mô hình xe cũng như công dụng của xe.', NULL, CAST(N'2018-11-07T07:57:38.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10068, N'Đồ chơi kệ chữ A', N'Toy02', N'do-choi', N'Chất liệu an toàn.Thiết kế đáng yêu', N'/Data/images/ad/Toy02.jpg', NULL, CAST(299000 AS Decimal(18, 0)), NULL, NULL, 30, 3, N'Các bà mẹ luôn muốn tìm đến những sản phẩm đồ chơi dành cho trẻ sơ sinh hỗ trợ mẹ tốt nhất trong việc phát triển các giác quan của bé từ những năm tháng đầu đời. Sản phẩm đồ chơi kệ chữ A 3010A dưới đây với chất liệu an toàn, thiết kế dễ thương sẽ là lựa chọn thông minh của mẹ dành cho bé. Kệ treo với nhiều chức năng kích thích sự tìm tòi, khám phá thế giới xung quanh của bé, bước đầu cho bé những sự phát triển tốt nhất.', NULL, CAST(N'2018-11-07T07:58:43.757' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10069, N'Thảm trải sàn họa tiết hoạt hình ngộ nghĩnh', N'Toy03', N'do-choi', N'Kích thước lớn cho bé vui chơi thoải mái.Thảm dày dặn, êm ái, chống trơn trượt.Thảm 2 mặt in họa tiết ngộ nghĩnh', N'/Data/images/ad/Toy03.jpg', NULL, CAST(779000 AS Decimal(18, 0)), NULL, NULL, 30, 3, N'Thảm chơi có kích thước lớn 180 x 200 cm, với độ dày 1.5 cm, bên trong là lớp xốp siêu nhẹ êm ái và phần viền được bo chắc chắn, đẹp mắt, mang đến cho bé một không gian vui chơi an toàn và thoải mái.', NULL, CAST(N'2018-11-07T07:59:46.523' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10070, N'Treo cũi hình thú vui nhộn', N'Toy04', N'do-choi', N'Được làm từ chất liệu nhựa cao cấp, không độc hại. Bề mặt đồ chơi trơn nhẵn đem đến một sản phẩm an toàn tuyệt đối cho sức khỏe của bé', N'/Data/images/ad/Toy03.jpg', NULL, CAST(493000 AS Decimal(18, 0)), NULL, NULL, 30, 3, N'Treo nôi cũi WinFun với thiết kế dễ thương, nhiều màu sắc kích thích thị giác, thu hút bé giúp bé chơi ngoan hơn. Đồ treo là 4 bạn nhỏ động vật: cún, chim, mèo và thỏ nhồi bông đáng yêu, ngộ nghĩnh, kích thích sự tò mò của bé, cho bé luyện tập cầm nắm, với và làm quen những hình ảnh mới, bước đầu khám phá thế giới xung quanh', NULL, CAST(N'2018-11-07T08:00:48.897' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10071, N'Đồ chơi chút chít Toyroyal', N'Toy06', N'do-choi', N'Hình ếch xanh', N'/Data/images/ad/Toy06.jpg', NULL, CAST(85000 AS Decimal(18, 0)), NULL, NULL, 30, 3, N'Đồ chơi chút chít Toyroyal hình ếch xanh được thiết kế hình dáng chú ếch xanh vô cùng đáng yêu với đôi mắt tròn to cùng chiếc miệng rộng luôn nở nụ cười tươi.Không chỉ làm bé thích thú khi chơi mà còn giúp bé có thêm hiểu biết về các loài động vật, tăng cường khả năng khám phá, học hỏi của bé.', NULL, CAST(N'2018-11-07T08:02:32.433' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10072, N'Đồ chơi bóp chíp Farlin', N'toy07', N'do-choi', N'Chú ếch xanh', N'/Data/images/ad/Toy07.jpg', NULL, CAST(50000 AS Decimal(18, 0)), NULL, NULL, 30, 2, N'Có hình chú ếch xinh xắn, ngộ nghĩnh phát ra tâm thanh vui tai giúp bé phát triển thính giác.Tăng cường khả năng khám phá, học hỏi của bé. Âm thanh phát ra thu hút sự chú ý của trẻ và giúp dỗ dành trẻ khi trẻ thức giấc, quấy khóc', NULL, CAST(N'2018-11-07T08:04:04.600' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10073, N'Xe đẩy 2 chiều Gluck', N'C58', N'xe-day', N'Màu xanh', N'/Data/images/ad/Cart01.jpg', NULL, CAST(2090000 AS Decimal(18, 0)), NULL, NULL, 20, 5, N'Đến từ thương hiệu Gluck Baby của Đức, xe đẩy 2 chiều Gluck C58 màu xanh nằm trong dòng sản phẩm mới ra mắt năm 2016 của hãng. Những tính năng nổi bật của xe như tay đẩy 2 chiều thuận tiện, hệ thống phanh và giảm xóc di chuyển an toàn, không gian xe rộng rãi cùng thiết kế đệm êm và mềm,...sẽ giúp mẹ bảo vệ sức khỏe của bé một cách tốt nhất. Khung xe có thể gập gọn linh hoạt, dễ dàng mang theo trong những chuyến đi, mang lại cho bé những giờ phút vui chơi thỏa thích bên cạnh gia đình. Xe đẩy Gluck thích hợp cho bé từ sơ sinh đến 6 tuổi, chắc chắn sẽ là món quà hoàn hảo của mẹ dành cho bé trong những năm tháng đầu đời', NULL, CAST(N'2018-11-07T09:52:20.913' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10074, N'Xe đẩy Gluck', N'C59', N'xe-day', N'Màu đỏ', N'/Data/images/ad/Cart02.jpg', NULL, CAST(1110000 AS Decimal(18, 0)), NULL, NULL, 20, 5, N'Xe đẩy luôn là lựa chọn thông minh và thích hợp hàng đầu giúp gia đình có được một chuyến hành trình vui vẻ, thoải mái khi bố mẹ muốn đưa cả bé đi cùng. Đến từ thương hiệu Gluck Baby của Đức, xe đẩy Gluck B-6 màu đỏ dưới đây sẽ mang đến một gợi ý hoàn hảo cho những gia đình có con nhỏ. Gluck B-6 với những ưu điểm nổi bật như: tựa lưng 3 tư thế, thanh chắn an toàn kết hợp bàn ăn thông minh, bánh lớn có giảm xóc và phanh khóa, giỏ đựng đồ tiện lợi,... chắc chắn sẽ khiến bố mẹ hài lòng và yên tâm khi cho bé sử dụng. Kết hợp thêm ưu điểm về chất liệu an toàn, bền đẹp, xe đẩy Gluck B-6 sẽ trở thành người trợ thủ đắc lực giúp công việc chăm sóc bé đơn giản, thuận tiện hơn mà lại tiết kiệm chi phí một cách tối đa. Sản phẩm phù hợp cho bé từ 0 đến 3 tuổi, dễ dàng gấp gọn để cất giữ và di chuyển', NULL, CAST(N'2018-11-07T09:53:12.087' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10075, N'Xe đẩy Hope', N'C60', N'xe-day', N'Màu tím', N'/Data/images/ad/Cart03.jpg', NULL, CAST(990000 AS Decimal(18, 0)), NULL, NULL, 20, 5, N'Xe đẩy Hope HP-308N với trọng lượng nhẹ nhàng sẽ là lựa chọn thích hợp cho những chuyến đi xa của bé cùng gia đình. Hope HP-308N mang những đặc điểm nổi bật như: tựa lưng 3 tư thế, mái chụp rộng và sâu, hệ thống bánh xe kép giảm rung lắc, phanh khóa an toàn khi không di chuyển, giỏ để đồ rộng rãi,... không chỉ mang tới cho bé cảm giác thoải mái, dễ chịu nhất mà còn đem đến cho bố mẹ sự thuận tiện, tiện ích, giúp công việc chăm sóc bé trở nên đơn giản và dễ dàng hơn. Với Hope HP-308N, bé tha hồ thỏa thích khám phá thế giới xung quanh hay có một giấc ngủ sâu và ngon, trong khi đó, bố mẹ có thể rảnh tay để mua sắm hay trò chuyện trong lúc nghỉ ngơi', NULL, CAST(N'2018-11-07T09:53:57.173' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10076, N'Xe đẩy 2 chiều SeeBaby', N'C61', N'xe-day', N'Mini màu đỏ', N'/Data/images/ad/Cart05.jpg', NULL, CAST(1430000 AS Decimal(18, 0)), NULL, NULL, 20, 5, N'Đến từ thương hiệu nổi tiếng Seebaby của Hồng Kông, xe đẩy 2 chiều Seebaby T08 mini màu đỏ dưới đây sẽ là một lựa chọn hoàn hảo của mẹ dành cho bé trong những năm tháng đầu đời. Xe đẩy Seebaby T08 với những tính năng nổi bật như thiết kế đẩy 2 chiều cùng chế độ điều chỉnh ghế lưng linh hoạt; chế độ giảm xóc cùng hệ thống phanh an toàn di chuyển; ngăn đựng đồ lớn cùng tính năng gập gọn dễ dàng bảo quản và di chuyển,... chắc chắn sẽ trở thành người bạn đồng hành tin cậy của bé, chăm sóc sức khỏe bé tốt nhất, mang đến cho bé những giờ phút đi chơi cùng bố mẹ thật vui vẻ và thỏa thích. Các bộ phận của xe được làm từ chất liệu thép siêu nhẹ và nhựa cao cấp, an toàn cho sức khỏe bé yêu. Màu đỏ và đen kết hợp hài hòa trên thân xe, thu hút bé ngay từ ánh nhìn đầu tiên', NULL, CAST(N'2018-11-07T09:55:02.983' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10077, N'Xe đẩy SeeBaby', N'C62', N'xe-day', N'Xanh lá cây', N'/Data/images/ad/Cart06.jpg', NULL, CAST(1450000 AS Decimal(18, 0)), NULL, NULL, 20, 5, N'Những khi đưa bé đi chơi, đi dạo, sẽ khá khó khăn để bế bé trên tay liên tục. Do vậy mà một chiếc xe đẩy em bé là cách nhiều gia đình lựa chọn. Xe đẩy giúp mẹ và bé di chuyển tới các vị trí gần một cách dễ dàng. Bé có thể ngắm cảnh khi di chuyển, cũng như ngả lưng ngủ ngay trên xe một cách dễ dàng. Xe đẩy Seebaby S03A xanh lá với thiết kế kế gọn nhẹ, di chuyển êm ái, chất liệu vải bền, thoáng mát hiện đang là một trong những lựa chọn hàng đầu của các bậc phụ huynh.', NULL, CAST(N'2018-11-07T09:55:45.063' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (10078, N'Xe đẩy song long Babyboo', N'C63', N'xe-day', N'Màu đỏ', N'/Data/images/ad/Cart02.jpg', NULL, CAST(620000 AS Decimal(18, 0)), NULL, NULL, 20, 5, N'Xe đẩy là đồ dùng không thể thiếu đối với các bé trong những năm tháng đầu đời, giúp bố mẹ và bé có những chuyến hành trình thật an toàn, tiện lợi và thoải mái. Đến từ thương hiệu Song Long Việt Nam, xe đẩy Song Long Babyboo Q2 màu đỏ dưới đây sẽ đem đến một gợi ý thú vị giúp bố mẹ dễ dàng hơn trong việc lựa chọn cho bé một "phương tiện di chuyển" thích hợp. Song Long Babyboo Q2 tạo cho bé sự thoải mái với tựa lưng 2 tư thế, mái chụp che chắn tốt và đặc biệt là chất liệu vải lưới thông thoáng không gây bí bức vào những ngày hè. Bên cạnh đó, sự an toàn được mang đến cho bé nhờ hệ thống đai bảo hiểm chắc chắn và phanh khóa dưới bánh xe. Tay đẩy bọc đệm êm ái cũng vô cùng thuận tiện cho việc di chuyển của bố mẹ', NULL, CAST(N'2018-11-07T09:56:36.723' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (1, N'Sữa', N'sua', NULL, 1, NULL, CAST(N'2018-10-28T15:45:53.737' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (2, N'Quần áo', N'quanao', NULL, 1, NULL, CAST(N'2018-10-28T15:46:45.987' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (3, N'Đồ chơi', N'dochoi', NULL, 1, NULL, CAST(N'2018-10-28T15:46:55.537' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (4, N'Trang sức', N'trangsuc', NULL, 1, NULL, CAST(N'2018-11-03T20:04:55.120' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (5, N'Xe đẩy', N'xeday', NULL, 1, NULL, CAST(N'2018-11-03T20:07:14.420' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'slide-1', 1, N'/Assets/Client/slide/slider1.jpg', NULL, CAST(N'2018-11-03T20:32:51.647' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'slide-2', 2, N'/Assets/Client/slide/slider2.jpg', NULL, CAST(N'2018-11-03T20:33:02.993' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (1, N'admin', N'202cb962ac59075b964b07152d234b70', N'tuan', NULL, NULL, NULL, CAST(N'2018-10-21T16:13:26.730' AS DateTime), NULL, NULL, NULL, 1, N'Admin')
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10002, N'1', N'c4ca4238a0b923820dcc509a6f75849b', N'number1', N'1', N'1@gmail.com', N'1', CAST(N'2018-10-23T16:13:26.730' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10003, N'2', N'c81e728d9d4c2f636f067f89cc14862c', N'number2', N'2', N'2@gmail.com', N'2', CAST(N'2018-10-24T16:13:26.730' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10004, N'3', N'eccbc87e4b5ce2fe28308fd9f2a7baf3', N'number3', N'3', N'3@gmail.com', N'3', CAST(N'2018-10-25T16:13:26.730' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10005, N'4', N'a87ff679a2f3e71d9181a67b7542122c', N'number4', N'4', N'4@gmail.com', N'4', CAST(N'2018-10-26T16:13:26.730' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10006, N'number5', N'e4da3b7fbbce2345d7772b0674a318d5', N'5', N'5', N'5', N'5', CAST(N'2018-10-27T16:13:26.730' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10007, N'number4', N'a87ff679a2f3e71d9181a67b7542122c', N'4', N'4', N'4', N'4', CAST(N'2018-10-28T16:13:26.730' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10008, N'number6', N'1679091c5a880faf6fb5e6087eb1b2dc', N'number6', N'6', N'6', N'6', CAST(N'2018-10-28T11:11:45.397' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10009, N'number7', N'1679091c5a880faf6fb5e6087eb1b2dc', N'7', N'7', N'7', N'7', CAST(N'2018-10-28T11:22:48.130' AS DateTime), NULL, NULL, NULL, 1, N'Admin')
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10010, N'teo', N'202cb962ac59075b964b07152d234b70', N'teo', N'teo', N'teo@sef', N'234', CAST(N'2018-11-07T11:33:02.260' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10011, NULL, N'25d55ad283aa400af464c76d713c07ad', N'thdr', N'drthdtrh', N'drth@rsg', N'4345345', CAST(N'2018-11-07T22:16:20.943' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10012, N'tuan', N'25d55ad283aa400af464c76d713c07ad', N'dgd', N'hb', N'sef@sef', N'23423', CAST(N'2018-11-07T22:20:30.140' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10013, N'fdgdf', N'25d55ad283aa400af464c76d713c07ad', N'srf', N'sf', N'fse@drg', N'345345', CAST(N'2018-11-07T22:23:25.463' AS DateTime), NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[User] ([ID], [Username], [Password], [Name], [Address], [Email], [Phone], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Type]) VALUES (10014, N'tuan123', N'25d55ad283aa400af464c76d713c07ad', N'tuan', N'hoa binh', N'tuan@uibs', N'345', CAST(N'2018-11-07T22:38:17.190' AS DateTime), NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_To_category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_To_category]
GO
USE [master]
GO
ALTER DATABASE [OnlineShopMomAndKid] SET  READ_WRITE 
GO
