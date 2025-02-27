USE [ProjectCS]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FullName] [nvarchar](450) NOT NULL,
	[AvatarPath] [nvarchar](256) NULL,
	[IsPassword] [bit] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assign]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assign](
	[AssignId] [nvarchar](450) NOT NULL,
	[AssignName] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](450) NULL,
	[Posttime] [datetime] NOT NULL,
	[AssignFile1] [nvarchar](450) NULL,
	[AssignFile2] [nvarchar](450) NULL,
	[ClassId] [nvarchar](450) NOT NULL,
	[LoaiId] [nvarchar](450) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Assign] PRIMARY KEY CLUSTERED 
(
	[AssignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Titlle] [nvarchar](50) NULL,
	[Topic] [nvarchar](50) NULL,
	[Room] [nvarchar](50) NULL,
	[Image] [nvarchar](255) NULL,
	[UserId] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [nvarchar](450) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[AssignId] [nvarchar](450) NOT NULL,
	[LoaiId] [nvarchar](450) NOT NULL,
	[CmtContent] [nvarchar](450) NULL,
	[CmtTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[UserId] ASC,
	[AssignId] ASC,
	[LoaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListAssign]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListAssign](
	[UserId] [nvarchar](450) NOT NULL,
	[AssignId] [nvarchar](450) NOT NULL,
	[LoaiId] [nvarchar](450) NOT NULL,
	[Point] [decimal](18, 2) NULL,
 CONSTRAINT [PK_ListAssign] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[AssignId] ASC,
	[LoaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListFile]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListFile](
	[UserId] [nvarchar](450) NOT NULL,
	[AssignId] [nvarchar](450) NOT NULL,
	[LoaiId] [nvarchar](450) NOT NULL,
	[FileId] [nvarchar](450) NOT NULL,
	[FilePath] [nvarchar](450) NULL,
	[SubmissTime] [datetime] NULL,
	[FileName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ListFile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[AssignId] ASC,
	[LoaiId] ASC,
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListStudent]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListStudent](
	[UserId] [nvarchar](450) NOT NULL,
	[ClassId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ListStudent] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 7/23/2024 12:10:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[LoaiId] [nvarchar](450) NOT NULL,
	[LoaiName] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[LoaiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240514061137_v1', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240514064732_v2', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240531135058_v3', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240609105744_v4', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240613165939_v5', N'8.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240723032955_v6', N'8.0.7')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'1', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2', N'Teacher', N'TEACHER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'3', N'Student', N'STUDENT', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'32a7db66-ef26-4622-b80a-51e5b67c9eee', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'822922f9-dce6-42ba-9a9e-dda8929bd11a', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'93aa97d3-ec9f-47b0-a380-d342b00ba592', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'dfa078f9-d5a2-4e6d-813b-f350789d539e', N'3')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [AvatarPath], [IsPassword]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'chienthanacquy2000@gmail.com', N'CHIENTHANACQUY2000@GMAIL.COM', N'chienthanacquy2000@gmail.com', N'CHIENTHANACQUY2000@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEPAQm0Q9Fbjt4xs24JWau/ktJsBmWOn7Y7zEmQvwfmNM5fQrDbbNSZe6NlBbL08qoA==', N'3UGFHV4Q7PPC56ODMPKL4LNMEUB4PGWX', N'febe5da8-1e1d-4bda-b4ce-34c5d3246b60', NULL, 0, 0, NULL, 1, 0, N'Lê Cảnh Đôn', NULL, 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [AvatarPath], [IsPassword]) VALUES (N'32a7db66-ef26-4622-b80a-51e5b67c9eee', N'richard.dataprotection@gmail.com', N'RICHARD.DATAPROTECTION@GMAIL.COM', N'richard.dataprotection@gmail.com', N'RICHARD.DATAPROTECTION@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEJLhI8FehsM6J4GqdYjI4EN7Fe9a61wv9YUgieV0dpusuzgtdAt3QDJxHjigI6ybcQ==', N'JGDLXIO5HG5XGKHP2G2A7BAYHMV2IK42', N'4cee3293-e8e1-4832-9280-120153fc8a8f', NULL, 0, 0, NULL, 1, 0, N'Admin', NULL, 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [AvatarPath], [IsPassword]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'nguyentinh692093@gmail.com', N'NGUYENTINH692093@GMAIL.COM', N'nguyentinh692093@gmail.com', N'NGUYENTINH692093@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEBbPXI7PNJw1pA2Zn6gn2D/ERWi+Y772LbBsyTBHjBeZ4zvPx68TVmVnhw4YK+W32Q==', N'SFDBFZDCXOSDPH3NYFG6QH5F66AMOZQA', N'7a6d87dd-6703-4dd6-9a94-dee73557bb7d', NULL, 0, 0, NULL, 1, 0, N'Nguyễn Trần Minh Tính', NULL, 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [AvatarPath], [IsPassword]) VALUES (N'822922f9-dce6-42ba-9a9e-dda8929bd11a', N'khoaaccai@gmail.com', N'KHOAACCAI@GMAIL.COM', N'khoaaccai@gmail.com', N'KHOAACCAI@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEAP4yE3nJ2EaM4j5pKTb063fv9maQT1QvKp9TLvbG70qN3n4PvU1Uuyf0D3WRsSOsA==', N'4NW3E4RUHPQUX32DSSR3N3RCAUW3GSWI', N'5f9c7010-0ed2-48ee-b844-f6b58b35023f', NULL, 0, 0, NULL, 1, 0, N'Giảng viên Hutech 2', NULL, 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [AvatarPath], [IsPassword]) VALUES (N'93aa97d3-ec9f-47b0-a380-d342b00ba592', N'mt.minhtinh2003@gmail.com', N'MT.MINHTINH2003@GMAIL.COM', N'mt.minhtinh2003@gmail.com', N'MT.MINHTINH2003@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEHoytM6SVlUDAlgrM58AhyPrUK+zOVu4aTprLZHqATgXe9FTdqIUyCcRJLPQoydZNg==', N'YPL2XMJ6F52UO6NOQS7MTCGAJDBVCU5B', N'a01bc919-8dd6-4f55-833c-e325c936ed1c', NULL, 0, 0, NULL, 1, 0, N'Bùi An Nhiên', NULL, 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [AvatarPath], [IsPassword]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'pthphicong373@gmail.com', N'PTHPHICONG373@GMAIL.COM', N'pthphicong373@gmail.com', N'PTHPHICONG373@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEDV3d0spXPi+sqzaVhHzlT44L3Yk5M82o9GLx1WajfwOCP9SGsU35zbOEXu4Gc8JSA==', N'BQRZZ37WJRL5WXQLFJTPALKJCBIXPGSD', N'c16c3cac-cb4b-4bf3-b109-c3907ecd4872', NULL, 0, 0, NULL, 1, 0, N'Giảng viên Hutech 1', NULL, 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [AvatarPath], [IsPassword]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'pthuy200307@gmail.com', N'PTHUY200307@GMAIL.COM', N'pthuy200307@gmail.com', N'PTHUY200307@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEOB1wZo6l1fh2W3qAfThYIMNj4m2BjppfrSSbTl1h5kcCVzA0kmQgrNvxbDAqy0dxQ==', N'I4HPQN742NF72PT4DKWGDDHEOERROV7G', N'69361742-198c-4f6a-a305-54d6bdde1d72', NULL, 0, 0, NULL, 1, 0, N'Phan Trọng Huy', NULL, 1)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [AvatarPath], [IsPassword]) VALUES (N'dfa078f9-d5a2-4e6d-813b-f350789d539e', N'phamquoccuong.bmo@gmail.com', N'PHAMQUOCCUONG.BMO@GMAIL.COM', N'phamquoccuong.bmo@gmail.com', N'PHAMQUOCCUONG.BMO@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEJWCEIpY69A5QBdjbQlHsxS6hZjHc45YkxgVCA6UTz3SXP9X1DnN0K85lGgJbaK9hQ==', N'LO7EM5CS4IJD7ZL7DHWBEYBUZEXL5GKY', N'926c28ca-e041-489b-af15-ad4adfc3e166', NULL, 0, 0, NULL, 1, 0, N'Phạm Quốc Cường', NULL, 1)
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'822922f9-dce6-42ba-9a9e-dda8929bd11a', N'[AspNetUserStore]', N'AuthenticatorKey', N'RCLIHU3R2XHYXDOBQYEN3DDDW6C4JP6B')
GO
INSERT [dbo].[Assign] ([AssignId], [AssignName], [Description], [Posttime], [AssignFile1], [AssignFile2], [ClassId], [LoaiId], [UserId]) VALUES (N'AQKPC', N'Viết CV', N'Sử dụng các công cụ hữu ích', CAST(N'2024-06-10T10:40:59.000' AS DateTime), NULL, NULL, N'5W5DT', N'2', N'')
INSERT [dbo].[Assign] ([AssignId], [AssignName], [Description], [Posttime], [AssignFile1], [AssignFile2], [ClassId], [LoaiId], [UserId]) VALUES (N'C7XV9', N'Giải phương trình vi phân', N'ABC', CAST(N'2024-06-09T12:06:35.000' AS DateTime), NULL, NULL, N'CLS001', N'1', N'')
INSERT [dbo].[Assign] ([AssignId], [AssignName], [Description], [Posttime], [AssignFile1], [AssignFile2], [ClassId], [LoaiId], [UserId]) VALUES (N'CHJTF', N'Làm quen với visual', N'Tải visual studio', CAST(N'2024-05-23T13:24:54.000' AS DateTime), NULL, NULL, N'OSDSK', N'2', N'')
INSERT [dbo].[Assign] ([AssignId], [AssignName], [Description], [Posttime], [AssignFile1], [AssignFile2], [ClassId], [LoaiId], [UserId]) VALUES (N'GBFYH', N'Bảo mật ', N'<p>abc</p>
<p style="text-align: center;"><strong>abc</strong></p>
<p style="text-align: right;"><em><strong>abc</strong></em></p>', CAST(N'2024-06-10T14:14:59.000' AS DateTime), N'N13.docx', N'No file', N'5W5DT', N'1', N'')
INSERT [dbo].[Assign] ([AssignId], [AssignName], [Description], [Posttime], [AssignFile1], [AssignFile2], [ClassId], [LoaiId], [UserId]) VALUES (N'I7RA7', N'Chạy bài Hello World', N'fbgsfg', CAST(N'2024-06-14T14:01:48.137' AS DateTime), N'Phieu theo doi do an co soTH.doc', NULL, N'CLS001', N'1', N'')
INSERT [dbo].[Assign] ([AssignId], [AssignName], [Description], [Posttime], [AssignFile1], [AssignFile2], [ClassId], [LoaiId], [UserId]) VALUES (N'KEH5W', N'Giải ma trận', N'bài tập sgk', CAST(N'2024-06-09T12:06:57.000' AS DateTime), NULL, NULL, N'CLS001', N'2', N'')
INSERT [dbo].[Assign] ([AssignId], [AssignName], [Description], [Posttime], [AssignFile1], [AssignFile2], [ClassId], [LoaiId], [UserId]) VALUES (N'OYCVG', N'Viết thư giới thiệu', N'Sử dụng các công cụ hữu ích', CAST(N'2024-06-10T12:48:54.000' AS DateTime), NULL, NULL, N'5W5DT', N'1', N'')
INSERT [dbo].[Assign] ([AssignId], [AssignName], [Description], [Posttime], [AssignFile1], [AssignFile2], [ClassId], [LoaiId], [UserId]) VALUES (N'Q5CG7', N'Làm quen ngôn ngữ Python', NULL, CAST(N'2024-06-14T09:28:39.910' AS DateTime), NULL, NULL, N'CLS002', N'2', N'')
GO
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'5W5DT', N'Kĩ năng tìm việccc', N'Môn kĩ năng', N'Viết CV', N'E2.09.01', N'hinh-nen-don-gian-1.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'8LE6W', N'Nhập môn hệ điều hành', N'Thực hành trên cisco', N'21DTHE2', N'E1.7.6', N'hinh-nen-don-gian-7.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS001', N'Lớp Toán Căn Bản', N'Toán Căn Bản A', N'Mathematics', N'Phòng A101', N'hinh-nen-don-gian-1.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS002', N'Lớp Lập Trình Python', N'Python Programming', N'Computer Science', N'Phòng B203', N'hinh-nen-don-gian-2.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS003', N'Lớp Hóa Học Hữu Cơ', N'Hóa Học Hữu Cơ', N'Chemistry', N'Phòng C305', N'hinh-nen-don-gian-3.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS004', N'Lớp Tiếng Anh Giao Tiếp', N'Tiếng Anh Giao Tiếp', N'English', N'Phòng D402', N'hinh-nen-don-gian-4.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS005', N'Lớp Vật Lý Cơ Bản', N'Vật Lý Cơ Bản A', N'Physics', N'Phòng E501', N'hinh-nen-don-gian-5.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS006', N'Lớp Quản Trị Kinh Doanh', N'Quản Trị Kinh Doanh', N'Business Management', N'Phòng F601', N'hinh-nen-don-gian-6.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS007', N'Lớp Lịch Sử Thế Giới', N'Lịch Sử Thế Giới', N'History', N'Phòng G701', N'hinh-nen-don-gian-7.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS008', N'Lớp Sinh Học Môi Trường', N'Sinh Học Môi Trường', N'Environmental Biology', N'Phòng H801', N'hinh-nen-don-gian-8.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS009', N'Lớp Ngôn Ngữ Học', N'Ngôn Ngữ Học', N'Linguistics', N'Phòng I901', N'hinh-nen-don-gian-9.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS010', N'Lớp Địa Lý Học', N'Địa Lý Học', N'Geography', N'Phòng J1001', N'hinh-nen-don-gian-5.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS011', N'Lớp Nghệ Thuật Ẩm Thực', N'Nghệ Thuật Ẩm Thực', N'Culinary Arts', N'Phòng K1101', N'hinh-nen-don-gian-9.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS012', N'Lớp Công Nghệ Sinh Học', N'Công Nghệ Sinh Học', N'Biotechnology', N'Phòng L1201', N'hinh-nen-don-gian-8.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS013', N'Lớp Kỹ Thuật Điện Tử', N'Kỹ Thuật Điện Tử', N'Electronics Engineering', N'Phòng M1301', N'hinh-nen-don-gian-7.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'CLS014', N'Lớp Thể Dục Thể Thao', N'Thể Dục Thể Thao', N'Physical Education', N'Phòng N1401', N'hinh-nen-don-gian-6.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'LT23J', N'Kiến trúc máy tính', N'Cơ sở máy tính', N'21DTHE1', N'E1.7.4', N'hinh-nen-don-gian-6.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'M9GAW', N'Tư tưởng Hồ Chí Minh', NULL, NULL, N'E2.3.6', N'hinh-nen-don-gian-8.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'NV9G6', N'Lap trinh di dong android', NULL, N'21DTHE2', N'E1.7.6', N'hinh-nen-don-gian-1.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'OSDSK', N'Lập trình Web', N'21DTHE1', N'Lập trình C#', N'E1.9.14', N'hinh-nen-don-gian-1.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'VAT9Q', N'Toán rời rạc', N'Đại cương CNTT', NULL, N'E2.2.6', N'hinh-nen-don-gian-5.jpg', N'')
INSERT [dbo].[Class] ([ClassId], [Name], [Titlle], [Topic], [Room], [Image], [UserId]) VALUES (N'VSC5E', N'Toán Cao Cấp', NULL, N'21DTHE2', N'E1.9.14', N'hinh-nen-don-gian-7.jpg', N'')
GO
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'AQKPC', N'2', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'C7XV9', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'GBFYH', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'I7RA7', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'KEH5W', N'2', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'OYCVG', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'Q5CG7', N'2', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'C7XV9', N'1', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'CHJTF', N'2', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'I7RA7', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'KEH5W', N'2', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'Q5CG7', N'2', CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'822922f9-dce6-42ba-9a9e-dda8929bd11a', N'Q5CG7', N'2', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'93aa97d3-ec9f-47b0-a380-d342b00ba592', N'C7XV9', N'1', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'93aa97d3-ec9f-47b0-a380-d342b00ba592', N'I7RA7', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'93aa97d3-ec9f-47b0-a380-d342b00ba592', N'KEH5W', N'2', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'93aa97d3-ec9f-47b0-a380-d342b00ba592', N'Q5CG7', N'2', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'C7XV9', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'I7RA7', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'KEH5W', N'2', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'Q5CG7', N'2', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'AQKPC', N'2', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'C7XV9', N'1', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'GBFYH', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'I7RA7', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'KEH5W', N'2', CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'OYCVG', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'Q5CG7', N'2', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'dfa078f9-d5a2-4e6d-813b-f350789d539e', N'C7XV9', N'1', CAST(8.50 AS Decimal(18, 2)))
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'dfa078f9-d5a2-4e6d-813b-f350789d539e', N'GBFYH', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'dfa078f9-d5a2-4e6d-813b-f350789d539e', N'I7RA7', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'dfa078f9-d5a2-4e6d-813b-f350789d539e', N'KEH5W', N'2', CAST(8.50 AS Decimal(18, 2)))
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'dfa078f9-d5a2-4e6d-813b-f350789d539e', N'OYCVG', N'1', NULL)
INSERT [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId], [Point]) VALUES (N'dfa078f9-d5a2-4e6d-813b-f350789d539e', N'Q5CG7', N'2', NULL)
GO
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'5W5DT')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'CLS001')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'CLS002')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'CLS003')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'CLS004')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'CLS005')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'05b30b34-6925-4ff6-8924-7c791c1b215b', N'CLS006')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'CLS001')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'CLS002')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'CLS003')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'CLS004')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'CLS005')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'CLS006')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'359df117-b9d7-4bc1-a6c9-c46177985ce6', N'OSDSK')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'822922f9-dce6-42ba-9a9e-dda8929bd11a', N'CLS002')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'822922f9-dce6-42ba-9a9e-dda8929bd11a', N'LT23J')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'822922f9-dce6-42ba-9a9e-dda8929bd11a', N'M9GAW')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'822922f9-dce6-42ba-9a9e-dda8929bd11a', N'OSDSK')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'822922f9-dce6-42ba-9a9e-dda8929bd11a', N'VAT9Q')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'93aa97d3-ec9f-47b0-a380-d342b00ba592', N'CLS001')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'93aa97d3-ec9f-47b0-a380-d342b00ba592', N'CLS002')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'93aa97d3-ec9f-47b0-a380-d342b00ba592', N'CLS003')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'93aa97d3-ec9f-47b0-a380-d342b00ba592', N'CLS004')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'93aa97d3-ec9f-47b0-a380-d342b00ba592', N'CLS005')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'93aa97d3-ec9f-47b0-a380-d342b00ba592', N'CLS006')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'8LE6W')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'CLS001')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'CLS002')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'CLS003')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'CLS004')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'CLS005')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'CLS006')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'CLS007')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'CLS008')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'CLS009')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'CLS010')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'CLS011')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'NV9G6')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b0e607ad-b6f9-4023-8cc9-ea59a145b0bf', N'VSC5E')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'5W5DT')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'CLS001')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'CLS002')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'CLS003')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'CLS004')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'CLS006')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'CLS007')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'CLS008')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'CLS009')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'CLS010')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'CLS011')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'CLS013')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'CLS014')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'LT23J')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'NV9G6')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'b3bc9a42-95cc-4a02-8f2c-d4afae099038', N'VAT9Q')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'dfa078f9-d5a2-4e6d-813b-f350789d539e', N'5W5DT')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'dfa078f9-d5a2-4e6d-813b-f350789d539e', N'CLS001')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'dfa078f9-d5a2-4e6d-813b-f350789d539e', N'CLS002')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'dfa078f9-d5a2-4e6d-813b-f350789d539e', N'CLS003')
INSERT [dbo].[ListStudent] ([UserId], [ClassId]) VALUES (N'dfa078f9-d5a2-4e6d-813b-f350789d539e', N'CLS004')
GO
INSERT [dbo].[Loai] ([LoaiId], [LoaiName]) VALUES (N'1', N'Thông báo')
INSERT [dbo].[Loai] ([LoaiId], [LoaiName]) VALUES (N'2', N'Bài tập')
INSERT [dbo].[Loai] ([LoaiId], [LoaiName]) VALUES (N'3', N'Câu hỏi')
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsPassword]
GO
ALTER TABLE [dbo].[Assign] ADD  DEFAULT (N'') FOR [UserId]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT (N'') FOR [UserId]
GO
ALTER TABLE [dbo].[ListFile] ADD  DEFAULT (N'') FOR [FileName]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Assign]  WITH CHECK ADD  CONSTRAINT [FK_Assign_Class_ClassId] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[Assign] CHECK CONSTRAINT [FK_Assign_Class_ClassId]
GO
ALTER TABLE [dbo].[Assign]  WITH CHECK ADD  CONSTRAINT [FK_Assign_Loai_LoaiId] FOREIGN KEY([LoaiId])
REFERENCES [dbo].[Loai] ([LoaiId])
GO
ALTER TABLE [dbo].[Assign] CHECK CONSTRAINT [FK_Assign_Loai_LoaiId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Assign_AssignId] FOREIGN KEY([AssignId])
REFERENCES [dbo].[Assign] ([AssignId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Assign_AssignId]
GO
ALTER TABLE [dbo].[ListAssign]  WITH CHECK ADD  CONSTRAINT [FK_ListAssign_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ListAssign] CHECK CONSTRAINT [FK_ListAssign_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ListAssign]  WITH CHECK ADD  CONSTRAINT [FK_ListAssign_Assign_AssignId] FOREIGN KEY([AssignId])
REFERENCES [dbo].[Assign] ([AssignId])
GO
ALTER TABLE [dbo].[ListAssign] CHECK CONSTRAINT [FK_ListAssign_Assign_AssignId]
GO
ALTER TABLE [dbo].[ListFile]  WITH CHECK ADD  CONSTRAINT [FK_ListFile_ListAssign_UserId_AssignId_LoaiId] FOREIGN KEY([UserId], [AssignId], [LoaiId])
REFERENCES [dbo].[ListAssign] ([UserId], [AssignId], [LoaiId])
GO
ALTER TABLE [dbo].[ListFile] CHECK CONSTRAINT [FK_ListFile_ListAssign_UserId_AssignId_LoaiId]
GO
ALTER TABLE [dbo].[ListStudent]  WITH CHECK ADD  CONSTRAINT [FK_ListStudent_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ListStudent] CHECK CONSTRAINT [FK_ListStudent_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ListStudent]  WITH CHECK ADD  CONSTRAINT [FK_ListStudent_Class_ClassId] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
GO
ALTER TABLE [dbo].[ListStudent] CHECK CONSTRAINT [FK_ListStudent_Class_ClassId]
GO
