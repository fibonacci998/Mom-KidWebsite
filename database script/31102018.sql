USE [master]
GO
/****** Object:  Database [OnlineShopMomAndKid]    Script Date: 31/10/2018 10:25:14 PM ******/
CREATE DATABASE [OnlineShopMomAndKid]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER\MSSQL\DATA\OnlineShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLSERVER\MSSQL\DATA\OnlineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OnlineShopMomAndKid] SET COMPATIBILITY_LEVEL = 130
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
ALTER DATABASE [OnlineShopMomAndKid] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShopMomAndKid] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineShopMomAndKid', N'ON'
GO
ALTER DATABASE [OnlineShopMomAndKid] SET QUERY_STORE = OFF
GO
USE [OnlineShopMomAndKid]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [OnlineShopMomAndKid]
GO
/****** Object:  Table [dbo].[About]    Script Date: 31/10/2018 10:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[Detail] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 31/10/2018 10:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
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
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 31/10/2018 10:25:14 PM ******/
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
/****** Object:  Table [dbo].[Content]    Script Date: 31/10/2018 10:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
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
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Tags] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 31/10/2018 10:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] IDENTITY(1,1) NOT NULL,
	[TagID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 31/10/2018 10:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 31/10/2018 10:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 31/10/2018 10:25:14 PM ******/
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
/****** Object:  Table [dbo].[MenuType]    Script Date: 31/10/2018 10:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 31/10/2018 10:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 31/10/2018 10:25:14 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 31/10/2018 10:25:14 PM ******/
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
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 31/10/2018 10:25:14 PM ******/
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
/****** Object:  Table [dbo].[Slide]    Script Date: 31/10/2018 10:25:14 PM ******/
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
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 31/10/2018 10:25:14 PM ******/
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
/****** Object:  Table [dbo].[Tag]    Script Date: 31/10/2018 10:25:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 31/10/2018 10:25:14 PM ******/
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
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (N'1', N'<footer id="footer">
            <div class="footer-bottom">
                <div class="container">
                    <div class="row">

                        <div class="col-sm-6 col-md-3 col-xs-12 clear-sm">
                            <div class="widget-wrapper animated">

                                <h3 class="title title_left">Giới thiệu</h3>

                                <div class="inner about_us">

                                    <p class="message">CÔNG TY CỔ PHẦN BÓNG ĐÈN ĐIỆN QUANG</p>

                                    <ul class="list-unstyled">

                                        <li>
                                            <i class="fa fa-home"></i>125 Hàm Nghi, P. Nguyễn Thái Bình, Q. 1, TP.HCM
                                        </li>


                                        <li>
                                            <i class="fa fa-envelope-o"></i> <a href="mailto:info@dienquang.com">info@dienquang.com</a>
                                        </li>


                                        <li>
                                            <i class="fa fa-phone"></i>19001257
                                        </li>


                                        <li>
                                            <i class="fa fa-print"></i>+8428 3825 1518
                                        </li>

                                    </ul>
                                    <a href="http://online.gov.vn/CustomWebsiteDisplay.aspx?DocId=1339">
                                        <img src="../Assets/Client/theme.hstatic.net/1000253446/1000408152/14/bocongthuong30f4.png?v=3" alt="" class="bocongthuong_img" />
                                    </a>
                                </div>
                            </div>
                        </div>


                        <div class="col-sm-6 col-md-2 col-xs-12 clear-sm">
                            <div class="widget-wrapper animated">

                                <h3 class="title title_left">LIÊN KẾT</h3>

                                <div class="inner">

                                    <ul class="list-unstyled list-styled">

                                        <li>
                                            <a href="https://dienquang.com/">THÔNG TIN CÔNG TY</a>
                                        </li>

                                        <li>
                                            <a href="https://dienquang.com/">QUAN HỆ CỔ ĐÔNG</a>
                                        </li>

                                        <li>
                                            <a href="https://tuyendung.dienquang.com/">CƠ HỘI NGHỀ NGHIỆP</a>
                                        </li>

                                        <li>
                                            <a href="pages/lien-he.html">LIÊN HỆ VÀ GÓP Ý</a>
                                        </li>

                                        <li>
                                            <a href="pages/huong-dan-mua-hang-online.html">HƯỚNG DẪN MUA HÀNG</a>
                                        </li>

                                        <li>
                                            <a href="pages/dieu-khoan-su-dung.html">ĐIỀU KHOẢN SỬ DỤNG</a>
                                        </li>

                                        <li>
                                            <a href="pages/quyen-rieng-tu">QUYỀN RIÊNG TƯ</a>
                                        </li>

                                        <li>
                                            <a href="pages/chinh-sach.html">CHÍNH SÁCH BẢO HÀNH</a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>


                        <div class="col-sm-6 col-md-3 col-xs-12 clear-sm">
                            <div class="widget-wrapper animated">


                                <h3 class="title title_left">Đăng kí nhận tin</h3>

                                <div class="inner">

                                    <form accept-charset=''UTF-8'' action=''https://shop.dienquang.com/account/contact'' class=''contact-form'' method=''post''>
                                        <input name=''form_type'' type=''hidden'' value=''customer''>
                                        <input name=''utf8'' type=''HIDDEN'' value=''✓''>

                                        <div class="group-input">
                                            <input type="hidden" id="contact_tags" name="contact[tags]" value="khách hàng tiềm năng, bản tin" />
                                            <input type="email" required="required" name="contact[email]" id="contact_email" />
                                            <span class="bar"></span>
                                            <label>Nhập email của bạn</label>
                                            <button type="submit"><i class="fa fa-paper-plane-o"></i></button>
                                        </div>




                                    </form>


                                    <div class="caption">Hãy nhập email của bạn vào đây để nhận tin!</div>

                                </div>



                                <div id="widget-social" class="social-icons">
                                    <ul class="list-inline">

                                        <li>
                                            <a target="_blank" href="https://www.facebook.com/dienquangonline/" class="social-wrapper facebook">
                                                <span class="social-icon">
                                                    <i class="fa fa-facebook"></i>
                                                </span>
                                            </a>
                                        </li>


                                        <li>
                                            <a target="_blank" href="https://twitter.com/dienquanglamp" class="social-wrapper twitter">
                                                <span class="social-icon">
                                                    <i class="fa fa-twitter"></i>
                                                </span>
                                            </a>
                                        </li>


                                        <li>
                                            <a target="_blank" href="https://pinterest.com/dienquanglamp" class="social-wrapper pinterest">
                                                <span class="social-icon">
                                                    <i class="fa fa-pinterest"></i>
                                                </span>
                                            </a>
                                        </li>


                                        <li>
                                            <a target="_blank" href="https://google.com/+dienquang?aelang=vi" class="social-wrapper google">
                                                <span class="social-icon">
                                                    <i class="fa fa-google-plus"></i>
                                                </span>
                                            </a>
                                        </li>


                                        <li>
                                            <a target="_blank" href="https://www.youtube.com/channel/UC5lyYES19jDnyJlHWu2kLWw?view_as=subscriber" class="social-wrapper youtube">
                                                <span class="social-icon">
                                                    <i class="fa fa-youtube"></i>
                                                </span>
                                            </a>
                                        </li>


                                        <li>
                                            <a target="_blank" href="https://www.instagram.com/shopdienquang/" class="social-wrapper instagram">
                                                <span class="social-icon">
                                                    <i class="fa fa-instagram"></i>
                                                </span>
                                            </a>
                                        </li>

                                    </ul>
                                </div>

                            </div>
                        </div>


                        <div class="col-sm-6 col-md-4 col-xs-12 clear-sm">
                            <div class="widget-wrapper animated">

                                <h3 class="title title_left">Kết nối với chúng tôi</h3>

                                <div class="inner">
                                    <!-- Facebook widget -->
                                    <div class="footer-static-content">
                                        <div class="fb-page" data-href="https://www.facebook.com/dienquangonline/" data-height="300" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true" data-show-posts="false">	</div>
                                    </div>
                                    <div style="clear:both;">

                                    </div>
                                    <!-- #Facebook widget -->
                                    <script>
                                            (function (d, s, id) {
                                                var js, fjs = d.getElementsByTagName(s)[0];
                                                if (d.getElementById(id)) return;
                                                js = d.createElement(s); js.id = id;
                                                js.src = "../Assets/Client/connect.facebook.net/vi_VN/sdk.js#xfbml=1&appId=263266547210244&version=v2.0";
                                                fjs.parentNode.insertBefore(js, fjs);
                                            }(document, ''script'', ''facebook-jssdk''));
                                    </script>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container copyright">
                    <p>
                        © Công ty Cổ phần Bóng đèn Điện Quang Giấy chứng ĐKKD số 0300363808 do sở KH và ĐT TPHCM cấp
                        Người chịu trách nhiệm quản lý nội dụng : Nguyễn Thị Phượng
                    </p>
                </div>
            </div>
        </footer>', 1)
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang chủ', N'/', 1, N'_blank', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Giới thiệu', N'/gioi-thieu', 2, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Tin tức', N'/tin-tuc', 3, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Sản phẩm', N'/san-pham', 4, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Liên hệ', N'/lien-he', 5, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Đăng nhập', N'/dang-nhap', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Đăng kí', N'/dang-ki', 2, N'_self', 1, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu chính')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu top')
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (1, NULL, 10002, N'Phan Anh Tuan', N'12345567', N'Hoa Binh', N'tuan@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (49, 1, 3, CAST(120000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (50, 1, 3, CAST(150000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (43, N'Product1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (44, N'Product2', NULL, NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), NULL, NULL, 0, 2, NULL, NULL, CAST(N'2018-10-28T20:03:48.403' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (45, N'Product3', NULL, NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), NULL, NULL, 0, 3, NULL, NULL, CAST(N'2018-10-28T20:03:58.297' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (47, N'Product 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (48, N'Product 5', NULL, NULL, NULL, N'/Data/images/ad/40002147_1921903507896579_8922226367626477568_n.jpg', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (49, N'Hộp đất nặn nhiều màu', N'DC-00001', NULL, N'Chất liệu: Bột mì, màu Độ tuổi: 3 tuổi. Rèn luyện tính khéo léo, sáng tạo của bé. Có nhiều màu khác nhau. Kích thước hộp: 18x4x18 (cm). Xuất xứ: Trung Quốc', N'/Data/images/ad/dochoi1.jpg', NULL, CAST(40000 AS Decimal(18, 0)), NULL, 1, 99, 3, N'Hộp đất nặn nhiều màu được làm từ bột mì an toàn, có nhiều màu khác nhau nên bé có thể nặn thành nhiều hình hoa quả, con vật...rèn luyện khả năng khéo léo, trí tưởng tưởng khi chơi. Sản phẩm thích hợp làm quà tặng cho bé từ 3 tuổi trở lên.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (50, N'Bộ đồ chơi xếp hình', N'DC-00002', NULL, N'Chất liệu: Nhựa cao cấp. Số chi tiết: 174. Độ tuổi: 6 - 12 tuổi. Mảnh ghép nhiều màu sắc. Giúp phát triển trí tuệ, tư duy. Xuất xứ: Trung Quốc', N'/Data/images/ad/dochoi2.jpg', NULL, CAST(50000 AS Decimal(18, 0)), NULL, 1, 99, 3, N'Bộ đồ chơi xếp hình gồm 174 miếng ghép nhiều màu sắc, bằng nhựa an toàn, để bé có thể ráp thành mô hình tàu thủy, máy bay, cano. Đồ chơi lắp ráp giúp bé phát triển trí tuệ, tư duy cũng như khả năng sáng tạo, bé có thể xây dựng nên những câu chuyện của riêng mình.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (51, N'Quần áo liền Carminas', N'QA-00001', NULL, N'Chất liệu vải cotton. Thiết kế kiểu cúc bấm. Xinh xắn, đáng yêu', N'/Data/images/ad/quanao1.jpg', NULL, CAST(100000 AS Decimal(18, 0)), NULL, 1, 99, 2, N'Quần áo Carminas với nhiều màu và họa tiết, được may từ chất liệu vải cotton mềm mại, thấm hút mồ hôi và giữ ấm cho bé. Body có kiểu liền tất thích hợp cho trẻ mặc vào mùa đông, mẹ không sợ bé bị lạnh khi ngủ hay vận động mạnh. Body có thiết kế kiểu khuy bấm, không làm bé bị đau, rất tiện lợi cho các mẹ khi thay bỉm cho bé.', NULL, NULL, NULL, CAST(N'2018-10-29T21:39:02.733' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (52, N'Quần áo liền Carminas 2', N'QA-00002', NULL, N'Chất liệu vải cotton. Thiết kế kiểu cúc bấm. Xinh xắn, đáng yêu', N'/Data/images/ad/quanao2.jpg', NULL, CAST(120000 AS Decimal(18, 0)), NULL, 1, 99, 2, N'Quần áo Carminas với nhiều màu và họa tiết, được may từ chất liệu vải cotton mềm mại, thấm hút mồ hôi và giữ ấm cho bé. Body có kiểu liền tất thích hợp cho trẻ mặc vào mùa đông, mẹ không sợ bé bị lạnh khi ngủ hay vận động mạnh. Body có thiết kế kiểu khuy bấm, không làm bé bị đau, rất tiện lợi cho các mẹ khi thay bỉm cho bé.', NULL, NULL, NULL, CAST(N'2018-10-29T21:38:51.913' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MetaTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (53, N'Quần áo liền Carminas 3', N'QA-00003', NULL, N'Chất liệu vải cotton. Thiết kế kiểu cúc bấm. Xinh xắn, đáng yêu', N'/Data/images/ad/quanao3.jpg', NULL, CAST(120000 AS Decimal(18, 0)), NULL, 1, 99, 2, N'Quần áo Carminas với nhiều màu và họa tiết, được may từ chất liệu vải cotton mềm mại, thấm hút mồ hôi và giữ ấm cho bé. Body có kiểu liền tất thích hợp cho trẻ mặc vào mùa đông, mẹ không sợ bé bị lạnh khi ngủ hay vận động mạnh. Body có thiết kế kiểu khuy bấm, không làm bé bị đau, rất tiện lợi cho các mẹ khi thay bỉm cho bé.', NULL, NULL, NULL, CAST(N'2018-10-29T21:38:39.603' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (1, N'Sữa', NULL, NULL, 0, NULL, CAST(N'2018-10-28T15:45:53.737' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (2, N'Quần áo', NULL, NULL, 0, NULL, CAST(N'2018-10-28T15:46:45.987' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (3, N'Đồ chơi', NULL, NULL, 0, NULL, CAST(N'2018-10-28T15:46:55.537' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
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
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
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
