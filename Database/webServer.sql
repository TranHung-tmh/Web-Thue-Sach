USE [master]
GO
/****** Object:  Database [WedChoThueSachCo]    Script Date: 5/17/2024 11:42:32 AM ******/

//xóa database WedChoThueSachCo trước
CREATE DATABASE [WedChoThueSachCo]
GO
ALTER DATABASE [WedChoThueSachCo] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WedChoThueSachCo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WedChoThueSachCo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET ARITHABORT OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WedChoThueSachCo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WedChoThueSachCo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WedChoThueSachCo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WedChoThueSachCo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET RECOVERY FULL 
GO
ALTER DATABASE [WedChoThueSachCo] SET  MULTI_USER 
GO
ALTER DATABASE [WedChoThueSachCo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WedChoThueSachCo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WedChoThueSachCo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WedChoThueSachCo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WedChoThueSachCo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WedChoThueSachCo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WedChoThueSachCo', N'ON'
GO
ALTER DATABASE [WedChoThueSachCo] SET QUERY_STORE = ON
GO
ALTER DATABASE [WedChoThueSachCo] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WedChoThueSachCo]
GO
/****** Object:  Table [dbo].[books]    Script Date: 5/17/2024 11:42:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[book_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[author] [nvarchar](255) NULL,
	[rental_price] [decimal](10, 2) NULL,
	[discount] [int] NULL,
	[published_date] [date] NULL,
	[Order_quantity] [int] NULL,
	[catalogy_id] [int] NULL,
	[description] [nvarchar](255) NULL,
	[img] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[book_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[catalogy]    Script Date: 5/17/2024 11:42:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catalogy](
	[catalogy_id] [int] IDENTITY(1,1) NOT NULL,
	[genre] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[catalogy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 5/17/2024 11:42:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[is_admin] [bit] NOT NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rentals]    Script Date: 5/17/2024 11:42:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rentals](
	[rental_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[rental_date] [datetime] NULL,
	[return_date] [datetime] NULL,
	[actual_return_date] [datetime] NULL,
	[Deposit] [int] NULL,
	[total_amount] [int] NULL,
	[book_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[rental_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[books] ON 
GO
INSERT [dbo].[books] ([book_id], [title], [author], [rental_price], [discount], [published_date], [Order_quantity], [catalogy_id], [description], [img]) VALUES (1, N'Anna Karenina', N'Leo Tolstoy', CAST(100.00 AS Decimal(10, 2)), 10, CAST(N'1801-03-01' AS Date), 5, 2, N'Tác phẩm này là một cuộc hành trình qua tình yêu, đau khổ và sự hy sinh, đưa bạn vào cuộc sống xa hoa và phức tạp của xã hội Nga vào thế kỷ 19.', N'Anna Karenina.jpg')
GO
INSERT [dbo].[books] ([book_id], [title], [author], [rental_price], [discount], [published_date], [Order_quantity], [catalogy_id], [description], [img]) VALUES (2, N'Divine Comedy', N'Dante Alighieri', CAST(90.00 AS Decimal(10, 2)), 0, CAST(N'1900-10-03' AS Date), 1, 11, N' Tác phẩm này dẫn dắt bạn vào một cuộc phiêu lưu sâu sắc qua ba phần: "Inferno" (Địa Ngục), "Purgatorio" (Lưỡi Lửa), và "Paradiso" (Thiên Đàng)', N'Divine Comedy.jpg')
GO
INSERT [dbo].[books] ([book_id], [title], [author], [rental_price], [discount], [published_date], [Order_quantity], [catalogy_id], [description], [img]) VALUES (3, N'Don Quixote', N'Miguel de Cervantes', CAST(100.00 AS Decimal(10, 2)), 20, CAST(N'1909-07-07' AS Date), 3, 1, N' Tại đây, bạn sẽ bắt đầu một cuộc hành trình đầy màu sắc cùng với nhân vật chính Don Quixote và người bạn thân thiết Sancho Panza, qua những thung lũng huyền bí và thôn quê yên bình của Tây Ban Nha', N'Don Quixote.jpg')
GO
INSERT [dbo].[books] ([book_id], [title], [author], [rental_price], [discount], [published_date], [Order_quantity], [catalogy_id], [description], [img]) VALUES (4, N'Gulliver''s Travels', N'Jonathan Swift', CAST(40.00 AS Decimal(10, 2)), 5, CAST(N'1803-01-09' AS Date), 5, 3, N'Tác phẩm này đưa bạn vào những cuộc phiêu lưu thú vị của nhân vật chính Lemuel Gulliver qua các quốc gia và vùng lãnh thổ kỳ lạ, mở ra một thế giới phong phú và kỳ bí.', N'Gulliver''s Travels.jpg')
GO
INSERT [dbo].[books] ([book_id], [title], [author], [rental_price], [discount], [published_date], [Order_quantity], [catalogy_id], [description], [img]) VALUES (5, N'Harry Potter', N'J.K.Rowling', CAST(200.00 AS Decimal(10, 2)), 10, CAST(N'1907-11-09' AS Date), 7, 4, N'Khám phá thế giới phù thủy kỳ diệu qua trọn bộ 8 phần của Harry Potter, một hành trình đầy phép thuật và phiêu lưu đáng nhớ', N'Ilya_Efimovich_Repin_(1844-1930)_-_Portrait_of_Leo_Tolstoy_(1887).jpg')
GO
INSERT [dbo].[books] ([book_id], [title], [author], [rental_price], [discount], [published_date], [Order_quantity], [catalogy_id], [description], [img]) VALUES (6, N'Les Miserables', N'Victor Hugo.', CAST(70.00 AS Decimal(10, 2)), 0, CAST(N'1987-04-04' AS Date), 1, 5, N'Tác phẩm này là một hành trình đầy cảm xúc qua thời kỳ Cách mạng Pháp, nơi mà nhân vật chính Jean Valjean đấu tranh với sự nghèo đói, sự bất công và tìm kiếm sự cứu rỗi.', N'Les Miserables.jpg')
GO
INSERT [dbo].[books] ([book_id], [title], [author], [rental_price], [discount], [published_date], [Order_quantity], [catalogy_id], [description], [img]) VALUES (7, N'Paradise Lost', N'John Milton', CAST(80.00 AS Decimal(10, 2)), 0, CAST(N'1899-05-05' AS Date), 2, 6, N'Tác phẩm này đưa bạn vào một hành trình đầy phép thuật và tôn giáo qua thiên đàng và địa ngục, tạo ra một bức tranh hoành tráng về sự sáng tạo, sự mất mát và sự cứu rỗi.', N'Paradise Lost.jpg')
GO
INSERT [dbo].[books] ([book_id], [title], [author], [rental_price], [discount], [published_date], [Order_quantity], [catalogy_id], [description], [img]) VALUES (8, N'The CanterburyTales', N'Geoffrey Chaucer.', CAST(130.00 AS Decimal(10, 2)), 0, CAST(N'1986-04-04' AS Date), 1, 7, N'Tác phẩm này là một tuyển tập các câu chuyện đa dạng và phong phú, mang lại cho độc giả một cái nhìn sâu sắc vào xã hội và văn hóa thời Trung Cổ.', N'The Canterbury Tales.jpg')
GO
INSERT [dbo].[books] ([book_id], [title], [author], [rental_price], [discount], [published_date], [Order_quantity], [catalogy_id], [description], [img]) VALUES (9, N'The Iliad', N'Homer', CAST(140.00 AS Decimal(10, 2)), 20, CAST(N'1918-05-06' AS Date), 6, 8, N'Tác phẩm văn học kinh điển này là một hành trình sâu sắc vào thế giới của cuộc chiến Trốn Tro, nơi các vị thần và anh hùng chiến đấu, nhưng cũng là nơi mà tình yêu, tự ái và lòng tự hào con người được thể hiện trong những khoảnh khắc đầy cảm xúc', N'The Iliad.jpg')
GO
INSERT [dbo].[books] ([book_id], [title], [author], [rental_price], [discount], [published_date], [Order_quantity], [catalogy_id], [description], [img]) VALUES (10, N'The Odyssey', N'Homer', CAST(60.00 AS Decimal(10, 2)), 5, CAST(N'1978-04-09' AS Date), 4, 9, N'Tác phẩm này là một cuộc phiêu lưu kỳ diệu qua biển cả và thế giới siêu nhiên, đưa bạn đến với những cuộc gặp gỡ với các vị thần và quái vật, cùng với những thử thách và cám dỗ của cuộc sống.', N'The Odyssey.jpg')
GO
INSERT [dbo].[books] ([book_id], [title], [author], [rental_price], [discount], [published_date], [Order_quantity], [catalogy_id], [description], [img]) VALUES (11, N'Ulysses', N'James Joyce', CAST(50.00 AS Decimal(10, 2)), 10, CAST(N'1978-06-09' AS Date), 9, 10, N'Tác phẩm này là một cuộc hành trình phiêu lưu qua mê cung ý nghĩ và tâm trí, đưa bạn vào cuộc sống đầy màu sắc và phức tạp của Dublin vào thế kỷ 20.', N'Ulysses.jpg')
GO
SET IDENTITY_INSERT [dbo].[books] OFF
GO
SET IDENTITY_INSERT [dbo].[catalogy] ON 
GO
INSERT [dbo].[catalogy] ([catalogy_id], [genre]) VALUES (1, N'thiếu nhi')
GO
INSERT [dbo].[catalogy] ([catalogy_id], [genre]) VALUES (2, N'tâm lý')
GO
INSERT [dbo].[catalogy] ([catalogy_id], [genre]) VALUES (3, N'tôn giáo')
GO
INSERT [dbo].[catalogy] ([catalogy_id], [genre]) VALUES (4, N'văn hoá xã hội')
GO
INSERT [dbo].[catalogy] ([catalogy_id], [genre]) VALUES (5, N'lịch sử')
GO
INSERT [dbo].[catalogy] ([catalogy_id], [genre]) VALUES (6, N'văn học viễn tưởng')
GO
INSERT [dbo].[catalogy] ([catalogy_id], [genre]) VALUES (7, N'tiểu sử')
GO
INSERT [dbo].[catalogy] ([catalogy_id], [genre]) VALUES (8, N'kinh dị')
GO
INSERT [dbo].[catalogy] ([catalogy_id], [genre]) VALUES (9, N'giáo dục')
GO
INSERT [dbo].[catalogy] ([catalogy_id], [genre]) VALUES (10, N'khoa học công nghệ')
GO
INSERT [dbo].[catalogy] ([catalogy_id], [genre]) VALUES (11, N'truyền cảm hứng')
GO
SET IDENTITY_INSERT [dbo].[catalogy] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 
GO
INSERT [dbo].[customers] ([customer_id], [fullname], [email], [password], [is_admin], [phone], [address]) VALUES (9, N'Lê Quang Duyệt', N'duyetpro@gmail.com', N'123', 1, N'123456787', N'tiền giang')
GO
INSERT [dbo].[customers] ([customer_id], [fullname], [email], [password], [is_admin], [phone], [address]) VALUES (12, N'Huỳnh Tấn Đạt', N'dat@gmail.com', N'123', 1, N'321564363', N'tây ninh')
GO
INSERT [dbo].[customers] ([customer_id], [fullname], [email], [password], [is_admin], [phone], [address]) VALUES (13, N'Trần Minh Hưng', N'hung@gmail.com', N'123', 1, N'231568391', N'bến tre')
GO
INSERT [dbo].[customers] ([customer_id], [fullname], [email], [password], [is_admin], [phone], [address]) VALUES (14, N'Nguyễn Hoàng Linh', N'linh@gmail.com', N'123', 0, N'431575313', N'bình thuận')
GO
INSERT [dbo].[customers] ([customer_id], [fullname], [email], [password], [is_admin], [phone], [address]) VALUES (15, N'Bùi Hữu Cương', N'cuong@gmail.com', N'123', 1, N'231457645', N'bình dương')
GO
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[rentals] ON 
GO
INSERT [dbo].[rentals] ([rental_id], [customer_id], [rental_date], [return_date], [actual_return_date], [Deposit], [total_amount], [book_id]) VALUES (2, 9, CAST(N'2022-10-02T00:00:00.000' AS DateTime), CAST(N'2024-01-05T00:00:00.000' AS DateTime), CAST(N'2024-01-05T00:00:00.000' AS DateTime), 100, 100000, 1)
GO
SET IDENTITY_INSERT [dbo].[rentals] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__customer__AB6E61648F9BD17C]    Script Date: 5/17/2024 11:42:32 AM ******/
ALTER TABLE [dbo].[customers] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[customers] ADD  DEFAULT ((0)) FOR [is_admin]
GO
ALTER TABLE [dbo].[rentals] ADD  DEFAULT (getdate()) FOR [rental_date]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD FOREIGN KEY([catalogy_id])
REFERENCES [dbo].[catalogy] ([catalogy_id])
GO
ALTER TABLE [dbo].[rentals]  WITH CHECK ADD FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([book_id])
GO
ALTER TABLE [dbo].[rentals]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
USE [master]
GO
ALTER DATABASE [WedChoThueSachCo] SET  READ_WRITE 
GO
