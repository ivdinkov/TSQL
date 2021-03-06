USE [myshopdb]
GO
/****** Object:  User [ivandinkov]    Script Date: 22/09/2017 22:06:20 ******/
CREATE USER [ivandinkov] FOR LOGIN [ivandinkov] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ivandinkov]
GO
/****** Object:  Schema [ivandinkov]    Script Date: 22/09/2017 22:06:20 ******/
CREATE SCHEMA [ivandinkov]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 22/09/2017 22:06:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderStatusID] [int] NOT NULL,
	[OrderDate] [date] NULL,
	[DeliveryDate] [date] NULL,
	[DeliveryStatusID] [int] NOT NULL,
	[ShippingID] [int] NOT NULL,
	[Note] [varchar](100) NULL,
	[TotalCost] [decimal](9, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 22/09/2017 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [varchar](50) NOT NULL,
	[CatDescription] [varchar](100) NULL,
	[ImageUrl] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 22/09/2017 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[DateRegistered] [date] NOT NULL,
	[IsActivated] [bit] NOT NULL,
	[LastLogin] [date] NOT NULL,
	[UserPass] [varchar](max) NOT NULL,
	[IsLogged] [bit] NOT NULL,
	[RoleID] [int] NOT NULL,
	[SecurityQuestion] [varchar](max) NULL,
	[QuestionAnswer] [varchar](max) NULL,
	[Street1] [varchar](50) NULL,
	[Street2] [varchar](50) NULL,
	[Town] [varchar](50) NULL,
	[County] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeliveryStatus]    Script Date: 22/09/2017 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryStatus](
	[DeliveryStatusID] [int] IDENTITY(1,1) NOT NULL,
	[IsDelivered] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Items]    Script Date: 22/09/2017 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[CartID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 22/09/2017 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[OrderType] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 22/09/2017 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProdName] [varchar](50) NOT NULL,
	[Price] [decimal](8, 2) NULL,
	[Discount] [decimal](5, 2) NULL,
	[ImageUrl] [varchar](50) NOT NULL,
	[ProductDescription] [xml] NULL,
	[CategoryID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShippingMethod]    Script Date: 22/09/2017 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingMethod](
	[ShippingID] [int] IDENTITY(1,1) NOT NULL,
	[ShipProvider] [varchar](50) NOT NULL,
	[ShipCharges] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 22/09/2017 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Role] [int] NOT NULL,
	[IsActive] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Pass] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 22/09/2017 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupName] [varchar](50) NOT NULL,
	[SupAddress] [varchar](50) NOT NULL,
	[SupPhone] [varchar](50) NOT NULL,
	[SupEmail] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 22/09/2017 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTransaction]    Script Date: 22/09/2017 22:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTransaction](
	[TransactionID] [varchar](150) NOT NULL,
	[CartID] [int] NOT NULL,
	[TranStatus] [bit] NOT NULL,
	[TranDate] [date] NOT NULL,
	[CustomerID] [int] NULL,
	[TranCost] [decimal](9, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartID], [CustomerID], [OrderStatusID], [OrderDate], [DeliveryDate], [DeliveryStatusID], [ShippingID], [Note], [TotalCost]) VALUES (7, 1, 1, NULL, NULL, 2, 1, NULL, CAST(0.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CatName], [CatDescription], [ImageUrl]) VALUES (1, N'Laptops', N'Small portable computer', N'laptops.jpg')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [DateRegistered], [IsActivated], [LastLogin], [UserPass], [IsLogged], [RoleID], [SecurityQuestion], [QuestionAnswer], [Street1], [Street2], [Town], [County]) VALUES (1, N'asd', N'asd', N'asd@asd.com', N'0321 654', CAST(N'2017-09-22' AS Date), 0, CAST(N'2017-09-22' AS Date), N'AN2rAXbN6Nt7roqeMWGv7xWpBNouUkeILGI1dY9Z9UA8pySDjKleGWSP3XFIKcZxLQ==', 1, 3, N'question', N'AOg3kW+n0eE39GYdKrx9YxVfWanBChqZUyWx39z6QHG7e+8+rLEq9a2BHs5iyMFulA==', N'asd', N'asd', N'asd', N'asd')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[DeliveryStatus] ON 

