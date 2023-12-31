CREATE DATABASE QuanLyBanGiay
GO
USE [QuanLyBanGiay]
GO
/****** Object:  Table [dbo].[CT_DonHang]    Script Date: 21/12/2022 9:08:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DonHang](
	[MaDonHang] [int] NOT NULL,
	[MaGiay] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [pk_ctdonhang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaGiay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 21/12/2022 9:08:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayGiao] [datetime] NULL,
	[NgayDat] [datetime] NULL,
	[DaThanhToan] [nvarchar](50) NULL,
	[TinhTrangGiaoHang] [int] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [pk_Donhang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gender]    Script Date: 21/12/2022 9:08:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[MaGender] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [nvarchar](50) NULL,
 CONSTRAINT [pk_Gender] PRIMARY KEY CLUSTERED 
(
	[MaGender] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Giay]    Script Date: 21/12/2022 9:08:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giay](
	[MaGiay] [int] IDENTITY(1,1) NOT NULL,
	[TenGiay] [nvarchar](100) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[MoTa] [nvarchar](max) NULL,
	[NgayCapNhat] [datetime] NULL,
	[AnhBia] [nvarchar](max) NULL,
	[SoLuongTon] [int] NULL,
	[MaLoai] [int] NULL,
	[MaGender] [int] NULL,
 CONSTRAINT [pk_giay] PRIMARY KEY CLUSTERED 
(
	[MaGiay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 21/12/2022 9:08:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[DienThoai] [varchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nchar](10) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiGiay]    Script Date: 21/12/2022 9:08:19 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiGiay](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[CT_DonHang] ([MaDonHang], [MaGiay], [SoLuong], [DonGia]) VALUES (2, 2, 2, CAST(800000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDonHang], [MaGiay], [SoLuong], [DonGia]) VALUES (2, 3, 1, CAST(419000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDonHang], [MaGiay], [SoLuong], [DonGia]) VALUES (3, 10, 1, CAST(419000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDonHang], [MaGiay], [SoLuong], [DonGia]) VALUES (4, 5, 3, CAST(1200000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDonHang], [MaGiay], [SoLuong], [DonGia]) VALUES (4, 11, 1, CAST(419000 AS Decimal(18, 0)))
INSERT [dbo].[CT_DonHang] ([MaDonHang], [MaGiay], [SoLuong], [DonGia]) VALUES (5, 20, 4, CAST(1789000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (1, NULL, CAST(N'2022-11-20 00:00:00.000' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (2, NULL, CAST(N'2022-11-20 00:00:00.000' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (3, NULL, CAST(N'2022-11-20 00:00:00.000' AS DateTime), NULL, NULL, 2)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (4, NULL, CAST(N'2022-11-20 00:00:00.000' AS DateTime), NULL, NULL, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (5, NULL, CAST(N'2022-11-20 00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([MaGender], [Gender]) VALUES (1, N'Nam')
INSERT [dbo].[Gender] ([MaGender], [Gender]) VALUES (2, N'Nữ')
INSERT [dbo].[Gender] ([MaGender], [Gender]) VALUES (3, N'Unisex')
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[Giay] ON 

INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (1, N'ECKO UNLTD GIÀY SNEAKERS MEN IS22-26506 GREY ', CAST(489000 AS Decimal(18, 0)), N'Giày sneakers nam Ecko Untld. 
Phần thân: PU, phần đế: cao su.
 Giày nam nhẹ, đi êm.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko1.png', 20, 2, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (2, N'ECKO UNLTD GIÀY SNEAKERS MEN IS22-26507 GREY ', CAST(489000 AS Decimal(18, 0)), N'Giày sneakers nam Ecko Untld. 
Phần thân: PU, phần đế: cao su.
 Giày nam nhẹ, đi êm.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko2.png', 21, 2, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (3, N'ECKO UNLTD GIÀY SNEAKERS WOMEN IS22-26720 GREEN ', CAST(489000 AS Decimal(18, 0)), N'Giày sneakers nữ Ecko Unltd. Phần thân: PU; phần đế: cao su.
 Giày nữ có trọng lượng nhẹ, êm, màu sắc bắt mắt, dễ thương.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko3.png', 20, 2, 2)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (4, N'ECKO UNLTD GIÀY SNEAKERS WOMEN IS22-26720 PINK ', CAST(489000 AS Decimal(18, 0)), N'Giày sneakers nữ Ecko Unltd. Phần thân: PU; phần đế: cao su.
 Giày nữ có trọng lượng nhẹ, êm, màu sắc bắt mắt, dễ thương.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko4.png', 25, 2, 2)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (5, N'ECKO UNLTD GIÀY SNEAKERS WOMEN IS22-26720 LILAC ', CAST(489000 AS Decimal(18, 0)), N'Giày sneakers nữ Ecko Unltd. Phần thân: PU; phần đế: cao su.
 Giày nữ có trọng lượng nhẹ, êm, màu sắc bắt mắt, dễ thương.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko5.png', 22, 2, 2)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (6, N'ECKO UNLTD GIÀY SNEAKERS MEN IS22-26508 GREY ', CAST(489000 AS Decimal(18, 0)), N'Giày sneakers nam Ecko Untld. 
Phần thân: PU, phần đế: cao su.
 Giày nam nhẹ, đi êm.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko6.png', 23, 2, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (7, N'ECKO UNLTD GIÀY SNEAKERS MEN IS22-26508 BLACK DK GREY ', CAST(299000 AS Decimal(18, 0)), N'Giày đế cao su nam Ecko Unltd.
 Giày nam thuộc bộ sưu tập xuân hè 2022.
 Phần thân: canvas, phần đế: cao su.
Thiết kế đơn giản, dễ phối với nhiều trang phục và không bị lỗi thời.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko7.png', 20, 2, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (8, N'ECKO UNLTD GIÀY SNEAKERS MEN/WOMEN IS22-28504 BLACK ', CAST(299000 AS Decimal(18, 0)), N'Giày đế cao su nam Ecko Unltd.
 Giày nam thuộc bộ sưu tập xuân hè 2022.
 Phần thân: canvas, phần đế: cao su.
Thiết kế đơn giản, dễ phối với nhiều trang phục và không bị lỗi thời.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko8.png', 15, 2, 3)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (9, N'ECKO UNLTD GIÀY SNEAKERS MEN IS22-28504 RED', CAST(299000 AS Decimal(18, 0)), N'Giày đế cao su nam Ecko Unltd.
 Giày nam thuộc bộ sưu tập xuân hè 2022.
 Phần thân: canvas, phần đế: cao su.
Thiết kế đơn giản, dễ phối với nhiều trang phục và không bị lỗi thời.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko9.png', 10, 2, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (10, N'ECKO UNLTD GIÀY SNEAKERS MEN IS22-28504 BEIGE', CAST(299000 AS Decimal(18, 0)), N'Giày đế cao su nam Ecko Unltd.
 Giày nam thuộc bộ sưu tập xuân hè 2022.
 Phần thân: canvas, phần đế: cao su.
Thiết kế đơn giản, dễ phối với nhiều trang phục và không bị lỗi thời.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko10.png', 13, 2, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (11, N'ECKO UNLTD GIÀY SNEAKERS WOMEN IS22-26721', CAST(389000 AS Decimal(18, 0)), N'Giày sneakers nữ Ecko Unltd. Phần thân: PU; phần đế: cao su.
 Giày nữ có trọng lượng nhẹ, êm, màu sắc độc đáo, thu hút', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko11.png', 20, 2, 2)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (12, N'ECKO UNLTD GIÀY SNEAKERS WOMEN IS22-26722', CAST(389000 AS Decimal(18, 0)), N'Giày sneakers nữ Ecko Unltd. Phần thân: PU; phần đế: cao su.
 Giày nữ có trọng lượng nhẹ, êm, màu sắc độc đáo, thu hút', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko12.png', 20, 2, 2)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (13, N'ECKO UNLTD GIÀY SNEAKERS MEN IS22-286509', CAST(389000 AS Decimal(18, 0)), N'Giày đế cao su nam Ecko Unltd.
 Giày nam thuộc bộ sưu tập xuân hè 2022.
 Phần thân: canvas, phần đế: cao su.
Thiết kế đơn giản, dễ phối với nhiều trang phục và không bị lỗi thời.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko13.png', 20, 2, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (14, N'ECKO UNLTD GIÀY SNEAKERS WOMEN IS22-26720', CAST(389000 AS Decimal(18, 0)), N'Giày sneakers nữ Ecko Unltd. Phần thân: PU; phần đế: cao su.
 Giày nữ có trọng lượng nhẹ, êm, màu sắc độc đáo, thu hút', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko14.png', 20, 2, 2)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (15, N'ECKO UNLTD GIÀY SNEAKERS MEN IS22-26507', CAST(489000 AS Decimal(18, 0)), N'Giày đế cao su nam Ecko Unltd.
 Giày nam thuộc bộ sưu tập xuân hè 2022.
 Phần thân: canvas, phần đế: cao su.
Thiết kế đơn giản, dễ phối với nhiều trang phục và không bị lỗi thời.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko15.png', 22, 2, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (16, N'ECKO UNLTD GIÀY SNEAKERS MEN IS22-26506', CAST(359000 AS Decimal(18, 0)), N'Giày sneakers nam Ecko Unltd. Phần thân: PU, phần đế: cao su.
 Giày nam nhẹ, êm chân.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko16.png', 22, 2, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (17, N'ECKO UNLTD GIÀY SNEAKERS MEN IS22-26510', CAST(359000 AS Decimal(18, 0)), N'Giày sneakers nam Ecko Unltd. Phần thân: PU, phần đế: cao su.
 Giày nam nhẹ, êm chân.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko17.png', 22, 2, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (18, N'ECKO UNLTD GIÀY SNEAKERS MEN IS22-26515', CAST(359000 AS Decimal(18, 0)), N'Giày sneakers nam Ecko Unltd. Phần thân: PU, phần đế: cao su.
 Giày nam nhẹ, êm chân.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko18.png', 23, 2, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (19, N'ECKO UNLTD GIÀY SNEAKERS MEN IS22-26514', CAST(359000 AS Decimal(18, 0)), N'Giày sneakers nam Ecko Unltd. Phần thân: PU, phần đế: cao su.
 Giày nam nhẹ, êm chân.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko19.png', 24, 2, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (20, N'ECKO UNLTD GIÀY SNEAKERS MEN IS22-26513', CAST(359000 AS Decimal(18, 0)), N'Giày sneakers nam Ecko Unltd. Phần thân: PU, phần đế: cao su.
 Giày nam nhẹ, êm chân.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Ecko20.png', 19, 2, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (21, N'Kappa nam giày Sneakers 36161RW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nam/nữ Kappa. Giày nam/ nữ thuộc bộ sưu tập xuân hè 2022. Kiểu dáng: Board shoes. Phần thân: Vải sợi, phần đế: cao su. Giày nhẹ, êm và thoáng khí.











', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Kappa1.png', 20, 1, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (22, N'Kappa nữ giày Sneakers 3112XIW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nam/nữ Kappa. Giày nam/ nữ thuộc bộ sưu tập xuân hè 2022. Kiểu dáng: Board shoes. Phần thân: Vải sợi, phần đế: cao su. Giày nhẹ, êm và thoáng khí.











', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Kappa2.png', 20, 1, 2)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (23, N'Kappa nữ giày Sneakers 3112XIW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nam/nữ Kappa. Giày nam/ nữ thuộc bộ sưu tập xuân hè 2022. Kiểu dáng: Board shoes. Phần thân: Vải sợi, phần đế: cao su. Giày nhẹ, êm và thoáng khí.











', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Kappa3.png', 20, 1, 2)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (24, N'Kappa nam giày Sneakers 38157RW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nam/nữ Kappa. Giày nam/ nữ thuộc bộ sưu tập xuân hè 2022. Kiểu dáng: Board shoes. Phần thân: Vải sợi, phần đế: cao su. Giày nhẹ, êm và thoáng khí.











', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Kappa4.png', 20, 1, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (25, N'Kappa nam giày Sneakers 3117LIW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nam/nữ Kappa. Giày nam/ nữ thuộc bộ sưu tập xuân hè 2022. Kiểu dáng: Board shoes. Phần thân: Vải sợi, phần đế: cao su. Giày nhẹ, êm và thoáng khí.











', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Kappa5.png', 20, 1, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (26, N'Kappa giày lười nam 381953W', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nam/nữ Kappa. Giày nam/ nữ thuộc bộ sưu tập xuân hè 2022. Kiểu dáng: Board shoes. Phần thân: Vải sợi, phần đế: cao su. Giày nhẹ, êm và thoáng khí.











', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Kappa6.png', 20, 1, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (27, N'Kappa giày lười nam 381951W', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nam/nữ Kappa. Giày nam/ nữ thuộc bộ sưu tập xuân hè 2022. Kiểu dáng: Board shoes. Phần thân: Vải sợi, phần đế: cao su. Giày nhẹ, êm và thoáng khí.











', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Kappa7.png', 20, 1, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (28, N'Kappa giày lười nam 38185ZW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nam/nữ Kappa. Giày nam/ nữ thuộc bộ sưu tập xuân hè 2022. Kiểu dáng: Board shoes. Phần thân: Vải sợi, phần đế: cao su. Giày nhẹ, êm và thoáng khí.











', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Kappa8.png', 20, 1, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (29, N'Kappa giày sneakers nam/nữ K0CX5CC03', CAST(499000 AS Decimal(18, 0)), N'Giày sneakers nam/nữ Kappa. Giày nam/ nữ thuộc bộ sưu tập xuân hè 2022. Kiểu dáng: Board shoes. Phần thân: Vải sợi, phần đế: cao su. Giày nhẹ, êm và thoáng khí.











', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Kappa9.png', 20, 1, 3)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (30, N'Kappa giày sneakers nam/nữ K0CX5CC50', CAST(719000 AS Decimal(18, 0)), N'Giày sneakers nam/nữ Kappa. Giày nam/ nữ thuộc bộ sưu tập xuân hè 2022. Kiểu dáng: Board shoes. Phần thân: Vải sợi, phần đế: cao su. Giày nhẹ, êm và thoáng khí.











', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Kappa10.png', 20, 1, 3)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (31, N'SUPERGA GIÀY LƯỜI WOMEN S4111QW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nữ Superga.
Phần thân: cotton; lớp lót: cotton; phần đế: cao su.
Giày nữ thoáng khí, đi nhẹ và dễ phối với nhiều trang phục.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Superga1.png', 20, 3, 2)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (32, N'SUPERGA GIÀY SNEAKERS MEN S1115DW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nam Superga.
Phần thân: cotton; lớp lót: cotton; phần đế: cao su.
Giày nam thoáng khí, đi nhẹ và dễ phối với nhiều trang phục.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Superga2.png', 20, 3, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (33, N'SUPERGA GIÀY SNEAKERS WOMEN S416EW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nữ Superga.
Phần thân: cotton; lớp lót: cotton; phần đế: cao su.
Giày nữ thoáng khí, đi nhẹ và dễ phối với nhiều trang phục.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Superga3.png', 20, 3, 2)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (34, N'SUPERGA GIÀY SNEAKERS WOMEN S3116PW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nữ Superga.
Phần thân: cotton; lớp lót: cotton; phần đế: cao su.
Giày nữ thoáng khí, đi nhẹ và dễ phối với nhiều trang phục.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Superga4.png', 20, 3, 2)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (35, N'SUPERGA GIÀY SNEAKERS MEN S3115TW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nam Superga.
Phần thân: cotton; lớp lót: cotton; phần đế: cao su.
Giày nam thoáng khí, đi nhẹ và dễ phối với nhiều trang phục.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Superga5.png', 20, 3, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (36, N'SUPERGA GIÀY SNEAKERS MEN S3115TW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nam Superga.
Phần thân: cotton; lớp lót: cotton; phần đế: cao su.
Giày nam thoáng khí, đi nhẹ và dễ phối với nhiều trang phục.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Superga6.png', 20, 3, 1)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (37, N'SUPERGA GIÀY SNEAKERS WOMEN S466EW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nữ Superga.
Phần thân: cotton; lớp lót: cotton; phần đế: cao su.
Giày nữ thoáng khí, đi nhẹ và dễ phối với nhiều trang phục.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Superga7.png', 20, 3, 2)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (38, N'SUPERGA GIÀY SNEAKERS MENWOMEN S446EW', CAST(419000 AS Decimal(18, 0)), N'Giày sneakers nữ/nam Superga.
Phần thân: cotton; lớp lót: cotton; phần đế: cao su.
Giày nam/nữ thoáng khí, đi nhẹ và dễ phối với nhiều trang phục.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Superga8.png', 20, 3, 3)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (39, N'SUPERGA GIÀY LƯỜI WOMEN S4111QW', CAST(319000 AS Decimal(18, 0)), N'Giày sneakers nữ Superga.
Phần thân: cotton; lớp lót: cotton; phần đế: cao su.
Giày nữ thoáng khí, đi nhẹ và dễ phối với nhiều trang phục.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Superga9.png', 22, 3, 2)
INSERT [dbo].[Giay] ([MaGiay], [TenGiay], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaLoai], [MaGender]) VALUES (40, N'SUPERGA GIÀY SNEAKERS CAO SU WOMEN S4111QW', CAST(489000 AS Decimal(18, 0)), N'Giày sneakers nữ Superga.
Phần thân: cotton; lớp lót: cotton; phần đế: cao su.
Giày nữ thoáng khí, đi nhẹ và dễ phối với nhiều trang phục.', CAST(N'2022-11-10 00:00:00.000' AS DateTime), N'Superga10.png', 25, 3, 2)
SET IDENTITY_INSERT [dbo].[Giay] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (1, N'Nguyễn Văn Tuấn', CAST(N'2000-06-10 00:00:00.000' AS DateTime), N'Nam', N'0967123653', N'tuan20', N'123', N'tuantuan@gmail.com', N'Đà Nẵng   ')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (2, N'Trần Thị Khánh Loan', CAST(N'1996-03-03 00:00:00.000' AS DateTime), N'Nữ', N'0371849728', N'loanloan', N'1234', N'loan1996@gmail.com', N'TP.HCM    ')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (3, N'Lâm Quốc Thắng', CAST(N'2004-05-15 00:00:00.000' AS DateTime), N'Nam', N'0778194536', N'thang2004', N'4321', N'thang123@gmail.com', N'Quảng Bình')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (4, N'Tống Duy Trường Đạt', CAST(N'2002-01-20 00:00:00.000' AS DateTime), N'Nam', N'0352840615', N'truongdat', N'truongdat', N'truongdat@gmail.com', N'Quảng Ngãi')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (5, N'Bùi Tấn Dũng', CAST(N'1995-05-10 00:00:00.000' AS DateTime), N'Nam', N'0846216142', N'dung', N'dung', N'dung@gmail.com', N'Thanh Hóa ')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiGiay] ON 

INSERT [dbo].[LoaiGiay] ([MaLoai], [TenLoai]) VALUES (1, N'Kappa')
INSERT [dbo].[LoaiGiay] ([MaLoai], [TenLoai]) VALUES (2, N'Ecko Unltđ')
INSERT [dbo].[LoaiGiay] ([MaLoai], [TenLoai]) VALUES (3, N'Superga')
INSERT [dbo].[LoaiGiay] ([MaLoai], [TenLoai]) VALUES (4, N'Staple')
INSERT [dbo].[LoaiGiay] ([MaLoai], [TenLoai]) VALUES (5, N'NINU&NICK')
SET IDENTITY_INSERT [dbo].[LoaiGiay] OFF
ALTER TABLE [dbo].[CT_DonHang]  WITH CHECK ADD  CONSTRAINT [fk_ctdonhang_donhang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[CT_DonHang] CHECK CONSTRAINT [fk_ctdonhang_donhang]
GO
ALTER TABLE [dbo].[CT_DonHang]  WITH CHECK ADD  CONSTRAINT [fk_ctdonhang_giay] FOREIGN KEY([MaGiay])
REFERENCES [dbo].[Giay] ([MaGiay])
GO
ALTER TABLE [dbo].[CT_DonHang] CHECK CONSTRAINT [fk_ctdonhang_giay]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [fk_donhang_Khachhang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [fk_donhang_Khachhang]
GO
ALTER TABLE [dbo].[Giay]  WITH CHECK ADD  CONSTRAINT [fk_giay_gender] FOREIGN KEY([MaGender])
REFERENCES [dbo].[Gender] ([MaGender])
GO
ALTER TABLE [dbo].[Giay] CHECK CONSTRAINT [fk_giay_gender]
GO
ALTER TABLE [dbo].[Giay]  WITH CHECK ADD  CONSTRAINT [fk_giay_loaigiay] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiGiay] ([MaLoai])
GO
ALTER TABLE [dbo].[Giay] CHECK CONSTRAINT [fk_giay_loaigiay]
GO
