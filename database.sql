USE [ShopManageDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 02/01/2019 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 02/01/2019 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductId] [bigint] NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[Quanlity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 02/01/2019 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[UserId] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 02/01/2019 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](10) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[Quanlity] [int] NULL,
	[ProductCategoryId] [bigint] NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 02/01/2019 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL,
	[CategoryId] [bigint] NULL,
	[ShowOnHome] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 02/01/2019 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[GroupId] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 02/01/2019 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](30) NULL,
	[GroupId] [varchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name], [CreateDate], [Status]) VALUES (1, N'Ði?n tho?i', CAST(N'2017-02-23T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (1, 11, 1, CAST(6500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (1, 13, 2, CAST(13000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (1, 14, 9, CAST(58500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (2, 9, 1, CAST(20500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (4, 15, 1, CAST(3050000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (11, 6, 1, CAST(3050000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (12, 9, 2, CAST(2300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (12, 10, 3, CAST(3450000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (12, 12, 2, CAST(2300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (13, 6, 1, CAST(1550000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (19, 7, 1, CAST(17500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (19, 8, 9, CAST(157500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (21, 13, 10, CAST(150000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (22, 12, 1, CAST(25500000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (22, 15, 2, CAST(51000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([ProductId], [OrderId], [Quanlity], [Price]) VALUES (22, 16, 2, CAST(51000000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderId], [CreateDate], [UserId], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (6, CAST(N'2018-12-10T12:09:17.957' AS DateTime), 5, N'dat', N'0165 451 5989', N'xóm 12 -thôn đoàn kết -cổ đông -sơn tây -hà nội', N'adawd@adaas.com', 0)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [UserId], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (7, CAST(N'2018-12-10T12:09:44.070' AS DateTime), 5, N'dat', N'0165 451 5989', N'xóm 12 -thôn đoàn kết -cổ đông -sơn tây -hà nội', N'awdawdaw', 0)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [UserId], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (8, CAST(N'2018-12-10T12:10:24.917' AS DateTime), 8, N'dai gia', N'0165 451 5789', N'xom 12 - thon doan ket -co dong -son tay -hanoi', N'ABC@XYZ.COM', 0)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [UserId], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (9, CAST(N'2018-12-10T12:11:47.633' AS DateTime), 5, N'anonymous', N'0165 451 5989', N'xóm 12 -thôn đoàn kết -cổ đông -sơn tây -hà nội', N'daaws@dsfsdf/vb', 0)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [UserId], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (10, CAST(N'2018-12-10T12:12:35.447' AS DateTime), 9, N'shi', N'0165 451 5989', N'xóm 12 -thôn đoàn kết -cổ đông -sơn tây -hà nội', N'awdawdaw@sfdsdf.vn', 0)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [UserId], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (11, CAST(N'2018-12-10T12:23:51.583' AS DateTime), 9, N'tran van dat', N'0123456789', N'xóm 12 -thôn đoàn kết -cổ đông -sơn tây -hà nội', N'awdawdaw@sfdsdf.vn', 0)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [UserId], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (12, CAST(N'2018-12-11T00:00:00.000' AS DateTime), NULL, N'anonymous', N'0165 451 5789', N'xom 12 - thon doan ket -co dong -son tay -hanoi', N'hello@sdfds.vn', 0)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [UserId], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (13, CAST(N'2018-12-11T14:11:32.617' AS DateTime), 8, N'tran van dat', N'0165 451 5789', N'xom 12 - thon doan ket -co dong -son tay -hanoi', N'sfsefe@sdfsdf.dvd', 0)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [UserId], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (14, CAST(N'2018-12-11T00:00:00.000' AS DateTime), NULL, N'dgdfgdrgdrgrd', N'0165 451 5789', N'xom 12 - thon doan ket -co dong -son tay -hanoi', N'awdawdaw@sfdsdf.vn', 0)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [UserId], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (15, CAST(N'2018-12-11T14:40:20.773' AS DateTime), 10, N'dat', N'0165 451 5989', N'xóm 12 -thôn đoàn kết -cổ đông -sơn tây -hà nội', N'awdawdaw@dsf.bn', 1)
INSERT [dbo].[Orders] ([OrderId], [CreateDate], [UserId], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (16, CAST(N'2018-12-11T14:42:27.643' AS DateTime), 10, N'tran van dat', N'0165 451 5789', N'xom 12 - thon doan ket -co dong -son tay -hanoi', N'awdawdaw@sfdsdf.vn', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (1, N'Iphone 7', N'IP7', N'Là chiếc smartphone cao cấp nhất của Apple với mức giá khủng chưa từng có, bộ nhớ trong lên tới 512GB, iPhone XS Max 512GB - sở hữu cái tên khác biệt so với các thế hệ trước, trang bị tới 6.5 inch đầu tiên của hãng cùng các thiết kế cao cấp hiện đại từ chip A12 cho tới camera AI.', N'\img\7.jpg', CAST(7000000 AS Decimal(18, 0)), CAST(6500000 AS Decimal(18, 0)), 0, 1, CAST(N'2018-12-11T14:38:58.687' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (2, N'Iphone X', N'IPX', N'Là chiếc smartphone cao cấp nhất của Apple với mức giá khủng chưa từng có, bộ nhớ trong lên tới 512GB, iPhone XS Max 512GB - sở hữu cái tên khác biệt so với các thế hệ trước, trang bị tới 6.5 inch đầu tiên của hãng cùng các thiết kế cao cấp hiện đại từ chip A12 cho tới camera AI.', N'\img\x.jpg', CAST(22000000 AS Decimal(18, 0)), CAST(20500000 AS Decimal(18, 0)), 33, 1, CAST(N'2018-12-10T12:11:47.740' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (3, N'Iphone 5', N'IP5', N'Là chiếc smartphone cao cấp nhất của Apple với mức giá khủng chưa từng có, bộ nhớ trong lên tới 512GB, iPhone XS Max 512GB - sở hữu cái tên khác biệt so với các thế hệ trước, trang bị tới 6.5 inch đầu tiên của hãng cùng các thiết kế cao cấp hiện đại từ chip A12 cho tới camera AI.', N'\img\5.jpg', CAST(12000000 AS Decimal(18, 0)), CAST(1050000 AS Decimal(18, 0)), 0, 1, CAST(N'2018-11-28T21:06:21.117' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (4, N'Iphone 6', N'IP6', N'Là chiếc smartphone cao cấp nhất của Apple với mức giá khủng chưa từng có, bộ nhớ trong lên tới 512GB, iPhone XS Max 512GB - sở hữu cái tên khác biệt so với các thế hệ trước, trang bị tới 6.5 inch đầu tiên của hãng cùng các thiết kế cao cấp hiện đại từ chip A12 cho tới camera AI.', N'\img\6.jpg', CAST(4200000 AS Decimal(18, 0)), CAST(3050000 AS Decimal(18, 0)), 115, 1, CAST(N'2018-12-11T14:40:20.843' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (5, N'Iphone 8 plus', N'IP8P', N'Là chiếc smartphone cao cấp nhất của Apple với mức giá khủng chưa từng có, bộ nhớ trong lên tới 512GB, iPhone XS Max 512GB - sở hữu cái tên khác biệt so với các thế hệ trước, trang bị tới 6.5 inch đầu tiên của hãng cùng các thiết kế cao cấp hiện đại từ chip A12 cho tới camera AI.', N'\img\8.jpg', CAST(12000000 AS Decimal(18, 0)), CAST(10500000 AS Decimal(18, 0)), 230, 1, CAST(N'2017-02-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (6, N'HP Omen', N'hpo', N'Màn hình đẹp ,Chất', N'\img\Hp-omen.png', CAST(24200000 AS Decimal(18, 0)), CAST(21050000 AS Decimal(18, 0)), 0, 2, CAST(N'2018-11-28T21:02:54.073' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (7, N'AlienWare 15', N'Alien', N'Màn hình đẹp ,Chất', N'\img\alienware.jpg', CAST(32000000 AS Decimal(18, 0)), CAST(30500000 AS Decimal(18, 0)), 38, 2, CAST(N'2018-12-05T12:00:34.507' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (9, N'Macbook Pro 18', N'MR972', N'Bộ vi xử lý	Intel Core i7-6 core 2.6Ghz/9MB L3 cache 
Bộ nhớ trong	16GB DDR4 
VGA	AMD Radeon Pro 560X 4GB DDR5 
Ổ cứng	512GB SSD 
Ổ quang	•	Không 
Card Reader	•	Không 
Bảo mật, Công nghệ	TouchID 
Màn hình Retina 15.4" (2880x1800) IPS LED BackLit', N'\img\macbook.jpg', CAST(42000000 AS Decimal(18, 0)), CAST(40500000 AS Decimal(18, 0)), 89, 2, CAST(N'2018-12-05T12:02:59.750' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (10, N'Asus ROG Gl503', N'AsusGl', N'Bộ vi xử lý	Intel Core i7-7700HQ Processor (4 x 2.80 GHz) - Max Turbo Frequency: 3.80 GHz 
Chipset	HM175 
Bộ nhớ trong	1 x 8GB DDR4, 2400MHz 
VGA	NVIDIA GeForce GTX 1060 (6GB of GDDR5 SDRAM, Bus Width: 192-Bit) 
Ổ cứng	1TB SATA3 (5400rpm) + 128GB SSD (M.2 2280) 
Ổ quang	
Card Reader	3 -in-1 card reader (SD/ SDHC/ SDXC/ MMC) 
Màn hình	15.6" 16:9 FHD', N'\img\asus.jpg', CAST(32500000 AS Decimal(18, 0)), CAST(30500000 AS Decimal(18, 0)), 50, 2, CAST(N'2018-12-10T11:07:50.453' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (11, N'AirPods Apple', N'ear', N'Mỗi tai nghe đều có một microphone giúp bạn có thể đàm thoại hoặc ra lệnh cho Siri.
Có thể sử dụng nghe nhạc lên đến 5 giờ (âm lượng 50%) cho mỗi một lần sạc đầy. Và 3 giờ (âm lượng 50%) cho 15 phút sạc nhanh.
Sử dụng song song với hộp sạc có thể dùng được lên đến 24 giờ.
Tính năng nhận cuộc gọi, kích hoạt Siri, nghe hoặc tạm dừng đoạn nhạc đang phát.
Sản phẩm chính hãng nguyên seal 100%.
Lưu ý: Thanh toán trước khi mở seal.', N'\img\ear.jpg', CAST(4200000 AS Decimal(18, 0)), CAST(3050000 AS Decimal(18, 0)), 1959, 4, CAST(N'2018-12-10T12:09:18.030' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (12, N'Router Wifi Xiaomi', N'Xiao', N'Mỗi tai nghe đều có một microphone giúp bạn có thể đàm thoại hoặc ra lệnh cho Siri.
Có thể sử dụng nghe nhạc lên đến 5 giờ (âm lượng 50%) cho mỗi một lần sạc đầy. Và 3 giờ (âm lượng 50%) cho 15 phút sạc nhanh.
Sử dụng song song với hộp sạc có thể dùng được lên đến 24 giờ.
Tính năng nhận cuộc gọi, kích hoạt Siri, nghe hoặc tạm dừng đoạn nhạc đang phát.
Sản phẩm chính hãng nguyên seal 100%.
Lưu ý: Thanh toán trước khi mở seal.', N'\img\wifi3.jpg', CAST(1550000 AS Decimal(18, 0)), CAST(1150000 AS Decimal(18, 0)), 13, 9, CAST(N'2018-12-11T13:47:06.383' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (13, N'Sony WH-CH500', N'WH-CH500', N'Tích hợp kết nối Bluetooth® không dây và NFC™.
Khung choàng đầu mỏng và dễ điều chỉnh cùng đệm tai nghe mềm mại.
Vành tai nghe dễ dàng xoay ngang nên bạn có thể cất vào túi mang đi bất cứ đâu.
Pin Li-ion tích hợp cho bạn thoải mái nghe nhạc không dây lên đến 20 giờ và có thể sạc qua kết nối Micro USB. Thời gian sạc khoảng 4,5 giờ.
Màng loa dạng vòm 30 mm tận hưởng những cung bậc âm thanh chi tiết hơn, tiếng bass đã tai hơn.', N'\img\tai nghe sony.jpg', CAST(1990000 AS Decimal(18, 0)), CAST(1550000 AS Decimal(18, 0)), 197, 4, CAST(N'2018-12-10T12:09:18.013' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (14, N'Samsung Level U Pro ', N'BN920C', N'Đệm tai được thiết kế mềm mại, linh hoạt.
Cung cấp hơn 9 giờ nghe nhạc, 9 giờ đàm thoại và 300 giờ cho thời gian chờ.
Chất lượng âm thanh tuyệt hảo nhờ công nghệ giảm tiếng ồn NR và EC.
Kết nối nam châm giữa hai đầu tai nghe của Level U sẽ giữ tai nghe khi không sử dụng.
Dung lượng pin 200mAh (lõi pin Li-ion).
Sản phẩm chính hãng Samsung.', N'\img\tai-nghe-bluetooth-samsung-level-u-pro-bn920c.jpg', CAST(1450000 AS Decimal(18, 0)), CAST(1550000 AS Decimal(18, 0)), 320, 4, CAST(N'2017-02-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (15, N'Earpods Apple', N'MNHF2', N'Jack 3.5 mm phù hợp với đa số smartphone, ipad,..
Thiết kế hiện đại, đầu tai nghe tròn theo hình dáng của tai.
Có phím điều chỉnh âm lượng, nghe/nhận cuộc gọi.
Micro tích hợp có khả năng lọc tiếng ồn.
Sản phẩm chính hãng nguyên seal 100%.
Lưu ý: Thanh toán trước khi mở seal.', N'\img\tai-nghe-earpods-apple-md827fea.jpg', CAST(790000 AS Decimal(18, 0)), CAST(550000 AS Decimal(18, 0)), 320, 4, CAST(N'2017-02-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (16, N'Sony MDR-XB55AP', N'MDR-XB55AP', N'Thiết kế chống rối siêu tiện ích đem đến nhiều tiện lợi hơn cho người dùng.
Mic và điều khiển trên dây để thực hiện các cuộc gọi rảnh tay.
Công nghệ Powered Bass Duct++ cho âm trầm cực sâu lắng.
Hàng chính hãng.', N'\img\tai-nghe-ep-sony-mdr-xb55ap.jpg', CAST(890000 AS Decimal(18, 0)), CAST(650000 AS Decimal(18, 0)), 320, 4, CAST(N'2017-02-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (17, N'Sony WI-C300', N'WI-C300', N'Thiết kế chống rối siêu tiện ích đem đến nhiều tiện lợi hơn cho người dùng.
Mic và điều khiển trên dây để thực hiện các cuộc gọi rảnh tay.
Công nghệ Powered Bass Duct++ cho âm trầm cực sâu lắng.
Hàng chính hãng.', N'\img\tai-nghe-bluetooth-sony-wi-c300.jpg', CAST(1890000 AS Decimal(18, 0)), CAST(1650000 AS Decimal(18, 0)), 320, 4, CAST(N'2017-02-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (18, N'Iphone XS Max', N'XsMax', N'Tích hợp kết nối Bluetooth® không dây và NFC™.
Khung choàng đầu mỏng và dễ điều chỉnh cùng đệm tai nghe mềm mại.
Vành tai nghe dễ dàng xoay ngang nên bạn có thể cất vào túi mang đi bất cứ đâu.
Pin Li-ion tích hợp cho bạn thoải mái nghe nhạc không dây lên đến 20 giờ và có thể sạc qua kết nối Micro USB. Thời gian sạc khoảng 4,5 giờ.
Màng loa dạng vòm 30 mm tận hưởng những cung bậc âm thanh chi tiết hơn, tiếng bass đã tai hơn.', N'\img\x.jpg', CAST(39900000 AS Decimal(18, 0)), CAST(29500000 AS Decimal(18, 0)), 205, 1, CAST(N'2018-12-10T11:14:17.427' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (19, N'Samsung Galaxy S8', N'S8', N'Tích hợp kết nối Bluetooth® không dây và NFC™.
Khung choàng đầu mỏng và dễ điều chỉnh cùng đệm tai nghe mềm mại.
Vành tai nghe dễ dàng xoay ngang nên bạn có thể cất vào túi mang đi bất cứ đâu.
Pin Li-ion tích hợp cho bạn thoải mái nghe nhạc không dây lên đến 20 giờ và có thể sạc qua kết nối Micro USB. Thời gian sạc khoảng 4,5 giờ.
Màng loa dạng vòm 30 mm tận hưởng những cung bậc âm thanh chi tiết hơn, tiếng bass đã tai hơn.', N'\img\samsung-galaxy-s8.jpg', CAST(19900000 AS Decimal(18, 0)), CAST(17500000 AS Decimal(18, 0)), 190, 1, CAST(N'2018-12-10T12:10:24.960' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (20, N'Samsung Galaxy S9', N'S9', N'Tích hợp kết nối Bluetooth® không dây và NFC™.
Khung choàng đầu mỏng và dễ điều chỉnh cùng đệm tai nghe mềm mại.
Vành tai nghe dễ dàng xoay ngang nên bạn có thể cất vào túi mang đi bất cứ đâu.
Pin Li-ion tích hợp cho bạn thoải mái nghe nhạc không dây lên đến 20 giờ và có thể sạc qua kết nối Micro USB. Thời gian sạc khoảng 4,5 giờ.
Màng loa dạng vòm 30 mm tận hưởng những cung bậc âm thanh chi tiết hơn, tiếng bass đã tai hơn.', N'\img\samsung-galaxy-s9.png', CAST(22900000 AS Decimal(18, 0)), CAST(20500000 AS Decimal(18, 0)), 215, 1, CAST(N'2018-12-10T12:04:26.507' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (21, N'Samsung Galaxy Note 8', N'Note8', N'Tích hợp kết nối Bluetooth® không dây và NFC™.
Khung choàng đầu mỏng và dễ điều chỉnh cùng đệm tai nghe mềm mại.
Vành tai nghe dễ dàng xoay ngang nên bạn có thể cất vào túi mang đi bất cứ đâu.
Pin Li-ion tích hợp cho bạn thoải mái nghe nhạc không dây lên đến 20 giờ và có thể sạc qua kết nối Micro USB. Thời gian sạc khoảng 4,5 giờ.
Màng loa dạng vòm 30 mm tận hưởng những cung bậc âm thanh chi tiết hơn, tiếng bass đã tai hơn.', N'\img\samsung-galaxy-note8.png', CAST(19900000 AS Decimal(18, 0)), CAST(15000000 AS Decimal(18, 0)), 206, 1, CAST(N'2018-12-11T14:11:32.680' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (22, N'Samsung Galaxy Note 9', N'Note9', N'Tích hợp kết nối Bluetooth® không dây và NFC™.
Khung choàng đầu mỏng và dễ điều chỉnh cùng đệm tai nghe mềm mại.
Vành tai nghe dễ dàng xoay ngang nên bạn có thể cất vào túi mang đi bất cứ đâu.
Pin Li-ion tích hợp cho bạn thoải mái nghe nhạc không dây lên đến 20 giờ và có thể sạc qua kết nối Micro USB. Thời gian sạc khoảng 4,5 giờ.
Màng loa dạng vòm 30 mm tận hưởng những cung bậc âm thanh chi tiết hơn, tiếng bass đã tai hơn.', N'\img\galaxy-note-9.jpg', CAST(29900000 AS Decimal(18, 0)), CAST(25500000 AS Decimal(18, 0)), 178, 1, CAST(N'2018-12-11T14:42:27.710' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (23, N'Xiaomi MI 8', N'Mi8', N'Tích hợp kết nối Bluetooth® không dây và NFC™.
Khung choàng đầu mỏng và dễ điều chỉnh cùng đệm tai nghe mềm mại.
Vành tai nghe dễ dàng xoay ngang nên bạn có thể cất vào túi mang đi bất cứ đâu.
Pin Li-ion tích hợp cho bạn thoải mái nghe nhạc không dây lên đến 20 giờ và có thể sạc qua kết nối Micro USB. Thời gian sạc khoảng 4,5 giờ.
Màng loa dạng vòm 30 mm tận hưởng những cung bậc âm thanh chi tiết hơn, tiếng bass đã tai hơn.', N'\img\mi8.png', CAST(14900000 AS Decimal(18, 0)), CAST(12500000 AS Decimal(18, 0)), 220, 1, CAST(N'2017-02-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [Name], [Code], [Description], [Image], [Price], [PromotionPrice], [Quanlity], [ProductCategoryId], [CreateDate]) VALUES (24, N'Iphone XS', N'Xs', N'Tích hợp kết nối Bluetooth® không dây và NFC™.
Khung choàng đầu mỏng và dễ điều chỉnh cùng đệm tai nghe mềm mại.
Vành tai nghe dễ dàng xoay ngang nên bạn có thể cất vào túi mang đi bất cứ đâu.
Pin Li-ion tích hợp cho bạn thoải mái nghe nhạc không dây lên đến 20 giờ và có thể sạc qua kết nối Micro USB. Thời gian sạc khoảng 4,5 giờ.
Màng loa dạng vòm 30 mm tận hưởng những cung bậc âm thanh chi tiết hơn, tiếng bass đã tai hơn.', N'\img\x.jpg', CAST(30900000 AS Decimal(18, 0)), CAST(29500000 AS Decimal(18, 0)), 220, 1, CAST(N'2017-02-23T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ProductCategoryId], [Name], [CreateDate], [Status], [CategoryId], [ShowOnHome]) VALUES (1, N'Điện Thoại', CAST(N'2017-02-23T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [Name], [CreateDate], [Status], [CategoryId], [ShowOnHome]) VALUES (2, N'Laptop', CAST(N'2017-02-23T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [Name], [CreateDate], [Status], [CategoryId], [ShowOnHome]) VALUES (3, N'Đồng Hồ', CAST(N'2017-02-23T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [Name], [CreateDate], [Status], [CategoryId], [ShowOnHome]) VALUES (4, N'Phụ Kiện', CAST(N'2017-02-23T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [Name], [CreateDate], [Status], [CategoryId], [ShowOnHome]) VALUES (5, N'Điện lạnh', CAST(N'2017-02-23T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [Name], [CreateDate], [Status], [CategoryId], [ShowOnHome]) VALUES (6, N'Gaming Gear', CAST(N'2017-02-23T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [Name], [CreateDate], [Status], [CategoryId], [ShowOnHome]) VALUES (7, N'Linh Kiện PC', CAST(N'2017-02-23T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [Name], [CreateDate], [Status], [CategoryId], [ShowOnHome]) VALUES (8, N'Thiết Bị Lưu Trữ', CAST(N'2017-02-23T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[ProductCategory] ([ProductCategoryId], [Name], [CreateDate], [Status], [CategoryId], [ShowOnHome]) VALUES (9, N'Thiết Bị Mạng', CAST(N'2017-02-23T00:00:00.000' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
INSERT [dbo].[UserGroup] ([GroupId], [Name]) VALUES (N'11111', N'Admin')
INSERT [dbo].[UserGroup] ([GroupId], [Name]) VALUES (N'12345', N'User')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [Password], [GroupId], [Name], [Address], [Email], [Phone], [CreateDate], [Status]) VALUES (3, N'Tom123', N'123456', N'12345', N'Tom', N'Hanoi', N'abcxyz@asd.com', N'0123456789', CAST(N'2018-11-26T09:47:19.917' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [GroupId], [Name], [Address], [Email], [Phone], [CreateDate], [Status]) VALUES (5, N'helloworld', N'123456', N'12345', N'good boy', N'hà nội', N'dracula@gmail.com', N'0165 451 5989', CAST(N'2018-11-26T13:50:01.620' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [GroupId], [Name], [Address], [Email], [Phone], [CreateDate], [Status]) VALUES (6, N'good girl', N'Kc9TVthEzYcujrw', N'12345', N'test', N'asdasdsa@asd.v', N'asdasdsa@asd.v', N'0165 451 5989', CAST(N'2018-11-26T10:40:12.660' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [GroupId], [Name], [Address], [Email], [Phone], [CreateDate], [Status]) VALUES (8, N'khachhang', N'matkhau', N'12345', N'ga', N'xóm 12 -thôn đoàn kết -cổ đông -sơn tây -hà nội', N'dracula@gmail.com', N'0165 451 5989', CAST(N'2018-11-26T11:00:42.690' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [GroupId], [Name], [Address], [Email], [Phone], [CreateDate], [Status]) VALUES (9, N'emconnho', N'123456', N'12345', N'Em be', N'ha noi', N'asda@sd-df.vn', N'02324324', CAST(N'2018-11-29T13:03:36.097' AS DateTime), 1)
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [GroupId], [Name], [Address], [Email], [Phone], [CreateDate], [Status]) VALUES (10, N'abc1234', N'1234', N'12345', N'dat', N'xom 12 - thon doan ket -co dong -son tay -hanoi', N'dracula@gmail.com', N'0165 451 5789', CAST(N'2018-12-11T14:41:15.977' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[ProductCategory] ([ProductCategoryId])
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[UserGroup] ([GroupId])
GO