INSERT [dbo].[DeliveryStatus] ([DeliveryStatusID], [IsDelivered]) VALUES (1, 1)
INSERT [dbo].[DeliveryStatus] ([DeliveryStatusID], [IsDelivered]) VALUES (2, 0)
SET IDENTITY_INSERT [dbo].[DeliveryStatus] OFF
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([OrderStatusID], [OrderType]) VALUES (1, N'Not Placed')
INSERT [dbo].[OrderStatus] ([OrderStatusID], [OrderType]) VALUES (2, N'Placed (awaiting confirmation)')
INSERT [dbo].[OrderStatus] ([OrderStatusID], [OrderType]) VALUES (3, N'Payment confirmed')
INSERT [dbo].[OrderStatus] ([OrderStatusID], [OrderType]) VALUES (4, N'Shipped')
INSERT [dbo].[OrderStatus] ([OrderStatusID], [OrderType]) VALUES (5, N'Delivered')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProdName], [Price], [Discount], [ImageUrl], [ProductDescription], [CategoryID], [SupplierID]) VALUES (1, N'HP 500', CAST(150.00 AS Decimal(8, 2)), CAST(5.00 AS Decimal(5, 2)), N'hp 500.jpg', N'<Sections><Section><Heading xml:space="preserve"> </Heading><Description xml:space="preserve"> </Description></Section></Sections>', 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ShippingMethod] ON 

INSERT [dbo].[ShippingMethod] ([ShippingID], [ShipProvider], [ShipCharges]) VALUES (1, N'Super saver', CAST(5.00 AS Decimal(5, 2)))
INSERT [dbo].[ShippingMethod] ([ShippingID], [ShipProvider], [ShipCharges]) VALUES (2, N'Standard', CAST(10.00 AS Decimal(5, 2)))
INSERT [dbo].[ShippingMethod] ([ShippingID], [ShipProvider], [ShipCharges]) VALUES (3, N'Express', CAST(20.00 AS Decimal(5, 2)))
INSERT [dbo].[ShippingMethod] ([ShippingID], [ShipProvider], [ShipCharges]) VALUES (4, N'Not Selected', CAST(0.00 AS Decimal(5, 2)))
SET IDENTITY_INSERT [dbo].[ShippingMethod] OFF
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([StaffID], [FirstName], [LastName], [Role], [IsActive], [Email], [Pass]) VALUES (1, N'admin', N'admin', 1, 2, N'admin@shop.ie', N'AGB9ScsA3/e47i9OUcHM9tc/dKmhhYM9fEQvjm3ZPN4eP2I8r1TiIt4rMgTb2QsKag==')
SET IDENTITY_INSERT [dbo].[Staff] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierID], [SupName], [SupAddress], [SupPhone], [SupEmail]) VALUES (1, N'HP', N'HP USA', N'0321 321654', N'hp@hp.com')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[UserRole] ([RoleID], [RoleName]) VALUES (2, N'Staff')
INSERT [dbo].[UserRole] ([RoleID], [RoleName]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Customer__A9D105348CB76257]    Script Date: 22/09/2017 22:06:24 ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Customer__A9D10534FB40288F]    Script Date: 22/09/2017 22:06:24 ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Staff__A9D105344DC76233]    Script Date: 22/09/2017 22:06:24 ******/
ALTER TABLE [dbo].[Staff] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Supplier__F389FE8A685A72F0]    Script Date: 22/09/2017 22:06:24 ******/
ALTER TABLE [dbo].[Supplier] ADD UNIQUE NONCLUSTERED 
(
	[SupEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((0)) FOR [IsActivated]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((0)) FOR [IsLogged]
GO
ALTER TABLE [dbo].[DeliveryStatus] ADD  DEFAULT ((0)) FOR [IsDelivered]
GO
ALTER TABLE [dbo].[UserTransaction] ADD  DEFAULT ((0)) FOR [TranStatus]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([DeliveryStatusID])
REFERENCES [dbo].[DeliveryStatus] ([DeliveryStatusID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([DeliveryStatusID])
REFERENCES [dbo].[DeliveryStatus] ([DeliveryStatusID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([OrderStatusID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([OrderStatusID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ShippingID])
REFERENCES [dbo].[ShippingMethod] ([ShippingID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ShippingID])
REFERENCES [dbo].[ShippingMethod] ([ShippingID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[UserRole] ([RoleID])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[UserRole] ([RoleID])
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[UserTransaction]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[UserTransaction]  WITH CHECK ADD FOREIGN KEY([CartID])
REFERENCES [dbo].[Cart] ([CartID])
GO
ALTER TABLE [dbo].[UserTransaction]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[UserTransaction]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[UserTransaction]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[UserTransaction]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[UserTransaction]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[UserTransaction]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
/****** Object:  StoredProcedure [dbo].[uspAllLaptops]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspAllLaptops]
AS
SELECT * FROM Product WHERE CategoryID = 1


GO
/****** Object:  StoredProcedure [dbo].[uspAllProducts]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspAllProducts]
AS
SELECT Product.ProductID, Product.ProdName, Product.Price, Product.CategoryID, Product.Discount, Product.SupplierID, Product.ProductDescription, ProductImage.ImageUrl, ProductImage.ImageID, Supplier.SupName
FROM Product
INNER JOIN ProductImage ON Product.ProductID = ProductImage.ProductID INNER JOIN Supplier ON Product.SupplierID = Supplier.SupplierID


GO
/****** Object:  StoredProcedure [dbo].[uspAllTablets]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspAllTablets]
AS
SELECT Product.ProdName, Product.Price, Product.CategoryID, Product.Discount, Product.SupplierID, Product.ProductDescription, ProductImage.ImageUrl, ProductImage.ImageID, Supplier.SupName
FROM Product
INNER JOIN ProductImage ON Product.ProductID = ProductImage.ProductID INNER JOIN Supplier ON Product.SupplierID = Supplier.SupplierID
WHERE CategoryID = 2


GO
/****** Object:  StoredProcedure [dbo].[uspChangePassword]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[uspChangePassword]
@email varchar(50),
@userpass varchar(max)
As
UPDATE Customer
SET UserPass = @userpass
WHERE Email = @email


GO
/****** Object:  StoredProcedure [dbo].[uspCheckLogin]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROC [dbo].[uspCheckLogin]
@email varchar(50)
AS
SELECT FirstName, UserPass From Customer WHERE Email=@email



GO
/****** Object:  StoredProcedure [dbo].[uspCheckLoginAdmin]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCheckLoginAdmin]
@email varchar(50)
AS
SELECT Staff.Role,Staff.Pass From Staff WHERE Email=@email AND IsActive=2

GO
/****** Object:  StoredProcedure [dbo].[uspCheckQuestion]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspCheckQuestion]
@email varchar(50)
AS
SELECT FirstName, QuestionAnswer From Customer WHERE Email=@email



GO
/****** Object:  StoredProcedure [dbo].[uspCheckShippingCharges]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



Create proc [dbo].[uspCheckShippingCharges]
	@shippingID int
	AS
	Select ShipCharges From ShippingMethod
	Where ShippingID = @shippingID


GO
/****** Object:  StoredProcedure [dbo].[uspCreateAddress]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateAddress]
AS
CREATE TABLE Address(
	AddressID int IDENTITY(1,1) PRIMARY KEY,
	Street1 varchar(50) NOT NULL,
	Street2 varchar(50) NOT NULL,
	Town varchar(50) NOT NULL,
	CountyID int NOT NULL,
	AddressType varchar(50) NOT NULL,
	CustomerID int NOT NULL
	FOREIGN KEY (CountyID) REFERENCES County(CountyID),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)


GO
/****** Object:  StoredProcedure [dbo].[uspCreateCart]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateCart]
AS
CREATE TABLE Cart(
	CartID int IDENTITY(1,1) PRIMARY KEY,
	CustomerID int NOT NULL,
	TotalCost decimal (5,2) NOT NULL,
	OrderStatusID int NOT NULL,
	OrderDate date NOT NULL,
	DeliveryDate date NOT NULL,
	DeliveryStatusID int NOT NULL,
	ShippingID int NOT NULL,
	Note varchar(100)
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	FOREIGN KEY (OrderStatusID) REFERENCES OrderStatus(OrderStatusID),
	FOREIGN KEY (DeliveryStatusID) REFERENCES DeliveryStatus(DeliveryStatusID),
	FOREIGN KEY (ShippingID) REFERENCES ShippingMethod(ShippingID) 
)


GO
/****** Object:  StoredProcedure [dbo].[uspCreateCategory]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateCategory]
AS
CREATE TABLE Category(
	CategoryID int IDENTITY(1,1) PRIMARY KEY,
	CatName varchar(50) NOT NULL,
	CatDescription varchar(100),
	ImageUrl varchar(50) NOT NULL,
)


GO
/****** Object:  StoredProcedure [dbo].[uspCreateCounty]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateCounty]
AS
CREATE TABLE County(
	CountyID int IDENTITY(1,1) PRIMARY KEY,
	CountyName varchar(50)
)


GO
/****** Object:  StoredProcedure [dbo].[uspCreateCustomer]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateCustomer]
AS
CREATE TABLE Customer(
	CustomerID int IDENTITY(1,1) PRIMARY KEY,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Email varchar(50) NOT NULL UNIQUE,	
	Phone varchar(50) NOT NULL,
	DateRegistered date NOT NULL,
	IsActivated bit NOT NULL DEFAULT 0,
	LastLogin date NOT NULL,
	UserPass varchar(max) NOT NULL,
	IsLogged bit NOT NULL DEFAULT 0,
	RoleID int NOT NULL,
	FOREIGN KEY (RoleID) REFERENCES UserRole(RoleID)	
)


GO
/****** Object:  StoredProcedure [dbo].[uspCreateDeliveryStatus]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateDeliveryStatus]
AS
CREATE TABLE DeliveryStatus(
	DeliveryStatusID int IDENTITY(1,1) PRIMARY KEY,
	IsDelivered bit NOT NULL DEFAULT 0 
)


GO
/****** Object:  StoredProcedure [dbo].[uspCreateItems]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateItems]
AS
CREATE TABLE Items(
	CartID int NOT NULL,
	ProductID int NOT NULL,
	Quantity int,	
	FOREIGN KEY (CartID) REFERENCES Cart(CartID),
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
	PRIMARY KEY (CartID, ProductID)
)


GO
/****** Object:  StoredProcedure [dbo].[uspCreateNewCart]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateNewCart]
@email varchar(50),
@totalcost decimal (5,2),
	@orderstatusid int,
	@deliverystatusid int,
	@shippingid int
AS
INSERT INTO Cart (CustomerID, TotalCost, OrderStatusID, DeliveryStatusID, ShippingID)
VALUES ((SELECT CustomerID FROM Customer WHERE Email=@email), @totalcost, @orderstatusid, @deliverystatusid, @shippingid)

GO
/****** Object:  StoredProcedure [dbo].[uspCreateOrderStatus]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateOrderStatus]
AS
CREATE TABLE OrderStatus(
	OrderStatusID int IDENTITY(1,1) PRIMARY KEY,
	OrderType varchar(50) NOT NULL 
)


GO
/****** Object:  StoredProcedure [dbo].[uspCreateProduct]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateProduct]
AS
CREATE TABLE Product(
	ProductID int IDENTITY(1,1) PRIMARY KEY,	
	ProdName varchar(50) NOT NULL,
	Price decimal (5,2),
	Discount decimal (5,2),
	ImageUrl varchar(50) NOT NULL,
	ProductDescription xml,	
	CategoryID int NOT NULL,
	SupplierID int NOT NULL,
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
	FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID) 
)


GO
/****** Object:  StoredProcedure [dbo].[uspCreateProductImage]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateProductImage]
AS
CREATE TABLE ProductImage(
	ImageID int IDENTITY(1,1) PRIMARY KEY,
	ImageUrl varchar(50) NOt NULL,
	ProductID int NOT NULL,
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID))


GO
/****** Object:  StoredProcedure [dbo].[uspCreateShippingMethod]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateShippingMethod]
AS
CREATE TABLE ShippingMethod(
	ShippingID int IDENTITY(1,1) PRIMARY KEY,
	ShipProvider varchar(50) NOT NULL,
	ShipCharges decimal (5,2)
)


GO
/****** Object:  StoredProcedure [dbo].[uspCreateStaff]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateStaff]
AS
CREATE TABLE [dbo].[Staff] (
    [StaffID]   INT           IDENTITY (1, 1) NOT NULL,
    [FirstName] VARCHAR (50)  NOT NULL,
    [LastName]  VARCHAR (50)  NOT NULL,
    [Role]      INT  NOT NULL,
    [IsActive]  INT  NOT NULL,
    [Email]     VARCHAR (100) NOT NULL,
    [Pass]      VARCHAR (MAX) NOT NULL,
    UNIQUE NONCLUSTERED ([Email] ASC)
);

GO
/****** Object:  StoredProcedure [dbo].[uspCreateUserAccount]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateUserAccount]
AS
CREATE TABLE UserAccount(
	AccountID int IDENTITY(1,1) PRIMARY KEY,
	CardID int NOT NULL,
	CustomerID int NOT NULL,
	FOREIGN KEY (CardID) REFERENCES UserCard(CardID),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)


GO
/****** Object:  StoredProcedure [dbo].[uspCreateUserCard]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateUserCard]
AS
CREATE TABLE UserCard(
	CardID int NOT NULL PRIMARY KEY,
	CardProvider varchar(50) NOT NULL,
	ExpiryDate date NOT NULL
)


GO
/****** Object:  StoredProcedure [dbo].[uspCreateUserRole]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateUserRole]
AS
CREATE TABLE UserRole(
	RoleID int IDENTITY(1,1) PRIMARY KEY,
	RoleName varchar(50) NOT NULL,
)


GO
/****** Object:  StoredProcedure [dbo].[uspCreateUserTransaction]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspCreateUserTransaction]
AS
CREATE TABLE UserTransaction(
	TransactionID varchar(150) NOT NULL PRIMARY KEY,
	CartID int NOT NULL,
	TranCost decimal NOT NULL,
	TranStatus bit NOT NULL DEFAULT 0,
	TranDate date NOT NULL,
	AccountID int NOT NULL,
	FOREIGN KEY (CartID) REFERENCES Cart(CartID),
	FOREIGN KEY (AccountID) REFERENCES UserAccount(AccountID)
)


GO
/****** Object:  StoredProcedure [dbo].[uspDeleteAllCartItems]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspDeleteAllCartItems]
	@email varchar (50)
AS
DELETE FROM Items
WHERE CartID = (SELECT CartID From Cart
Inner join Customer on Cart.CustomerID = Customer.CustomerID
WHERE Customer.Email = @email AND Cart.OrderStatusID = 1)



GO
/****** Object:  StoredProcedure [dbo].[uspDeleteCartItem]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[uspDeleteCartItem]
	@email varchar(50),
	@productID int
AS
DELETE FROM Items
WHERE CartID = (SELECT CartID From Cart
Inner join Customer on Cart.CustomerID = Customer.CustomerID
WHERE Customer.Email = @email AND Cart.OrderStatusID = 1) and ProductID = @productID


GO
/****** Object:  StoredProcedure [dbo].[uspGetSecurityQuestion]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[uspGetSecurityQuestion]
@email varchar(50)
AS
SELECT SecurityQuestion From Customer WHERE Email=@email



GO
/****** Object:  StoredProcedure [dbo].[uspIncreaseQuantityofItem]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[uspIncreaseQuantityofItem]
	@email varchar(50),
	@productID int,
	@quantity int
	AS
	UPDATE Items
SET Quantity = @quantity
WHERE CartID = (SELECT CartID From Cart
Inner join Customer on Cart.CustomerID = Customer.CustomerID
WHERE Customer.Email = @email AND Cart.OrderStatusID = 1) AND ProductID = @productID

GO
/****** Object:  StoredProcedure [dbo].[uspInsertAddress]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertAddress]
	@street1 varchar(50),
	@street2 varchar(50),
	@town varchar(50),
	@countyid int,
	@addresstype varchar(50),
	@customerID int
AS
INSERT INTO Address VALUES (@street1, @street2, @town, @countyID, @addresstype, @customerID)


GO
/****** Object:  StoredProcedure [dbo].[uspInsertCategory]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspInsertCategory]
	@catname varchar(50),
	@catdescription varchar(100),
	@imageURL varchar(50)
AS
INSERT INTO Category VALUES (@catname, @catdescription, @imageURL)


GO
/****** Object:  StoredProcedure [dbo].[uspInsertCounty]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertCounty]
	@countyname varchar(50)
AS
INSERT INTO County VALUES (@countyname)


GO
/****** Object:  StoredProcedure [dbo].[uspInsertCustomerandCart]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspInsertCustomerandCart]
	@firstname varchar(50),
	@lastname varchar(50),
	@email varchar(50),
	@phone varchar(50),
	@dateregistered date,
	@isactivated bit,
	@lastlogin date,
	@userpass varchar(max),
	@securityquestion varchar(max),
	@securityanswer varchar(max),
	@address1 varchar(50),
	@address2 varchar(50),
	@town varchar(50),
	@county varchar(50),
	@islogged bit,
	@roleid int,
	@totalcost decimal (5,2),
	@orderstatusid int,
	@deliverystatusid int,
	@shippingid int
	
AS
INSERT INTO Customer VALUES (@firstname, @lastname, @email, @phone, @dateregistered, @isactivated,@lastlogin, @userpass, @islogged, @roleid, @securityquestion, @securityanswer, @address1, @address2, @town, @county)
INSERT INTO Cart (CustomerID, TotalCost, OrderStatusID, DeliveryStatusID, ShippingID) VALUES ((SELECT CustomerID FROM Customer WHERE Email=@email), @totalcost, @orderstatusid, @deliverystatusid, @shippingid)

GO
/****** Object:  StoredProcedure [dbo].[uspInsertDeliveryStatus]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertDeliveryStatus]

	@isdelivered bit

AS
INSERT INTO DeliveryStatus VALUES (@isdelivered)


GO
/****** Object:  StoredProcedure [dbo].[uspInsertItems]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspInsertItems]

	@email varchar(50),
	@productID int,
	@quantity int
AS
INSERT INTO Items VALUES ((SELECT CartID From Cart
Inner join Customer on Cart.CustomerID = Customer.CustomerID
WHERE Customer.Email = @email AND Cart.OrderStatusID = 1), @productID, @quantity)


GO
/****** Object:  StoredProcedure [dbo].[uspInsertOrderStatus]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertOrderStatus]

	@ordertype varchar(50) 
AS
INSERT INTO OrderStatus VALUES (@ordertype)


GO
/****** Object:  StoredProcedure [dbo].[uspInsertProduct]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertProduct]

	@prodname varchar(50),
	@price decimal (5,2),
	@discount decimal (5,2),
	@image varchar(50),
	@description xml,
	@categoryID int,
	@supplierID int
AS
INSERT INTO Product VALUES (@prodname, @price, @discount,@image, @description, @categoryID, @supplierID)


GO
/****** Object:  StoredProcedure [dbo].[uspInsertProductImage]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertProductImage]
	@imageurl varchar(50),
	@productID int
AS
INSERT INTO ProductImage VALUES (@imageurl, @productID)


GO
/****** Object:  StoredProcedure [dbo].[uspInsertShippingMethod]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertShippingMethod]

	@shipprovider varchar(50),
	@shipcharges decimal (5,2)
AS
INSERT INTO ShippingMethod VALUES (@shipprovider, @shipcharges)


GO
/****** Object:  StoredProcedure [dbo].[uspInsertStaff]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[uspInsertStaff]
	@fname varchar(50),
	@sname varchar(50),
	@role int,
	@active int,
	@email varchar(100),
	@pass varchar(MAX)
AS
INSERT INTO Staff VALUES (@fname, @sname, @role,@active,@email,@pass)

GO
/****** Object:  StoredProcedure [dbo].[uspInsertSupplier]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertSupplier]
	@supname varchar(50),
	@supaddress varchar(50),
	@supphone varchar(50),
	@supemail varchar(50)
AS
INSERT INTO Supplier VALUES (@supname, @supaddress, @supphone, @supemail)


GO
/****** Object:  StoredProcedure [dbo].[uspInsertUserAccount]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertUserAccount]
	@cardid int,
	@customerid int
AS
INSERT INTO UserAccount VALUES (@cardid, @customerid)


GO
/****** Object:  StoredProcedure [dbo].[uspInsertUserCard]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertUserCard]
	@cardid int,
	@cardprovider varchar(50),
	@expirydate date
AS
INSERT INTO UserCard VALUES (@cardid, @cardprovider, @expirydate)


GO
/****** Object:  StoredProcedure [dbo].[uspInsertUserRole]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertUserRole]
	@rolename varchar(50)
AS
INSERT INTO UserRole VALUES (@rolename)


GO
/****** Object:  StoredProcedure [dbo].[uspInsertUserTransaction]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspInsertUserTransaction]

	@transactionid varchar(150),
	@email varchar(50),
	@trancost decimal (9,2),
	@transtatus bit,
	@trandate date
	AS
INSERT INTO UserTransaction (TransactionID, CartID, TranCost, TranStatus, TranDate, CustomerID)
VALUES (@transactionid, (SELECT CartID From Cart Inner join Customer on Cart.CustomerID = Customer.CustomerID
WHERE Customer.Email = @email AND Cart.OrderStatusID = 1),
@trancost, @transtatus, @trandate, (SELECT CustomerID FROM Customer WHERE Customer.Email = @email))

GO
/****** Object:  StoredProcedure [dbo].[uspSelectItemsFromCart]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSelectItemsFromCart]
@email varchar(50)
AS
SELECT Product.ProductID, Items.Quantity, Product.ProdName, Product.Price, Product.CategoryID, Product.Discount, Product.SupplierID, Product.ProductDescription, Product.ImageUrl, Supplier.SupName
FROM Product INNER JOIN Supplier ON Product.SupplierID = Supplier.SupplierID INNER JOIN Items ON Product.ProductID = Items.ProductID INNER JOIN Cart on Items.CartID = Cart.CartID Inner join Customer on Cart.CustomerID = Customer.CustomerID
WHERE Customer.Email = @email AND Cart.OrderStatusID = 1

GO
/****** Object:  StoredProcedure [dbo].[uspSelectSingleCategory]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSelectSingleCategory] 
@id int
AS
SELECT        CategoryID,CatName,CatDescription,ImageUrl
FROM          Category
WHERE		  CategoryID = @id


GO
/****** Object:  StoredProcedure [dbo].[uspSelectSingleProduct]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSelectSingleProduct]
       @Id INT
AS
SELECT ProductID,ProdName,Price,Discount,ImageUrl, CategoryID, SupplierID
FROM Product 
WHERE ProductID = @Id

GO
/****** Object:  StoredProcedure [dbo].[uspSelectSingleProductDescription]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSelectSingleProductDescription] 
@id int
AS
SELECT        *
FROM          Product
WHERE		  ProductID = @id

GO
/****** Object:  StoredProcedure [dbo].[uspSelectSingleStaff]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSelectSingleStaff] 
@id int
AS
SELECT        *
FROM          Staff
WHERE		  StaffID = @id


GO
/****** Object:  StoredProcedure [dbo].[uspSelectSingleSupplier]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspSelectSingleSupplier] 
@id int
AS
SELECT        SupplierID,SupName,SupAddress,SupPhone,SupEmail
FROM          Supplier
WHERE		  SupplierID = @id

GO
/****** Object:  StoredProcedure [dbo].[uspUpdateCartCost]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[uspUpdateCartCost]
@email varchar(50),
@price decimal (5,2)
AS
Update Cart 
SET TotalCost = @price
Where CartID = (SELECT CartID From Cart
Inner join Customer on Cart.CustomerID = Customer.CustomerID
WHERE Customer.Email = @email AND Cart.OrderStatusID = 1)


GO
/****** Object:  StoredProcedure [dbo].[uspUpdateCartOrder]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[uspUpdateCartOrder]
@email varchar(50),
@orderdate date
	AS
	UPDATE Cart
	SET OrderStatusID = 2, OrderDate = @orderdate
WHERE CartID = (SELECT CartID From Cart
Inner join Customer on Cart.CustomerID = Customer.CustomerID
WHERE Customer.Email = @email AND Cart.OrderStatusID = 1)


GO
/****** Object:  StoredProcedure [dbo].[uspUpdateCartOrderPlaced]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[uspUpdateCartOrderPlaced]
@cartID int
	AS
	UPDATE Cart
SET OrderStatusID = 2
WHERE CartID = @cartID


GO
/****** Object:  StoredProcedure [dbo].[uspUpdateShippingOfCart]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create proc [dbo].[uspUpdateShippingOfCart]
	@email varchar(50),
	@shippingID int
	AS
	UPDATE Cart
SET ShippingID = @shippingID
WHERE CartID = (SELECT CartID From Cart
Inner join Customer on Cart.CustomerID = Customer.CustomerID
WHERE Customer.Email = @email AND Cart.OrderStatusID = 1)



GO
/****** Object:  StoredProcedure [dbo].[uspUpdateSingleCategory]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspUpdateSingleCategory]
       @catId INT,
	   @catName varchar(50),
	   @catDesc varchar(100),
	   @imageUrl varchar(120)
  AS
    BEGIN
     UPDATE Category 
     SET CatName = @catName,CatDescription = @catDesc,ImageUrl = @imageUrl
     WHERE CategoryId = @catId
    END

GO
/****** Object:  StoredProcedure [dbo].[uspUpdateSingleProduct]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspUpdateSingleProduct]
       @Id INT,
	   @prodName varchar(50),
	   @price decimal(8,2),
	   @discount decimal(5,2),
	   @imageUrl varchar(120),
	   @catId int,
	   @supId int
  AS
    BEGIN
     UPDATE Product 
     SET ProdName = @prodName,Price = @price,Discount = @discount,ImageUrl = @imageUrl,CategoryID = @catId,SupplierID = @supId
     WHERE ProductID = @Id
    END

GO
/****** Object:  StoredProcedure [dbo].[uspUpdateSingleProductDescription]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspUpdateSingleProductDescription]
       @id INT,
	   @description XML
  AS
    BEGIN
     UPDATE Product 
     SET ProductDescription = @description
     WHERE ProductID = @id
    END

GO
/****** Object:  StoredProcedure [dbo].[uspUpdateSingleStaff]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspUpdateSingleStaff]
       @id INT,
	   @fname varchar(50),
	   @sname varchar(50),
	   @email varchar(100),
	   @role INT,
	   @active INT
  AS
    BEGIN
     UPDATE Staff 
     SET FirstName = @fname, LastName = @sname, Role = @role, Email = @email,IsActive = @active
     WHERE StaffID = @id
    END

GO
/****** Object:  StoredProcedure [dbo].[uspUpdateSingleSupplier]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspUpdateSingleSupplier]
       @supId INT,
	   @supName varchar(50),
	   @supAddress varchar(50),
	   @supPhone varchar(50),
	   @supEmail varchar(50)
  AS
    BEGIN
     UPDATE Supplier 
     SET SupName = @supName,SupAddress = @supAddress,SupPhone = @supPhone,SupEmail = @supEmail
     WHERE SupplierID = @supId
    END

GO
/****** Object:  StoredProcedure [dbo].[uspUpdateStaffPassword]    Script Date: 22/09/2017 22:06:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspUpdateStaffPassword]
       @id INT,
	   @pass varchar(MAX)
  AS
    BEGIN
     UPDATE Staff 
     SET Pass = @pass
     WHERE StaffId = @id
    END

GO
