/****** Object:  Table [dbo].[zone]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zone](
	[id] [int] NOT NULL,
	[name] [nvarchar](40) NOT NULL,
	[timeout] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeUserLevel]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeUserLevel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](256) NULL,
	[minGold] [bigint] NULL,
	[maxGold] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeUserDevice]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xeUserDevice](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[osName] [varchar](16) NULL,
	[osVersion] [varchar](50) NULL,
	[osMAC] [varchar](64) NULL,
	[lastLogin] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xeUserAvatar]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeUserAvatar](
	[userId] [bigint] NOT NULL,
	[avatarPath] [nvarchar](256) NULL,
	[createDate] [datetime] NULL,
	[isLock] [bit] NULL,
 CONSTRAINT [PK_userAvatar] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeUsedGiftCodeType]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xeUsedGiftCodeType](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[usedGiftCodeType] [varchar](max) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xeShopDailyStatistics]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeShopDailyStatistics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reportDate] [datetime] NULL,
	[itemId] [int] NULL,
	[itemPrice] [int] NULL,
	[itemCount] [int] NULL,
	[executeDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeRouletteItem]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeRouletteItem](
	[id] [float] NULL,
	[round] [float] NULL,
	[lastItem] [nvarchar](255) NULL,
	[nextItem] [nvarchar](255) NULL,
	[rate] [float] NULL,
	[price] [float] NULL,
	[isStop] [float] NULL,
	[level] [float] NULL,
	[isActive] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeRoulette]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeRoulette](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[value] [bigint] NULL,
	[type] [nvarchar](10) NULL,
	[level] [int] NULL,
	[isActive] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeReportUserRole]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeReportUserRole](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeReportUserLogAction]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeReportUserLogAction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action] [nvarchar](max) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XEReportUserLog]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XEReportUserLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[actionId] [int] NULL,
	[refId] [bigint] NULL,
	[logDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xePrivateMessage]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xePrivateMessage](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fromUserId] [bigint] NULL,
	[toUserId] [bigint] NULL,
	[title] [ntext] NULL,
	[content] [ntext] NULL,
	[dateSent] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xePredefinedTableNames]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xePredefinedTableNames](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[table_name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeNumOfUserOnlineBackup20140624]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeNumOfUserOnlineBackup20140624](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateReport] [datetime] NULL,
	[num] [int] NULL,
	[numByDB] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeNumOfUserOnline]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeNumOfUserOnline](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dateReport] [datetime] NULL,
	[num] [int] NULL,
	[numByDB] [int] NULL,
	[numTienLen] [int] NULL,
	[numPhom] [int] NULL,
	[numBaCay] [int] NULL,
	[numBauCua] [int] NULL,
	[numALTP] [int] NULL,
	[numPikachu] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeNumOfUserDeviceByOSMonthly]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xeNumOfUserDeviceByOSMonthly](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reportDate] [date] NULL,
	[os] [varchar](64) NULL,
	[num] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xeNumOfUserDeviceByOS]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xeNumOfUserDeviceByOS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reportDate] [datetime] NULL,
	[os] [varchar](64) NULL,
	[num] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xeNews]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeNews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[htmlContent] [nvarchar](max) NOT NULL,
	[dateCreated] [datetime] NOT NULL,
	[dateModified] [datetime] NOT NULL,
	[userCreated] [int] NOT NULL,
	[userModified] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeLogRouletteHistory]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeLogRouletteHistory](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[fee] [bigint] NULL,
	[feeType] [nvarchar](10) NULL,
	[round] [int] NULL,
	[item] [nvarchar](50) NULL,
	[price] [float] NULL,
	[priceType] [nvarchar](10) NULL,
	[value] [bigint] NULL,
	[date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XELogMoneyHistoryReason]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XELogMoneyHistoryReason](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XELogMoneyHistoryBackup20140614]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XELogMoneyHistoryBackup20140614](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[moneyBefore] [bigint] NULL,
	[moneyDiff] [bigint] NULL,
	[moneyAfter] [bigint] NULL,
	[moneyType] [bit] NULL,
	[message] [nvarchar](max) NULL,
	[modifyDate] [datetime] NULL,
	[reason] [int] NULL,
	[refId] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XELogMoneyHistory]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XELogMoneyHistory](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[moneyBefore] [bigint] NULL,
	[moneyDiff] [bigint] NULL,
	[moneyAfter] [bigint] NULL,
	[moneyType] [bit] NULL,
	[message] [nvarchar](max) NULL,
	[modifyDate] [datetime] NULL,
	[reason] [int] NULL,
	[refId] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeLogJoinItemHistory]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeLogJoinItemHistory](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[eventId] [bigint] NULL,
	[itemCode] [nvarchar](10) NULL,
	[message] [nvarchar](100) NULL,
	[time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeLogExchangeMoney]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeLogExchangeMoney](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[fromValue] [bigint] NOT NULL,
	[fromType] [nvarchar](50) NOT NULL,
	[toValue] [bigint] NOT NULL,
	[toType] [nvarchar](50) NOT NULL,
	[message] [nvarchar](max) NULL,
	[exchangeDate] [datetime] NOT NULL,
	[fromValueBefore] [bigint] NOT NULL,
	[fromValueAfter] [bigint] NOT NULL,
	[toValueBefore] [bigint] NOT NULL,
	[toValueAfter] [bigint] NOT NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá trị cần chuyển (nguồn)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'xeLogExchangeMoney', @level2type=N'COLUMN',@level2name=N'fromValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kiểu cần chuyển (nguồn)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'xeLogExchangeMoney', @level2type=N'COLUMN',@level2name=N'fromType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá trị cần chuyển (đích)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'xeLogExchangeMoney', @level2type=N'COLUMN',@level2name=N'toValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kiểu cần chuyển (đích)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'xeLogExchangeMoney', @level2type=N'COLUMN',@level2name=N'toType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá trị trước khi chuyển (nguồn)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'xeLogExchangeMoney', @level2type=N'COLUMN',@level2name=N'fromValueBefore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá trị sau khi chuyển (nguồn)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'xeLogExchangeMoney', @level2type=N'COLUMN',@level2name=N'fromValueAfter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá trị trước khi chuyển (đích)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'xeLogExchangeMoney', @level2type=N'COLUMN',@level2name=N'toValueBefore'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giá trị sau khi chuyển (đích)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'xeLogExchangeMoney', @level2type=N'COLUMN',@level2name=N'toValueAfter'
GO
/****** Object:  Table [dbo].[xeLogEventGiftsHistory]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeLogEventGiftsHistory](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[eventId] [bigint] NULL,
	[evgfCode] [nvarchar](10) NULL,
	[evitCode] [nvarchar](10) NULL,
	[value] [bigint] NULL,
	[type] [nvarchar](10) NULL,
	[message] [nvarchar](100) NULL,
	[useDate] [datetime] NULL,
	[fromValue] [bigint] NULL,
	[toValue] [bigint] NULL,
	[isLimitUsage] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeLogCashShopHistory]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeLogCashShopHistory](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[itemCode] [nvarchar](10) NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](256) NULL,
	[price] [bigint] NULL,
	[type] [nvarchar](10) NULL,
	[date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeInventory]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeInventory](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[itemCode] [nvarchar](10) NULL,
	[quantity] [int] NULL,
	[isActive] [bit] NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](256) NULL,
	[isUsable] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeInGameEvent]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeInGameEvent](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[content] [nvarchar](max) NULL,
	[description] [nvarchar](256) NULL,
	[components] [nvarchar](100) NULL,
	[type] [nvarchar](20) NULL,
	[isActive] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XEGoogleTransaction]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XEGoogleTransaction](
	[userId] [bigint] NOT NULL,
	[transactionId] [nvarchar](300) NOT NULL,
	[productId] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_XEGoogleTransaction] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[transactionId] ASC,
	[productId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XEGoogleProduct]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XEGoogleProduct](
	[productId] [nvarchar](15) NOT NULL,
	[xeengValue] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeGoldenHour]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeGoldenHour](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[item_id] [nvarchar](10) NULL,
	[value] [int] NULL,
	[date_begin] [datetime] NULL,
	[date_end] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeGameMatchDailyStatistics]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeGameMatchDailyStatistics](
	[id] [int] NULL,
	[reportDate] [datetime] NULL,
	[baCayMatchCount] [int] NULL,
	[bauCuaMatchCount] [int] NULL,
	[tienLenMatchCount] [int] NULL,
	[phomMatchCount] [int] NULL,
	[pikachuMatchCount] [int] NULL,
	[altpMatchCount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeFreeGoldByFriend]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xeFreeGoldByFriend](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[receivedGold] [int] NOT NULL,
	[addedFriends] [varchar](max) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xeFreeGoldByDay]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xeFreeGoldByDay](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [varchar](50) NOT NULL,
	[receivedTimes] [tinyint] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số quà đã nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'xeFreeGoldByDay', @level2type=N'COLUMN',@level2name=N'receivedTimes'
GO
/****** Object:  Table [dbo].[xeFirstCharging]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeFirstCharging](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[chargingDate] [datetime] NULL,
	[amount] [int] NULL,
	[type] [int] NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: SMS ; 1: Card' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'xeFirstCharging', @level2type=N'COLUMN',@level2name=N'type'
GO
/****** Object:  Table [dbo].[xeExchange]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeExchange](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[item_id] [nvarchar](10) NOT NULL,
	[cardinality] [int] NOT NULL,
	[mul_factor] [int] NULL,
	[price] [int] NOT NULL,
	[description] [nvarchar](50) NULL,
	[active] [int] NULL,
 CONSTRAINT [PK_xeExchange] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeEventItems]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeEventItems](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[eventId] [bigint] NULL,
	[code] [nvarchar](10) NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](256) NULL,
	[rate] [float] NULL,
	[type] [int] NULL,
	[quantity] [int] NULL,
	[isActive] [bit] NULL,
	[isUsable] [bit] NULL,
	[components] [nvarchar](256) NULL,
	[fee] [bigint] NULL,
	[feeType] [nvarchar](10) NULL,
	[limit] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeEventGifts]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeEventGifts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[evitCode] [nvarchar](10) NULL,
	[evgfCode] [nvarchar](10) NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](256) NULL,
	[rate] [float] NULL,
	[value] [bigint] NULL,
	[type] [nvarchar](10) NULL,
	[quantity] [int] NULL,
	[isActive] [bit] NULL,
	[isLimitUsage] [bit] NULL,
	[eventId] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeDeviceDailyStatistics]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeDeviceDailyStatistics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numOfAndroidDevices] [int] NULL,
	[numOfIOSDevices] [int] NULL,
	[numOfJavaDevices] [nchar](10) NULL,
	[numOfAndroidDevicesMonthly] [int] NULL,
	[numOfIOSDevicesMonthly] [int] NULL,
	[numOfJavaDevicesMonthly] [nchar](10) NULL,
	[reportDate] [datetime] NULL,
	[executeDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XEDailyStatistics]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XEDailyStatistics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[xeengInByTool] [bigint] NULL,
	[xeengInBySMS] [bigint] NULL,
	[xeengInByCard] [bigint] NULL,
	[xeengInByEvent] [bigint] NULL,
	[xeengInByRoulette] [bigint] NULL,
	[xeengOutByTool] [bigint] NULL,
	[xeengOutByExchange] [bigint] NULL,
	[xeengOutByEvent] [bigint] NULL,
	[xeengOutByCashShop] [bigint] NULL,
	[xeengOutByRoulette] [bigint] NULL,
	[xeengInWorkingUsers] [bigint] NULL,
	[goldInByTool] [bigint] NULL,
	[goldInByExchange] [bigint] NULL,
	[goldInByGiftCode] [bigint] NULL,
	[goldInByAddFriend] [int] NULL,
	[goldInByFreeGold] [int] NULL,
	[goldInByRegister] [bigint] NULL,
	[goldInByWrongCalc] [int] NULL,
	[goldInByEvent] [bigint] NULL,
	[goldInByRoulette] [bigint] NULL,
	[goldOutByTool] [bigint] NULL,
	[goldOutByGame] [bigint] NULL,
	[goldOutByEvent] [bigint] NULL,
	[goldOutByRoulette] [bigint] NULL,
	[goldInWorkingUsers] [bigint] NULL,
	[reportDate] [datetime] NULL,
	[newUsers] [int] NULL,
	[activeUsers] [int] NULL,
	[returnUsers] [int] NULL,
	[executeDate] [datetime] NULL,
	[newDevice] [int] NULL,
	[returnDevice] [int] NULL,
	[activeDevice] [int] NULL,
	[returnDeviceGooglePlayCPI] [int] NULL,
	[returnDeviceAppotaIOS] [int] NULL,
	[returnDeviceAppotaAndroid] [int] NULL,
	[returnDeviceAppStore] [int] NULL,
	[returnDeviceGooglePlay] [int] NULL,
	[returnDeviceMobigate] [int] NULL,
	[returnDeviceMobiHub] [int] NULL,
	[returnDeviceMobigateCPI] [int] NULL,
	[newDeviceGooglePlayCPI] [int] NULL,
	[newDeviceAppotaIOS] [int] NULL,
	[newDeviceAppotaAndroid] [int] NULL,
	[newDeviceAppStore] [int] NULL,
	[newDeviceGooglePlay] [int] NULL,
	[newDeviceMobigate] [int] NULL,
	[newDeviceMobihub] [int] NULL,
	[newDeviceMobigateCPI] [int] NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lấy sai số Gold của người chơi, dẫn tới sau khi trừ tiền bị âm và hệ thống phải bù lại.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'XEDailyStatistics', @level2type=N'COLUMN',@level2name=N'goldInByWrongCalc'
GO
/****** Object:  Table [dbo].[xeCmsUser]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xeCmsUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[displayName] [nvarchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[encryptedPassword] [varchar](32) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xeChargingMonthlyStatistics]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeChargingMonthlyStatistics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reportDate] [datetime] NULL,
	[numOfPayer] [int] NULL,
	[numOfPayerDaily] [int] NULL,
	[numOfNewPayerDaily] [int] NULL,
	[revenueOfNewPayerBySMSDaily] [int] NULL,
	[revenueOfNewPayerByCardDaily] [int] NULL,
	[executeDate] [datetime] NULL,
	[payerGooglePlayCPI] [int] NULL,
	[payerAppotaIOS] [int] NULL,
	[payerAppotaAndroid] [int] NULL,
	[payerAppStore] [int] NULL,
	[payerGooglePlay] [int] NULL,
	[payerMobigate] [int] NULL,
	[payerMobihub] [int] NULL,
	[payerMobigateCPI] [int] NULL,
	[newPayerGooglePlayCPI] [int] NULL,
	[newPayerAppotaIOS] [int] NULL,
	[newPayerAppotaAndroid] [int] NULL,
	[newPayerAppStore] [int] NULL,
	[newPayerGooglePlay] [int] NULL,
	[newPayerMobigate] [int] NULL,
	[newPayerMobihub] [int] NULL,
	[newPayerMobigateCPI] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeChargingMoneyStatistics]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeChargingMoneyStatistics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reportDate] [datetime] NULL,
	[itemType] [int] NULL,
	[itemMoney] [int] NULL,
	[itemCount] [int] NULL,
	[executeDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeCashShop]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeCashShop](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](10) NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](256) NULL,
	[price] [bigint] NULL,
	[type] [nvarchar](10) NULL,
	[isActive] [bit] NULL,
	[isUsable] [bit] NULL,
	[eventId] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeCampaignTracking]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[xeCampaignTracking](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[campaignName] [varchar](128) NULL,
	[osName] [varchar](128) NULL,
	[ip] [varchar](32) NULL,
	[date] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[xeBadUsers]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeBadUsers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[rate] [float] NULL,
	[isActive] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XEAppotaTransaction]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XEAppotaTransaction](
	[userId] [bigint] NOT NULL,
	[transactionId] [nvarchar](50) NOT NULL,
	[paymentTime] [datetime] NULL,
 CONSTRAINT [PK_XEAppotaTransaction] PRIMARY KEY CLUSTERED 
(
	[transactionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[xeAdvertising]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xeAdvertising](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](256) NULL,
	[type] [int] NULL,
	[isDisplay] [bit] NULL,
	[createdDate] [datetime] NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workinguser]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[workinguser](
	[userId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[password] [varchar](255) NULL,
	[phoneNumber] [varchar](20) NULL,
	[sessionId] [varchar](100) NULL,
	[WonPlaysNumber] [int] NULL,
	[cash] [bigint] NULL,
	[PlaysNumber] [int] NULL,
	[level] [int] NULL,
	[experience] [int] NULL,
	[vipId] [int] NULL,
	[isOnline] [bit] NULL,
	[avatarId] [int] NULL,
	[lastLogin] [datetime] NULL,
	[email] [varchar](256) NULL,
	[isActive] [bit] NULL,
	[partnerId] [int] NULL,
	[avatarFileId] [bigint] NULL,
	[biaFileId] [bigint] NULL,
	[sex] [bit] NULL,
	[timesQuay] [int] NULL,
	[status] [nvarchar](256) NULL,
	[mobileVersion] [varchar](100) NULL,
	[registerDate] [datetime] NULL,
	[fromDevice] [varchar](100) NULL,
	[refCode] [varchar](20) NULL,
	[gameVersion] [varchar](50) NULL,
	[xeeng] [bigint] NULL,
	[loginName] [nvarchar](100) NULL,
	[cmnd] [varchar](32) NULL,
	[xePhoneNumber] [varchar](32) NULL,
	[guestToUserDate] [datetime] NULL,
	[lastSecondLogin] [datetime] NULL,
	[isLock] [bit] NULL,
	[lockExpired] [datetime] NULL,
	[chatLockExpired] [datetime] NULL,
	[firstOvernight] [datetime] NULL,
	[firstChargingDate] [datetime] NULL,
	[accumulatedGold] [bigint] NULL,
	[specialPoint] [int] NULL,
 CONSTRAINT [PK__WorkingU__CB9A1CFF108B795B] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: unlocked ; 1: locked' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'workinguser', @level2type=N'COLUMN',@level2name=N'isLock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dùng để tính trường hợp bổ sung cho return user (đăng ký vào ngày hôm trước và có chơi trong ngày hôm nay), khi người chơi đăng ký và chơi qua đêm.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'workinguser', @level2type=N'COLUMN',@level2name=N'firstOvernight'
GO
/****** Object:  Table [dbo].[vip]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vip](
	[vipId] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[bonusMoney] [int] NULL,
	[bonusPercent] [float] NULL,
	[limitVND] [int] NULL,
 CONSTRAINT [PK__VIP__8C200A440A888742] PRIMARY KEY CLUSTERED 
(
	[vipId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[version]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[version](
	[VersionID] [int] NOT NULL,
	[CreateDate] [datetime2](7) NULL,
	[Description] [varchar](max) NULL,
	[linkDown] [varchar](max) NULL,
	[partnerId] [int] NULL,
	[isNeedUpdate] [bit] NULL,
	[newsUpdate] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[VersionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[advertising]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advertising](
	[advertisingId] [bigint] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](256) NULL,
	[createdDate] [datetime] NULL,
	[webUserId] [bigint] NULL,
	[isDisplay] [bit] NULL,
	[partnerId] [int] NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[advertisingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[uspGetRevenueType]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetRevenueType]
as
	select *
		from udvRevenueType
GO
/****** Object:  StoredProcedure [dbo].[uspGetRevenue]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetRevenue]
	@partnerId int,
	@serviceDetail varchar(20) = null , -- dich vu 
	@fromDate datetime = null,
	@toDate datetime = null
as
	set nocount on
	
	if @toDate is null
		select @toDate = GETDATE()		
		
	select *
		from udvLogRevenue
	where  (@partnerId = -10 or COALESCE(partnerId,0) = @partnerId)  -- 10: all partner is admin person. hard code :(
		and (@serviceDetail='-1' or (@serviceDetail='-2' and phoneNumber is not null ) or (@serviceDetail='-3' and phoneNumber is null )  or @serviceDetail = serviceDetail)
		and (@fromDate is null or (datediff(day, @fromDate, revenueDate)> -1 and datediff(day, revenueDate, @toDate)> -1 ))
		
	order by revenueDate desc
GO
/****** Object:  Table [dbo].[gameeventuser]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gameeventuser](
	[gameEventUserId] [bigint] IDENTITY(1,1) NOT NULL,
	[gameEventId] [int] NULL,
	[point] [int] NULL,
	[userId] [bigint] NULL,
 CONSTRAINT [PK_GameEventUser] PRIMARY KEY CLUSTERED 
(
	[gameEventUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gameevent]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gameevent](
	[GameEventId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](256) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[dateCreated] [datetime] NULL,
	[partnerId] [int] NOT NULL,
	[fromDate] [datetime] NULL,
	[toDate] [datetime] NULL,
	[isConcurrent] [bit] NULL,
	[plus] [int] NOT NULL,
	[gameID] [int] NULL,
 CONSTRAINT [PK__GameEven__09597C07656C112C] PRIMARY KEY CLUSTERED 
(
	[GameEventId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[friend]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[friend](
	[userId] [bigint] NOT NULL,
	[friendId] [bigint] NOT NULL,
	[connectedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[freeGoldByDay]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[freeGoldByDay](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[receivedTimes] [tinyint] NOT NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số quà đã nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'freeGoldByDay', @level2type=N'COLUMN',@level2name=N'receivedTimes'
GO
/****** Object:  Table [dbo].[files]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[files](
	[fileId] [bigint] IDENTITY(1,1) NOT NULL,
	[AlbumId] [bigint] NULL,
	[location] [nvarchar](500) NULL,
	[fileName] [nvarchar](100) NULL,
	[dateCreated] [datetime] NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[fileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[f_nosymbol]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f_nosymbol](
@input_string NVARCHAR (4000)
)
RETURNS VARCHAR (4000)
AS
BEGIN
DECLARE @l_str NVARCHAR(4000);
SET @l_str = LTRIM(@input_string);
SET @l_str = LOWER(RTRIM(@l_str));
 
SET @l_str = REPLACE(@l_str, N'á', 'a');
 
SET @l_str = REPLACE(@l_str, N'à', 'a');
SET @l_str = REPLACE(@l_str, N'ả', 'a');
SET @l_str = REPLACE(@l_str, N'ã', 'a');
SET @l_str = REPLACE(@l_str, N'ạ', 'a');
 
SET @l_str = REPLACE(@l_str, N'â', 'a');
SET @l_str = REPLACE(@l_str, N'ấ', 'a');
SET @l_str = REPLACE(@l_str, N'ầ', 'a');
SET @l_str = REPLACE(@l_str, N'ẩ', 'a');
SET @l_str = REPLACE(@l_str, N'ẫ', 'a');
SET @l_str = REPLACE(@l_str, N'ậ', 'a');
 
SET @l_str = REPLACE(@l_str, N'ă', 'a');
SET @l_str = REPLACE(@l_str, N'ắ', 'a');
SET @l_str = REPLACE(@l_str, N'ằ', 'a');
SET @l_str = REPLACE(@l_str, N'ẳ', 'a');
SET @l_str = REPLACE(@l_str, N'ẵ', 'a');
SET @l_str = REPLACE(@l_str, N'ặ', 'a');
 
SET @l_str = REPLACE(@l_str, N'é', 'e');
SET @l_str = REPLACE(@l_str, N'è', 'e');
SET @l_str = REPLACE(@l_str, N'ẻ', 'e');
SET @l_str = REPLACE(@l_str, N'ẽ', 'e');
SET @l_str = REPLACE(@l_str, N'ẹ', 'e');
 
SET @l_str = REPLACE(@l_str, N'ê', 'e');
SET @l_str = REPLACE(@l_str, N'ế', 'e');
SET @l_str = REPLACE(@l_str, N'ề', 'e');
SET @l_str = REPLACE(@l_str, N'ể', 'e');
SET @l_str = REPLACE(@l_str, N'ễ', 'e');
SET @l_str = REPLACE(@l_str, N'ệ', 'e');
 
SET @l_str = REPLACE(@l_str, N'í', 'i');
SET @l_str = REPLACE(@l_str, N'ì', 'i');
SET @l_str = REPLACE(@l_str, N'ỉ', 'i');
SET @l_str = REPLACE(@l_str, N'ĩ', 'i');
SET @l_str = REPLACE(@l_str, N'ị', 'i');
 
SET @l_str = REPLACE(@l_str, N'ó', 'o');
SET @l_str = REPLACE(@l_str, N'ò', 'o');
SET @l_str = REPLACE(@l_str, N'ỏ', 'o');
SET @l_str = REPLACE(@l_str, N'õ', 'o');
SET @l_str = REPLACE(@l_str, N'ọ', 'o');
 
SET @l_str = REPLACE(@l_str, N'ô', 'o');
SET @l_str = REPLACE(@l_str, N'ố', 'o');
SET @l_str = REPLACE(@l_str, N'ồ', 'o');
SET @l_str = REPLACE(@l_str, N'ổ', 'o');
SET @l_str = REPLACE(@l_str, N'ỗ', 'o');
SET @l_str = REPLACE(@l_str, N'ộ', 'o');
 
SET @l_str = REPLACE(@l_str, N'ơ', 'o');
SET @l_str = REPLACE(@l_str, N'ớ', 'o');
SET @l_str = REPLACE(@l_str, N'ờ', 'o');
SET @l_str = REPLACE(@l_str, N'ở', 'o');
SET @l_str = REPLACE(@l_str, N'ỡ', 'o');
SET @l_str = REPLACE(@l_str, N'ợ', 'o');
 
SET @l_str = REPLACE(@l_str, N'ú', 'u');
SET @l_str = REPLACE(@l_str, N'ù', 'u');
SET @l_str = REPLACE(@l_str, N'ủ', 'u');
SET @l_str = REPLACE(@l_str, N'ũ', 'u');
SET @l_str = REPLACE(@l_str, N'ụ', 'u');
 
SET @l_str = REPLACE(@l_str, N'ư', 'u');
SET @l_str = REPLACE(@l_str, N'ứ', 'u');
SET @l_str = REPLACE(@l_str, N'ừ', 'u');
SET @l_str = REPLACE(@l_str, N'ử', 'u');
SET @l_str = REPLACE(@l_str, N'ữ', 'u');
SET @l_str = REPLACE(@l_str, N'ự', 'u');
 
SET @l_str = REPLACE(@l_str, N'ý', 'y');
SET @l_str = REPLACE(@l_str, N'ỳ', 'y');
SET @l_str = REPLACE(@l_str, N'ỷ', 'y');
SET @l_str = REPLACE(@l_str, N'ỹ', 'y');
SET @l_str = REPLACE(@l_str, N'ỵ', 'y');
 
SET @l_str = REPLACE(@l_str, N'đ', 'd');
 
 
--SET @l_str = REPLACE(@l_str, ' ', '-');
--SET @l_str = REPLACE(@l_str, '~', '-');
--SET @l_str = REPLACE(@l_str, '?', '-');
--SET @l_str = REPLACE(@l_str, '@', '-');
--SET @l_str = REPLACE(@l_str, '#', '-');
--SET @l_str = REPLACE(@l_str, '$', '-');
--SET @l_str = REPLACE(@l_str, '^', '-');
--SET @l_str = REPLACE(@l_str, '&', '-');
--SET @l_str = REPLACE(@l_str, '/', '-');
 
--SET @l_str = REPLACE(@l_str, '(', '');
--SET @l_str = REPLACE(@l_str, ')', '');
--SET @l_str = REPLACE(@l_str, '[', '');
--SET @l_str = REPLACE(@l_str, ']', '');
--SET @l_str = REPLACE(@l_str, '{', '');
--SET @l_str = REPLACE(@l_str, '}', '');
--SET @l_str = REPLACE(@l_str, '<', '');
--SET @l_str = REPLACE(@l_str, '>', '');
--SET @l_str = REPLACE(@l_str, '|', '');
--SET @l_str = REPLACE(@l_str, '"', '');
--SET @l_str = REPLACE(@l_str, '%', '');
--SET @l_str = REPLACE(@l_str, '^', '');
--SET @l_str = REPLACE(@l_str, '*', '');
--SET @l_str = REPLACE(@l_str, '!', '');
--SET @l_str = REPLACE(@l_str, ',', '');
--SET @l_str = REPLACE(@l_str, '.', '');
 
--SET @l_str = REPLACE(@l_str, '---', '-');
--SET @l_str = REPLACE(@l_str, '--', '-');
 
RETURN @l_str;
END
GO
/****** Object:  Table [dbo].[duty]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[duty](
	[dutyId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](256) NULL,
	[content] [nvarchar](max) NULL,
	[receiveDutyDesc] [nvarchar](50) NULL,
	[hasReceiveDuty] [bit] NULL,
	[doneDutyDesc] [nvarchar](50) NULL,
	[hasDoneDuty] [bit] NULL,
	[resultDutyDesc] [nvarchar](50) NULL,
	[hasResultDuty] [bit] NULL,
	[dtFormat] [varchar](50) NULL,
	[dtDuty] [varchar](50) NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[dutyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[city]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[cityId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[uspGetChatRoom]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspGetChatRoom]
as
	select * from ChatRoom
GO
/****** Object:  Table [dbo].[charging]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[charging](
	[id] [int] NOT NULL,
	[number] [varchar](20) NOT NULL,
	[value] [varchar](20) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[partnerId] [int] NULL,
	[isSMS] [bit] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK__charging__3213E83F6477ECF3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardtxn]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardtxn](
	[CardTxnId] [bigint] IDENTITY(1,1) NOT NULL,
	[amount] [float] NULL,
	[cardId] [nvarchar](100) NULL,
	[cardCode] [nvarchar](100) NOT NULL,
	[receiveDate] [datetime] NULL,
	[paymentDate] [datetime] NULL,
	[parnterId] [varchar](40) NULL,
	[userName] [nvarchar](100) NOT NULL,
	[statusId] [int] NULL,
	[providerTxnId] [varchar](100) NULL,
	[providerName] [nvarchar](100) NULL,
	[serviceId] [nvarchar](100) NULL,
	[additionalInfo] [nvarchar](max) NULL,
	[providerStatusId] [nvarchar](10) NULL,
	[gotMoney] [int] NULL,
	[userId] [bigint] NULL,
	[refCode] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CardTxnId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cardofflinetxn]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cardofflinetxn](
	[CardOfflineTxnId] [bigint] IDENTITY(1,1) NOT NULL,
	[cardId] [varchar](100) NULL,
	[cardCode] [varchar](100) NULL,
	[userName] [varchar](100) NULL,
	[serviceId] [varchar](100) NULL,
	[receiveDate] [datetime] NULL,
	[deliveryDate] [datetime] NULL,
	[partnerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CardOfflineTxnId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[auditgiftcode]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[auditgiftcode](
	[AuditGiftCodeId] [bigint] IDENTITY(1,1) NOT NULL,
	[createdDate] [datetime] NULL,
	[userId] [bigint] NULL,
	[deviceType] [int] NULL,
	[isSuccess] [bit] NULL,
	[serial] [varchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditGiftCodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[level]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[level](
	[LevelID] [int] NOT NULL,
	[Description] [nvarchar](45) NULL,
	[MinExp] [int] NULL,
	[bonusUpperLevel] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job](
	[jobId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[jobId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[guest]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[guest](
	[guestId] [bigint] IDENTITY(1,1) NOT NULL,
	[deviceUid] [nchar](100) NOT NULL,
	[insertDate] [datetime] NULL,
	[registedFlag] [smallint] NULL,
 CONSTRAINT [PK__guest__8D59CD1C3E3D3572] PRIMARY KEY CLUSTERED 
(
	[guestId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[goldenhour]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[goldenhour](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[fromDate] [datetime] NULL,
	[toDate] [datetime] NULL,
	[isActive] [bit] NULL,
	[type] [int] NULL,
	[bonusAmount] [bigint] NULL,
	[partnerId] [int] NULL,
	[externalParam] [varchar](50) NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_GoldenHour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[giftcode]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[giftcode](
	[GiftCodeId] [bigint] IDENTITY(1,1) NOT NULL,
	[serial] [varchar](40) NULL,
	[createdDate] [datetime] NULL,
	[usedDate] [datetime] NULL,
	[bonusMoney] [int] NULL,
	[marketingChannelId] [int] NULL,
	[type] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[GiftCodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[getValueFromMgs]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[getValueFromMgs]
(
 @msg nvarchar(100)
)
returns int
as
 begin
  declare @value int
  set @value = 0;
  if @msg like '%8575'
   set @value = 5000
  if @msg like '%8675'
   set @value = 10000
  if @msg like '%8775'
   set @value = 15000
  if @msg like '%10000'
   set @value = 10000
   if @msg like '%20000'
   set @value = 20000
   if @msg like '%30000'
   set @value = 30000
   if @msg like '%40000'
   set @value = 40000
   if @msg like '%50000'
   set @value = 50000
   if @msg like '%60000'
   set @value = 60000
   if @msg like '%70000'
   set @value = 70000
   if @msg like '%80000'
   set @value = 80000
   if @msg like '%90000'
   set @value = 90000
   if @msg like '%100000'
   set @value = 100000
   if @msg like '%110000'
   set @value = 110000
   if @msg like '%120000'
   set @value = 120000
   if @msg like '%130000'
   set @value = 130000
   if @msg like '%140000'
   set @value = 140000
   if @msg like '%150000'
   set @value = 150000
   if @msg like '%160000'
   set @value = 160000
   if @msg like '%170000'
   set @value = 170000
   if @msg like '%180000'
   set @value = 180000
   if @msg like '%190000'
   set @value = 190000
   if @msg like '%200000'
   set @value = 200000
   if @msg like '%210000'
   set @value = 210000
   if @msg like '%220000'
   set @value = 220000
   if @msg like '%230000'
   set @value = 230000
   if @msg like '%240000'
   set @value = 240000
   if @msg like '%250000'
   set @value = 250000
   if @msg like '%260000'
   set @value = 260000
   if @msg like '%270000'
   set @value = 270000
   if @msg like '%280000'
   set @value = 280000
   if @msg like '%290000'
   set @value = 290000
   if @msg like '%300000'
   set @value = 300000
   if @msg like '%310000'
   set @value = 310000
   if @msg like '%320000'
   set @value = 320000
   if @msg like '%330000'
   set @value = 330000
   if @msg like '%340000'
   set @value = 340000
   if @msg like '%350000'
   set @value = 350000
   if @msg like '%360000'
   set @value = 360000
   if @msg like '%370000'
   set @value = 370000
   if @msg like '%380000'
   set @value = 380000
   if @msg like '%390000'
   set @value = 390000
   if @msg like '%400000'
   set @value = 400000
   if @msg like '%410000'
   set @value = 410000
   if @msg like '%420000'
   set @value = 420000
   if @msg like '%430000'
   set @value = 430000
   if @msg like '%440000'
   set @value = 440000
   if @msg like '%450000'
   set @value = 450000
   if @msg like '%460000'
   set @value = 460000
   if @msg like '%470000'
   set @value = 470000
   if @msg like '%480000'
   set @value = 480000
   if @msg like '%490000'
   set @value = 490000
   if @msg like '%500000'
   set @value = 500000
   if @msg like '%510000'
   set @value = 510000
   if @msg like '%520000'
   set @value = 520000
   if @msg like '%530000'
   set @value = 530000
   if @msg like '%540000'
   set @value = 540000
   if @msg like '%550000'
   set @value = 550000
   if @msg like '%560000'
   set @value = 560000
   if @msg like '%570000'
   set @value = 570000
   if @msg like '%580000'
   set @value = 580000
   if @msg like '%590000'
   set @value = 590000
   if @msg like '%600000'
   set @value = 600000
   if @msg like '%610000'
   set @value = 610000
   if @msg like '%620000'
   set @value = 620000
   if @msg like '%630000'
   set @value = 630000
   if @msg like '%640000'
   set @value = 640000
   if @msg like '%650000'
   set @value = 650000
   if @msg like '%660000'
   set @value = 660000
   if @msg like '%670000'
   set @value = 670000
   if @msg like '%680000'
   set @value = 680000
   if @msg like '%690000'
   set @value = 690000
   if @msg like '%700000'
   set @value = 700000
   if @msg like '%710000'
   set @value = 710000
   if @msg like '%720000'
   set @value = 720000
   if @msg like '%730000'
   set @value = 730000
   if @msg like '%740000'
   set @value = 740000
   if @msg like '%750000'
   set @value = 750000
   if @msg like '%760000'
   set @value = 760000
   if @msg like '%770000'
   set @value = 770000
   if @msg like '%780000'
   set @value = 780000
   if @msg like '%790000'
   set @value = 790000
   if @msg like '%800000'
   set @value = 800000
   if @msg like '%810000'
   set @value = 810000
   if @msg like '%820000'
   set @value = 820000
   if @msg like '%830000'
   set @value = 830000
   if @msg like '%840000'
   set @value = 840000
   if @msg like '%850000'
   set @value = 850000
   if @msg like '%860000'
   set @value = 860000
   if @msg like '%870000'
   set @value = 870000
   if @msg like '%880000'
   set @value = 880000
   if @msg like '%890000'
   set @value = 890000
   if @msg like '%900000'
   set @value = 900000
   if @msg like '%910000'
   set @value = 910000
   if @msg like '%920000'
   set @value = 920000
   if @msg like '%930000'
   set @value = 930000
   if @msg like '%940000'
   set @value = 940000
   if @msg like '%950000'
   set @value = 950000
   if @msg like '%960000'
   set @value = 960000
   if @msg like '%970000'
   set @value = 970000
   if @msg like '%980000'
   set @value = 980000
   if @msg like '%990000'
   set @value = 990000
   if @msg like '%1000000'
   set @value = 1000000
  return (@value)
 end
GO
/****** Object:  Table [dbo].[userinfo]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[userinfo](
	[userId] [bigint] NOT NULL,
	[address] [nvarchar](256) NULL,
	[cityId] [int] NULL,
	[jobId] [int] NULL,
	[birthday] [datetime] NULL,
	[hobby] [nvarchar](1000) NULL,
	[nickSkype] [nvarchar](100) NULL,
	[nickYahoo] [nvarchar](100) NULL,
	[characterId] [int] NULL,
	[aboutMe] [nvarchar](1000) NULL,
	[Wanted] [nvarchar](1000) NULL,
	[phoneNumber] [varchar](20) NULL,
UNIQUE NONCLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usergifttype]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usergifttype](
	[userGiftTypeID] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](100) NOT NULL,
	[moneyGift] [bigint] NOT NULL,
 CONSTRAINT [PK_UserGiftType] PRIMARY KEY CLUSTERED 
(
	[userGiftTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usergift]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usergift](
	[userGiftID] [bigint] IDENTITY(1,1) NOT NULL,
	[userID] [bigint] NOT NULL,
	[objectID] [varchar](100) NULL,
	[userGiftTypeID] [int] NOT NULL,
 CONSTRAINT [PK_UserGift] PRIMARY KEY CLUSTERED 
(
	[userGiftID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[superuser]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[superuser](
	[superuserid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [bigint] NOT NULL,
 CONSTRAINT [PK_superuser] PRIMARY KEY CLUSTERED 
(
	[superuserid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[socialFriend]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[socialFriend](
	[socialId] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[friendId] [bigint] NOT NULL,
	[requestDate] [datetime] NULL,
	[confirmDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[socialId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shoutbox]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shoutbox](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](100) NULL,
	[content] [nvarchar](256) NULL,
	[active] [int] NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_shoutbox] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roomlevel]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roomlevel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[zoneId] [int] NULL,
	[level] [nvarchar](30) NULL,
	[minCash] [int] NULL,
	[cashList] [varchar](50) NULL,
	[levelId] [int] NULL,
	[isVip] [tinyint] NULL,
 CONSTRAINT [PK__roomleve__3213E83F2B3F6F97] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[room]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [int] NOT NULL,
	[availables] [int] NULL,
	[numTable] [int] NULL,
	[levelId] [int] NOT NULL,
	[playing] [int] NULL,
	[ZoneId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[revenuetype]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[revenuetype](
	[RevenueTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceCode] [nvarchar](100) NULL,
	[Partner] [nvarchar](100) NULL,
	[money] [float] NULL,
	[provider] [nvarchar](40) NULL,
	[VND] [int] NULL,
	[cash] [int] NULL,
	[actualRevenue] [float] NULL,
 CONSTRAINT [PK__RevenueT__DD7B231C73A521EA] PRIMARY KEY CLUSTERED 
(
	[RevenueTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reportuser]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reportuser](
	[Userid] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[partnerId] [int] NULL,
	[userTypeId] [int] NULL,
	[roleId] [int] NOT NULL,
	[active] [int] NOT NULL,
 CONSTRAINT [PK_ReportUser] PRIMARY KEY CLUSTERED 
(
	[Userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reportdailystat]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reportdailystat](
	[day] [date] NOT NULL,
	[hour] [int] NOT NULL,
	[downloadCount] [int] NULL,
	[registCount] [int] NULL,
	[loginCount] [int] NULL,
	[ccu] [int] NULL,
	[smsCount] [int] NULL,
	[cardCount] [int] NULL,
	[samCount] [int] NULL,
	[samMoney] [int] NULL,
	[altpCount] [int] NULL,
	[altpMoney] [int] NULL,
	[phomCount] [int] NULL,
	[phomMoney] [int] NULL,
	[tlmnCount] [int] NULL,
	[tlmnMoney] [int] NULL,
	[picachuCount] [int] NULL,
	[picachuMoney] [int] NULL,
	[liengCount] [int] NULL,
	[liengMoney] [int] NULL,
	[xitoCount] [int] NULL,
	[xitoMoney] [int] NULL,
	[bacayCount] [int] NULL,
	[bacayMoney] [int] NULL,
	[baucuaCount] [int] NULL,
	[baucauMoney] [int] NULL,
	[uniqueUserGameCount] [int] NULL,
	[revenueMoney] [int] NULL,
	[vascMoney] [int] NULL,
	[feeMoney] [int] NULL,
	[insertDate] [datetime] NULL,
 CONSTRAINT [PK_STA_DAILYSTAT] PRIMARY KEY CLUSTERED 
(
	[day] ASC,
	[hour] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[refreshcache]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[refreshcache](
	[RefreshId] [bigint] IDENTITY(1,1) NOT NULL,
	[namespace] [varchar](50) NULL,
	[value] [bigint] NULL,
	[isRefresh] [bit] NULL,
	[keyCache] [bigint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[refgioithieu]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[refgioithieu](
	[RefGioiThieuID] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[createdDate] [datetime] NULL,
	[PhoneOrMail] [varchar](100) NULL,
	[device] [int] NULL,
	[sendDate] [datetime] NULL,
	[partnerId] [int] NULL,
	[positionGioithieu] [int] NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RefGioiThieuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestionKhongDau]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionKhongDau](
	[QuestionId] [float] NULL,
	[detail] [nvarchar](max) NULL,
	[choix1] [nvarchar](max) NULL,
	[choix2] [nvarchar](max) NULL,
	[choix3] [nvarchar](max) NULL,
	[choix4] [nvarchar](max) NULL,
	[answer] [float] NULL,
	[levelID] [float] NULL,
	[domainID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionBackup20140712]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionBackup20140712](
	[QuestionId] [float] NULL,
	[detail] [nvarchar](max) NULL,
	[choix1] [nvarchar](max) NULL,
	[choix2] [nvarchar](max) NULL,
	[choix3] [nvarchar](max) NULL,
	[choix4] [nvarchar](max) NULL,
	[answer] [float] NULL,
	[levelID] [float] NULL,
	[domainID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionBackup20140630_2]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionBackup20140630_2](
	[QuestionId] [float] NULL,
	[detail] [nvarchar](max) NULL,
	[choix1] [nvarchar](max) NULL,
	[choix2] [nvarchar](max) NULL,
	[choix3] [nvarchar](max) NULL,
	[choix4] [nvarchar](max) NULL,
	[answer] [float] NULL,
	[levelID] [float] NULL,
	[domainID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionBackup20140630]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionBackup20140630](
	[QuestionId] [float] NULL,
	[detail] [nvarchar](max) NULL,
	[choix1] [nvarchar](max) NULL,
	[choix2] [nvarchar](max) NULL,
	[choix3] [nvarchar](max) NULL,
	[choix4] [nvarchar](max) NULL,
	[answer] [float] NULL,
	[levelID] [float] NULL,
	[domainID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionBackup20140626]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionBackup20140626](
	[QuestionId] [float] NULL,
	[detail] [nvarchar](max) NULL,
	[choix1] [nvarchar](max) NULL,
	[choix2] [nvarchar](max) NULL,
	[choix3] [nvarchar](max) NULL,
	[choix4] [nvarchar](max) NULL,
	[answer] [float] NULL,
	[levelID] [float] NULL,
	[domainID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionBackup2]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionBackup2](
	[QuestionId] [float] NULL,
	[detail] [nvarchar](max) NULL,
	[choix1] [nvarchar](max) NULL,
	[choix2] [nvarchar](max) NULL,
	[choix3] [nvarchar](max) NULL,
	[choix4] [nvarchar](max) NULL,
	[answer] [float] NULL,
	[levelID] [float] NULL,
	[domainID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionBackup]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionBackup](
	[QuestionId] [float] NULL,
	[detail] [nvarchar](max) NULL,
	[choix1] [nvarchar](max) NULL,
	[choix2] [nvarchar](max) NULL,
	[choix3] [nvarchar](max) NULL,
	[choix4] [nvarchar](max) NULL,
	[answer] [float] NULL,
	[levelID] [float] NULL,
	[domainID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question_full]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_full](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[detail] [nvarchar](max) NOT NULL,
	[choix1] [nvarchar](200) NOT NULL,
	[choix2] [nvarchar](200) NOT NULL,
	[choix3] [nvarchar](200) NOT NULL,
	[choix4] [nvarchar](200) NOT NULL,
	[answer] [int] NULL,
	[levelID] [int] NOT NULL,
	[domainID] [int] NULL,
 CONSTRAINT [PK_Question_2] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [float] NULL,
	[detail] [nvarchar](max) NULL,
	[choix1] [nvarchar](max) NULL,
	[choix2] [nvarchar](max) NULL,
	[choix3] [nvarchar](max) NULL,
	[choix4] [nvarchar](max) NULL,
	[answer] [float] NULL,
	[levelID] [float] NULL,
	[domainID] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[percharacter]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[percharacter](
	[CharacterId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CharacterId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partner]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[partner](
	[partnerId] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[webURL] [varchar](256) NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[partner] ADD [folder] [varchar](100) NULL
ALTER TABLE [dbo].[partner] ADD [gameFile] [varchar](100) NULL
ALTER TABLE [dbo].[partner] ADD [password] [varchar](100) NULL
ALTER TABLE [dbo].[partner] ADD [isNeedActive] [bit] NULL
ALTER TABLE [dbo].[partner] ADD [partnerCode] [varchar](10) NULL
ALTER TABLE [dbo].[partner] ADD [isDiffUser] [bit] NULL
ALTER TABLE [dbo].[partner] ADD PRIMARY KEY CLUSTERED 
(
	[partnerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mxhmessage]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mxhmessage](
	[messageId] [bigint] IDENTITY(1,1) NOT NULL,
	[sourceId] [bigint] NOT NULL,
	[destId] [bigint] NOT NULL,
	[content] [nvarchar](max) NULL,
	[isRead] [bit] NULL,
	[dateCreated] [datetime] NOT NULL,
	[title] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[messageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mtmessages]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mtmessages](
	[mtseq] [bigint] IDENTITY(1,1) NOT NULL,
	[moid] [varchar](100) NULL,
	[moseq] [varchar](100) NULL,
	[src] [varchar](100) NULL,
	[dest] [varchar](100) NULL,
	[cmdcode] [varchar](100) NULL,
	[msgbody] [varchar](1000) NULL,
	[msgtype] [varchar](100) NULL,
	[msgtitle] [varchar](100) NULL,
	[mttotalseq] [varchar](100) NULL,
	[mtseqref] [varchar](100) NULL,
	[cpid] [varchar](100) NULL,
	[reqtime] [varchar](100) NULL,
	[procresult] [varchar](100) NULL,
	[opid] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[momessages]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[momessages](
	[moid] [varchar](100) NOT NULL,
	[moseq] [varchar](100) NULL,
	[src] [varchar](100) NULL,
	[dest] [varchar](100) NULL,
	[cmdcode] [varchar](100) NULL,
	[msgbody] [varchar](1000) NULL,
	[opid] [varchar](100) NULL,
	[dateInsert] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[match]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[match](
	[MatchId] [bigint] IDENTITY(1,1) NOT NULL,
	[dateCreated] [datetime] NULL,
	[ownerId] [bigint] NULL,
	[roomId] [int] NULL,
	[tableNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MatchId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LuckyNumber]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LuckyNumber](
	[LuckyNumberId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[LuckyNumber] [bigint] NOT NULL,
	[LuckyTime] [datetime] NOT NULL,
 CONSTRAINT [PK_LuckyNumber] PRIMARY KEY CLUSTERED 
(
	[LuckyNumberId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logvasc]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[logvasc](
	[logvascId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[DateTime] [datetime] NULL,
	[Money] [bigint] NULL,
	[Description] [varchar](200) NULL,
	[LogTypeId] [int] NULL,
	[PhoneNumber] [varchar](12) NULL,
	[balanceAfter] [bigint] NULL,
	[isWin] [bit] NULL,
	[experience] [smallint] NULL,
	[dateCalExp] [datetime] NULL,
	[achievementQuestion] [int] NULL,
	[moneyType] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Gold ; 1: Xeeng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'logvasc', @level2type=N'COLUMN',@level2name=N'moneyType'
GO
/****** Object:  StoredProcedure [dbo].[uspMonitorStatus]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspMonitorStatus]
as
SELECT 
    DB_NAME(dbid) as DBName, 
    COUNT(dbid) as NumberOfConnections,
    loginame as LoginName
FROM
    sys.sysprocesses
WHERE 
    dbid > 0
GROUP BY 
    dbid, loginame
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetNewsById]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetNewsById] 
	@id int
AS
BEGIN
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * 
	FROM xeNews
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetMonthlySMSStatistics]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetMonthlySMSStatistics]
	-- Add the parameters for the stored procedure here
	@reportMonth datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAX(itemCount) AS itemCount, itemMoney
	FROM xeChargingMoneyStatistics
	WHERE DATEDIFF(MONTH, reportDate, @reportMonth) = 0
	    AND itemType = 2
	GROUP BY DATEDIFF(MONTH, reportDate, @reportMonth), itemMoney
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetMonthlyCardStatistics]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetMonthlyCardStatistics]
	-- Add the parameters for the stored procedure here
	@reportMonth datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAX(itemCount) AS itemCount, itemMoney
	FROM xeChargingMoneyStatistics
	WHERE DATEDIFF(MONTH, reportDate, @reportMonth) = 0
	    AND itemType = 3
	GROUP BY DATEDIFF(MONTH, reportDate, @reportMonth), itemMoney
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetMaxNumOfUserOnlineByHour]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetMaxNumOfUserOnlineByHour]
	-- Add the parameters for the stored procedure here
	@date datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT DATEADD(HOUR, -hourDiff, GETDATE()) AS dateReport, num FROM
	(
		SELECT TOP 168 DATEDIFF(HOUR, dateReport, GETDATE()) AS hourDiff, MAX(num) AS num -- 168 = 24 x 7
		FROM xeNumOfUserOnline
		WHERE DATEDIFF(SECOND, dateReport, @date) >= 0
		GROUP BY DATEDIFF(HOUR, dateReport, GETDATE())
		ORDER BY DATEDIFF(HOUR, dateReport, GETDATE()) ASC
	) tmp
	ORDER BY dateReport ASC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetMaxNumOfUserOnlineByDay]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetMaxNumOfUserOnlineByDay]
	-- Add the parameters for the stored procedure here
	@date datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT DATEADD(DAY, -dayDiff, GETDATE()) AS dateReport, num FROM
	(
		SELECT TOP 30 DATEDIFF(DAY, dateReport, GETDATE()) AS dayDiff, MAX(num) AS num
		FROM xeNumOfUserOnline
		WHERE DATEDIFF(SECOND, dateReport, @date) >= 0
		GROUP BY DATEDIFF(DAY, dateReport, GETDATE())
		ORDER BY DATEDIFF(DAY, dateReport, GETDATE()) ASC
	) tmp
	ORDER BY dateReport ASC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetInventoryOfUser]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 28-Jul-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetInventoryOfUser] 
	-- Add the parameters for the stored procedure here
	@userId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	-- SELECT * from xeInventory where userId = @userId and isActive = 1 and quantity > 0
	SELECT DISTINCT xeInventory.* FROM xeInventory LEFT JOIN xeEventItems ON xeInventory.itemCode = xeEventItems.code 
							  LEFT JOIN xeCashShop ON xeInventory.itemCode = xeCashShop.code
							  WHERE userId = @userId 
							  AND xeInventory.quantity > 0 
							  AND (xeEventItems.isActive = 1 OR xeCashShop.isActive = 1)
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetGameSpecificEventItems]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetGameSpecificEventItems]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT xeEventItems.* FROM xeEventItems, xeInGameEvent WHERE xeEventItems.eventId = xeInGameEvent.id AND xeInGameEvent.id = 9 AND xeInGameEvent.isActive = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetEventGiftLogOfUser]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 29-Jul-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetEventGiftLogOfUser] 
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@evenId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 30 * FROM xeLogEventGiftsHistory WHERE userId = @userId AND eventId = @evenId ORDER BY useDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetEventGiftLog]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 29-Jul-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetEventGiftLog] 
	-- Add the parameters for the stored procedure here
	@eventId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 30 l.message, l.useDate, u.name FROM xeLogEventGiftsHistory l, workinguser u WHERE eventId = @eventId AND l.userId = u.userId AND message NOT LIKE N'Chúc bạn may mắn lần sau' ORDER BY useDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetDeviceStatisticsMonthly]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetDeviceStatisticsMonthly]
	-- Add the parameters for the stored procedure here
	@month date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1 * 
	FROM xeDeviceDailyStatistics
	WHERE DATEDIFF(MONTH, reportDate, @month) = 0
	ORDER BY reportDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetDeviceStatistics]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetDeviceStatistics]
	-- Add the parameters for the stored procedure here
	@month date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM xeDeviceDailyStatistics
	WHERE DATEDIFF(MONTH, reportDate, @month) = 0
	ORDER BY reportDate ASC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetDailyStatistics]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetDailyStatistics]
	-- Add the parameters for the stored procedure here
	@dateStart date,
	@dateEnd date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM XEDailyStatistics
	WHERE DATEDIFF(DAY, @dateStart, reportDate) >= 0
		AND DATEDIFF(DAY, reportDate, @dateEnd) >= 0
	ORDER BY reportDate ASC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetChatMessages]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetChatMessages]
	-- Add the parameters for the stored procedure here
	@sentId bigint,
	@receivedId bigint,
	@offset int,
	@limit int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- Select chat messages between 2 users order by most recent date with row number
	WITH ChatMessages AS
	(
		SELECT
			*,
			ROW_NUMBER() OVER (ORDER BY dateSent DESC) AS RowNum
		FROM xePrivateMessage
		WHERE ( fromUserId = @sentId AND toUserId = @receivedId ) OR (fromUserId = @receivedId AND toUserId = @sentId )
	)
	-- 
	SELECT *
	FROM ChatMessages
	WHERE RowNum > @offset
	AND RowNum <= @offset + @limit;
  
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetCardLogByPaymentDate]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetCardLogByPaymentDate]
	-- Add the parameters for the stored procedure here
	@timeStart datetime,
	@timeEnd datetime,
	@partnerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * 
    FROM cardtxn
    WHERE amount != 0
        AND paymentDate IS NOT NULL
        AND DATEDIFF(SECOND, @timeStart, paymentDate) >= 0
        AND DATEDIFF(SECOND, paymentDate, @timeEnd) >= 0
        AND parnterId = @partnerId AND parnterId IN (96, 97)
            -- OR (parnterId = @partnerId AND parnterId IN (96, 97) AND refCode NOT IN (0, 4, 8)))
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetCampaignStatistics]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetCampaignStatistics]
	-- Add the parameters for the stored procedure here
	@dateStart date,
	@dateEnd date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT campaignName, MAX(osName) AS osName, COUNT(osName) AS osCount
	FROM xeCampaignTracking
	WHERE DATEDIFF(DAY, @dateStart, [date]) >= 0
	    AND DATEDIFF(DAY, [date], @dateEnd) >= 0
	GROUP BY campaignName, osName
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetAppotaTransaction]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetAppotaTransaction]
	@userId bigint,
	@transactionId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- Insert statements for procedure here
	SELECT * FROM [dbo].[XEAppotaTransaction] WHERE transactionId = @transactionId;
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetAllShopItems]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ThamThang
-- Create date: 10-Aug-2014
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetAllShopItems] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @goldenHourItem int
    
    SELECT @goldenHourItem = COUNT(*) FROM xeGoldenHour WHERE date_begin < GETDATE() AND date_end > GETDATE();
    IF (@goldenHourItem > 0)
    BEGIN
		SELECT ex.*, gh.value FROM dbo.xeExchange ex, xeGoldenHour gh 
		WHERE ex.active = 1 AND ex.item_id = gh.item_id AND gh.date_begin < GETDATE() AND gh.date_end > GETDATE();
    END
    ELSE
    BEGIN
		SELECT *, 0 as value FROM xeExchange;
    END
	
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetAllRouletteItems]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 04-Sep-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetAllRouletteItems] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM xeRouletteItem where isActive = 1
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetAllPrivateMessages]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetAllPrivateMessages] 
	@receiverId bigint,
	@numOfDay int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM xePrivateMessage
	WHERE toUserId = @receiverId
	    AND dateSent >= DATEADD(DAY, -@numOfDay, GETDATE())
	ORDER BY dateSent DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetAllNews]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetAllNews] 
AS
BEGIN
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * 
	FROM xeNews
	ORDER BY dateCreated DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetAllLevels]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tunghx
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetAllLevels] 
	@zoneId int
AS
BEGIN
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT * 
	FROM roomlevel
	WHERE zoneId = @zoneId;
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetAllInGameEvents]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 04-Aug-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetAllInGameEvents] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM xeInGameEvent WHERE isActive = 1
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetAllEventItems]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ThamThang
-- Create date: 25-Jul-2014
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetAllEventItems]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT xeEventItems.* FROM xeEventItems WHERE xeEventItems.isActive = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetAllEventGifts]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 29-Jul-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetAllEventGifts] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from xeEventGifts where isActive = 1
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetAllCashShopItems]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 07-Aug-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetAllCashShopItems]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM xeCashShop where isActive = 1
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetAllCampaigns]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetAllCampaigns]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DISTINCT campaignName 
	FROM xeCampaignTracking
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetAllBadUsers]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetAllBadUsers]
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM xeBadUsers WHERE isActive = 1
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetAllAds]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetAllAds]  
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM xeAdvertising 
	WHERE isDisplay = 1 
		AND startDate < GETDATE()
		AND endDate > GETDATE()
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEEndRoulette]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 06-Sep-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEEndRoulette]
	@userId bigint,
	@round int,
	@item nvarchar(50),
	@fee bigint,
	@feeType nvarchar(10),
	@price float
AS
BEGIN
	SET NOCOUNT ON;

    -- Update user's money
	IF (@feeType like 'Gold')
	BEGIN
		UPDATE workinguser 
			SET cash = cash + (@fee * @price)
		WHERE userId = @userId
	END
	ELSE IF (@feeType like 'Xeng')
	BEGIN
		UPDATE workinguser
			SET xeeng = xeeng + (@fee * @price)
		WHERE userId = @userId
	END
	
	-- Insert log
	INSERT INTO xeLogRouletteHistory
	(userId, round, item, price, priceType, value, date)
	VALUES
	(@userId, @round, @item, @price, @feeType, @fee * @price, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEDeviceDailyReport]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEDeviceDailyReport]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @today datetime = GETDATE()
	DECLARE @reportDate date = DATEADD(DAY, -1, @today)

	INSERT INTO xeNumOfUserDeviceByOS
	(reportDate, os, num)
	SELECT @reportDate, (osName + ' ' + osVersion) AS os, COUNT(osMAC) AS num
	FROM xeUserDevice
	WHERE DATEDIFF(DAY, lastLogin, @reportDate) = 0
	GROUP BY (osName + ' ' + osVersion)
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEDeleteNews]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEDeleteNews] 
	@id bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM xeNews
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[uspLogout]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspLogout]
	@userId bigint,
	@collectInfo nvarchar(max) 
as
	set nocount on
	declare @dt datetime
	declare @loginDate datetime
	
	select @dt = GETDATE()
	
	update workingUser
		set isOnline = 0
	where UserID =@userId
GO
/****** Object:  StoredProcedure [dbo].[uspLoginEvent]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspLoginEvent]
	@userid bigint,
	@extParam varchar(100)
as

	set nocount on
	
	declare @dtNow datetime
	declare @partnerId int
	Declare @lastLogin datetime
	Declare @totalBonusAmount bigint = 0
	Declare @bonusAmount bigint
	Declare @currentCash bigint
	Declare @returnString varchar(500) = ''
	Declare @lastestVersion varchar(50)
	Declare @currentVersion varchar(20)
	DECLARE @oldLastLogin datetime
	
	if not exists (select userid from WorkingUser where userId=@userid)
	begin
		select -1 as 'result'
		return
	end
	
	select @dtNow = GETDATE()
	
	select @currentVersion=gameVersion,@currentCash=cash, @lastLogin = lastLogin, @partnerId=partnerId
		from workingUser
	where userId=@userid
	
	--partner=0 la tat ca
	
	--su kien cong tien khi gio vang type =1
	set @bonusAmount=0
	select @bonusAmount = bonusAmount,@returnString+=description from GoldenHour where (@dtNow between fromDate and toDate) and (@lastLogin is null or @lastLogin not between fromDate and toDate) and isActive=1 and (partnerId=@partnerId or partnerId=0) and type=1
	set @totalBonusAmount+=@bonusAmount
	--su kien cong tien khi nang cap phien ban moi type = 2
	set @bonusAmount=0
	select @lastestVersion = Description from version 
	select @bonusAmount = bonusAmount,@returnString+=description from GoldenHour where (@dtNow between fromDate and toDate) and isActive=1 and (partnerId=@partnerId or partnerId=0) and type=2 and (@lastestVersion != @currentVersion or @currentVersion is null) and @extParam=@lastestVersion	
	if(@bonusAmount>0)
	begin
	
		update WorkingUser set gameVersion = @lastestVersion where userId=@userid
	end
	set @totalBonusAmount+=@bonusAmount
    --su kien tang bi sms user sau 1 thang = 5
	set @bonusAmount=0
	select @bonusAmount = bonusAmount,@returnString+=description from GoldenHour where (@dtNow between fromDate and toDate) and isActive=1 and (partnerId=@partnerId or partnerId=0) and type=5 and (DATEDIFF(DAY,@lastLogin ,GETDATE()) > externalParam)
    set @totalBonusAmount+=@bonusAmount
    
    /*
    SELECT @oldLastLogin = lastLogin FROM workinguser WHERE userId = @userid
    
    IF DATEDIFF(day, @oldLastLogin, GETDATE()) > 0 -- lan dang nhap cuoi khong phai ngay hom nay
    BEGIN
		-- chuyen lastLogin sang lastSecondLogin, cap nhat lastLogin
		UPDATE workinguser
		SET lastSecondLogin = @oldLastLogin,
			lastLogin = GETDATE()
		WHERE userId = @userid
    END
    ELSE -- lan dang nhap cuoi van trong ngay hom nay
    BEGIN
		-- cap nhat lastLogin
		UPDATE workinguser
		SET lastLogin = GETDATE()
		WHERE userId = @userid
    END
    */

	if @totalBonusAmount>0
	begin
		update WorkingUser set cash+=@totalBonusAmount where userId=@userid
		select cast((@currentCash+@totalBonusAmount) as varchar(50))+ '#'+@returnString as 'result'
		return
	end
	select @currentCash as 'result'
GO
/****** Object:  StoredProcedure [dbo].[uspLogin]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspLogin]
	@userName varchar(100),
	@password varchar(255),
	@device varchar(30),
	@mobileVersion varchar(100),
	@screen varchar(30),
	@ip varchar(50),
	@partnerId int,
	@isMxh bit
as

	set nocount on
	
	Declare @userId bigInt
	
	declare @dtNow datetime
	declare @isOnline bit
	Declare @lastLogin datetime
	Declare @phoneNumber varchar(20)
	Declare @won int
	Declare @plays int		
	Declare @vipId int
	declare @experience int
	declare @levelId int
	declare @cash bigint
	declare @xeeng bigint
	Declare @avatarId int
	Declare @email varchar(256)
	Declare @dbPartnerId int
	Declare @isActive bit
	Declare @sex bit
	
	Declare @avatarFileId bigint
	Declare @biaFileId bigint
	
	Declare @timesQuay int
	Declare @status nvarchar(256)
	
	
				
	
	if not exists(select userId from WorkingUser where loginName = @userName and password = @password )
	begin
		
			SELECT [userId]
			  ,[name]
			  ,[password]
			  ,[phoneNumber]
			  ,[sessionId]
			  ,[WonPlaysNumber]
			  ,[cash]
			  ,[xeeng]
			  ,[PlaysNumber]
			  ,[level]
			  ,[experience]
			  ,[vipId]
			  ,[isOnline]
			  ,[avatarId]
			  ,[lastLogin]
			  ,[email]
			  ,[isActive]
			  ,[partnerId]
			  ,[avatarFileId]
			  ,[biaFileId]
			  ,[sex]
			  ,[timesQuay]
			  ,[status]
			  ,[mobileVersion]
			  ,[registerDate]
			  ,[fromDevice]
			  ,coalesce([refCode],0) as refcode
			  ,[gameVersion]
			  ,loginName
			  ,cmnd
			  ,xePhoneNumber
			FROM [WorkingUser]
			where loginName = @userName and password = @password
			
			return
	end
	
	select @dtNow = GETDATE()
	
	select @userId = userId, @isOnline = isOnline, @lastLogin = lastLogin
		from workingUser
	where loginName =  @userName and password = @password 
	
		
	update workingUser
		set isonline = 1, 
		mobileVersion = @mobileVersion
	where UserId = @userId	
	
	-- nhat ky dang nhap {
	DECLARE @oldLastLogin datetime
	SELECT @oldLastLogin = lastLogin FROM workinguser WHERE userId = @userid
    
    IF DATEDIFF(day, @oldLastLogin, GETDATE()) > 0 -- lan dang nhap cuoi khong phai ngay hom nay
    BEGIN
		-- chuyen lastLogin sang lastSecondLogin, cap nhat lastLogin
		UPDATE workinguser
		SET lastSecondLogin = @oldLastLogin,
			lastLogin = GETDATE()
		WHERE userId = @userid
    END
    ELSE -- lan dang nhap cuoi van trong ngay hom nay
    BEGIN
		-- cap nhat lastLogin
		UPDATE workinguser
		SET lastLogin = GETDATE()
		WHERE userId = @userid
    END
    -- } nhat ky dang nhap

	select userId, name, password, phoneNumber, wonPlaysNumber, cash, xeeng, playsNumber , level, experience, 0 as vipId, @isOnline as 'isonline', avatarId, @lastLogin as 'lastLogin', isActive, partnerId,  sex, isActive, avatarFileId, biaFileId, timesQuay, status, refCode, loginName, cmnd, xePhoneNumber, isLock, lockExpired, chatLockExpired
		from workingUser
	where UserId = @userId
GO
/****** Object:  StoredProcedure [dbo].[uspMonitorAuditUser]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspMonitorAuditUser]
	@sortBy int = 0
as
	declare @dt datetime
	select @dt = GETDATE()
	
	if @sortBy = 0
		select userId, name ,cash, VipId, partnerId, mobileVersion
			from WorkingUser
		where isonline =1 order by Cash desc
	else if @sortBy = 1
		select userId, name ,cash, VipId, partnerId, mobileVersion
			from WorkingUser
		where isonline =1 order by vipId desc
	else if @sortBy = 2
		select userId, name ,cash, VipId, partnerId, mobileVersion
			from WorkingUser
		where isonline =1 order by partnerId desc	
	else if @sortBy = 3
		select  partnerId, COUNT(userId) as 'online'
			from WorkingUser
		where isonline =1 
		group by partnerId
		order by online desc
		
	else if @sortBy = 4
		select userId, name ,cash, VipId, partnerId
			from WorkingUser
		where isonline =1 and mobileVersion is null 
			order by vipId desc, cash desc
GO
/****** Object:  StoredProcedure [dbo].[uspManualIncreaseMoney]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspManualIncreaseMoney]
as
	update WorkingUser
		set cash = 1000
	where cash < 1000
GO

/****** Object:  StoredProcedure [dbo].[uspManualActive]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspManualActive]
	@userId bigint
as
	update WorkingUser
		set isActive = 1
	where userId = @userId
	
	update WorkingUser
		set isActive = 1
	where UserID = @userId
	declare @newCash bigint
	
	select @newCash = cash
		from WorkingUser
	where userId = @userId
	
	if @newCash = 0 or @newCash is null
		select @newCash = 3000
	
	insert into RefreshCache(namespace, value, isRefresh, keyCache) 
		values ('userActive', @newCash, 0, @userId)
GO
/****** Object:  StoredProcedure [dbo].[uspReportGetAdvList]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspReportGetAdvList]
		@pageIndex int, 
		@pageSize int,
		@totalRec int output,
		@totalPage int output
	as
		set nocount on
		DECLARE @FirstRec int
		DECLARE @LastRec int
		SET @FirstRec = (@pageIndex - 1) * @pageSize + 1
		SET @LastRec = @pageIndex * @pageSize 
		CREATE TABLE #TemporaryTable (
			Row int IDENTITY(1,1) PRIMARY KEY,
			[advertisingId] [bigint] NULL,
			[content] [nvarchar](1256) NULL,
			[isDisplay] bit null,
			[partnerId] [int] NULL,
			[startDate] [datetime] NULL,
			[endDate] [datetime] NULL
 
		)
		INSERT INTO #TemporaryTable
		select [advertisingId],[content],[isDisplay] ,[partnerId],[startDate],[endDate]from advertising order by advertisingId desc

		SELECT @totalRec=count(Row)	FROM #TemporaryTable

		SET @totalPage = @totalRec/@pageSize
		IF @totalRec > @totalPage*@pageSize
		BEGIN
		   SET	@totalPage = @totalPage +1
		END

		select Row, [advertisingId],[content],[partnerId],[isDisplay],
			(CONVERT(VARCHAR(10), [startDate], 103) + ' ' + CONVERT(VARCHAR(8), [startDate], 108)) 'startDate',
			(CONVERT(VARCHAR(10), [endDate], 103) + ' ' + CONVERT(VARCHAR(8), [endDate], 108)) 'endDate'
			from #TemporaryTable WHERE (Row >= @FirstRec) AND (Row <= @LastRec)
		
		DROP TABLE #TemporaryTable
GO
/****** Object:  StoredProcedure [dbo].[uspReportGetAdvDetail]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspReportGetAdvDetail]
		@advId int
	as
		set nocount on
		select * from advertising where advertisingId=@advId
GO
/****** Object:  StoredProcedure [dbo].[uspReportDoLogin]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE pROCEDURE [dbo].[uspReportDoLogin]
	@userName varchar(256),
	@password varchar(256)
as
	SELECT TOP 1 ReportUser.*, xeReportUserRole.roleName
	FROM ReportUser, xeReportUserRole
	WHERE ReportUser.roleId = xeReportUserRole.id
	    AND name=@userName 
	    AND password=@password
GO
/****** Object:  StoredProcedure [dbo].[uspReportDoChangePassword]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create pROCEDURE [dbo].[uspReportDoChangePassword]
	@userName varchar(256),
	@password varchar(256)
as
	set nocount on;
	select userid 'result' from ReportUser where name=@userName;
	Update ReportUser set password=@password where name=@userName;
GO
/****** Object:  StoredProcedure [dbo].[uspReportDailyStat]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspReportDailyStat] 
	@fromDate Datetime = null,
	@toDate DateTime = null,
	@pageIndex int, 
	@pageSize int,
	@totalRec int output,
	@totalPage int output
as
	set nocount on	
	set nocount on
		DECLARE @FirstRec int
		DECLARE @LastRec int
		SET @FirstRec = (@pageIndex - 1) * @pageSize + 1
		SET @LastRec = @pageIndex * @pageSize 
   	if @toDate is null
		select @toDate = GETDATE()			
		CREATE TABLE #TemporaryTable (
			Row int IDENTITY(1,1) PRIMARY KEY,
    	[day] [date] NOT NULL,
    	[hour] [nchar](2) NOT NULL,
    	[downloadCount] [int] NULL,
    	[registCount] [int] NULL,
    	[loginCount] [int] NULL,
    	[ccu] [int] NULL,
    	[smsCount] [int] NULL,
    	[cardCount] [int] NULL,
    	[samCount] [int] NULL,
    	[samMoney] [int] NULL,
    	[altpCount] [int] NULL,
    	[altpMoney] [int] NULL,
    	[phomCount] [int] NULL,
    	[phomMoney] [int] NULL,
    	[tlmnCount] [int] NULL,
    	[tlmnMoney] [int] NULL,
    	[picachuCount] [int] NULL,
    	[picachuMoney] [int] NULL,
    	[liengCount] [int] NULL,
    	[liengMoney] [int] NULL,
    	[xitoCount] [int] NULL,
    	[xitoMoney] [int] NULL,
    	[bacayCount] [int] NULL,
    	[bacayMoney] [int] NULL,
    	[baucuaCount] [int] NULL,
    	[baucauMoney] [int] NULL,
    	[uniqueUserGameCount] [int] NULL,
    	[revenueMoney] [int] NULL,
    	[vascMoney] [int] NULL,
    	[feeMoney] [int] NULL
		)
    
		INSERT INTO #TemporaryTable
		SELECT [day]
          ,[hour]
          ,[downloadCount]
          ,[registCount]
          ,[loginCount]
          ,[ccu]
          ,[smsCount]
          ,[cardCount]
          ,[samCount]
          ,[samMoney]
          ,[altpCount]
          ,[altpMoney]
          ,[phomCount]
          ,[phomMoney]
          ,[tlmnCount]
          ,[tlmnMoney]
          ,[picachuCount]
          ,[picachuMoney]
          ,[liengCount]
          ,[liengMoney]
          ,[xitoCount]
          ,[xitoMoney]
          ,[bacayCount]
          ,[bacayMoney]
          ,[baucuaCount]
          ,[baucauMoney]
          ,[uniqueUserGameCount]
          ,[revenueMoney]
          ,[vascMoney]
          ,[feeMoney]
		FROM ReportDailyStat
		WHERE (@fromDate is null or (datediff(day, @fromDate, day)> -1 and datediff(day, day, @toDate)> -1 ))
		order by day desc, hour desc 
			
	  SELECT @totalRec=count(Row)	FROM #TemporaryTable
		SET @totalPage = @totalRec/@pageSize
		IF @totalRec > @totalPage*@pageSize
		BEGIN
		   SET	@totalPage = @totalPage +1
		END

		SELECT  Row 
          ,[day]
          ,[hour]
          ,[downloadCount]
          ,[registCount]
          ,[loginCount]
          ,[ccu]
          ,[smsCount]
          ,[cardCount]
          ,[samCount]
          ,[samMoney]
          ,[altpCount]
          ,[altpMoney]
          ,[phomCount]
          ,[phomMoney]
          ,[tlmnCount]
          ,[tlmnMoney]
          ,[picachuCount]
          ,[picachuMoney]
          ,[liengCount]
          ,[liengMoney]
          ,[xitoCount]
          ,[xitoMoney]
          ,[bacayCount]
          ,[bacayMoney]
          ,[baucuaCount]
          ,[baucauMoney]
          ,[uniqueUserGameCount]
          ,[revenueMoney]
          ,[vascMoney]
          ,[feeMoney]    
     from #TemporaryTable 
     WHERE (Row >= @FirstRec) AND (Row <= @LastRec)
		
		DROP TABLE #TemporaryTable
GO
/****** Object:  StoredProcedure [dbo].[uspSetStt]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspSetStt]
	@userId bigint,
	@stt nvarchar(256)
as
	set nocount on
	update WorkingUser 
		set status = @stt 
	where UserID = @userId
GO
/****** Object:  StoredProcedure [dbo].[uspSetSocialAvatar]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspSetSocialAvatar]
	@type int,
	@fileId bigint,
	@userId bigint
as
	set nocount on
	
	if @type = 0 --set avatar
	begin
		update WorkingUser
			set AvatarFileId = @fileId
		where UserID = @userId

	end
	else  -- set bia
	begin
		update WorkingUser
			set BiaFileId = @fileId
		where UserID = @userId
		
	end
GO
/****** Object:  StoredProcedure [dbo].[uspResetCacheInfo]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspResetCacheInfo]
as
	delete RefreshCache
GO
/****** Object:  StoredProcedure [dbo].[uspReseedMatch]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspReseedMatch]
as
	delete match
	DBCC CHECKIDENT (Match, RESEED, 1)
GO
/****** Object:  StoredProcedure [dbo].[uspReportRegisters]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspReportRegisters]
	@partnerId int,
	@fromDate Datetime = null,
	@toDate DateTime = null,
	@pageIndex int, 
	@pageSize int,
	@totalRec int output,
	@totalPage int output

as
	
	set nocount on	
	set nocount on
		DECLARE @FirstRec int
		DECLARE @LastRec int
		SET @FirstRec = (@pageIndex - 1) * @pageSize + 1
		SET @LastRec = @pageIndex * @pageSize 
	if @toDate is null
		select @toDate = GETDATE()	
		
			CREATE TABLE #TemporaryTable (
			Row int IDENTITY(1,1) PRIMARY KEY,
			[userId] [bigint]  NULL,
			[name] [nvarchar](100) NULL,
			[cash] [bigint] NULL,
			[registerDate] [datetime] NULL,
		)
		INSERT INTO #TemporaryTable
		select userId,name,cash,registerDate
			from WorkingUser
		where  (@partnerId = 0 or COALESCE(partnerId,0) = @partnerId)
			and (@fromDate is null or (datediff(day, @fromDate, registerDate)> -1 and datediff(day, registerDate, @toDate)> -1 ))
		order by registerDate desc
			
	SELECT @totalRec=count(Row)	FROM #TemporaryTable
		SET @totalPage = @totalRec/@pageSize
		IF @totalRec > @totalPage*@pageSize
		BEGIN
		   SET	@totalPage = @totalPage +1
		END

		select Row ,
			[userId],
			[name],
			[cash],
			(CONVERT(VARCHAR(10), [registerDate], 103) + ' ' + CONVERT(VARCHAR(8), [registerDate], 108)) as 'registerDate'  from #TemporaryTable WHERE (Row >= @FirstRec) AND (Row <= @LastRec)
		
		DROP TABLE #TemporaryTable
GO
/****** Object:  StoredProcedure [dbo].[uspReportGetMember]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspReportGetMember]
	@fromDate datetime=null,
	@toDate datetime=null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @toDate is null
		select @toDate= GETDATE()
		
    -- Insert statements for procedure here
	SELECT top 100 userId,name,COALESCE(phoneNumber,'') as phoneNumber,COALESCE(cash,0) as cash,COALESCE(registerDate,'') as registerDate,lastLogin
	From WorkingUser 
	where (@fromDate is null or (datediff(day, @fromDate, lastLogin)> -1 and datediff(day, lastLogin, @todate)> -1 )) ORDER BY lastLogin DESC
END
GO
/****** Object:  StoredProcedure [dbo].[uspReportGetHourlyStat]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspReportGetHourlyStat]
  @day date = null,
  @hour int = null ,
  @check int  = 0,
  @ccu int = 0,
  @regist int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    
    -- get data
    -- ccu
    SELECT @ccu = count(*) FROM WorkingUser WHERE DATEDIFF(DAY,lastLogin,@day) = 0 AND DatePart(hh, lastLogin) = @hour ;
    -- regist
    SELECT @regist = count(*) FROM WorkingUser WHERE DATEDIFF(DAY,registerDate,@day) = 0 AND DatePart(hh, registerDate) = @hour ;
    
    -- Insert statements for procedure here
	SELECT @check = count(*) From ReportDailyStat Where DATEDIFF(DAY, day, GETDATE()) = 0 AND hour = @hour;
	
	if (@check = 0) 
	    INSERT INTO ReportDailyStat (day, hour, ccu, registCount) VALUES (@day, @hour, @ccu, @regist);
	else 
	    UPDATE ReportDailyStat SET ccu = @ccu, registCount = @regist WHERE DATEDIFF(DAY,day,@day) = 0 AND hour = @hour;
	
END
GO
/****** Object:  StoredProcedure [dbo].[uspXECardStatistics]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXECardStatistics]
	-- Add the parameters for the stored procedure here
	@dateStart date,
	@dateEnd date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CONVERT(VARCHAR(10), reportDate, 103) AS reportDate, itemMoney, itemCount
	FROM xeChargingMoneyStatistics
	WHERE DATEDIFF(DAY, @dateStart, reportDate) >= 0
		AND DATEDIFF(DAY, reportDate, @dateEnd) >= 0
		AND itemType = 3
	ORDER BY reportDate ASC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXECanUserUploadAvatar]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXECanUserUploadAvatar]
	-- Add the parameters for the stored procedure here
	@userId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM xeUserAvatar WHERE userId = @userId)
	BEGIN
		DECLARE @isLock bit = 0
		SELECT @isLock = isLock FROM xeUserAvatar WHERE userId = @userId
		IF @isLock = 1
		BEGIN
			RETURN 0
		END
	END
	
	RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEBuyCashShopItem]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 07-Aug-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEBuyCashShopItem] 
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@itemCode nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @id bigint
	DECLARE @name nvarchar(50)
	DECLARE @description nvarchar(256)
	DECLARE @price bigint
	DECLARE @type nvarchar(10)
	DECLARE @isUsable bit
	
	-- Check if the item is available
	SELECT @id = id, @name = name, @description = description, @price = price, @type = type, @isUsable = isUsable
		FROM xeCashShop
	WHERE code like @itemCode AND isActive = 1

	IF (@id > 0)
	BEGIN
		-- Check if user has enough money
		DECLARE @money bigint
		IF (@type like 'Xeng')
		BEGIN
			SELECT @money = xeeng
				FROM workinguser
			WHERE userId = @userId
		END
		ELSE
		BEGIN
			SELECT @money = cash
				FROM workinguser
			WHERE userId = @userId
		END
		
		IF (@money < @price)
		BEGIN
			SELECT -2 AS result -- Not enough money
			RETURN
		END
		
		-- Update user's money
		IF (@type like 'Xeng')
		BEGIN
			UPDATE workinguser
				SET xeeng = xeeng - @price
			WHERE userId = @userId
		END
		ELSE
		BEGIN
			UPDATE workinguser
				SET cash = cash - @price
			WHERE userId = @userId
		END
		
		-- Update user's inventory
		DECLARE @itemId bigint
		
		SELECT @itemId = id
			FROM xeInventory
		WHERE userId = @userId AND itemCode = @itemCode
		
		IF (@itemId > 0)
		BEGIN
			UPDATE xeInventory
				SET quantity = quantity + 1
			WHERE userId = @userId AND itemCode = @itemCode
		END
		ELSE
		BEGIN
			INSERT INTO xeInventory
			(userId, itemCode, name, description, quantity, isActive, isUsable)
			VALUES
			(@userId, @itemCode, @name, @description, 1, 1, @isUsable)
		END
		
		-- Insert log
		INSERT INTO xeLogCashShopHistory
		(userId, itemCode, name, description, price, type, date)
		VALUES
		(@userId, @itemCode, @name, @description, @price, @type, GETDATE())
		
		SELECT 1 AS result -- Success
	END
	ELSE
	BEGIN
		SELECT -1 AS result -- Item not found
	END
END
GO
/****** Object:  StoredProcedure [dbo].[uspWebLogin]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspWebLogin]
	@userName varchar(100) = null,
	@password varchar(100) = null,
	@email varchar(100) = null,
	@sessionId varchar(100) = null,
	@partnerId int = 0
as
	set nocount on
	declare @userId bigint
	declare @cash float
	--Declare @userId bigInt
	

	begin
		--login by vip user
	
		if exists(select name from WorkingUser where name = @userName and password = @password)
		begin
			update WorkingUser
				set sessionId = @sessionId
			where name = @userName  and password = @password 
			
			select * from WorkingUser
				where name = @userName  and password = @password 
		end	
		
		
		
	end
GO
/****** Object:  StoredProcedure [dbo].[uspValidateChangeSetting]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspValidateChangeSetting]
	@roomId int,
	@money int,
	@userId int
as
	set nocount on
	Declare @minCash int
	Declare @userMoney int
	Declare @roomLevel int
	declare @TIMES int
	select @TIMES = 4
	
	select @userMoney = cash 
		from workingUser
	where UserID = @userId
	
	if @userMoney< @TIMES * @money
		return 1  -- not enough money to set 
	
	select @minCash = roomlevel.minCash
	from roomlevel, room 
	where room.id = @roomId
	    and roomlevel.levelId = room.levelId
	    and roomlevel.zoneId = room.ZoneId
			
	if @money>=  @minCash
		return 0  -- succfully set
	else 
		return 2  --- more money for this room
GO
/****** Object:  StoredProcedure [dbo].[uspUseGiftCodeUserName]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspUseGiftCodeUserName]
 @username varchar(30),
 @serial varchar(40)

as

 set nocount on
 
 DECLARE @deviceType int = 0 
 Declare @money int = 0
 Declare @userId int = 0
 Declare @dtNow datetime
 
 select @dtNow = GETDATE()
 
 select @money = bonusMoney from GiftCode where serial = @serial and usedDate is null
 
 if @money <= 0  
 return -2
 
 select @userId = userId from WorkingUser where name = @username
 if @userId <= 0  
 return -1
  
 if @money >0
 begin
  
  insert into AuditGiftCode(createdDate, userId, serial, deviceType, isSuccess)
   values(@dtNow, @userId, @serial, @deviceType, 1)
  
  update GiftCode set usedDate = @dtNow where serial = @serial  
  
  update WorkingUser set cash = cash + @money where userId = @userId
  
  insert into logvasc(UserID, DateTime, Money, Description, LogTypeId) 
  values(@userId, @dtNow, @money, 'gift code', 111);
          
  return @money
 end
 else
 begin
  insert into AuditGiftCode(createdDate, userId, serial, deviceType, isSuccess)
  values(@dtNow, @userId, @serial, @deviceType, 0)
  return 0   
 end
GO
/****** Object:  StoredProcedure [dbo].[uspUseGiftCode]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspUseGiftCode]
	@userId bigint,
	@serial varchar(40),
	@deviceType int
as

	set nocount on
	
	Declare @money int = 0
	Declare @dtNow datetime
	
	select @dtNow = GETDATE()
	
	select @money = bonusMoney from GiftCode where serial = @serial and usedDate is null
	
		
	if @money >0
	begin
		-- ***********************************************************
		-- * Kiem tra xem user da tung su dung loai Gift Code nay chua
		-- ***********************************************************
			DECLARE @usedGiftCodeType varchar(MAX)
			DECLARE @giftCodeType varchar(MAX)
			DECLARE @giftCodePattern varchar(MAX)
			
			SELECT @giftCodeType = [type]
			FROM giftcode
			WHERE serial = @serial
			
			SET @giftCodePattern = ';' + @giftCodeType + ';'
			
			IF NOT EXISTS (SELECT * FROM xeUsedGiftCodeType WHERE userId = @userId)
			BEGIN
				INSERT INTO xeUsedGiftCodeType 
				(userId, usedGiftCodeType) 
				VALUES
				(@userId, '')
			END
			
			SELECT @usedGiftCodeType = usedGiftCodeType
			FROM xeUsedGiftCodeType
			WHERE userId = @userId
			
			IF CHARINDEX(@giftCodePattern, @usedGiftCodeType) > 0
			BEGIN
				-- loai Gift Code nay da duoc su dung
				RETURN -1
			END 

		-- loai Gift Code nay chua duoc su dung --> them vao danh sach
		UPDATE xeUsedGiftCodeType
		SET usedGiftCodeType = usedGiftCodeType + @giftCodePattern
		WHERE userId = @userId
		
		
		-- ***********************************************************
		-- * Su dung Gift Code
		-- ***********************************************************
		insert into AuditGiftCode(createdDate, userId, serial, deviceType, isSuccess)
			values(@dtNow, @userId, @serial, @deviceType, 1)
		
		update GiftCode
			set usedDate = @dtNow
		where serial = @serial
		
		DECLARE @newCash bigint

		update WorkingUser 
			set cash = cash + @money
		where userId = @userId
		
		SELECT @newCash = cash
		FROM workinguser
		WHERE userId = @userId
		
		insert into logvasc(UserID, DateTime, Money, Description, LogTypeId) 
				values(@userId, @dtNow, @money, 'gift code', 111);
				
		insert into XELogMoneyHistory(userId, modifyDate, moneyAfter, moneyType, message, moneyDiff, reason, refId) 
				values(@userId, @dtNow, @newCash, 0, '', @money, 4, @serial);
	
		declare @bonusUserCash bigint				
		select @bonusUserCash = cash
			from WorkingUser
		where userId = @userId
		
		insert into RefreshCache(namespace, value, isRefresh, keyCache) 
			values ('user', @bonusUserCash, 0, @userId)
					
				
		return @money
	end
	else
	begin
		insert into AuditGiftCode(createdDate, userId, serial, deviceType, isSuccess)
			values(@dtNow, @userId, @serial, @deviceType, 0)
			
			return 0
			
	end
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateUserPassword]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspUpdateUserPassword]
	@userId bigint,
	@passwordMD5 varchar(32)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE workinguser
    SET password = @passwordMD5
    where userId = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateUserMoneyForTP]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[uspUpdateUserMoneyForTP] 
	@uid bigint, 
	@money int, 
	@description nvarchar(max), 
	@logTypeId int,
	@isWin bit,
	@experience int = 0,
	@achievementQuestion int

as
	set nocount on
	Declare @wonplayer int
	Declare @oldLevelId int
	Declare @newLevelId int
	Declare @bonusUpperLevel int
	Declare @cashBefore bigint
	Declare @ALTP_LOG_TYPE_ID int = 10003
	/*
	if @logTypeId = 10031 or @logTypeId = 10030 or @logTypeId = 10032
	begin
		select cash
			from workingUser
		where UserID = @uid
		return
	end
	*/
	
	if @isWin = 1
		select @wonplayer = 1
	else
		select @wonplayer = 0
	
	--update money for user uid
	select @cashBefore = cash
		from WorkingUser
	where userId = @uid
	
	update workingUser
		set cash = cash + @money, wonPlaysNumber = wonPlaysNumber + @wonplayer, PlaysNumber = PlaysNumber + 1
	where UserID = @uid
	
	--if @logTypeId = @ALTP_LOG_TYPE_ID
		--exec UpdateGameEventUserForALTP @uid, @achievementQuestion;
	--else
		insert into logvasc(UserID, DateTime, Money, Description, LogTypeId, isWin, experience, balanceAfter, achievementQuestion) 
				values(@uid, GETDATE(), @money, @description, @logTypeId, @isWin, @experience, @cashBefore, @achievementQuestion);
	
		insert into XELogMoneyHistory(userId,  modifyDate, moneyAfter, moneyType, message, moneyDiff, reason, refId) 
				values(@uid, GETDATE(), @cashBefore + @money, 0, @description, @money, @logTypeId, 0);
	
	--select cash
	--	from workingUser
	--where UserID = @uid

	
	DECLARE @oldCash bigint
	SELECT @oldCash = cash
	FROM workingUser
	WHERE UserID = @uid

	IF @oldCash < 0 -- bù âm
	BEGIN
		INSERT INTO XELogMoneyHistory
		(userId, moneyDiff, moneyAfter, moneyType, message, modifyDate, reason, refId) 
		VALUES
		(@uid, -@oldCash, 0, 0, '', GETDATE(), 14, 0)

		UPDATE workinguser
		SET cash = 0
		WHERE UserId = @uid
	END
	
	SELECT @oldCash AS cash
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateUserMoney]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[uspUpdateUserMoney] 
	@uid int, 
	@money int, 
	@description nvarchar(max), 
	@logTypeId int,
	@isWin bit,
	@experience int = 0

as
	set nocount on
	Declare @wonplayer int
	Declare @oldLevelId int
	Declare @newLevelId int
	Declare @bonusUpperLevel int
	Declare @cashBefore bigint
	
	if @isWin = 1
		select @wonplayer = 1
	else
		select @wonplayer = 0
	
	--update money for user uid
	select @cashBefore = cash
		from WorkingUser
	where userId = @uid
	
	
	update workingUser
		set cash = cash + @money, wonPlaysNumber = wonPlaysNumber + @wonplayer, PlaysNumber = PlaysNumber + 1
	where UserID = @uid
	
	insert into logvasc(UserID, DateTime, Money, Description, LogTypeId, isWin, experience, balanceAfter) 
				values(@uid, GETDATE(), @money, @description, @logTypeId, @isWin, @experience, @cashBefore);
				
	insert into XELogMoneyHistory(userId,  modifyDate, moneyAfter, moneyType, message, moneyDiff, reason, refId) 
				values(@uid, GETDATE(), @cashBefore + @money, 0, @description, @money, @logTypeId, 0);

	--select cash
	--	from workinguser
	--where UserID = @uid

	
	DECLARE @oldCash bigint
	SELECT @oldCash = cash
	FROM workingUser
	WHERE UserID = @uid

	IF @oldCash < 0 -- bù âm
	BEGIN
		INSERT INTO XELogMoneyHistory
		(userId, moneyDiff, moneyAfter, moneyType, message, modifyDate, reason, refId) 
		VALUES
		(@uid, -@oldCash, 0, 0, '', GETDATE(), 14, 0)

		UPDATE workinguser
		SET cash = 0
		WHERE UserId = @uid
	END
	
	SELECT @oldCash AS cash
GO
/****** Object:  StoredProcedure [dbo].[uspUpdateMxhUserInfo]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspUpdateMxhUserInfo]
	@userId bigint,
	@cityId int,
	@address nvarchar(256),
	@jobId int,
	@birthday DateTime,
	@hobby nvarchar(1000),
	@nickSkype varchar(100),
	@phoneNumber varchar(20),
	@nickYahoo varchar(100),
	@avatarFileId bigint,
	@stt nvarchar(256),
	@characterId int
	
as
	set nocount on
	
	if exists(select UserId from UserInfo where userId = @userId)
	
		update UserInfo
			set cityId = COALESCE(@cityId, cityId),
				address = COALESCE(@address, address),
				jobId = COALESCE(@jobId, jobId),
				birthday = COALESCE(@birthday, birthday),
				hobby = COALESCE(@hobby, hobby),
				nickSkype = COALESCE(@nickSkype, nickSkype),
				nickYahoo = COALESCE(@nickYahoo, nickYahoo),
				phoneNumber = coalesce(@phoneNumber, phoneNumber),
				characterId = coalesce(@characterId, characterId)
		where UserId = @userId
	else
    
    insert into UserInfo(cityId, address, jobId, birthday, hobby, nickSkype, nickYahoo, userId, characterId)
			values(@cityId, @address, @jobId, @birthday, @hobby, @nickSkype, @nickYahoo, @userId, @characterId)
	
	
	update WorkingUser
	set  avatarFileId = coalesce(@avatarFileId, avatarFileId), status = coalesce(@stt, status)
    where userId = @userId
GO
/****** Object:  StoredProcedure [dbo].[uspTransfer]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspTransfer]  
 @money bigint,  
 @s_uid bigint,  
 @d_name varchar(100),
 @times int,
 @tax int
     
as  
 set nocount on  
 DECLARE @cash float;  
 DECLARE @newCash float;  
 DECLARE @d_uid bigint;  
 DECLARE @time_trans datetime = getdate();  
 DECLARE @s_name varchar(100);
 DECLARE @total int;
 DECLARE @friend int;
 
 select @cash = cash, @s_name = name from workingUser where UserID = @s_uid  
   
 select @d_uid = userId from workingUser where name= @d_name
 
 select @total = SUM(Money) from logvasc where UserID = @s_uid And Convert(date,DateTime) = convert(date,GETDATE());
       
 if @d_uid is null  
 begin      
  return -1 -- invalid destination  
 end          
 
 if not exists(select userId from socialFriend 
		where (userId = @s_uid and friendId = @d_uid and confirmDate is not null) or (userId = @d_uid and friendId = @s_uid and confirmDate is not null))
 return -4
 
 select @newCash = @cash - @money         
 if @newCash < 0  
  return -2  --not enough money
 
 if @total > @times     
  return -3  -- over  
     
 declare @gotMoney float
 declare @newDestCash float

 select @gotMoney = @money - @money * @tax/100 
   
 UPDATE WorkingUser SET Cash=@newCash WHERE UserID=@s_uid;  
 
 UPDATE WorkingUser SET Cash=Cash+@gotMoney WHERE UserID=@d_uid;   
   
 select @newDestCash = cash from WorkingUser where UserID=@d_uid
    
 INSERT INTO logvasc(UserID, DateTime, Money, Description, LogTypeId, balanceAfter)   
  VALUES(@s_uid,@time_trans,@money,'transfer to ' + cast(@d_uid as nvarchar(19)),4, @newCash);  
   
 INSERT INTO logvasc(UserID, DateTime, Money, Description, LogTypeId, balanceAfter)   
  VALUES(@d_uid,@time_trans,@gotMoney,cast(@s_uid as nvarchar(19)) + ' transfered',5 , @newDestCash);  

 INSERT INTO mxhMessage(sourceId, destId, content, isRead, dateCreated, title)
  values (@s_uid, @d_uid, N'Bạn ' + @s_name + N' đã chuyển thành công cho bạn ' + cast(@gotMoney as nvarchar(10)) + ' Xu ', 0, GETDATE(), N'Chuyển tiền')
   
 return @d_uid;
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetReportUserLog]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetReportUserLog] 
	-- Add the parameters for the stored procedure here
	@page int = 1,
	@pageSize int = 20,
	@reportUserName nvarchar(128) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @start int = 1
	DECLARE @end int = 1

	SET @start = (@page - 1) * @pageSize + 1
	SET @end = @page * @pageSize

	IF @reportUserName IS NULL OR @reportUserName = ''
	BEGIN
		SELECT *
		FROM
		(
			SELECT xeReportUserLog.logDate, reportuser.name, xeReportUserLogAction.action, xeReportUserLog.refId,
				ROW_NUMBER() OVER (ORDER BY xeReportUserLog.logDate DESC) AS row
			FROM xeReportUserLog, reportuser, xeReportUserLogAction
			WHERE xeReportUserLog.userId = reportuser.Userid
				AND xeReportUserLog.actionId = xeReportUserLogAction.id
		) AS tmp
		WHERE row >= @start
			AND row <= @end
	END
	ELSE
	BEGIN
		SELECT *
		FROM
		(
			SELECT xeReportUserLog.logDate, reportuser.name, xeReportUserLogAction.action, xeReportUserLog.refId,
				ROW_NUMBER() OVER (ORDER BY xeReportUserLog.logDate DESC) AS row
			FROM xeReportUserLog, reportuser, xeReportUserLogAction
			WHERE reportuser.name = @reportUserName
				AND xeReportUserLog.userId = reportuser.Userid
				AND xeReportUserLog.actionId = xeReportUserLogAction.id
		) AS tmp
		WHERE row >= @start
			AND row <= @end
	END
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetRegisteredDeviceByDay]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetRegisteredDeviceByDay]
	-- Add the parameters for the stored procedure here
	@dateStart date,
	@dateEnd date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @days int = DATEDIFF(d, @dateStart, @dateEnd)
	DECLARE @currentDate date
	DECLARE @i int = 0
	DECLARE @count int = 0
	
	IF OBJECT_ID('tempdb..#registeredDevice') IS NOT NULL DROP TABLE #registeredDevice
	IF OBJECT_ID('tempdb..#registeredDevice') IS NOT NULL DROP TABLE #googlePlayCPI
	IF OBJECT_ID('tempdb..#registeredDevice') IS NOT NULL DROP TABLE #appota
	IF OBJECT_ID('tempdb..#registeredDevice') IS NOT NULL DROP TABLE #appStore
	IF OBJECT_ID('tempdb..#registeredDevice') IS NOT NULL DROP TABLE #googlePlay
	IF OBJECT_ID('tempdb..#registeredDevice') IS NOT NULL DROP TABLE #mobigate
	IF OBJECT_ID('tempdb..#registeredDevice') IS NOT NULL DROP TABLE #mobihub
	IF OBJECT_ID('tempdb..#registeredDevice') IS NOT NULL DROP TABLE #mobigateCPI
	IF OBJECT_ID('tempdb..#registeredDevice') IS NOT NULL DROP TABLE #google_PlayCPI
	
    -- Insert statements for procedure here
	SELECT MAX(registerDate) as registerDate, count(distinct(mobileVersion)) as DeviceCount
	INTO #registeredDevice
	FROM workingUser 
	WHERE DATEDIFF(DAY, @dateStart, registerDate) >= 0
	  AND DATEDIFF(DAY, registerDate, @dateEnd) >= 0
	GROUP BY DATEPART(dy, registerDate)
	  
	WHILE @i < @days
	BEGIN
		SET @currentDate = DATEADD(D, @i, @dateStart)
		SELECT @count = COUNT(*) FROM #registeredDevice
		WHERE DATEDIFF(DAY, registerDate, @currentDate) = 0
		
		IF @count = 0
		BEGIN
			INSERT INTO #registeredDevice VALUES (@currentDate, 0)
		END 
		SET @i = @i + 1
	END
	  
	SELECT MAX(registerDate) as registerDate, count(distinct(mobileVersion)) as DeviceCount
	INTO #googlePlayCPI
	FROM workingUser
	WHERE DATEDIFF(DAY, @dateStart, registerDate) >= 0
	  AND DATEDIFF(DAY, registerDate, @dateEnd) >= 0
	  AND partnerId = 1
	GROUP BY DATEPART(dy, registerDate)
	
	SELECT MAX(registerDate) as registerDate, count(distinct(mobileVersion)) as DeviceCount
	INTO #appota
	FROM workingUser
	WHERE DATEDIFF(DAY, @dateStart, registerDate) >= 0
	  AND DATEDIFF(DAY, registerDate, @dateEnd) >= 0
	  AND partnerId = 93
	GROUP BY DATEPART(dy, registerDate)
	    
	SELECT MAX(registerDate) as registerDate, count(distinct(mobileVersion)) as DeviceCount
	INTO #appStore
	FROM workingUser
	WHERE DATEDIFF(DAY, @dateStart, registerDate) >= 0
	  AND DATEDIFF(DAY, registerDate, @dateEnd) >= 0
	  AND partnerId = 94
	GROUP BY DATEPART(dy, registerDate)
	  
	SELECT MAX(registerDate) as registerDate, count(distinct(mobileVersion)) as DeviceCount
	INTO #googlePlay
	FROM workingUser
	WHERE DATEDIFF(DAY, @dateStart, registerDate) >= 0
	  AND DATEDIFF(DAY, registerDate, @dateEnd) >= 0
	  AND partnerId = 95
	GROUP BY DATEPART(dy, registerDate)
	  
	SELECT MAX(registerDate) as registerDate, count(distinct(mobileVersion)) as DeviceCount
	INTO #mobigate
	FROM workingUser
	WHERE DATEDIFF(DAY, @dateStart, registerDate) >= 0
	  AND DATEDIFF(DAY, registerDate, @dateEnd) >= 0
	  AND partnerId = 96
	  GROUP BY DATEPART(dy, registerDate)
	  
	SELECT MAX(registerDate) as registerDate, count(distinct(mobileVersion)) as DeviceCount
	INTO #mobihub
	FROM workingUser
	WHERE DATEDIFF(DAY, @dateStart, registerDate) >= 0
	  AND DATEDIFF(DAY, registerDate, @dateEnd) >= 0
	  AND partnerId = 97
	  GROUP BY DATEPART(dy, registerDate)
	
	SELECT MAX(registerDate) as registerDate, count(distinct(mobileVersion)) as DeviceCount
	INTO #mobigateCPI
	FROM workingUser
	WHERE DATEDIFF(DAY, @dateStart, registerDate) >= 0
	  AND DATEDIFF(DAY, registerDate, @dateEnd) >= 0
	  AND partnerId = 98
	  GROUP BY DATEPART(dy, registerDate)
	  
	SELECT MAX(registerDate) as registerDate, count(distinct(mobileVersion)) as DeviceCount
	INTO #google_PlayCPI
	FROM workingUser
	WHERE DATEDIFF(DAY, @dateStart, registerDate) >= 0
	  AND DATEDIFF(DAY, registerDate, @dateEnd) >= 0
	  AND partnerId = 99
	  GROUP BY DATEPART(dy, registerDate)
	  
	SELECT #registeredDevice.registerDate as registerDate, #registeredDevice.DeviceCount as registerDevice,
		   #googlePlayCPI.DeviceCount as GooglePlayCPI, 
		   #appota.DeviceCount as Appota, 
		   #appStore.DeviceCount as AppStore,
		   #googlePlay.DeviceCount as GooglePlay,
		   #mobigate.DeviceCount as Mobigate,
		   #mobihub.DeviceCount as Mobihub,
		   #mobigateCPI.DeviceCount as MobigateCPI,
		   #google_PlayCPI.DeviceCount as [Google_PlayCPI]
	FROM #registeredDevice 
	LEFT JOIN #googlePlayCPI
		ON DATEPART(dy, #registeredDevice.registerDate) = DATEPART(dy, #googlePlayCPI.registerDate)
	LEFT JOIN #appota
		ON DATEPART(dy, #registeredDevice.registerDate) = DATEPART(dy, #appota.registerDate)
	LEFT JOIN #appStore
		ON DATEPART(dy, #registeredDevice.registerDate) = DATEPART(dy, #appStore.registerDate)
	LEFT JOIN #googlePlay
		ON DATEPART(dy, #registeredDevice.registerDate) = DATEPART(dy, #googlePlay.registerDate)
	LEFT JOIN #mobigate
		ON DATEPART(dy, #registeredDevice.registerDate) = DATEPART(dy, #mobigate.registerDate)
	LEFT JOIN #mobihub
		ON DATEPART(dy, #registeredDevice.registerDate) = DATEPART(dy, #mobihub.registerDate)
	LEFT JOIN #mobigateCPI
		ON DATEPART(dy, #registeredDevice.registerDate) = DATEPART(dy, #mobigateCPI.registerDate)
	LEFT JOIN #google_PlayCPI
		ON DATEPART(dy, #registeredDevice.registerDate) = DATEPART(dy, #google_PlayCPI.registerDate)
	ORDER BY registerDate ASC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetPrivateMessage]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetPrivateMessage] 
	@id bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM xePrivateMessage
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetPredefinedTableNames]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		tunghx
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetPredefinedTableNames] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select table_name from xePredefinedTableNames;
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetPheDuong]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetPheDuong]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM(moneyDiff) AS phe,
		   message AS gameMessage,
		   MIN(modifyDate) AS gameStartDate
	FROM
		(SELECT *
		 FROM XELogMoneyHistory
		 WHERE DATEDIFF(DAY, modifyDate, GETDATE()) < 10 -- chỉ xét những biến động số dư trong 10 ngày gần nhất (loại bỏ trường hợp reset id dẫn đến một bàn chơi có thể chứa cả những biến động số dư từ rất lâu trong quá khứ

			 AND reason > 10000 -- chỉ xét biến động số dư của game
	) tblLast10Days
	GROUP BY message HAVING MAX(DATEDIFF(DAY, modifyDate, GETDATE())) < 7 -- chỉ xét những bàn chơi bắt đầu từ 7 ngày trở lại đây
	AND SUM(moneyDiff) > 0 -- chỉ xét phế dương
	ORDER BY MIN(modifyDate) DESC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetNumOfUserOnlineByHour]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetNumOfUserOnlineByHour]
	-- Add the parameters for the stored procedure here
	@date datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT DATEADD(HOUR, -hourDiff, GETDATE()) AS dateReport, * FROM
	(
		SELECT TOP 168 DATEDIFF(HOUR, dateReport, GETDATE()) AS hourDiff, ISNULL(AVG(num), 0) AS num, 
			ISNULL(AVG(numTienLen), 0) AS numTienLen, ISNULL(AVG(numPhom), 0) AS numPhom, 
			ISNULL(AVG(numBaCay), 0) AS numBaCay, ISNULL(AVG(numBauCua), 0) AS numBauCua, 
			ISNULL(AVG(numALTP), 0) AS numALTP, ISNULL(AVG(numPikachu), 0) AS numPikachu -- 168 = 24 x 7
		FROM xeNumOfUserOnline
		WHERE DATEDIFF(SECOND, dateReport, @date) >= 0
		GROUP BY DATEDIFF(HOUR, dateReport, GETDATE())
		ORDER BY DATEDIFF(HOUR, dateReport, GETDATE()) ASC
	) tmp
	ORDER BY dateReport ASC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetNumOfUserOnlineByDay]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetNumOfUserOnlineByDay]
	-- Add the parameters for the stored procedure here
	@date datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT DATEADD(DAY, -dayDiff, GETDATE()) AS dateReport, * FROM
	(
		SELECT TOP 30 DATEDIFF(DAY, dateReport, GETDATE()) AS dayDiff, AVG(num) AS num, 
			AVG(numTienLen) AS numTienLen, AVG(numPhom) AS numPhom, AVG(numBaCay) AS numBaCay,
			AVG(numBauCua) AS numBauCua, AVG(numALTP) AS numALTP, AVG(numPikachu) AS numPikachu
		FROM xeNumOfUserOnline
		WHERE DATEDIFF(SECOND, dateReport, @date) >= 0
		GROUP BY DATEDIFF(DAY, dateReport, GETDATE())
		ORDER BY DATEDIFF(DAY, dateReport, GETDATE()) ASC
	) tmp
	ORDER BY dateReport ASC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetNumOfUserOnlineBy5Minutes]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetNumOfUserOnlineBy5Minutes]
	-- Add the parameters for the stored procedure here
	@date datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT * FROM
	(
		SELECT TOP 288 * -- 288 = 12 * 24
		FROM xeNumOfUserOnline
		WHERE DATEDIFF(SECOND, dateReport, @date) >= 0
		ORDER BY id DESC
	) tmp
	ORDER BY dateReport ASC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetNumOfUserDeviceByMonth]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetNumOfUserDeviceByMonth]
	-- Add the parameters for the stored procedure here
	@month date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- nếu đã có dữ liệu thì lấy ngay
	IF EXISTS(SELECT * FROM xeNumOfUserDeviceByOSMonthly WHERE DATEDIFF(MONTH, reportDate, @month) = 0)
	BEGIN
		SELECT os, num
		FROM xeNumOfUserDeviceByOSMonthly
		WHERE DATEDIFF(MONTH, reportDate, @month) = 0
	END
	ELSE -- nếu chưa có thì lấy thủ công
	BEGIN
		SELECT (osName + ' ' + osVersion) AS os, COUNT(osMAC) AS num
		FROM xeUserDevice
		WHERE DATEDIFF(MONTH, lastLogin, GETDATE()) = 0
		GROUP BY (osName + ' ' + osVersion)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetNumOfUserDeviceByDay]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetNumOfUserDeviceByDay]
	-- Add the parameters for the stored procedure here
	@month date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- /!\ CẢNH BÁO: Hàm PIVOT tương đối hại não, nếu không hiểu được thì không nên cố hiểu [thanhnvt]

	DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
	DECLARE @ColumnName AS NVARCHAR(MAX)


	SELECT @ColumnName = ISNULL(@ColumnName + ',','') 
			+ QUOTENAME(os)
	FROM (SELECT DISTINCT os FROM xeNumOfUserDeviceByOS) AS tbl1


	SET @DynamicPivotQuery = 
		N'
	SELECT *
	FROM 
	(
		SELECT reportDate, os, num
		FROM xeNumOfUserDeviceByOS
		WHERE DATEDIFF(MONTH, reportDate, @month) = 0
	) AS tbl1
	PIVOT
	(
		SUM(num)
		FOR os IN (' + @ColumnName + ')
	) AS tbl2'

	EXEC sp_executesql @DynamicPivotQuery,
		N'@month date',
		@month = @month
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetNumOfUniquePayerInRange]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetNumOfUniquePayerInRange]
	-- Add the parameters for the stored procedure here
	@dateStart date,
	@dateEnd date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM xeChargingMonthlyStatistics
	WHERE DATEDIFF(DY, @dateStart, reportDate) >= 0
	AND	  DATEDIFF(DY, @dateEnd, reportDate) <=0
	ORDER BY reportDate ASC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetNumOfUniquePayerByDay]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetNumOfUniquePayerByDay]
	-- Add the parameters for the stored procedure here
	@month datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM xeChargingMonthlyStatistics
	WHERE DATEDIFF(MONTH, @month, reportDate) = 0
	ORDER BY reportDate ASC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetNumOfUniquePayer]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetNumOfUniquePayer]
	-- Add the parameters for the stored procedure here
	@month datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAX(numOfPayer) AS numOfPayer
	FROM xeChargingMonthlyStatistics
	WHERE DATEDIFF(MONTH, @month, reportDate) = 0
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetNumOfReportUserLog]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetNumOfReportUserLog] 
	-- Add the parameters for the stored procedure here
	@reportUserName nvarchar(128) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @numOfLog int = 0

	IF @reportUserName IS NULL OR @reportUserName = ''
	BEGIN
		SELECT @numOfLog = COUNT(*)
		FROM
		(
			SELECT xeReportUserLog.logDate, reportuser.name, xeReportUserLogAction.action, xeReportUserLog.refId
			FROM xeReportUserLog, reportuser, xeReportUserLogAction
			WHERE xeReportUserLog.userId = reportuser.Userid
				AND xeReportUserLog.actionId = xeReportUserLogAction.id
		) AS tmp
	END
	ELSE
	BEGIN
		SELECT @numOfLog = COUNT(*)
		FROM
		(
			SELECT xeReportUserLog.logDate, reportuser.name, xeReportUserLogAction.action, xeReportUserLog.refId,
				ROW_NUMBER() OVER (ORDER BY xeReportUserLog.id ASC) AS row
			FROM xeReportUserLog, reportuser, xeReportUserLogAction
			WHERE reportuser.name = @reportUserName
				AND xeReportUserLog.userId = reportuser.Userid
				AND xeReportUserLog.actionId = xeReportUserLogAction.id
		) AS tmp
	END

	RETURN @numOfLog
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetNumOfReceivedFreeGold]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetNumOfReceivedFreeGold]
	-- Add the parameters for the stored procedure here
	@userId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT receivedTimes
	FROM xeFreeGoldByDay
	WHERE userId = @userId
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEInsertPrivateMessage]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEInsertPrivateMessage] 
	@fromUserId bigint,
	@toUserId bigint,
	@title ntext,
	@content ntext
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO xePrivateMessage(fromUserId, toUserId, title, content, dateSent) 
    VALUES (@fromUserId, @toUserId, @title, @content, GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEInsertNumOfUserOnline]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEInsertNumOfUserOnline]
	-- Add the parameters for the stored procedure here
	@num int,
	@numTienLen int = 0,
	@numPhom int = 0,
	@numBaCay int = 0,
	@numBauCua int = 0,
	@numALTP int = 0,
	@numPikachu int = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @numOnlineByDB int
    SELECT @numOnlineByDB = COUNT(*)
    FROM workinguser
    WHERE isOnline = 1
    
	INSERT INTO xeNumOfUserOnline
	(dateReport, num, numByDB, numTienLen, numPhom, numBaCay, numBauCua, numALTP, numPikachu)
	VALUES
	(GETDATE(), @num, @numOnlineByDB, @numTienLen, @numPhom, @numBaCay, @numBauCua, @numALTP, @numPikachu)
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEInsertNews]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEInsertNews] 
	@title nvarchar(max),
	@htmlContent nvarchar(max),
	@uid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO xeNews(title, htmlContent, dateCreated, dateModified, userCreated, userModified) 
    VALUES (@title, @htmlContent, GETDATE(), GETDATE(), @uid, @uid);
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEInsertInventoryOfUser]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 31-Jul-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEInsertInventoryOfUser]
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@itemCode nvarchar(10),
	@eventId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @id bigint
	DECLARE @quantity int
	DECLARE @name nvarchar(50)
	DECLARE @description nvarchar(256)
	DECLARE @isUsable bit
	
    -- Check if item is available
    SELECT @id = id, @quantity = quantity, @name = name, @description = description, @isUsable = isUsable, @eventId = eventId
		FROM xeEventItems
	WHERE code = @itemCode AND eventId = @eventId AND isActive = 1 AND (quantity = -1 OR quantity > 0)
	
	IF (@id > 0)
	BEGIN
		-- Insert/Update inventory of user
		DECLARE @itemId bigint
		
		SELECT @itemId = id
			FROM xeInventory
		WHERE userId = @userId AND itemCode = @itemCode
		
		IF (@itemId > 0)
		BEGIN
			UPDATE xeInventory
				SET quantity = quantity + 1
			WHERE userId = @userId AND itemCode = @itemCode
		END
		ELSE
		BEGIN
			INSERT INTO xeInventory
			(userId, itemCode, name, description, quantity, isActive, isUsable)
			VALUES
			(@userId, @itemCode, @name, @description, 1, 1, @isUsable)
		END
	
		-- Insert log
		INSERT INTO xeLogJoinItemHistory
		(userId, eventId, itemCode, message, time)
		VALUES
		(@userId, @eventId, @itemCode, N'Nhận được 1 ' + @name, GETDATE())
	
		-- Update event items system
		IF (@quantity > 0)
		BEGIN
			UPDATE xeEventItems
				SET quantity = quantity - 1
			WHERE code = @itemCode
		END
		
		SELECT 1 AS result
	END
	ELSE
	BEGIN
		SELECT -1 AS result
	END
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEInsertExchangeLog]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEInsertExchangeLog] 
	@uid bigint,
	@fromValue bigint,
	@fromType nvarchar(50),
	@toValue bigint,
	@toType nvarchar(50),
	@message nvarchar(max),
	@fromValueBefore bigint,
	@fromValueAfter bigint,
	@toValueBefore bigint,
	@toValueAfter bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO xeLogExchangeMoney(userId, fromValue, fromType, toValue, toType, message, exchangeDate,
				fromValueBefore, fromValueAfter, toValueBefore, toValueAfter) 
    VALUES (@uid, @fromValue, @fromType, @toValue, @toType, @message, GETDATE(),
				@fromValueBefore, @fromValueAfter, @toValueBefore, @toValueAfter);
				
	IF @toValueAfter != @toValueBefore
	BEGIN
		INSERT INTO XELogMoneyHistory
		(userId, moneyBefore, moneyAfter, moneyDiff, moneyType, message, reason, modifyDate)
		VALUES
		(@uid, @fromValueBefore, @fromValueAfter, @fromValueAfter - @fromValueBefore, 1, '', 1, GETDATE())
	    
		INSERT INTO XELogMoneyHistory
		(userId, moneyBefore, moneyAfter, moneyDiff, moneyType, message, reason, modifyDate)
		VALUES
		(@uid, @toValueBefore, @toValueAfter, @toValueAfter - @toValueBefore, 0, '', 1, GETDATE())
		
		INSERT INTO logvasc
		(userId, DateTime, money, Description, LogTypeId, moneyType)
		VALUES
		(@uid, GETDATE(), @fromValueAfter - @fromValueBefore, 'Exchange', 1338, 1)
		
		INSERT INTO logvasc
		(userId, DateTime, money, Description, LogTypeId, moneyType)
		VALUES
		(@uid, GETDATE(), @toValueAfter - @toValueBefore, 'Exchange', 1338, 0)
		
    END
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEInsertAppotaTransaction]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEInsertAppotaTransaction]
	@userId bigint,
	@transactionId nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- Insert statements for procedure here
	INSERT INTO [dbo].[XEAppotaTransaction] (userId, transactionId, paymentTime)
	VALUES (@userId, @transactionId, GETDATE());
	
	SELECT @@ROWCOUNT AS result;
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEInsertAdvertising]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEInsertAdvertising]
	-- Add the parameters for the stored procedure here
	@content nvarchar(256),
	@createdDate datetime,
	@webUserId bigint,
	@isDisplay bit,
	@partnerId int,
	@startDate datetime,
	@endDate datetime,
	@reportUserId int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO advertising 
	VALUES 
	(@content, @createdDate, @webUserId, @isDisplay, @partnerId, @startDate, @endDate)

	INSERT INTO xeReportUserLog
	(userId, actionId, refId, logDate)
	VALUES
	(@reportUserId, 8, (SELECT SCOPE_IDENTITY()), GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGuestLogin]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ThangTD
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGuestLogin] 
	@deviceUid varchar(100),
	@password varchar(255),
	@partnerId int,
	@refCode int,
	@mobileVersion varchar(100),
	@registerTime int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Declare @userId bigInt
	declare @dtNow datetime
	declare @isOnline bit
	Declare @lastLogin datetime
	Declare @phoneNumber varchar(20)
	Declare @won int
	Declare @plays int		
	Declare @vipId int
	declare @experience int
	declare @levelId int
	declare @cash bigint
	Declare @avatarId int
	Declare @email varchar(256)
	Declare @dbPartnerId int
	Declare @isActive bit
	Declare @sex bit
	
	Declare @avatarFileId bigint
	Declare @biaFileId bigint
	Declare @timesQuay int
	Declare @status nvarchar(256)
	
	Declare @userName varchar(100)
	Declare @guestId bigint = 0
	DECLARE @newGuest int = 0
	
	select @guestId = max(guestId) from guest where deviceUid = @deviceUid and registedFlag = 0
	
	If (@guestId is null OR @guestId = 0 )
	begin
	 Insert into guest (deviceUid, insertDate, registedFlag) values (@deviceUid, GETDATE(), 0)
	 select @guestId = @@IDENTITY
	
	end
	
	set @userName = 'khach' + CONVERT(varchar, @guestId) 
		
	if not exists(select userId from WorkingUser where name = @userName)
	begin
		IF @registerTime = 0
		BEGIN
			SET @cash = 30000
		END
		ELSE
		BEGIN
			SET @cash = 20000
		END
	
		INSERT INTO WorkingUser(Name,Password, partnerId, registerDate, fromDevice, refCode, cash, mobileVersion) 
			VALUES(@userName,@Password, @partnerId, GETDATE(), 'mobile', @refCode, @cash, @mobileVersion);
			
		select @userId = @@IDENTITY
		INSERT INTO XELogMoneyHistory
		(userId, modifyDate, moneyDiff, moneyAfter, moneyType, reason, message)
		VALUES 
		(@userId, GETDATE(), @cash, @cash, 0, 13, '')
	end
	
	-- nhat ky dang nhap {
	DECLARE @oldLastLogin datetime
	SELECT @oldLastLogin = lastLogin FROM workinguser WHERE name = @userName
    
    IF DATEDIFF(day, @oldLastLogin, GETDATE()) > 0 -- lan dang nhap cuoi khong phai ngay hom nay
    BEGIN
		-- chuyen lastLogin sang lastSecondLogin, cap nhat lastLogin
		UPDATE workinguser
		SET lastSecondLogin = @oldLastLogin,
			lastLogin = GETDATE()
		WHERE name = @userName
    END
    ELSE -- lan dang nhap cuoi van trong ngay hom nay
    BEGIN
		-- cap nhat lastLogin
		UPDATE workinguser
		SET lastLogin = GETDATE()
		WHERE name = @userName
    END
    -- } nhat ky dang nhap
    
	update WorkingUser set isonline = 1, mobileVersion = @mobileVersion, partnerId = @partnerId where name =  @userName 

	select userId, name, password, phoneNumber, wonPlaysNumber, cash, playsNumber , level, experience, 0 as vipId, @isOnline as 'isonline', avatarId, @lastLogin as 'lastLogin', isActive, partnerId,  sex, isActive, avatarFileId, biaFileId, timesQuay, status, refCode, xeeng, isLock, lockExpired, chatLockExpired
	from workingUser
	where name =  @userName 
	
    -- Insert statements for procedure here
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetXeengOutByDay]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetXeengOutByDay]
	-- Add the parameters for the stored procedure here
	@reason int,
	@dateStart date,
	@dateEnd date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM(moneyDiff) AS money, CONVERT(VARCHAR(10), modifyDate, 103) AS dayString
	FROM XELogMoneyHistory 
	WHERE reason = @reason
		AND moneyType = 1
		AND moneyDiff < 0
		AND modifyDate >= @dateStart
		AND modifyDate <= @dateEnd
	GROUP BY CONVERT(VARCHAR(10), modifyDate, 103)
	ORDER BY CONVERT(VARCHAR(10), modifyDate, 103) DESC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetXeengInByDay]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetXeengInByDay]
	-- Add the parameters for the stored procedure here
	@reason int,
	@dateStart date,
	@dateEnd date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUM(moneyDiff) AS money, CONVERT(VARCHAR(10), modifyDate, 103) AS dayString
	FROM XELogMoneyHistory 
	WHERE reason = @reason
		AND moneyType = 1
		AND moneyDiff > 0
		AND modifyDate >= @dateStart
		AND modifyDate <= @dateEnd
	GROUP BY CONVERT(VARCHAR(10), modifyDate, 103)
	ORDER BY CONVERT(VARCHAR(10), modifyDate, 103) DESC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetUserLevels]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetUserLevels]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT *
    FROM xeUserLevel
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetUserByRegistrationDate]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetUserByRegistrationDate]
	-- Add the parameters for the stored procedure here
	@timeStart datetime,
	@timeEnd datetime,
	@partnerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT userId, loginName, refCode, registerDate
    FROM workinguser
    WHERE DATEDIFF(SECOND, @timeStart, registerDate) >= 0
        AND DATEDIFF(SECOND, registerDate, @timeEnd) >= 0
        AND ((partnerId = @partnerId AND @partnerId != 96) 
            OR (partnerId = @partnerId AND @partnerId = 96 AND refCode NOT IN (0, 4, 8)))
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetTransaction]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetTransaction]
	@userId bigint,
	@transactionId nvarchar(300),
	@productId nvarchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * 
	FROM [dbo].[XEGoogleTransaction] 
	WHERE userId = @userId AND transactionId = @transactionId AND productId = @productId;
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetShopDailyStatistics]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetShopDailyStatistics]
	-- Add the parameters for the stored procedure here
	@dateStart date,
	@dateEnd date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CONVERT(VARCHAR(10), reportDate, 103) AS reportDate, itemId, itemPrice, itemCount
	FROM xeShopDailyStatistics
	WHERE DATEDIFF(DAY, @dateStart, reportDate) >= 0
		AND DATEDIFF(DAY, reportDate, @dateEnd) >= 0
	ORDER BY xeShopDailyStatistics.reportDate ASC, itemId ASC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetRouletteLog]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 12-Sep-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetRouletteLog] 
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 50 us.name, his.round, his.value, his.priceType, his.date
	FROM xeLogRouletteHistory his, workinguser us
	WHERE his.price > 0 AND his.userId = us.userId
	ORDER BY his.date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetRouletteInfo]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 03-Sep-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetRouletteInfo]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM xeRoulette where isActive = 1
END
GO
/****** Object:  StoredProcedure [dbo].[uspRegUser]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspRegUser]
	@loginName varchar(100),
    @Password varchar(255),
    @Sex tinyint, 
    @partnerId int,
    @introduceId bigint,
    @phone nvarchar(100),
    @isMxh bit,
    @refCode varchar(20),
    @registerTime int,
    @deviceUid varchar(100),
    @username nvarchar(100),
    @cmnd varchar(32),
    @xePhoneNumber varchar(32)
as
	
	set nocount on
	declare @userId bigint = 0
	declare @cash int = 0
	declare @fromDevice varchar(20)
	declare @dtNow datetime
	declare @guestId bigint = 0
	declare @guestName varchar(20)
			
	if exists (select name from WorkingUser where loginName = @loginName or name = @username)
    return -1
    
    select @guestId = max(guestId) from guest where deviceUid = @deviceUid and registedFlag = 0		
	
	if(@guestId >0)
	begin
	     set @guestName = 'khach' + CONVERT(varchar, @guestId) 
	     select @userId = userId from workinguser where name = @guestName
	     if(@userId > 0)
	     begin
			Update guest set registedFlag = 1 where guestId = @guestId
			Update workinguser set loginName = @loginName, name = @username, password = @Password, sex = @Sex, xePhoneNumber = @xePhoneNumber, cmnd = @cmnd, guestToUserDate = GETDATE() where userId = @userId					
			return @userId
	     end
	end
	
	select @fromDevice = 'mobile'
	select @dtNow = GETDATE()
	
	IF @registerTime = 0
	BEGIN
		SET @cash = 30000
	END
	ELSE
	BEGIN
		SET @cash = 20000
	END
		
	INSERT INTO WorkingUser(loginName,Password, Sex, PhoneNumber, partnerId, registerDate, fromDevice, refCode, cash, Name, cmnd, xePhoneNumber) 
		VALUES(@loginName,@Password, @Sex, @phone, @partnerId, @dtNow, @fromDevice, @refCode, @cash, @username, @cmnd, @xePhoneNumber);
	select @userId = @@IDENTITY
	
	INSERT INTO XELogMoneyHistory
	(userId, modifyDate, moneyDiff, moneyAfter, moneyType, reason, message)
	VALUES 
	(@userId, GETDATE(), @cash, @cash, 0, 13, '')

	return @userId
GO
/****** Object:  StoredProcedure [dbo].[uspRegGameShow]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspRegGameShow]
	@userName varchar(100),
    @Password varchar(255),
    @Sex tinyint, 
    @partnerId int,
    @chkPartnerSide bit,
    @introduceId bigint,
    @phone nvarchar(100),
    @isMxh bit,
    @refCode varchar(20)
    
as
	
	set nocount on
	declare @userId bigint
	declare @cash int
	declare @fromDevice varchar(20)
	Declare @dtNow datetime
	Declare @lotusPartnerId int = 75
	
	
	
	if exists (select name 
					from WorkingUser
					where phoneNumber = @phone)
	
		return -1
		
	
	select @fromDevice = 'mobile'
	select @dtNow = GETDATE()
	
			
		
	INSERT INTO WorkingUser(Name,Password, Sex, PhoneNumber, partnerId, registerDate, fromDevice, refCode, cash) 
		VALUES(@userName,@Password, @Sex, @phone, @partnerId, @dtNow, @fromDevice, @refCode, 3000);
	select @userId = @@IDENTITY
	
	
	return @userId
GO
/****** Object:  StoredProcedure [dbo].[uspReadMessage]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspReadMessage]
	@messageId bigint
as
	set nocount on
	update mxhMessage
		set isRead = 1
	where messageId = @messageId
	
	select content	
		from mxhMessage
	where messageId = @messageId
GO
/****** Object:  StoredProcedure [dbo].[uspPrepProcCardRefCode]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspPrepProcCardRefCode]
	@userName nvarchar(100),
	@partnerID varchar(40),
	@cardId nvarchar(100),
	@cardcode nvarchar(100),
	@serviceId nvarchar(100),
	@providerName nvarchar(100),
	@userId bigint,
	@refCode varchar(20)
as
	declare @statusId int,
			@INPROGRESS_STATUS int = 1,
			@INVALID_USER_NAME_STATUS int = 14,
			@NOT_EXISTS_CARD_STATUS int = 16,
			@CARD_IS_USE_STATUS int = 15,
			@PROVIDER_BUSY int = 84,
			@BLOCK_USER int = 17,
			@CARD_CODE_DUPLICATE int = 18,
			@timesIncorrectCard int = 0,
			@dtNow datetime
	set nocount on
	select @dtNow = GETDATE()
	
	
			
	select @statusId = @INPROGRESS_STATUS --in progress status
	
	if not exists (select name from [WorkingUser] where Name = @userName OR loginName = @userName OR userId = @userId)
		select @statusId = @INVALID_USER_NAME_STATUS -- invalid userName
	else
	begin
		create table #tmpStatus
		(
			statusId int
		)
		
		
		insert into #tmpStatus
			select top(3) statusId
				from CardTxn
			where DATEDIFF(DAY, receiveDate,@dtNow)> -1 
			order by receiveDate desc
			
		select @timesIncorrectCard = COUNT(statusId)
			from #tmpStatus
		where statusId = @NOT_EXISTS_CARD_STATUS
		
		delete #tmpStatus
		
		if @timesIncorrectCard> 2
			select @statusId = @BLOCK_USER
		else
		begin
			if exists(select cardCode from CardTxn 
						where cardCode = @cardcode and cardId = @cardId and serviceId= @serviceId)
				select @statusId = @CARD_CODE_DUPLICATE
		end
		
	end
	
	--update txn status
	
	insert into CardTxn(cardId, cardCode, parnterId, userName, receiveDate, statusId, serviceId, providerName, userId, refCode) 
		values(@cardId, @cardcode, @partnerID, @userName, @dtNow, @statusId, @serviceId, @providerName, @userId, @refCode)
		
	select * 
		from CardTxn
	where CardTxnId = @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[uspNotMinus]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspNotMinus]
as
	DECLARE @time datetime = GETDATE()
	
	INSERT INTO XELogMoneyHistory
	(userId, moneyDiff, moneyAfter, moneyType, message, modifyDate, reason, refId) 
	SELECT userId, -cash, 0, 0, '', @time, 14, 0
	FROM workinguser
	WHERE cash < 0
	 
	update workingUser 
		set Cash = 0 
	where Cash< 0
GO
/****** Object:  StoredProcedure [dbo].[uspXECheckOvernight]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXECheckOvernight]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE workinguser 
	SET firstOvernight = GETDATE()
	WHERE firstOvernight is null 
	    AND isOnline = 1
END
GO
/****** Object:  Table [dbo].[logtype]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[logtype](
	[LogTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[serviceCode] [varchar](60) NULL,
	[money] [int] NULL,
	[CommandCode] [varchar](100) NULL,
	[isSMS] [bit] NULL,
	[isActive] [bit] NULL,
	[isCard] [bit] NULL,
	[isKM] [bit] NULL,
	[partnerId] [int] NULL,
 CONSTRAINT [PK__logtype__AE9574941F98B2C1] PRIMARY KEY CLUSTERED 
(
	[LogTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[logrevenue]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[logrevenue](
	[logRevenueId] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[revenueDate] [datetime] NULL,
	[description] [varchar](256) NULL,
	[RevenueTypeId] [int] NULL,
	[money] [int] NULL,
	[phoneNumber] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[logRevenueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[LogMatch]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[LogMatch]
 @uid bigint,
 @roomId int,
 @tableNumber int
as
	SET NOCOUNT ON
	
	insert into match(dateCreated,ownerId,roomId,tableNumber)
		 values (GETDATE(),@uid,@roomId,@tableNumber);
		 
	select @@IDENTITY as 'MatchID'
GO
/****** Object:  StoredProcedure [dbo].[UpdateGameEventUserForALTP]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGameEventUserForALTP]
	@userId bigint,
	@achivementQuestion int
as 	
	if(@achivementQuestion < 10) 
		return;
	declare @partnerId int;
	declare @gameId int = 3;
	select @partnerId = w.partnerId from WorkingUser w where w.userId = @userId;
	
	declare @gameEventId int=-1;
    select @gameEventId = ge.GameEventId from GameEvent ge 
            where ge.gameId = @gameId and (ge.partnerId = @partnerId or ge.partnerId=0);
    
    if(@gameEventId=-1)
		return
	declare @startDate Datetime;
	declare @endDate Datetime;
	select @startDate = g.fromDate, @endDate = g.toDate from GameEvent g 
	     where g.GameEventId = @gameEventId;
	if(GETDATE() between @startDate and @endDate) 
	begin
		declare @plus int;
		set @plus = 
		case @achivementQuestion
		   when 10 then 1
		   when 11 then  2
		   when 12 then  4
		   when 13 then 6
		   when 14 then 8
		   when 15 then 10
		end;
		if(not exists (select gU.userId from GameEventUser gU where gU.userId = @userId and gU.gameEventId = @gameEventId ))
			insert into GameEventUser(gameEventId, point, userId) 
			            values (@gameEventId, @plus, @userId)
		else
		    update GameEventUser set point = point + @plus 
		       where userId = @userId and gameEventId = @gameEventId
		
	
	end
GO
/****** Object:  StoredProcedure [dbo].[UpdateGameEventUser]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGameEventUser]
	@userId bigint,
	@gameId int
as 	

	declare @partnerId int;
	select @partnerId = w.partnerId from WorkingUser w where w.userId = @userId;
	
	declare @gameEventId int=-1;
    select @gameEventId = ge.GameEventId from GameEvent ge 
            where ge.gameId = @gameId and ge.partnerId = @partnerId;
    
    if(@gameEventId=-1)
		return
	declare @startDate Datetime;
	declare @endDate Datetime;
	declare @plus int;
	select @plus = g.plus, @startDate = g.fromDate, @endDate = g.toDate from GameEvent g 
	     where g.GameEventId = @gameEventId;
	if(GETDATE() between @startDate and @endDate) 
	begin
		if(not exists (select gU.userId from GameEventUser gU where gU.userId = @userId and gU.gameEventId = @gameEventId ))
			insert into GameEventUser(gameEventId, point, userId) 
			            values (@gameEventId, @plus, @userId)
		else
		    update GameEventUser set point = point + @plus 
		    where userId = @userId and gameEventId = @gameEventId
	end
GO
/****** Object:  View [dbo].[udvSocialFriend]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[udvSocialFriend]
as
	select userId, friendId 
		from socialFriend s1
		where s1.confirmDate is not null
	union all
	  select friendId, userId
		  from socialFriend s2
		where s2.confirmDate is not null
GO
/****** Object:  StoredProcedure [dbo].[getSuperUser]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getSuperUser]
as 	
	set nocount on;
	SELECT userid from superuser
GO
/****** Object:  Table [dbo].[alertuser]    Script Date: 03/17/2015 16:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alertuser](
	[alertUserId] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[content] [nvarchar](1024) NOT NULL,
	[dateCreated] [datetime] NOT NULL,
	[dateSend] [datetime] NULL,
	[typeInform] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[alertUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[udvGetALlRoomBak]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[udvGetALlRoomBak]
    as
		select room.number, room.availables, room.numTable, roomlevel.level , room.playing, zone.id  as zoneId, room.id, room.levelId, roomlevel.minCash, roomlevel.isVip
		from room inner join roomlevel on room.levelId = roomlevel.id
		inner join zone on room.ZoneId = zone.id
GO
/****** Object:  View [dbo].[udvGetALlRoom]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[udvGetALlRoom]
    as
		SELECT     room.number, room.availables, room.numTable, roomlevel. LEVEL, room.playing, room.ZoneId AS zoneId, room.id, room.levelId, roomlevel.minCash, roomlevel.isVip
		FROM       room, roomlevel
		WHERE      room.levelId = roomlevel.levelId
				   AND room.ZoneId = roomlevel.zoneId
GO
/****** Object:  StoredProcedure [dbo].[TopRich]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE pROCEDURE [dbo].[TopRich]
as
	
	SELECT top(10) *, 0 as 'age', lastLogin as 'lastTime', 0 as 'lastMatch', 0 as 'sex'  from workinguser
	ORDER BY Cash DESC
GO
/****** Object:  StoredProcedure [dbo].[TopLevel]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TopLevel]
as 	
	SELECT top(10) * , 0 as 'age', lastLogin as 'lastTime', 0 as 'lastMatch', 0 as 'sex'
	FROM workinguser
	ORDER BY experience DESC
GO
/****** Object:  StoredProcedure [dbo].[uspChangePassword]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspChangePassword]
	@userId bigint,
	@password varchar(100)
as
	update [user]
		set Password = @password
	where UserID = @userId
	
	update WorkingUser
		set password = @password
	where userId = @userId
GO
/****** Object:  StoredProcedure [dbo].[uspBonusMoneyCC]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspBonusMoneyCC]
	@userId bigint,
	@money bigint,
	@logTypeId int
	
as
	set nocount on	
	Declare @currentMOney bigint
	Declare @isWorkingUser bit
	
	if exists(select userId from WorkingUser where userId = @userId)
	begin
		select @isWorkingUser = 1
		update WorkingUser
			set Cash = Cash + @money
		where UserID = @userId
	
	end
	else
	begin
		select @isWorkingUser = 0
		update userstt
			set Cash = Cash + @money
		where UserID = @userId
	end
	
	insert into logvasc(UserID, DateTime, Money, Description, LogTypeId) 
		values ( @userId, GETDATE(), @money, 'tri an khach hang', @logTypeId)
	
	if @isWorkingUser = 1
		select cash
			from WorkingUser
		where UserID = @userId
	else
		select cash
			from userstt
		where UserID = @userId
GO
/****** Object:  StoredProcedure [dbo].[uspBonusMoney]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspBonusMoney]
	@userName nvarchar(100),
	@money bigint,
	@dt datetime
as
	set nocount on
	
	
	Declare @userId bigint 
	Declare @currentMOney bigint
	Declare @isWorkingUser bit
	
	select @userId = userId
		from [user] 
	where Name = @userName
	
	if @userId is null
		return -1 -- invalid user(not exist user)
	
	
	
	if exists(select userId from WorkingUser where userId = @userId)
	begin
		select @isWorkingUser = 1
		update WorkingUser
			set Cash = Cash + @money
		where UserID = @userId
	
	end
	else
	begin
		select @isWorkingUser = 0
		update userstt
			set Cash = Cash + @money
		where UserID = @userId
	end
	
	insert into logvasc(UserID, DateTime, Money, Description, LogTypeId) 
		values ( @userId, @dt, @money, 'Bonus money', 20001)
	
	if @isWorkingUser = 1
		select @currentMOney = cash
			from WorkingUser
		where UserID = @userId
	else
		select @currentMOney = cash
			from userstt
		where UserID = @userId
		
	return @currentMoney
GO
/****** Object:  StoredProcedure [dbo].[uspAddSocialFriend]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspAddSocialFriend]
	@userId bigint,
	@friendId bigint,
	@bonusGold int,
	@maxGoldAllowed int
as
	--return 0 is succeful add to databae
	--return 1 means that they are friends
	set nocount on
	
	if exists(select userId from Socialfriend where (userId = @userId and friendId = @friendId) or (userId =@friendId and friendId =  @userId))
		return 1 --return 1 means that they are friends
	else 
		begin
			Insert into socialFriend(userId, friendId, requestDate, confirmDate)
				values (@userId, @friendId, GETDATE(), GETDATE())
			Insert into socialFriend(userId, friendId, requestDate, confirmDate)
				values (@friendId, @userId, GETDATE(), GETDATE())
			
			-- xu ly cong Gold
			DECLARE @addedFriends varchar(MAX)
			DECLARE @friendIdString varchar(MAX)
			DECLARE @friendIdPattern varchar(MAX)
			DECLARE @receivedGold int
			
			SET @friendIdString = CONVERT(varchar(MAX), @friendId)
			SET @friendIdPattern = ';' + @friendIdString + ';'
			
			IF NOT EXISTS (SELECT * FROM xeFreeGoldByFriend WHERE userId = @userId)
			BEGIN
				INSERT INTO xeFreeGoldByFriend 
				(userId, receivedGold, addedFriends) 
				VALUES
				(@userId, 0, '')
			END
			
			SELECT @addedFriends = addedFriends, @receivedGold = receivedGold
			FROM xeFreeGoldByFriend
			WHERE userId = @userId
			
			IF CHARINDEX(@friendIdPattern, @addedFriends) > 0 OR @receivedGold >= @maxGoldAllowed
				BEGIN
					-- da duoc ket ban truoc do hoac da nhan toi da so luong Gold cho phep
					return 3
				END 
			ELSE 
				BEGIN 
					-- chua ket ban truoc do, cong tien va them ban moi vao danh sach
					DECLARE @oldCash bigint
					
					SELECT @oldCash = cash
					FROM workinguser
					WHERE userId = @userId
					
					-- ghi log
					INSERT INTO XELogMoneyHistory
					(userId, moneyAfter, moneyType, moneyDiff, reason, refId, message, modifyDate)
					VALUES
					(@userId, @oldCash + @bonusGold, 0, @bonusGold, 10, @friendId, '', GETDATE())
					
					-- cap nhat luong tien da nhan
					UPDATE xeFreeGoldByFriend
					SET receivedGold = receivedGold + @bonusGold, addedFriends = addedFriends + @friendIdPattern
					WHERE userId = @userId
					
					-- cap nhat tien cho user
					UPDATE workinguser
					SET cash = cash + @bonusGold
					WHERE userId = @userId
					
					return 2		
				END
		end
GO
/****** Object:  StoredProcedure [dbo].[uspFindFriends]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspFindFriends]
	@isMale bit,
	@cityId int,
	@jobId int,
	@fromYear int,
	@toYear int,
	@characterId int,
	@hasAvatar bit,
	@friendName nvarchar(100)
as
	select top(100) * 
		from WorkingUser u left join UserInfo ui on u.userId = ui.userId
		
	
	where COALESCE(sex, 0) = @isMale and 
		  (@cityId = 0 or (ui.cityId = @cityId)) and 
		  (@jobId = 0 or (ui.jobId = @jobId)) and 
		  (@fromYear = 0 or (ui.birthday is not null and YEAR(ui.birthday)>= @fromYear)) and 
		  (@toYear = 0 or (ui.birthday is not null and YEAR(ui.birthday)<= @toYear)) and 
		  (@characterId = 0 or (ui.characterId = @characterId)) and 
		  (@hasAvatar = 0 or (u.avatarFileId>0)) and
		  (@friendName = '' or (u.name like ('%' +@friendName + '%')))
		  
		  
	order by lastLogin desc
GO
/****** Object:  StoredProcedure [dbo].[uspFaceLogin]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspFaceLogin]
	@faceUid varchar(100),
	@password varchar(255),
	@partnerId int,
	@refCode int,
	@mobileVersion varchar(100)
as
	set nocount on	
	
	Declare @userId bigInt
	declare @dtNow datetime
	declare @isOnline bit
	Declare @lastLogin datetime
	Declare @phoneNumber varchar(20)
	Declare @won int
	Declare @plays int		
	Declare @vipId int
	declare @experience int
	declare @levelId int
	declare @cash bigint = 3000
	Declare @avatarId int
	Declare @email varchar(256)
	Declare @dbPartnerId int
	Declare @isActive bit
	Declare @sex bit
	
	Declare @avatarFileId bigint
	Declare @biaFileId bigint
	Declare @timesQuay int
	Declare @status nvarchar(256)
	
	Declare @userName varchar(100)
	Declare @guestId bigint
	Declare @total int = 0
		
	set @userName = 'face_' + CONVERT(varchar, @faceUid) 	
		
	if not exists(select userId from WorkingUser where name = @userName and password = @password)
	begin
	
	Select @total = COUNT(*) from WorkingUser where name = @userName
	
    if @total > 0
    begin
       set @userName = @userName + CONVERT(varchar, @total + 1);
    end
	
	INSERT INTO WorkingUser(Name, Password, partnerId, registerDate, fromDevice, refCode, cash, mobileVersion) 
		VALUES(@userName,@Password, @partnerId, GETDATE(), 'mobile', @refCode, @cash, @mobileVersion);
	
	end
		
	update WorkingUser set isonline = 1 where name = @userName 

	select userId, name, password, phoneNumber, wonPlaysNumber, cash, playsNumber , level, experience, vipId, @isOnline as 'isonline', avatarId, @lastLogin as 'lastLogin', isActive, partnerId,  sex, isActive, avatarFileId, biaFileId, timesQuay, status, refCode
	from workingUser
	where name =  @userName
GO
/****** Object:  StoredProcedure [dbo].[uspEditMoney]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspEditMoney]
	@userName varchar(100),
	@cash int
as
	update WorkingUser
		set cash = cash + @cash
	where name = @userName
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteSocialFriend]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspDeleteSocialFriend]
	@userId bigint,
	@friendId bigint
as
	--return 0 is succeful add to databae
	--return 1 means that they are friends
	set nocount on
	
	delete from 
		socialFriend
	where (userId = @userId and friendId = @friendId) or (userId = @friendId and friendId = @userId)
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteMessage]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspDeleteMessage]
	@type int,
	@messageId bigint,
	@userId bigint
as
	set nocount on
	
	if @type = 0 -- delete only one message
		delete mxhMessage
			where messageId = @messageId
	else if @type = 1 -- delete read message
		delete mxhMessage
			where isRead = 1 and destId = @userId
	else if @type = 1 -- delete unread message
		delete mxhMessage
			where destId = @userId
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteLogvasc]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspDeleteLogvasc]
as
	Declare @dtNow datetime
	
	select @dtNow = GETDATE()
	select @dtNow = DATEADD(day, -30, @dtNow)
	
	delete logvasc
		where DateTime< @dtNow
GO
/****** Object:  StoredProcedure [dbo].[uspDeleteFriend]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspDeleteFriend]
	@userId bigint,
	@friendId bigint
as
	--return 0 is succeful add to databae
	--return 1 means that they are friends
	set nocount on
	
	delete from 
		friend
	where (userId = @userId and friendId = @friendId) or (userId = @friendId and friendId = @userId)
GO
/****** Object:  StoredProcedure [dbo].[uspCreateSocialFriend]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspCreateSocialFriend]
	@userId bigint,
	@friendId bigint
as
	Insert into socialFriend(userId, friendId, requestDate, confirmDate)
	    values(@userId, @friendId, GETDATE(), null)
GO
/****** Object:  StoredProcedure [dbo].[uspCreateMatch]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspCreateMatch]
 @uid bigint,
 @roomId int,
 @tableNumber int
as
	SET NOCOUNT ON
	
	insert into match(dateCreated,ownerId,roomId,tableNumber)
		 values (GETDATE(),@uid,@roomId,@tableNumber);
		 
	DECLARE @matchId bigint
	SELECT @matchId = @@IDENTITY
	IF(@matchId < 1000000)
		select @matchId as 'MatchID'
	ELSE
		SELECT RIGHT(@matchId,6) as 'MatchID'
GO
/****** Object:  StoredProcedure [dbo].[uspCreateGiftCode]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspCreateGiftCode]
	@value bigint,
	@total bigint,
	@type varchar(10)
as    
	DECLARE @serial varchar(40)
	DECLARE @i bigint = 0
	
	while (@i < @total)
	begin
	SET @serial = (SELECT CONVERT(BIGINT, (8888888888+1)*RAND()) + 1111111111)
	SET @serial = @type + CONVERT(VARCHAR(10), @serial)
	if not exists(select GiftCodeId from GiftCode where serial = @serial)
		insert into GiftCode(serial, createdDate, bonusMoney, marketingChannelId, type)
			values(@serial, GETDATE(), @value, 0, @type)
		set @i = @i + 1	
end
GO
/****** Object:  StoredProcedure [dbo].[uspCrawlUser]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspCrawlUser]
	@userName varchar(256),
	@password varchar(256),
	@money bigint,
	@playsNumber int,
	@won int,
	@lastLogin DateTime,
	@sex bit,
	@phoneNumber varchar(20),
	@vipId int,
	@partnerId int,
	@stt nvarchar(256),
	@level int,
	@experience int,
	@isActive bit
as
	set nocount on
	if exists(select userId from WorkingUser where name = @userName)
		if exists (select Userid from WorkingUser where name = @userName and cash is null)
			update WorkingUser
				set cash = @money, lastLogin = @lastLogin
			where name = @userName
	else
		insert into WorkingUser(name, password, phoneNumber, WonPlaysNumber, PlaysNumber, level, experience, vipId, lastLogin, isActive, partnerId, sex, cash)
			values (@userName, @password, @phoneNumber, @won, @playsNumber, @level, @experience, @vipId, @lastLogin, @isActive, @partnerId, @sex, @money)
GO
/****** Object:  StoredProcedure [dbo].[uspGetAdvertising]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetAdvertising]
	
as
	set nocount on
	select * 
		from advertising
	where (GETDATE() between startDate and endDate) and isDisplay = 1
	order by createdDate desc
GO
/****** Object:  StoredProcedure [dbo].[uspGetCharacter]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspGetCharacter]
as
	select * 
		from PerCharacter
GO
/****** Object:  StoredProcedure [dbo].[uspGetCardOfflineTxn]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetCardOfflineTxn]
as
	select top(10) *
		from CardOfflineTxn
	where deliveryDate is null
GO
/****** Object:  StoredProcedure [dbo].[uspGetRequestFriends]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetRequestFriends]
	@userId bigint
as
	select sf.userId as 'friendId', sf.friendId as 'userId', sf.socialId, u.Name, u.avatarFileId
		from socialFriend sf inner join WorkingUser u on sf.userId = u.UserID
	where sf.friendId = @userId and confirmDate is null
GO
/****** Object:  StoredProcedure [dbo].[uspGetRefGioithieu]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetRefGioithieu]
	@refGioithieuId bigint --only for mobile
as
	set nocount on
	select  UserId, phoneOrMail, partnerId
		from RefGioiThieu 
	where RefGioiThieuID = @refGioithieuId
GO
/****** Object:  StoredProcedure [dbo].[uspGetQuestion]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[uspGetQuestion]
as
	select * from Question
GO
/****** Object:  StoredProcedure [dbo].[uspGetPlayers]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetPlayers]
	@partnerId int,
	@userName varchar(100) = null,
	@device varchar(20) = null,
	@fromDate Datetime = null,
	@toDate DateTime = null 
as
	
	set nocount on
	
	if @toDate is null
		select @toDate = GETDATE()	
	
	select top(20000) * 
		from WorkingUser
	where  (@partnerId = -10 or COALESCE(partnerId,0) = @partnerId)  -- 10: all partner is admin person. hard code :(
		and (@userName is null or name like ('%' + @userName + '%'))
		and (fromDevice = 'mobile')
		and (@fromDate is null or (datediff(day, @fromDate, registerDate)> -1 and datediff(day, registerDate, @toDate)> -1 ))
	order by registerDate desc
GO
/****** Object:  StoredProcedure [dbo].[uspGetNumRequestFriends]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetNumRequestFriends]
	@userId bigint
as
	select COUNT(sf.userId) as 'count'
		from socialFriend sf
	where sf.friendId = @userId and confirmDate is null
GO
/****** Object:  StoredProcedure [dbo].[uspGetNumMessage]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspGetNumMessage]
	@userID bigint
as
	select COUNT(messageId)
		from mxhMessage
	where destId = @userID and isRead = 0
GO
/****** Object:  StoredProcedure [dbo].[uspGetMessage]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetMessage]
	@userId bigint
as
	set nocount on
	select m.content, m.dateCreated, m.destId, m.sourceId, u.name, isRead, title, m.messageId
	from WorkingUser u 
	inner join mxhMessage m 
	on u.userId = m.sourceId
	where m.destId = @userId AND isRead = 0
	order by dateCreated desc
GO
/****** Object:  StoredProcedure [dbo].[uspGetJob]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspGetJob]
as
	select * 
		from Job
GO
/****** Object:  StoredProcedure [dbo].[uspGetGiftUser]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE pROCEDURE [dbo].[uspGetGiftUser]
as
	set nocount on;
	select * from UserGiftType
GO
/****** Object:  StoredProcedure [dbo].[uspGetGameStatus]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspGetGameStatus]
as
	select ZoneId, SUM(playing) as playing from room group by ZoneId
GO
/****** Object:  StoredProcedure [dbo].[uspGetFriends]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetFriends]
	@userID bigint,
	@isOnline bit
as
	
		
	select u.userId, f.friendId, u.avatarId, u.cash, u.level, u.PlaysNumber, u.name, u.isOnline, u.WonPlaysNumber
		 from WorkingUser u inner join friend f on u.userId = f.friendId
		
	where f.userId = @userID and (( @isOnline = 0) or (@isOnline = 1 and u.isOnline = 1))
	order by isOnline desc, name asc
GO
/****** Object:  StoredProcedure [dbo].[uspGetEvent]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetEvent]
as
	set nocount on
	Declare @dtNow datetime
	
	select @dtNow = GETDATE()
	
	select * 
		from GameEvent
	where (DATEDIFF(day, fromDate, @dtNow)> -1 and DATEDIFF(day, @dtNow, toDate)> -1) or isConcurrent=1
	order by dateCreated desc
GO
/****** Object:  StoredProcedure [dbo].[uspGetDuty]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetDuty]
	as
		select * 
			from Duty
		where isactive = 1
GO
/****** Object:  StoredProcedure [dbo].[uspGetCity]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspGetCity]
as
	select * 
		from City
GO
/****** Object:  StoredProcedure [dbo].[uspGetSendGioiThieu]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetSendGioiThieu]
as
	set nocount on
	Declare @dtNow datetime
	select @dtNow = GETDATE()
	
	select r.userId, r.PhoneOrMail, r.partnerId, p.webUrl+ '?par=' + (cast(r.RefGioiThieuID as varchar(200))) as 'link', r.name
		from RefGioiThieu R inner join Partner p on R.partnerId = p.partnerId
		where sendDate is null and device = 2
		
	update RefGioiThieu
		set sendDate = @dtNow
	where sendDate is null
GO
/****** Object:  StoredProcedure [dbo].[uspGetRoomByZone]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[uspGetRoomByZone] 
	@zoneId int
as
	--Routine body goes here...
	select room.number, room.availables, room.numTable, roomlevel.level , room.playing, zone.name  as zoneName, room.id, room.levelId, roomlevel.minCash
	   from room inner join roomlevel on room.levelId = roomlevel.id
							 inner join zone on room.ZoneId = zone.id
  where zone.id = @zoneId;
GO
/****** Object:  StoredProcedure [dbo].[uspGetAllPartner]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetAllPartner]
as
	select * from Partner where partnerId >0
GO
/****** Object:  StoredProcedure [dbo].[uspIsFriend]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspIsFriend]
	@userId bigint,
	@friendId bigint
as
	if exists(select userId from socialFriend 
		where (userId = @userId and friendId = @friendId and confirmDate is not null) or (userId = @friendId and friendId = @userId and confirmDate is not null))
		return 1
	else
		return 0
GO
/****** Object:  StoredProcedure [dbo].[uspInsertMTVDC]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspInsertMTVDC]
	@moid varchar(100) ,
	@moseq varchar(100) ,
	@src varchar(100) ,
	@dest varchar(100) ,
	@cmdcode varchar(100) ,
	@msgbody varchar(1000) ,
	@msgtype varchar(100) ,
	@msgtitle varchar(100) ,
	@mttotalseq varchar(100) ,
	@mtseqref varchar(100) ,
	@cpid varchar(100) ,
	@reqtime varchar(100) ,
	@procresult varchar(100) ,
	@opid varchar(100) 
AS
		insert into MTMessages(moid,moseq,src,dest,cmdcode,msgbody,msgtype,msgtitle,mttotalseq,mtseqref,cpid,reqtime,procresult,opid)
		values(@moid,@moseq,@src,@dest,@cmdcode,@msgbody,@msgtype,@msgtitle,@mttotalseq,@mtseqref,@cpid,@reqtime,@procresult,@opid)
		return SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[uspInsertMoVDC]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspInsertMoVDC]
	@moid varchar(100),
	@moseq varchar(100),
	@src varchar(100),
	@dest varchar(100),
	@cmdcode varchar(100),
	@msgbody varchar(1000),
	@opid varchar(100),
	@dateInsert varchar(100)
AS

		if   exists(select moid from MOMessages where moid = @moid)
			return -2
		
		insert into MOMessages(moid,moseq,src,dest,cmdcode,msgbody,opid,dateInsert) 
		values(@moid,@moseq,@src,@dest,@cmdcode,@msgbody,@opid,@dateInsert)
		return 0
GO
/****** Object:  StoredProcedure [dbo].[uspInsertMessage]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspInsertMessage]
	@sourceId bigint,
	@destId bigint,
	@content nvarchar(max),
	@title nvarchar(max)
as

	insert into mxhMessage(sourceId, destId, content, isRead, dateCreated, title)
		values(@sourceId, @destId, @content, 0, GETDATE(), @title)
GO
/****** Object:  StoredProcedure [dbo].[uspInsertMatch]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE  [dbo].[uspInsertMatch] 
	@roomId int, 
	@tableNumber int, 
	@ownerId int
as
	
	insert into match (dateCreated,ownerID, roomId,tableNumber) values (GETDATE(), @ownerId, @roomId, @tableNumber);
	select @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[uspInsertGiftCode]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspInsertGiftCode]
	@serial varchar(20)
as
	if not exists(select GiftCodeId from GiftCode where serial = @serial)
		insert into GiftCode(serial, createdDate, bonusMoney, marketingChannelId)
			values(@serial, GETDATE(), 2000, 0)
GO
/****** Object:  StoredProcedure [dbo].[uspInsertFriend]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspInsertFriend]
	@userId bigint,
	@friendId bigint,
	@bonusGold int,
	@maxGoldAllowed int
as
	--return 0 is succeful add to databae
	--return 1 means that they are friends
	set nocount on
	
	if exists(select userId from friend where userId = @userId and friendId = @friendId)
		return 1 --return 1 means that they are friends
	else
	begin
		
		-- ket ban
		insert into friend(userId, friendId, connectedDate) values(@userId, @friendId, GETDATE())
		insert into friend(friendId, userId, connectedDate) values(@userId, @friendId, GETDATE())
		
		-- xu ly cong Gold
		DECLARE @addedFriends varchar(MAX)
		DECLARE @friendIdString varchar(MAX)
		DECLARE @friendIdPattern varchar(MAX)
		DECLARE @receivedGold int
		
		SET @friendIdString = CONVERT(varchar(MAX), @friendId)
		SET @friendIdPattern = ';' + @friendIdString + ';'
		
		IF NOT EXISTS (SELECT * FROM xeFreeGoldByFriend WHERE userId = @userId)
		BEGIN
			INSERT INTO xeFreeGoldByFriend 
			(userId, receivedGold, addedFriends) 
			VALUES
			(@userId, 0, '')
		END
		
		SELECT @addedFriends = addedFriends, @receivedGold = receivedGold
		FROM xeFreeGoldByFriend
		WHERE userId = @userId
		
		IF CHARINDEX(@friendIdPattern, @addedFriends) > 0 OR @receivedGold >= @maxGoldAllowed
			BEGIN
				-- da duoc ket ban truoc do hoac da nhan toi da so luong Gold cho phep
				return 0
			END 
		ELSE 
			BEGIN 
				-- chua ket ban truoc do, cong tien va them ban moi vao danh sach
				DECLARE @oldCash bigint
				
				SELECT @oldCash = cash
				FROM workinguser
				WHERE userId = @userId
				
				-- ghi log
				INSERT INTO XELogMoneyHistory
				(userId, moneyAfter, moneyType, moneyDiff, reason, refId, message, modifyDate)
				VALUES
				(@userId, @oldCash + @bonusGold, 0, @bonusGold, 10, @friendId, '', GETDATE())
				
				-- cap nhat luong tien da nhan
				UPDATE xeFreeGoldByFriend
				SET receivedGold = receivedGold + @bonusGold, addedFriends = addedFriends + @friendIdPattern
				WHERE userId = @userId
				
				-- cap nhat tien cho user
				UPDATE workinguser
				SET cash = cash + @bonusGold
				WHERE userId = @userId
				
				return 2		
			END
	end
GO
/****** Object:  StoredProcedure [dbo].[uspGuestLogin]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGuestLogin]
	@deviceUid varchar(100),
	@password varchar(255),
	@partnerId int,
	@refCode int,
	@mobileVersion varchar(100)
as
	set nocount on	
	
	Declare @userId bigInt
	declare @dtNow datetime
	declare @isOnline bit
	Declare @lastLogin datetime
	Declare @phoneNumber varchar(20)
	Declare @won int
	Declare @plays int		
	Declare @vipId int
	declare @experience int
	declare @levelId int
	declare @cash bigint = 50000
	Declare @avatarId int
	Declare @email varchar(256)
	Declare @dbPartnerId int
	Declare @isActive bit
	Declare @sex bit
	
	Declare @avatarFileId bigint
	Declare @biaFileId bigint
	Declare @timesQuay int
	Declare @status nvarchar(256)
	
	Declare @userName varchar(100)
	Declare @guestId bigint = 0
	DECLARE @newGuest int = 0
	
	select @guestId = max(guestId) from guest where deviceUid = @deviceUid and registedFlag = 0
	
	If (@guestId is null OR @guestId = 0 )
	begin
	 Insert into guest (deviceUid, insertDate, registedFlag) values (@deviceUid, GETDATE(), 0)
	 select @guestId = @@IDENTITY
	
	end
	
	set @userName = 'khach' + CONVERT(varchar, @guestId) 
		
	if not exists(select userId from WorkingUser where name = @userName)
	begin
		INSERT INTO WorkingUser(Name,Password, partnerId, registerDate, fromDevice, refCode, cash, mobileVersion) 
			VALUES(@userName,@Password, @partnerId, GETDATE(), 'mobile', @refCode, @cash, @mobileVersion);
			
		select @userId = @@IDENTITY
		INSERT INTO XELogMoneyHistory
		(userId, modifyDate, moneyDiff, moneyAfter, moneyType, reason, message)
		VALUES 
		(@userId, GETDATE(), @cash, @cash, 0, 13, '')
	end
	
	-- nhat ky dang nhap {
	DECLARE @oldLastLogin datetime
	SELECT @oldLastLogin = lastLogin FROM workinguser WHERE name = @userName
    
    IF DATEDIFF(day, @oldLastLogin, GETDATE()) > 0 -- lan dang nhap cuoi khong phai ngay hom nay
    BEGIN
		-- chuyen lastLogin sang lastSecondLogin, cap nhat lastLogin
		UPDATE workinguser
		SET lastSecondLogin = @oldLastLogin,
			lastLogin = GETDATE()
		WHERE name = @userName
    END
    ELSE -- lan dang nhap cuoi van trong ngay hom nay
    BEGIN
		-- cap nhat lastLogin
		UPDATE workinguser
		SET lastLogin = GETDATE()
		WHERE name = @userName
    END
    -- } nhat ky dang nhap
    
	update WorkingUser set isonline = 1 where name =  @userName 

	select userId, name, password, phoneNumber, wonPlaysNumber, cash, playsNumber , level, experience, vipId, @isOnline as 'isonline', avatarId, @lastLogin as 'lastLogin', isActive, partnerId,  sex, isActive, avatarFileId, biaFileId, timesQuay, status, refCode, xeeng, isLock, lockExpired, chatLockExpired
	from workingUser
	where name =  @userName
GO
/****** Object:  StoredProcedure [dbo].[uspGetUserToRefresh]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspGetUserToRefresh]
as
	set nocount on
	
	select * 
		from RefreshCache
	where isRefresh = 0
	
	update RefreshCache
		set isRefresh = 1
	where isRefresh = 0
GO
/****** Object:  StoredProcedure [dbo].[uspGetUserMXHInfo]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspGetUserMXHInfo]
	@userId bigint
as
	select u.*
		from WorkingUser w left join UserInfo u on w.userId = u.userId
	where w.userId = @userId
GO
/****** Object:  StoredProcedure [dbo].[uspGetUserInfoByUid]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetUserInfoByUid]
	@uid bigint 
as
	set nocount on 
	
	select [userId]
      ,[name]
      ,[password]
      ,[phoneNumber]
      ,[sessionId]
      ,[WonPlaysNumber]
      ,[cash]
      ,[PlaysNumber]
      ,[level]
      ,[experience]
      , 0 as [vipId]	--vipid
      ,[isOnline]
      ,[avatarId]
      ,[lastLogin]
      ,[email]
      ,[isActive]
      ,[partnerId]
      ,[avatarFileId]
      ,[biaFileId]
      ,[sex]
      ,[timesQuay]
      ,[status]
      ,[mobileVersion]
      ,[registerDate]
      ,[fromDevice]
      ,[refCode]
      ,[gameVersion]
      ,[xeeng]
      ,[loginName]
      ,[cmnd]
      ,[xePhoneNumber]
      ,[guestToUserDate]
      ,[lastSecondLogin]
      ,[isLock]
      ,[lockExpired]
      ,[chatLockExpired]
      ,[firstOvernight]
      ,[firstChargingDate]
      ,[specialPoint]
			from workingUser
	where UserID = @uid
GO
/****** Object:  StoredProcedure [dbo].[uspGetUserInfoByName]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetUserInfoByName]
	@loginName nvarchar(100)
as
	set nocount on 
	
		select *
			from workingUser
		where loginName = @loginName
GO
/****** Object:  StoredProcedure [dbo].[uspGetTopRich]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE pROCEDURE [dbo].[uspGetTopRich]
	@partnerId int
as
	
	SELECT top(10) *, 0 as 'age', lastLogin as 'lastTime', 0 as 'lastMatch', sex 
	from WorkingUser
	where partnerId = @partnerId or @partnerId = 0
	ORDER BY Cash DESC
GO
/****** Object:  StoredProcedure [dbo].[uspGetTopLevel]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetTopLevel]
	@partnerId int
as 	
	SELECT top(10) * , 0 as 'age', lastLogin as 'lastTime', 0 as 'lastMatch', 0 as 'sex'
	FROM WorkingUser
	where partnerId = @partnerId or @partnerId = 0
	ORDER BY experience DESC
GO
/****** Object:  StoredProcedure [dbo].[uspGetSocialFriends]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetSocialFriends]
	@userId bigint
as
	select udv.userId, udv.friendId, u.Name as 'fName', u.Cash as 'fCash', u.isOnline as 'fOnline', u.avatarFileId
		from socialFriend udv inner join WorkingUser u on udv.friendId = u.UserID
	where udv.userId = @userId
	order by u.isOnline desc
GO
/****** Object:  StoredProcedure [dbo].[uspXEUseInventoryItem]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 30-Jul-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEUseInventoryItem] 
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@evitCode nvarchar(10),
	@evgfCode nvarchar(10),
	@itemLimit int,
	@eventId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Check if user has received enough gifts
	if (@itemLimit != -1)
	BEGIN
		DECLARE @count int
		SELECT @count = COUNT(id)
			FROM xeLogEventGiftsHistory
		WHERE userId = @userId AND evitCode = @evitCode
		
		IF (@count >= @itemLimit)
		BEGIN
			SELECT -2 AS result
			RETURN
		END
	END

	DECLARE @value bigint
	DECLARE @type nvarchar(10)
	DECLARE @isLimit bit
	DECLARE @quantity int

	-- Get gift info
	SELECT @value = value, @type = type, @isLimit = isLimitUsage
		FROM xeEventGifts
	WHERE evgfCode like @evgfCode
	
	IF (@isLimit = 1)
	BEGIN
		-- Check if user has got the special gift
		DECLARE @logId bigint
	
		SELECT @logId = id
			FROM xeLogEventGiftsHistory
		WHERE userId = @userId AND evitCode like @evitCode AND isLimitUsage = 1
		
		IF (@logId) > 0
		BEGIN
			SELECT -1 AS result
			RETURN
		END
	END

	-- Update user's money
	DECLARE @fromValue bigint
	
	SELECT @fromValue = cash
		FROM workinguser
	WHERE userId = @userId
	
	UPDATE workinguser
		SET cash = cash + @value
	WHERE userId = @userId

    -- Insert log
    DECLARE @message nvarchar(100) = N'Đã nhận được ' + CAST(@value AS nvarchar) + ' ' + @type
    
	INSERT INTO xeLogEventGiftsHistory
	(userId, eventId, evgfCode, evitCode, value, type, message, useDate, fromValue, toValue, isLimitUsage)
	VALUES
	(@userId, @eventId, @evgfCode, @evitCode, @value, @type, @message, GETDATE(), @fromValue, @fromValue + @value, @isLimit)
	
	INSERT INTO logvasc
	(userId, DateTime, money, Description, LogTypeId, moneyType)
	VALUES
	(@userId, GETDATE(), @value, 'Event Gift', 1340, 1)
	
	-- Update user's invetory
	UPDATE xeInventory
		SET quantity = quantity - 1
	WHERE userId = @userId AND itemCode like @evitCode
	
	-- Update quantity of gift
	UPDATE xeEventGifts
		SET quantity = quantity - 1
	WHERE evgfCode like @evgfCode
	
	SELECT 1 AS result
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEUpdateWorkingUser]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEUpdateWorkingUser]
	-- Add the parameters for the stored procedure here
    @userId bigint,
    @name nvarchar(100) = NULL,
    @email varchar(256) = NULL,
    @sex bit = NULL,
    @cmnd varchar(32) = NULL,
    @xePhoneNumber varchar(32) = NULL,
	@reportUserId int = -1,
	 @xeNewPass varchar(32) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --Hungdt: add update password
	IF LEN(@xeNewPass) > 0
	   BEGIN
		UPDATE [dbo].[workinguser]
		SET    [name] = @name, 
			[email] = @email,
			[sex] = @sex,
			[cmnd] = @cmnd, 
			[xePhoneNumber] = @xePhoneNumber,
			[password] = @xeNewPass
		WHERE  [userId] = @userId
	   END
	 ELSE
		UPDATE [dbo].[workinguser]
		SET    [name] = @name, 
			[email] = @email,
			[sex] = @sex,
			[cmnd] = @cmnd, 
			[xePhoneNumber] = @xePhoneNumber
		WHERE  [userId] = @userId


	INSERT INTO xeReportUserLog
	(userId, actionId, refId, logDate)
	VALUES
	(@reportUserId, 1, @userId, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEUpdateUserMoney]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		thanhnvt
-- Create date: 21/03/2014
-- Description:	Cap nhat thong tin nguoi dung sau khi chuyen doi tien.
-- =============================================
CREATE PROCEDURE [dbo].[uspXEUpdateUserMoney] 
	-- Add the parameters for the stored procedure here
	@uid bigint, 
	@xeeng bigint, 
	@gold bigint,
	@boughtGold bigint
AS
BEGIN
	SET NOCOUNT ON;

    UPDATE workinguser
		SET 
			xeeng = @xeeng, 
			cash = @gold
	WHERE UserID = @uid
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEUpdateUserDevice]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEUpdateUserDevice]
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@osName varchar(16),
	@osVersion varchar(16),
	@osMAC varchar(64)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF EXISTS(SELECT * FROM xeUserDevice WHERE userId = @userId)
	BEGIN
		UPDATE xeUserDevice
		SET osName = @osName,
			osVersion = @osVersion,
			osMAC = @osMAC,
			lastLogin = GETDATE()
		WHERE userId = @userId
	END
	ELSE
	BEGIN
		INSERT INTO xeUserDevice
		(userId, osName, osVersion, osMAC, lastLogin)
		VALUES
		(@userId, @osName, @osVersion, @osMAC, GETDATE())
	END
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEUpdateNews]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEUpdateNews] 
	@id int,
	@title nvarchar(max),
	@htmlContent nvarchar(max),
	@uid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE xeNews
    SET title = @title, 
		htmlContent = @htmlContent,
		dateModified = GETDATE(),
		userModified = @uid
	WHERE id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEUnlockUserAvatar]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEUnlockUserAvatar]
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@reportUserId int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE xeUserAvatar
	SET isLock = 0
	WHERE userId = @userId

	INSERT INTO xeReportUserLog
	(userId, actionId, refId, logDate)
	VALUES
	(@reportUserId, 7, @userId, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEUnlockUser]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEUnlockUser]
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@reportUserId int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE workinguser
	SET lockExpired = GETDATE()
	WHERE userId = @userId

	INSERT INTO xeReportUserLog
	(userId, actionId, refId, logDate)
	VALUES
	(@reportUserId, 3, @userId, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEUnlockChatUser]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEUnlockChatUser]
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@reportUserId int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE workinguser
	SET chatLockExpired = GETDATE()
	WHERE userId = @userId

	INSERT INTO xeReportUserLog
	(userId, actionId, refId, logDate)
	VALUES
	(@reportUserId, 5, @userId, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEStartRoulette]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 04-Sep-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEStartRoulette]
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@fee bigint,
	@feeType nvarchar(10)
AS
BEGIN
	SET NOCOUNT ON;

	-- Update user's money
	IF (@feeType like 'Gold')
	BEGIN
		UPDATE workinguser 
			SET cash = cash - @fee
		WHERE userId = @userId
	END
	ELSE IF (@feeType like 'Xeng')
	BEGIN
		UPDATE workinguser
			SET xeeng = xeeng - @fee
		WHERE userId = @userId
	END
	
	-- Insert log
	INSERT INTO xeLogRouletteHistory
	(userId, fee, feeType, date)
	VALUES
	(@userId, @fee, @feeType, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[uspXESMSStatistics]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXESMSStatistics]
	-- Add the parameters for the stored procedure here
	@dateStart date,
	@dateEnd date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CONVERT(VARCHAR(10), reportDate, 103) AS reportDate, itemMoney, itemCount
	FROM xeChargingMoneyStatistics
	WHERE DATEDIFF(DAY, @dateStart, reportDate) >= 0
		AND DATEDIFF(DAY, reportDate, @dateEnd) >= 0
		AND itemType = 2
	ORDER BY reportDate ASC
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEShopDailyReport]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEShopDailyReport]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	DECLARE @today datetime = GETDATE()
	DECLARE @reportDate date = DATEADD(DAY, -1, @today)

	-- ################################
	-- # Item Count
	-- ################################
	INSERT INTO xeShopDailyStatistics
	(executeDate, reportDate, itemId, itemPrice, itemCount)
	SELECT @today AS executeDate, @reportDate, xeExchange.id AS itemId, xeExchange.price AS itemPrice, IsNull(itemCount, 0) AS itemCount
	FROM xeExchange
	LEFT JOIN
	(
		SELECT -moneyDiff AS money, COUNT(moneyDiff) AS itemCount
		FROM XELogMoneyHistory
		WHERE moneyDiff < 0
			AND moneyType = 1
			AND reason = 1
			AND DATEDIFF(DAY, modifyDate, @today) = 1
		GROUP BY moneyDiff
	) tblLog
	ON tblLog.money = xeExchange.price
	
	-- ################################
	-- # Total Xeeng
	-- ################################
	DECLARE @totalXeeng int
	SELECT @totalXeeng = -SUM(moneyDiff)
	FROM XELogMoneyHistory
	WHERE moneyDiff < 0
		AND moneyType = 1
		AND reason = 1
		AND DATEDIFF(DAY, modifyDate, @today) = 1

	INSERT INTO xeShopDailyStatistics
	(executeDate, reportDate, itemId, itemPrice, itemCount)
	VALUES 
	(@today, @reportDate, 10001, @totalXeeng, 1) -- Xeeng
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEReceiveFreeGoldByDay]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEReceiveFreeGoldByDay]
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@numOfGold int,
	@minGoldAllowed int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @currentUserGold bigint
    
    SELECT @currentUserGold = cash
    FROM workinguser
    WHERE userId = @userId
    
    IF @currentUserGold >= @minGoldAllowed BEGIN
		RETURN 0
	END
	
	DECLARE @oldCash bigint
	
	SELECT @oldCash = cash
	FROM workinguser
	WHERE userId = @userId
	
	-- ghi log
	INSERT INTO XELogMoneyHistory
	(userId, moneyAfter, moneyType, moneyDiff, reason, refId, message, modifyDate)
	VALUES
	(@userId, @oldCash + @numOfGold, 0, @numOfGold, 11, 0, '', GETDATE())
	
	-- cap nhat tien cho user
	UPDATE workinguser
	SET cash = cash + @numOfGold
	WHERE userId = @userId
	
	
	IF NOT EXISTS (SELECT * FROM xeFreeGoldByDay WHERE userId = @userId)
	BEGIN
		INSERT INTO xeFreeGoldByDay 
		(userId, receivedTimes) 
		VALUES
		(@userId, 0)
	END
		
	
	UPDATE xeFreeGoldByDay
	SET receivedTimes = receivedTimes + 1
	WHERE userId = @userId
	
	RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEOpenEventCard]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: Aug-20-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEOpenEventCard]
	@userId bigint,
	@evitCode nvarchar(10),
	@evgfCode nvarchar(10),
	@itemLimit int,
	@eventId bigint,
	@fee bigint,
	@feeType nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Check if user has received enough gifts
	if (@itemLimit != -1)
	BEGIN
		DECLARE @count int
		SELECT @count = COUNT(id)
			FROM xeLogEventGiftsHistory
		WHERE userId = @userId AND evitCode = @evitCode
		
		IF (@count >= @itemLimit)
		BEGIN
			SELECT -2 AS result
			RETURN
		END
	END
	
	-- Get gift info
	DECLARE @giftValue bigint
	DECLARE @giftType nvarchar(10)
	DECLARE @isLimit bit
	DECLARE @quantity int
	
	SELECT @giftValue = value, @giftType = type, @isLimit = isLimitUsage
		FROM xeEventGifts
	WHERE evgfCode like @evgfCode
	
	IF (@isLimit = 1)
	BEGIN
		-- Check if user has got the special gift
		DECLARE @logId bigint
	
		SELECT @logId = id
			FROM xeLogEventGiftsHistory
		WHERE userId = @userId AND evitCode like @evitCode AND isLimitUsage = 1
		
		IF (@logId) > 0
		BEGIN
			SELECT -1 AS result
			RETURN
		END
	END
	
	-- Update user's money
	DECLARE @fromValue bigint
	
	IF (@feeType like 'Gold')
	BEGIN
		SELECT @fromValue = cash
			FROM workinguser
		WHERE userId = @userId
		
		UPDATE workinguser
			SET cash = cash - @fee
		WHERE userId = @userId
	END
	ELSE IF (@feeType like 'Xeng')
	BEGIN
		SELECT @fromValue = xeeng
			FROM workinguser
		WHERE userId = @userId
		
		UPDATE workinguser
			SET xeeng = xeeng - @fee
		WHERE userId = @userId
	END
	ELSE IF (@feeType like 'SPoint')
	BEGIN
		SELECT @fromValue = cash
			FROM workinguser
		WHERE userId = @userId
		
		UPDATE workinguser
			SET specialPoint = specialPoint - @fee
		WHERE userId = @userId
	END
	
	IF (@giftType like 'Gold' OR @giftType like 'SPoint')
	BEGIN
		SELECT @fromValue = cash
			FROM workinguser
		WHERE userId = @userId
		
		UPDATE workinguser
			SET cash = cash + @giftValue
		WHERE userId = @userId
	END
	ELSE IF (@giftType like 'Xeng')
	BEGIN
		SELECT @fromValue = xeeng
			FROM workinguser
		WHERE userId = @userId
		
		UPDATE workinguser
			SET xeeng = xeeng + @giftValue
		WHERE userId = @userId
	END
	
	-- Insert log
	DECLARE @message nvarchar(100)
	IF @giftValue = 0
	BEGIN
		SELECT @message = N'Chúc bạn may mắn lần sau'
	END
	ELSE
	BEGIN
		SELECT @message =  N'Đã nhận được ' + CAST(@giftValue AS nvarchar) + ' ' + @giftType
    END
	
	INSERT INTO xeLogEventGiftsHistory
	(userId, eventId, evgfCode, evitCode, value, type, message, useDate, fromValue, toValue, isLimitUsage)
	VALUES
	(@userId, @eventId, @evgfCode, @evitCode, @giftValue, @giftType, @message, GETDATE(), @fromValue, @fromValue + @giftValue, @isLimit)

	-- Update quantity of gift
	UPDATE xeEventGifts
		SET quantity = quantity - 1
	WHERE evgfCode like @evgfCode
	
	SELECT 1 AS result
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEMonthlyReport]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEMonthlyReport]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @month DATE = DATEADD(DAY, -1, GETDATE())

	INSERT INTO xeNumOfUserDeviceByOSMonthly
	(reportDate, os, num)
	SELECT @month, (osName + ' ' + osVersion) AS os, COUNT(osMAC) AS num
	FROM xeUserDevice
	WHERE DATEDIFF(MONTH, lastLogin, @month) = 0
	GROUP BY (osName + ' ' + osVersion)
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEModifyXeeng]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEModifyXeeng]
	-- Add the parameters for the stored procedure here
	@uid bigint,
	@offset bigint,
	@message ntext,
	@adminId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @oldXeeng bigint
    DECLARE @newXeeng bigint
    
    SELECT @oldXeeng = xeeng FROM workinguser where userId = @uid
    
    SET @newXeeng = @oldXeeng + @offset
    UPDATE workinguser SET xeeng = @newXeeng WHERE userId = @uid
    
    INSERT INTO XELogMoneyHistory
    (userId, moneyAfter, moneyDiff, moneyType, message, reason, modifyDate, refId)
    VALUES
    (@uid, @newXeeng, @offset, 1, @message, 0, GETDATE(), @adminId)

	INSERT INTO xeReportUserLog
	(userId, actionId, refId, logDate)
	VALUES
	(@adminId, 9, @uid, GETDATE())
    
    INSERT INTO logvasc
	(userId, DateTime, money, Description, LogTypeId, moneyType)
	VALUES
	(@uid, GETDATE(), @offset, 'Tool', 0, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEModifyCash]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEModifyCash]
	-- Add the parameters for the stored procedure here
	@uid bigint,
	@offset bigint,
	@message ntext,
	@adminId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @oldCash bigint
    DECLARE @newCash bigint
    
    SELECT @oldCash = cash FROM workinguser where userId = @uid
    
    SET @newCash = @oldCash + @offset
    UPDATE workinguser SET cash = @newCash WHERE userId = @uid
    
    INSERT INTO XELogMoneyHistory 
    (userId, moneyAfter, moneyDiff, moneyType, message, reason, modifyDate, refId)
    VALUES
    (@uid, @newCash, @offset, 0, @message, 0, GETDATE(), @adminId)

	INSERT INTO xeReportUserLog
	(userId, actionId, refId, logDate)
	VALUES
	(@adminId, 9, @uid, GETDATE())
    
    INSERT INTO logvasc
	(userId, DateTime, money, Description, LogTypeId, moneyType)
	VALUES
	(@uid, GETDATE(), @offset, 'Tool', 0, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[uspXELockUserAvatar]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXELockUserAvatar]
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@reportUserId int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE xeUserAvatar
	SET isLock = 1
	WHERE userId = @userId

	INSERT INTO xeReportUserLog
	(userId, actionId, refId, logDate)
	VALUES
	(@reportUserId, 6, @userId, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[uspXELockUser]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXELockUser]
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@numOfDay int,
	@reportUserId int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
    IF @numOfDay != 31337
    BEGIN
		UPDATE workinguser
		SET lockExpired = DATEADD(DAY, @numOfDay, GETDATE())
		WHERE userId = @userId
	END
	ELSE
	BEGIN
		UPDATE workinguser
		SET lockExpired = CONVERT(DATETIME, '03/31/2037', 101)
		WHERE userId = @userId
	END

	INSERT INTO xeReportUserLog
	(userId, actionId, refId, logDate)
	VALUES
	(@reportUserId, 2, @userId, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[uspXELockOrUnlockUser]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspXELockOrUnlockUser]
	-- Add the parameters for the stored procedure here
	@uid bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @isLock bit
	
	SELECT @isLock = isLock FROM workinguser WHERE userId = @uid
	
    IF @isLock = 1
    BEGIN
		SET @isLock = 0
    END
    ELSE
    BEGIN
		SET @isLock = 1
    END
    
    UPDATE workinguser
    SET isLock = @isLock
    WHERE userId = @uid
END
GO
/****** Object:  StoredProcedure [dbo].[uspXELockChatUser]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXELockChatUser]
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@numOfDay int,
	@reportUserId int = -1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    IF @numOfDay != 31337
    BEGIN
		UPDATE workinguser
		SET chatLockExpired = DATEADD(DAY, @numOfDay, GETDATE())
		WHERE userId = @userId
	END
	ELSE
	BEGIN
		UPDATE workinguser
		SET chatLockExpired = CONVERT(DATETIME, '03/31/2037', 101)
		WHERE userId = @userId
	END

	INSERT INTO xeReportUserLog
	(userId, actionId, refId, logDate)
	VALUES
	(@reportUserId, 4, @userId, GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEJoinEventItems]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Tham Thang
-- Create date: 30-Jul-2014
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEJoinEventItems] 
	-- Add the parameters for the stored procedure here
	@userId bigint,
	@itemCode nvarchar(10),
	@itemName nvarchar(50),
	@itemDescription nvarchar(256),
	@itemFee bigint,
	@eventId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON
	
	-- Check if user has not enough cash
	if (@itemFee > 0)
	BEGIN
		DECLARE @cash bigint
		SELECT @cash = cash
			FROM workinguser
		WHERE userId = @userId
		
		IF (@cash < @itemFee)
		BEGIN
			SELECT -1 AS result
			RETURN
		END
	END
	
    -- Update inventory of user
    if (@eventId = 1) -- Su kien Ghep Chu
    BEGIN
		DECLARE @times int = 2
		UPDATE xeInventory
			SET quantity = quantity - 1 * @times
		WHERE userId = @userId AND itemCode in ('evit_01', 'evit_03', 'evit_04')
	
		UPDATE xeInventory
			SET quantity = quantity - 2 * @times
		WHERE userId = @userId AND itemCode like 'evit_02'
    END
    ELSE IF (@eventId = 2) -- Su kien Banh deo
    BEGIN
		UPDATE xeInventory
			SET quantity = quantity - 2
		WHERE userId = @userId AND itemCode in ('evit_06', 'evit_07', 'evit_08', 'evit_09')
    END
    ELSE IF (@eventId = 3) -- Su kien Banh nuong
    BEGIN
		UPDATE xeInventory
			SET quantity = quantity - 1
		WHERE userId = @userId AND itemCode in ('evit_06', 'evit_07', 'evit_08', 'evit_09', 'csit_01')
    END
    ELSE IF (@eventId = 5) -- Su kien Tang nguoi Yeu thuong
    BEGIN
		UPDATE xeInventory
			SET quantity = quantity - 1
		WHERE userId = @userId AND itemCode in ('evit_12', 'evit_14')
		
		UPDATE xeInventory
			SET quantity = quantity - 9
		WHERE userId = @userId AND itemCode in ('evit_13')
    END
    ELSE IF (@eventId = 6) -- Su kien Nha giao Viet Nam
    BEGIN
		UPDATE xeInventory
			SET quantity = quantity - 5
		WHERE userId = @userId AND itemCode in ('evit_17', 'evit_18', 'evit_19')
		
		UPDATE xeInventory
			SET quantity = quantity - 1
		WHERE userId = @userId AND itemCode in ('evit_20', 'evit_21')
    END
    ELSE IF (@eventId = 7) -- Su kien Giang sinh may man
    BEGIN
		UPDATE xeInventory
			SET quantity = quantity - 1
		WHERE userId = @userId AND itemCode in ('evit_23', 'evit_26')
		UPDATE xeInventory
			SET quantity = quantity - 5
		WHERE userId = @userId AND itemCode in ('evit_24', 'evit_25')
    END
    ELSE IF (@eventId = 8) -- Su kien Giang sinh dac biet
    BEGIN
		UPDATE xeInventory
			SET quantity = quantity - 1
		WHERE userId = @userId AND itemCode in ('evit_23', 'evit_24', 'evit_25','evit_26','csit_02')
    END
    ELSE IF (@eventId = 10) -- Su kien Nam moi 2015
    BEGIN
		UPDATE xeInventory
			SET quantity = quantity - 1
		WHERE userId = @userId AND itemCode in ('evit_29', 'evit_30','evit_31', 'evit_32')
    END
    ELSE IF (@eventId = 11) -- Su kien Banh chung ngay Tet
    BEGIN
		UPDATE xeInventory
			SET quantity = quantity - 1
		WHERE userId = @userId AND itemCode in ('evit_34', 'evit_35')
		
		UPDATE xeInventory
			SET quantity = quantity - 4
		WHERE userId = @userId AND itemCode in ('evit_36', 'evit_37')
    END
    ELSE IF (@eventId = 12) -- Su kien banh chung dac biet
    BEGIN
		UPDATE xeInventory
			SET quantity = quantity - 1
		WHERE userId = @userId AND itemCode in ('evit_34', 'evit_35','evit_36', 'evit_37','csit_03')
		
    END
    ELSE
    BEGIN
		SELECT -1 AS result
		RETURN
    END
	
	DECLARE @id bigint
	SELECT @id = id	FROM xeInventory WHERE userId = @userId AND itemCode like @itemCode
	IF (@id > 0)
	BEGIN
		UPDATE xeInventory
			SET quantity = quantity + 1
		WHERE userId = @userId AND itemCode like @itemCode
	END
	ELSE
	BEGIN
		INSERT INTO xeInventory
		(userId, itemCode, quantity, isActive, name, description, isUsable)
		VALUES
		(@userId, @itemCode, 1, 1, @itemName, @itemDescription, 1)
	END
	
	-- Update user cash
	IF (@itemFee > 0)
	BEGIN
		UPDATE workinguser
			SET cash = cash - @itemFee
		WHERE userId = @userId
	END
	
	-- Insert log
	INSERT INTO xeLogJoinItemHistory
	(userId, eventId, itemCode, message, time)
	VALUES
	(@userId, @eventId, @itemCode, N'Nhận được 1 ' + @itemName, GETDATE())
	
	INSERT INTO logvasc
	(userId, DateTime, money, Description, LogTypeId, moneyType)
	VALUES
	(@userId, GETDATE(), -@itemFee, 'Join Event Item', 1339, 0)
	
	SELECT 1 AS result
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEInsertTransaction]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEInsertTransaction]
	@userId bigint,
	@transactionId nvarchar(300),
	@productId nvarchar(15)
AS
BEGIN
	DECLARE @newXeeng bigint;
	DECLARE @money bigint;
	DECLARE @description nvarchar(50);
	DECLARE @dtNow datetime;
	DECLARE @logTypeId int;
	
	SELECT @dtNow = GETDATE()
	SELECT @description = 'Buy from Google Play: ' + @productId
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- Insert statements for procedure here
	INSERT INTO [dbo].[XEGoogleTransaction] 
	VALUES (@userId, @transactionId, @productId);
	
	IF @@ROWCOUNT > 0
	BEGIN
		SELECT @newXeeng = xeeng 
		FROM [dbo].[workinguser] 
		WHERE userId = @userId;
		
		SELECT @logTypeId = LogTypeId, @money = money
		FROM [dbo].[logtype] 
		WHERE @productId = serviceCode
		
		insert into logvasc(userId, DateTime, money, Description, LogTypeId, PhoneNumber)
		 values(@userId, @dtNow, @money, @description, @logTypeID, null)

		declare @RevenueTypeId int =0
		
		
		select @RevenueTypeId = RevenueTypeId
			from RevenueType
		where provider = 'Xeeng' and ServiceCode = @productId
		
		insert into logRevenue(userId, revenueDate, description, revenueTypeId, money)
			values (@userId, @dtNow, @description, @RevenueTypeId, @money)
		
		SET @newXeeng+=@money;
			-- set @newCash+=@money;
			UPDATE WorkingUser
				SET xeeng = @newXeeng
				-- set cash = @newCash
			WHERE userId = @userId
			
		INSERT INTO XELogMoneyHistory
			(userId, moneyAfter, moneyDiff, moneyType, message, reason, modifyDate)
		VALUES
			(@userID, @newXeeng, @money, 1, @description, 6, @dtNow)
			
		INSERT INTO RefreshCache(namespace, value, isRefresh, keyCache) 
		values ('user', @newXeeng, 0, @userId)
			
		SELECT 1 AS result
	END
	
	SELECT 0 AS result
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetServiceCode]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspGetServiceCode]
as
	select * 
		from logtype
	where serviceCode is not null and serviceCode <>'register'
GO
/****** Object:  StoredProcedure [dbo].[uspGetAlertUser]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetAlertUser]
	@userId bigint
as
	set nocount on
	select * 
		from AlertUSer
	where userId = @userId and dateSend is null
	
	update AlertUSer
		set dateSend = GETDATE()
	where userId = @userId
GO
/****** Object:  StoredProcedure [dbo].[uspGetGoodCustomer]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[uspGetGoodCustomer]
as
	Declare @dtNow datetime
	
	select @dtNow = GETDATE()
	select @dtNow = DATEADD(day, -7, @dtNow)
	
	select lr.userId, u.Name, SUM(rt.VND) as money
		from LogRevenue lr inner join WorkingUser u on lr.userId = u.userId
			inner join RevenueType rt on lr.RevenueTypeId = rt.RevenueTypeId
	where DATEDIFF(day, @dtNow, lr.revenueDate)>0
	group by lr.userId, u.Name
	order by money desc
GO
/****** Object:  StoredProcedure [dbo].[uspGetCardInfo]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetCardInfo]
as
select * from logtype where partnerId = -1 OR money = 0
GO
/****** Object:  StoredProcedure [dbo].[uspGetAllRooms]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspGetAllRooms]
as
	select * from udvGetALlRoom order by zoneId
GO
/****** Object:  StoredProcedure [dbo].[uspFshProcCardRefCode]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspFshProcCardRefCode]
	@cardTxnId bigint,
	@amount varchar(100),
	@providerTxnId varchar(100),
	@statusId int,
	@serviceId nvarchar(100),
	@userId bigint,
	@additionalInfo nvarchar(max),
	@providerStatusId nvarchar(10),
	@providerName nvarchar(100)
as
	
	
	set nocount on
	declare @money int = 0
	Declare @NAP_TIEN_BONUS int =2
	Declare @partnerId int = 0;	
	
	if @statusId = 0
	begin
		declare @logtypeId int,
			--@userId bigint,
			@dtNow datetime,
			@description varchar(100),
			@infoTopup nvarchar(100)
		select @dtNow = GETDATE()
		select @description = @serviceId + ' ' + @amount
				
				
		select @partnerId=partnerId
		from [workinguser] where userid = @userId 
		
		-- gio vang km nap The
		declare @SMSPromotionRate float = 1
		select @SMSPromotionRate = COALESCE(externalParam, 1) from goldenhour where type=4 and isActive=1 and (@dtNow between fromDate and toDate) and (@partnerId=partnerId or partnerId=0)
	
		
		select @logtypeId = logtypeId, @money = money*@SMSPromotionRate
			from logtype
		where serviceCode = @serviceId and CommandCode = @amount

		DECLARE @oldXeeng bigint
		DECLARE @newXeeng bigint
		
		SELECT @oldXeeng = xeeng
		FROM workinguser
		WHERE userId = @userId
		
		SET @newXeeng = @oldXeeng + @money

		update WorkingUser
			set xeeng = @newXeeng
		where userId = @userId
		
		INSERT INTO XELogMoneyHistory
		(userId, moneyAfter, moneyDiff, moneyType, message, reason, modifyDate, refId)
		VALUES
		(@userID, @newXeeng, @money, 1, @description, 3, @dtNow, @cardTxnId)
		
		-- nguoi nap tien lan dau {
		IF NOT EXISTS(SELECT * FROM xeFirstCharging WHERE userId = @userID) 
		    AND @amount IS NOT NULL 
		    AND @amount != 0
		BEGIN
			DECLARE @amountInt int = 0
			SELECT @amountInt = CAST(@amount AS int)
			
			INSERT INTO xeFirstCharging
			(userId, chargingDate, amount, type)
			VALUES
			(@userID, @dtNow, @amountInt, 1)
		END
		-- } nguoi nap tien lan dau
		
		insert into logvasc(userId, DateTime, money, Description, LogTypeId)
		 values(@userId, @dtNow, @money, @description,  @logTypeID)
		
		select @infoTopup = N'Tài khoản của bạn đã nạp thành công ' + cast(@money as nvarchar) + ' Xeeng.'
			

		declare @revenueTypeId int = 0
				
		select 
			@revenueTypeId = RevenueTypeId 
		from RevenueType
		where ServiceCode = @description
		
		insert into logRevenue(userId, revenueDate, description, revenueTypeId, money)
		values (@userId, @dtNow, @description, @RevenueTypeId, @money)
		
		-- update VIP status
		declare @topupMOneyVND bigint
		declare @newVipId int = 0
		declare @ACTIVE_VIP int = 1
		declare @oldVipID int
		declare @newCash bigint
		
		select @oldVipID = COALESCE(vipId, 0), @newCash = cash
		   from WorkingUser
		where UserID = @userId
		
		select @topupMOneyVND = SUM(rt.vnd)
			from LogRevenue lr inner join RevenueType rt on lr.RevenueTypeId = rt.RevenueTypeId
		where lr.userId = @userId	
		
		select top(1) @newVipId = vipId 
			from VIP
		 where limitVND <= @topupMOneyVND and vipId <> @ACTIVE_VIP
		 order by vipId desc
		 
		/*if @oldVipID < @newVipId
		begin 
			Declare @bonusMOney int
			Declare @vipName nvarchar(100)
			
			select @bonusMOney = bonusMoney + bonusPercent * @money, @vipName = name
				from VIP
			where vipId = @newVipId
		
			update WorkingUser
				set cash = cash + @bonusMoney, vipId = @newVipId
			where userId = @userId
		
			select @newCash = cash
				from WorkingUser
			where userId = @userId
			
			insert into logvasc(userId, DateTime, money, Description, LogTypeId)
				values(@userId, @dtNow, @bonusMOney,'thuong tang vip',  20002)
			
			Declare @vipDesc nvarchar(256)
			select @vipDesc =N'Bạn trở thành: ' + @vipName + N' . Bạn được thưởng thêm: '+ + cast(@bonusMOney as nvarchar(30))
		
		end*/
		
		insert into RefreshCache(namespace, value, isRefresh, keyCache) 
			values ('user', @newCash, 0, @userId)
				
		end
		
		update CardTxn
			set amount = @amount,
				providerTxnId = @providerTxnId,
				statusId = @statusId,
				paymentDate = GETDATE(),
				additionalInfo = @additionalInfo,
				providerStatusId = @providerStatusId,
				gotMoney = @money,
				providerName = @providerName
		where CardTxnId = @cardTxnId
		
		DECLARE @specialPoint int
		
		SELECT @specialPoint = @amount / 10000
		
		UPDATE workinguser SET specialPoint = ISNULL(specialPoint,0) + @specialPoint 
		WHERE userId = @userId

		select * 
			from CardTxn
		where CardTxnId = @cardTxnId
GO
/****** Object:  StoredProcedure [dbo].[uspClearLogin]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspClearLogin]
as
	set nocount on
	declare @exp int
	declare @userID bigint 
	
	update workingUser set isOnline = 0
	
	declare @dt datetime 
	
	select @dt= GETDATE()
	
	--update level
	create table #temp(
		userID bigint,
		experience int
	)
	
	insert into #temp
		select  userId, SUM(experience)
			from logvasc
		where dateCalExp is null and experience is not null				
		group by userId	
	
	DECLARE userCursor CURSOR FOR
		SELECT UserId FROM #temp	

	OPEN userCursor
	FETCH NEXT FROM userCursor
	INTO @UserId
	
	WHILE @@FETCH_STATUS = 0
	BEGIN	
		 select @exp = experience
			from #temp
		 where userID = @UserId
		 
		 Declare @oldLevelId int 
		 Declare @newLevelId int 
		 Declare @bonusUpperLevel int
		 
		 select @oldLevelId = level
			from workingUser
			where UserID = @UserId 
			
		 update WorkingUser
			set experience = experience + @exp			
		 where userId = @userID
		 	
		 select @newLevelId = dbo.udfGetUserLevel(@UserId)
		 
		 if @oldLevelId < @newLevelId
		 begin
		 
	     update workingUser
		 set  level = @newLevelId
		 where UserID = @userID
			
	     if exists (select userId from WorkingUser where userId = @userID and COALESCE(vipId, 0) > 0)
			 begin	
			 		
				if @newLevelId > @oldLevelId
				
				begin
					Declare @levelDesc nvarchar(200)
						
					select @bonusUpperLevel = bonusUpperLevel, @levelDesc = Description
						from level
					where LevelID = @newLevelId
						
					update workingUser
						set Cash = Cash + @bonusUpperLevel
					where UserID = @UserId;

			
					insert into logvasc(UserID, DateTime, Money, Description, LogTypeId) values(@UserId, GETDATE(), @bonusUpperLevel, 'Increase level', 3000);
										
				end
			end
		end
		   -- This is executed as long as the previous fetch succeeds.
		FETCH NEXT FROM userCursor
		INTO @userId;
	END
	
	CLOSE userCursor;
	DEALLOCATE userCursor;
	drop table #temp
	
	-- update logvasc
	update logvasc set dateCalExp =@dt where dateCalExp is null

	-- update cash
	--update workingUser
	--set cash = 1000
	--where cash < 1000
	
	-- remove log sau 2 thang
	--select @dt = DATEADD(day, -60, @dt)
	--delete logvasc where DateTime < @dt
GO
/****** Object:  StoredProcedure [dbo].[uspCreateChargingInfo]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspCreateChargingInfo]
as
    select l.LogTypeId as 'id', l.serviceCode as 'number', 
    l.CommandCode as 'value', l.Description, l.partnerId,  
    p.isNeedActive, COALESCE(l.isActive, 0) as 'isActive'
    from logtype l inner join Partner p on p.partnerId = l.partnerId
	where isSms = 1 and l.isActive = 1 order by id desc
GO
/****** Object:  StoredProcedure [dbo].[uspActivateUser]    Script Date: 03/17/2015 16:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspActivateUser]
	@userId bigint,
	@phoneNumber varchar(12),
	@commandCode varchar(50),
	@dauso varchar(10)
	
as
	
	set nocount on
	
	--Declare @bonusUserId bigint 
	Declare @bonusCash int = 0
	Declare @logTypeId int
	declare @dbUsrName nvarchar(100)
	Declare @VIETTEL_PREFIX_09 varchar(15)='849[876]%',
			@VIETTEL_PREFIX_01 varchar(15)='84[1]6%',
			@VINAPHONE_PREFIX_09 varchar(15)='849[14]%',
			@VINAPHONE_PREFIX_01 varchar(15)='8412[34579]%',
			@MOBIFONE_PREFIX_09 varchar(15)='849[03]%',
			@MOBIFONE_PREFIX_01 varchar(15)='8412[01268]%',
			@BEELINE_PREFIX varchar(15)='84[19]9%',
			@VIETNAMOBILE_PREFIX_09 varchar(15)='8492%',
			@VIETNAMOBILE_PREFIX_01 varchar(15)='8418%'
	
	Declare @serviceId varchar(100)
	declare @dtNow datetime
	Declare @description varchar(100)
	Declare @newCash bigint 
	select @dtNow = GETDATE()
	select @description = @CommandCode + ' ' + @dauso
	
	
	select @bonusCash = money, @logTypeId = LogTypeId
		from logtype
	where commandCode = @commandCode and  serviceCode = @dauso
	

	
	/*
	select @bonusUserId = userId
		from userLink
	where friendId = @userId and status <>'activated' and @phoneNumber not in (select phoneNumber
																					from logvasc
																				where logtypeid = @logTypeId)		
	
	*/
	
	-- log money
	insert into logvasc(UserID, DateTime, Money, Description, LogTypeId, PhoneNumber) 
	  values (@userId, @dtNow, @bonusCash, @description + @dauso, @logTypeId, @phoneNumber)
	  
	if @bonusCash is not null
	begin
		update [user]
			set PhoneNumber = @phoneNumber, isActive = 1
		where UserID = @userId
	
		update userstt 
			set Cash = Cash + @bonusCash
		where UserID = @userId
		
		update WorkingUser
			set cash = cash + @bonusCash, isActive = 1
		where userId = @userId
		
		

	end	  
	  
	/*
	if @bonusCash is not null
	begin
		update [user]
			set PhoneNumber = @phoneNumber
		where UserID = @userId
	
		update userstt 
			set Cash = Cash + @bonusCash
		where UserID = @userId
		
		if @bonusUserId is not null
		begin
			
			update userstt
				set Cash = Cash + 1000
			where UserID = @bonusUserId
			
			declare @userName varchar(256),
					@bonusUserName varchar(256),
					@message nvarchar(256),
					@friendMessage nvarchar(256)
			
			select
				@userName = name
			from [User] 
			where UserID = @userId
			
			select
				@bonusUserName = name
			from [User] 
			where UserID = @bonusUserId
			
			exec uspInsertFriend @userId, @bonusUserId
			
			select @message = N'Bạn được thưởng ' + cast(1000 as nvarchar(30)) + 
			N' Pi vì bạn của bạn là: '  + @bonusUserName + N' đã kích hoạt thành công'
			
			select @friendMessage = N'Bạn của bạn là: ' + @userName + ' cũng đang chơi game này'
			
			exec uspAdminInform @UserId, @message,@message  
			exec uspAdminInform @UserId, @friendMessage,@friendMessage  
			
			update userLink
				set status = 'activated'
			where friendId = @userId
			
		end	
	
	end
	else
	begin
		declare 
			@incorrectActive nvarchar(256)
		
		select @incorrectActive = N'Đầu số active không đúng'
		exec uspAdminInform @UserId, @incorrectActive,@incorrectActive  
		
	end
	*/
	
	--write log revenue for report
	if (@PhoneNumber like  @VIETTEL_PREFIX_09) or (@PhoneNumber like  @VIETTEL_PREFIX_01)
		select @serviceId = 'viettel'
	
	else if (@PhoneNumber like  @MOBIFONE_PREFIX_09) or (@PhoneNumber like  @MOBIFONE_PREFIX_01)
		select @serviceId = 'mobifone'
	else if @PhoneNumber like  @BEELINE_PREFIX
		select @serviceId = 'beeline'
	else if (@PhoneNumber like  @VINAPHONE_PREFIX_09) or (@PhoneNumber like  @VINAPHONE_PREFIX_01)
		select @serviceId = 'vinaphone'
	else if (@PhoneNumber like  @VIETNAMOBILE_PREFIX_09) or (@PhoneNumber like  @VIETNAMOBILE_PREFIX_01)
		select @serviceId = 'vietnamobile'
	
	declare @RevenueTypeId int =0
	
	select @RevenueTypeId = RevenueTypeId
		from RevenueType
	where provider = @serviceId and ServiceCode = @dauso
	
	insert into logRevenue(userId, revenueDate, description, revenueTypeId, money, phoneNumber)
		values (@userId, @dtNow, @description, @RevenueTypeId, @bonusCash, @PhoneNumber )
		
		
	
	-- update VIP status
	declare @topupMOneyVND bigint
	declare @ACTIVE_VIP int = 1
	declare @oldVipID int
	
	
	select @oldVipID = COALESCE(vipId, 0), @newCash = cash, @dbUsrName = name
	   from WorkingUser
	where UserID = @userId
	
	if @oldVipID = 0
		select @oldVipID = COALESCE(vipId, 0), @newCash = cash
			from userstt
		where UserID = @userId
	
	 
	if @oldVipID < @ACTIVE_VIP  and @bonusCash is not null--active
	begin 
		

		update userstt 
			set VipID = @ACTIVE_VIP
		where UserID = @userId	
		
		update WorkingUser 
			set VipID = @ACTIVE_VIP
		where UserID = @userId	
		
			
	end
	
	insert into RefreshCache(namespace, value, isRefresh, keyCache) 
		values ('userActive', @newCash, 0, @userId)
	
	
	--- bonus money
	declare @bonusUserId bigint = -1
	select @bonusUserId = userId
		from GioiThieu
	where successId = @userId
	
	if @bonusUserId >0
	begin
		Declare @bonusGTMoney bigint
		
		select @bonusGTMoney = @bonusCash/2
		
		update userstt 
			set  cash = cash + @bonusGTMoney
		where UserID = @bonusUserId	
		
		update WorkingUser
			set cash = cash + @bonusGTMoney
		where userId = @bonusUserId
		
		
		insert into logGioithieu(userId, timeTopup, money,phoneNumber, bonusUserId)
		    values(@bonusUserId, @dtNow, @bonusGTMoney, null, @userId)
		/*
		insert into logvasc(userId, DateTime, money, Description, LogTypeId)
		 values(@bonusUserId, @dtNow, @bonusGTMoney,'gioi thieu',  20004)
		*/
		
		
		
		insert into message(sourceID, destID, detail, status, time,title) 
			values (@bonusUserId, @bonusUserId, N'Bạn được hưởng : '+ + cast(@bonusGTMoney as nvarchar(30)) + N' vì bạn ' + @dbUsrName + N' đã nạp tiền', 0, getDate(), N'Thưởng cho VIP')
		
		declare @bonusUserCash bigint
		
		select @bonusUserCash = cash
			from WorkingUser
		where userId = @bonusUserId
		
		insert into RefreshCache(namespace, value, isRefresh, keyCache) 
			values ('user', @bonusUserCash, 0, @bonusUserId)
	
		
	end
GO
/****** Object:  StoredProcedure [dbo].[uspMonitorMoney]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspMonitorMoney]
	@dt datetime = null
as
	declare @now datetime
	
	
	if @dt is null
		select @now = GETDATE()
	else
		select @now = @dt
	
	select SUM(money)
		from logRevenue 
	where  DATEDIFF(day, @now, revenueDate) = 0
	

	select u.UserID, u.Name, money, l.Description, l.phonenumber,  revenueDate 
		from logRevenue l inner join WorkingUser u on u.UserID = l.UserID
		where DATEDIFF(day, @now, revenueDate) = 0
	order by revenueDate desc
GO
/****** Object:  StoredProcedure [dbo].[uspXEChargingDailyReport]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEChargingDailyReport]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	DECLARE @today datetime = GETDATE()
	DECLARE @reportDate date = DATEADD(DAY, -1, @today)
	
	DECLARE @paidUser int
	DECLARE @googlePlayCPIPaidUser int
	DECLARE @appotaAndroidPaidUser int
	DECLARE @appotaIOSPaidUser int
	DECLARE @appStorePaidUser int
	DECLARE @googlePlayPaidUser int
	DECLARE @mobigatePaidUser int
	DECLARE @mobihubPaidUser int
	DECLARE @mobigateCPIPaidUser int
	
	DECLARE @googlePlayCPINewPayer int
	DECLARE @appotaAndroidNewPayer int
	DECLARE @appotaIOSNewPayer int
	DECLARE @appStoreNewPayer int
	DECLARE @googlePlayNewPayer int
	DECLARE @mobigateNewPayer int
	DECLARE @mobihubNewPayer int
	DECLARE @mobigateCPINewPayer int
	
	-- ################################
	-- # Number of unique payers
	-- ################################
	DECLARE @numOfPayer int
	DECLARE @numOfPayerDaily int
	DECLARE @numOfNewPayerDaily int
	DECLARE @revenueOfNewPayerBySMSDaily int
	DECLARE @revenueOfNewPayerByCardDaily int
	
	SELECT @numOfPayer = COUNT(DISTINCT [userId])
	FROM XELogMoneyHistory
	WHERE reason in (2, 3)
		AND DATEDIFF(MONTH, modifyDate, @today) = 0
		AND DATEDIFF(SECOND, modifyDate, @today) >= 0
		
	SELECT @numOfPayerDaily = COUNT(DISTINCT [userId])
	FROM XELogMoneyHistory
	WHERE reason in (2, 3)
		AND DATEDIFF(DAY, modifyDate, @reportDate) = 0
		
	SELECT DISTINCT(workinguser.userid), partnerId
	INTO #paidUser
	FROM XELogMoneyHistory JOIN workinguser ON XELogMoneyHistory.userId = workinguser.userId
	WHERE DATEPART(dy, modifyDate) = DATEPART(dy, @today) - 1
		AND reason IN (2,3,6)
		AND moneyType = 1
		AND moneyDiff > 0
		
	-- Paid user by partner
	SELECT @paidUser = COUNT(*)	FROM #paidUser
	SELECT @googlePlayCPIPaidUser = COUNT(*)	FROM #paidUser WHERE LEFT(partnerId,2) = 99
	SELECT @appotaIOSPaidUser = COUNT(*)	FROM #paidUser WHERE partnerId = 92
	SELECT @appotaAndroidPaidUser = COUNT(*)	FROM #paidUser WHERE partnerId = 93
	SELECT @appStorePaidUser = COUNT(*)	FROM #paidUser WHERE partnerId = 94
	SELECT @googlePlayPaidUser = COUNT(*)	FROM #paidUser WHERE partnerId = 95
	SELECT @mobigatePaidUser = COUNT(*)	FROM #paidUser WHERE partnerId = 96
	SELECT @mobihubPaidUser = COUNT(*)	FROM #paidUser WHERE partnerId = 97
	SELECT @mobigateCPIPaidUser = COUNT(*)	FROM #paidUser WHERE partnerId = 98
		
	SELECT @numOfNewPayerDaily = COUNT(*)
	FROM xeFirstCharging
	WHERE DATEDIFF(DAY, chargingDate, @reportDate) = 0 -- lan tra tien dau tien vao ngay hom qua
	
	SELECT @googlePlayCPINewPayer = COUNT(*)
	FROM xeFirstCharging JOIN workinguser ON xeFirstCharging.userId = workinguser.userId
	WHERE DATEDIFF(DAY, chargingDate, @reportDate) = 0 -- lan tra tien dau tien vao ngay hom qua
	AND LEFT(workinguser.partnerId,2) = 99
	
	SELECT @appotaIOSNewPayer = COUNT(*)
	FROM xeFirstCharging JOIN workinguser ON xeFirstCharging.userId = workinguser.userId
	WHERE DATEDIFF(DAY, chargingDate, @reportDate) = 0 -- lan tra tien dau tien vao ngay hom qua
	AND workinguser.partnerId = 92
	
	SELECT @appotaAndroidNewPayer = COUNT(*)
	FROM xeFirstCharging JOIN workinguser ON xeFirstCharging.userId = workinguser.userId
	WHERE DATEDIFF(DAY, chargingDate, @reportDate) = 0 -- lan tra tien dau tien vao ngay hom qua
	AND workinguser.partnerId = 93
	
	SELECT @appStoreNewPayer = COUNT(*)
	FROM xeFirstCharging JOIN workinguser ON xeFirstCharging.userId = workinguser.userId
	WHERE DATEDIFF(DAY, chargingDate, @reportDate) = 0 -- lan tra tien dau tien vao ngay hom qua
	AND workinguser.partnerId = 94
	
	SELECT @googlePlayNewPayer = COUNT(*)
	FROM xeFirstCharging JOIN workinguser ON xeFirstCharging.userId = workinguser.userId
	WHERE DATEDIFF(DAY, chargingDate, @reportDate) = 0 -- lan tra tien dau tien vao ngay hom qua
	AND workinguser.partnerId = 95
	
	SELECT @mobigateNewPayer = COUNT(*)
	FROM xeFirstCharging JOIN workinguser ON xeFirstCharging.userId = workinguser.userId
	WHERE DATEDIFF(DAY, chargingDate, @reportDate) = 0 -- lan tra tien dau tien vao ngay hom qua
	AND workinguser.partnerId = 96
	
	SELECT @mobihubNewPayer = COUNT(*)
	FROM xeFirstCharging JOIN workinguser ON xeFirstCharging.userId = workinguser.userId
	WHERE DATEDIFF(DAY, chargingDate, @reportDate) = 0 -- lan tra tien dau tien vao ngay hom qua
	AND workinguser.partnerId = 97
	
	SELECT @mobigateCPINewPayer = COUNT(*)
	FROM xeFirstCharging JOIN workinguser ON xeFirstCharging.userId = workinguser.userId
	WHERE DATEDIFF(DAY, chargingDate, @reportDate) = 0 -- lan tra tien dau tien vao ngay hom qua
	AND workinguser.partnerId = 98
		
	SELECT @revenueOfNewPayerBySMSDaily = ISNULL(SUM(amount), 0)
	FROM xeFirstCharging
	WHERE type = 0
	    AND DATEDIFF(DAY, chargingDate, @reportDate) = 0 -- lan tra tien dau tien vao ngay hom qua
	    
	SELECT @revenueOfNewPayerByCardDaily = ISNULL(SUM(amount), 0)
	FROM xeFirstCharging
	WHERE type = 1
	    AND DATEDIFF(DAY, chargingDate, @reportDate) = 0 -- lan tra tien dau tien vao ngay hom qua

	INSERT INTO xeChargingMonthlyStatistics
	(executeDate, reportDate, numOfPayer, numOfPayerDaily, numOfNewPayerDaily, revenueOfNewPayerBySMSDaily, revenueOfNewPayerByCardDaily,
    payerGooglePlayCPI, payerAppotaAndroid, payerAppotaIOS, payerAppStore, payerGooglePlay, payerMobigate, payerMobiHub, payerMobigateCPI,
    newPayerGooglePlayCPI, newPayerAppotaAndroid, newPayerAppotaIOS, newPayerAppStore, newPayerGooglePlay, newPayerMobigate, newPayerMobiHub, newPayerMobigateCPI)
	VALUES
	(@today, @reportDate, @numOfPayer, @numOfPayerDaily, @numOfNewPayerDaily, @revenueOfNewPayerBySMSDaily, @revenueOfNewPayerByCardDaily,
	@googlePlayCPIPaidUser, @appotaAndroidPaidUser, @appotaIOSPaidUser, @appStorePaidUser, @googlePlayPaidUser, @mobigatePaidUser, @mobihubPaidUser, @mobigateCPIPaidUser,
	@googlePlayCPINewPayer, @appotaAndroidNewPayer, @appotaIOSNewPayer, @appStoreNewPayer, @googlePlayNewPayer, @mobigateNewPayer, @mobihubNewPayer, @mobigateCPINewPayer)
	
	-- ################################
	-- # SMS Count
	-- ################################
	INSERT INTO xeChargingMoneyStatistics
	(executeDate, reportDate, itemType, itemMoney, itemCount)
	SELECT @today, @reportDate, 2, revenuetype.VND, COUNT(revenuetype.VND)
	FROM logrevenue, revenuetype
	WHERE logrevenue.RevenueTypeId = revenuetype.RevenueTypeId
	    AND logrevenue.RevenueTypeId IN (3, 4)
	    AND DATEDIFF(MONTH, revenueDate, @reportDate) = 0
	GROUP BY revenuetype.VND
	
	
	-- ################################
	-- # Card Count
	-- ################################
	INSERT INTO xeChargingMoneyStatistics
	(executeDate, reportDate, itemType, itemMoney, itemCount)
	SELECT @today, @reportDate, 3, amount, COUNT(amount)
	FROM cardtxn
	WHERE amount IS NOT NULL
	    AND amount != 0
	    AND DATEDIFF(MONTH, paymentDate, @reportDate) = 0
	GROUP BY amount
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetRevenueByPlatform]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetRevenueByPlatform]
	-- Add the parameters for the stored procedure here
	@revenueMonth datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @revenue int
	
	CREATE TABLE #temp
    (
        os   varchar(20) NOT NULL,
        num int
    );
	
    -- Insert statements for procedure here
	SELECT @revenue = SUM(logrevenue.money) 
	FROM logrevenue, workinguser  
	WHERE logrevenue.userId = workinguser.userId AND mobileVersion LIKE '%java%'
		AND DATEDIFF(MONTH, revenueDate, @revenueMonth) = 0
	
	INSERT INTO #temp (os, num) VALUES ('java',@revenue)
	
	SELECT @revenue = SUM(logrevenue.money) 
	FROM logrevenue, workinguser  
	WHERE logrevenue.userId = workinguser.userId AND mobileVersion LIKE '%android%'
		AND DATEDIFF(MONTH, revenueDate, @revenueMonth) = 0
	
	INSERT INTO #temp (os, num) VALUES ('android',@revenue)
	
	SELECT @revenue = SUM(logrevenue.money) 
	FROM logrevenue, workinguser  
	WHERE logrevenue.userId = workinguser.userId AND mobileVersion LIKE '%ios%'
		AND DATEDIFF(MONTH, revenueDate, @revenueMonth) = 0
	
	INSERT INTO #temp (os, num) VALUES ('ios',@revenue)
	
	SELECT @revenue = SUM(logrevenue.money) 
	FROM logrevenue, workinguser  
	WHERE logrevenue.userId = workinguser.userId 
		AND mobileVersion NOT LIKE '%java%'
		AND mobileVersion NOT LIKE '%android%'
		AND mobileVersion NOT LIKE '%ios%'
		AND DATEDIFF(MONTH, revenueDate, @revenueMonth) = 0
	
	INSERT INTO #temp (os, num) VALUES ('other',@revenue)
	
	SELECT * FROM #temp
END
GO
/****** Object:  StoredProcedure [dbo].[uspXEGetNumOfPaidUserByPlatform]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEGetNumOfPaidUserByPlatform]
	-- Add the parameters for the stored procedure here
	@reportMonth date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	CREATE TABLE #temp
    (
        os   varchar(20) NOT NULL,
        num int
    );
	
	DECLARE @noOfUser int
	
    -- Insert statements for procedure here
	SELECT @noOfUser = COUNT(DISTINCT workinguser.userId)
	FROM logrevenue, workinguser  
	WHERE logrevenue.userId = workinguser.userId AND mobileVersion LIKE '%java%'
		AND DATEDIFF(MONTH, revenueDate, @reportMonth) = 0
	
	INSERT INTO #temp (os, num) VALUES ('java',@noOfUser)
	
	SELECT @noOfUser = COUNT(DISTINCT workinguser.userId)
	FROM logrevenue, workinguser  
	WHERE logrevenue.userId = workinguser.userId AND mobileVersion LIKE '%android%'
		AND DATEDIFF(MONTH, revenueDate, @reportMonth) = 0
	
	INSERT INTO #temp (os, num) VALUES ('android',@noOfUser)
	
	SELECT @noOfUser = COUNT(DISTINCT workinguser.userId)
	FROM logrevenue, workinguser  
	WHERE logrevenue.userId = workinguser.userId AND mobileVersion LIKE '%ios%'
		AND DATEDIFF(MONTH, revenueDate, @reportMonth) = 0
	
	INSERT INTO #temp (os, num) VALUES ('ios',@noOfUser)
		
	SELECT @noOfUser = COUNT(DISTINCT workinguser.userId)
	FROM logrevenue, workinguser  
	WHERE logrevenue.userId = workinguser.userId 
		AND mobileVersion NOT LIKE '%java%'
		AND mobileVersion NOT LIKE '%ios%'
		AND mobileVersion NOT LIKE '%android%'
		AND DATEDIFF(MONTH, revenueDate, @reportMonth) = 0
	
	INSERT INTO #temp (os, num) VALUES ('others',@noOfUser)	
	SELECT * FROM #temp
END
GO
/****** Object:  StoredProcedure [dbo].[uspTopupCashBySMS]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspTopupCashBySMS]
	@partner int,
	@partnerPass varchar(100),
	@phoneNumber varchar(20),
	@userID bigint,
	@username varchar(50),
	@keyword varchar(50),
	@shortCode varchar(50)
	
	
AS
    set  nocount on
	declare @dtNow datetime
	Declare @description varchar(100)
	declare @money int = 0
	Declare @logTypeID int
	Declare @isActive bit
	declare @dbUsrName nvarchar(100)
	Declare @partnerId int

	declare @totalMoney int = 0
	declare @result varchar(200)
	
	declare @randomNumber bigint = 0
	
	select @dtNow = GETDATE()
	select @description = @keyword + ' ' + @shortCode
	if(@userID>0) 
	begin
		if exists (select userId from WorkingUser where userId = @userID)
		begin
			select @dbUsrName = name, @partnerId = partnerId
				from WorkingUser
				where userId = @userID
		end
		else
		begin
			select @result= '-2'	 
			select @result as 'result'
			return
		end
	end else
	begin	
		if exists (select userId from WorkingUser where name = @username)
		begin
			select @dbUsrName = name, @partnerId = partnerId, @userID=userId
				from WorkingUser
				where name = @username
		end
		else
		begin
			select @result= '-2'	 
			select @result as 'result'
			return
		end
	end
	
	-- gio vang km nap SMS
	declare @SMSPromotionRate float = 1
	select @SMSPromotionRate = COALESCE(externalParam, 1.0) from goldenhour where type=3 and isActive=1 and (@dtNow between fromDate and toDate) and (@partnerId=partnerId or partnerId=0)
	
	
	select @money = money, @logTypeID = LogTypeId, @isActive = isActive
		from logtype
	where serviceCode = @shortCode and CommandCode = @keyword
	
	SELECT @money = @money * @SMSPromotionRate
	--active
	-- if @isActive = 1
	-- begin
	    -- Declare @currVipId int
	    -- Declare @chargePhoneNumber varchar(100)
		-- Declare @wasActive int
	    -- select @currVipId = COALESCE(vipId, 0),@chargePhoneNumber = phoneNumber, @wasActive = COALESCE(isActive, 0)
		    -- from WorkingUser
	    -- where userId = @userID
	    -- if(@wasActive=1)
		-- begin 
			-- select @result= '-6'	 
			-- select @result as 'result'
			-- return
		-- end
	    -- if(@chargePhoneNumber!=@phoneNumber)
		-- begin
		    -- select @result= '-5'	 
			-- select @result as 'result'
			-- return
	    -- end
	    -- if @currVipId = 0	
		    -- update WorkingUser
			    -- set isActive = @isActive, vipId = 1
		    -- where userId = @userID
		-- else
			-- update WorkingUser
			  -- set isActive = @isActive
			-- where userId = @userID			   		     	   
	-- end   
		
	insert into logvasc(userId, DateTime, money, Description, LogTypeId, PhoneNumber)
		 values(@userId, @dtNow, @money,@description,  @logTypeID, null)


	declare @RevenueTypeId int =0
	
	
	select @RevenueTypeId = RevenueTypeId
		from RevenueType
	where provider = @keyword and ServiceCode = @shortCode
	
	
	insert into logRevenue(userId, revenueDate, description, revenueTypeId, money, phoneNumber)
		values (@userId, @dtNow, @description, @RevenueTypeId, @money, @PhoneNumber )

	-- update VIP status
	declare @topupMOneyVND bigint
	declare @newVipId int = 0
	declare @oldVipID int
	declare @ACTIVE_VIP int = 1
	-- declare @newCash bigint
	declare @newXeeng bigint
	
	select @oldVipID = COALESCE(vipId, 0), @newXeeng = xeeng -- @newCash = cash
	   from WorkingUser
	where UserID = @userId
	
	select @topupMOneyVND = SUM(rt.vnd)
		from LogRevenue lr inner join RevenueType rt on lr.RevenueTypeId = rt.RevenueTypeId
	where lr.userId = @userId	
	
	/*
	select top(1) @newVipId = vipId 
		from VIP
	 where limitVND <= @topupMOneyVND and vipId <> @ACTIVE_VIP
	 order by vipId desc
	 */
	 
	 /*
	if @oldVipID < @newVipId
	begin 
		Declare @bonusMOney int
		Declare @vipName nvarchar(100)
		
		select @bonusMOney = bonusMoney + bonusPercent * @money, @vipName = name
			from VIP
		where vipId = @newVipId

		set @newXeeng+=@bonusMOney;
		-- set @newCash+=@bonusMOney;

		update WorkingUser
			set xeeng = @newXeeng, vipID = @newVipId
			-- set cash = @newCash, VipID = @newVipId
		where userId = @userId
	
		insert into logvasc(userId, DateTime, money, Description, LogTypeId)
		 values(@userId, @dtNow, @bonusMOney,'thuong tang vip',  20002)
	end
	else
	begin
	*/
		set @newXeeng+=@money;
		-- set @newCash+=@money;
		update WorkingUser
			set xeeng = @newXeeng
			-- set cash = @newCash
		where userId = @userId
		
		INSERT INTO XELogMoneyHistory
		(userId, moneyAfter, moneyDiff, moneyType, message, reason, modifyDate, refId)
		VALUES
		(@userID, @newXeeng, @money, 1, @description, 2, @dtNow, @phoneNumber)
		
		-- nguoi nap tien lan dau {
		IF NOT EXISTS(SELECT * FROM xeFirstCharging WHERE userId = @userID)
		BEGIN
			DECLARE @amount int = 0
			SELECT @amount = VND
			FROM revenuetype
			WHERE provider = @keyword and ServiceCode = @shortCode
			
			INSERT INTO xeFirstCharging
			(userId, chargingDate, amount, type)
			VALUES
			(@userID, @dtNow, @amount, 0)
		END
		-- } nguoi nap tien lan dau
		
	/*end*/
	if @isActive = 1
		BEGIN
			-- neu user active thi cap so may man
			set @randomNumber = ROUND(((99999-10000-1)*RAND() + 10000),0);
			insert into LuckyNumber(userid,luckyNumber,luckyTime) 
			values(@userID, @randomNumber,@dtNow)
			insert into RefreshCache(namespace, value, isRefresh, keyCache) 
			values ('userActive', @newXeeng, 0, @userId)
			-- values ('userActive', @newCash, 0, @userId)
		END;
	else
	
	insert into RefreshCache(namespace, value, isRefresh, keyCache) 
		values ('user', @newXeeng, 0, @userId)
		-- values ('user', @newCash, 0, @userId)	

	select @result=  (cast(@money as varchar) + '|' +@dbUsrName +'|' +(cast(@randomNumber as varchar)))
	select @result as 'result'
GO
/****** Object:  StoredProcedure [dbo].[uspReportGetDailyStat]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspReportGetDailyStat]
  @day date = null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

/* sms count */
update reportdailystat
set smsCount = t2.total
from ReportDailyStat t1,(select mDate day, SUBSTRING(t.mHour,1,2) hour, COUNT(*) total from
 (select convert(varchar(10),revenueDate, 101) as mDate, LogRevenue.description,
  convert(varchar(10),revenueDate, 108) as mHour 
  from LogRevenue  
  inner join logtype 
  on LogRevenue.RevenueTypeId = logtype.LogTypeId
  where DATEDIFF(DAY,revenueDate,GETDATE()) = 1 AND isCard is NULL) as t
  Group by t.mDate, SUBSTRING(t.mHour,1,2)  
) t2 
where t1.day = t2.day and t1.hour = t2.hour;    

/* card count */
update ReportDailyStat
set cardCount = t2.total
from ReportDailyStat t1,(select mDate day, SUBSTRING(t.mHour,1,2) hour, COUNT(*) total from
 (select convert(varchar(10),revenueDate, 101) as mDate, LogRevenue.description,
  convert(varchar(10),revenueDate, 108) as mHour 
  from LogRevenue  
  inner join logtype 
  on LogRevenue.RevenueTypeId = logtype.LogTypeId
  where DATEDIFF(DAY,revenueDate,GETDATE()) = 1 AND isCard is not NULL) as t
  Group by t.mDate, SUBSTRING(t.mHour,1,2)  
) t2 
where t1.day = t2.day and t1.hour = t2.hour;

/* Thong ke luot user choi game theo gio: SAM */
update ReportDailyStat
set samCount = t2.total
from ReportDailyStat t1,(select convert(varchar(10),DateTime, 101) as day,
substring(convert(varchar(10),DateTime, 108),1,2) as hour,COUNT(*) total 
FROM logvasc
where LogTypeId = 20
and DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101), 
substring(convert(varchar(10),DateTime, 108),1,2) 
) t2 
where t1.day = t2.day and t1.hour = t2.hour;

/* sam money */
update ReportDailyStat
set samMoney = (0 - t2.total)
from ReportDailyStat t1,(
select convert(varchar(10),DateTime, 101) as day,                                  
substring(convert(varchar(10),DateTime, 108),1,2) as hour, SUM(Money) as total
FROM logvasc
where LogTypeId = 20 
and  DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101),substring(convert(varchar(10),DateTime, 108),1,2)
) t2 
where t1.day = t2.day and t1.hour = t2.hour;  

/* Thong ke luot user choi game theo gio: ALTP */
update ReportDailyStat
set altpCount = t2.total
from ReportDailyStat t1,(select convert(varchar(10),DateTime, 101) as day,
substring(convert(varchar(10),DateTime, 108),1,2) as hour,COUNT(*) total 
FROM logvasc
where LogTypeId = 10003
and DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101), 
substring(convert(varchar(10),DateTime, 108),1,2) 
) t2 
where t1.day = t2.day and t1.hour = t2.hour;

/* altp money */
update ReportDailyStat
set altpMoney = (0 - t2.total)
from ReportDailyStat t1,(
select convert(varchar(10),DateTime, 101) as day,                                  
substring(convert(varchar(10),DateTime, 108),1,2) as hour, SUM(Money) as total
FROM logvasc
where LogTypeId = 10003 
and  DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101),substring(convert(varchar(10),DateTime, 108),1,2)
) t2 
where t1.day = t2.day and t1.hour = t2.hour;  

/* Thong ke luot user choi game theo gio: Phom */
update ReportDailyStat
set phomCount = t2.total
from ReportDailyStat t1,(select convert(varchar(10),DateTime, 101) as day,
substring(convert(varchar(10),DateTime, 108),1,2) as hour,COUNT(*) total 
FROM logvasc
where LogTypeId = 10004
and DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101), 
substring(convert(varchar(10),DateTime, 108),1,2) 
) t2 
where t1.day = t2.day and t1.hour = t2.hour;

/* phom money */
update ReportDailyStat
set phomMoney = (0 - t2.total)
from ReportDailyStat t1,(
select convert(varchar(10),DateTime, 101) as day,                                  
substring(convert(varchar(10),DateTime, 108),1,2) as hour, SUM(Money) as total
FROM logvasc
where LogTypeId = 10004
and  DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101),substring(convert(varchar(10),DateTime, 108),1,2)
) t2 
where t1.day = t2.day and t1.hour = t2.hour;  

/* Thong ke luot user choi game theo gio: TLMN */
update ReportDailyStat
set tlmnCount = t2.total
from ReportDailyStat t1,(select convert(varchar(10),DateTime, 101) as day,
substring(convert(varchar(10),DateTime, 108),1,2) as hour,COUNT(*) total 
FROM logvasc
where LogTypeId = 10005
and DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101), 
substring(convert(varchar(10),DateTime, 108),1,2) 
) t2 
where t1.day = t2.day and t1.hour = t2.hour;

/* tlmn money */
update ReportDailyStat
set tlmnMoney = (0 - t2.total)
from ReportDailyStat t1,(
select convert(varchar(10),DateTime, 101) as day,                                  
substring(convert(varchar(10),DateTime, 108),1,2) as hour, SUM(Money) as total
FROM logvasc
where LogTypeId = 10005
and  DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101),substring(convert(varchar(10),DateTime, 108),1,2)
) t2 
where t1.day = t2.day and t1.hour = t2.hour;  

/* Thong ke luot user choi game theo gio: XITO */
update ReportDailyStat
set xitoCount = t2.total
from ReportDailyStat t1,(select convert(varchar(10),DateTime, 101) as day,
substring(convert(varchar(10),DateTime, 108),1,2) as hour,COUNT(*) total 
FROM logvasc
where LogTypeId = 10007
and DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101), 
substring(convert(varchar(10),DateTime, 108),1,2) 
) t2 
where t1.day = t2.day and t1.hour = t2.hour;

/* xito money */
update ReportDailyStat
set xitoMoney = (0 - t2.total)
from ReportDailyStat t1,(
select convert(varchar(10),DateTime, 101) as day,                                  
substring(convert(varchar(10),DateTime, 108),1,2) as hour, SUM(Money) as total
FROM logvasc
where LogTypeId = 10007 
and  DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101),substring(convert(varchar(10),DateTime, 108),1,2)
) t2 
where t1.day = t2.day and t1.hour = t2.hour;  

/* Thong ke luot user choi game theo gio: LIENG */
update ReportDailyStat
set liengCount = t2.total
from ReportDailyStat t1,(select convert(varchar(10),DateTime, 101) as day,
substring(convert(varchar(10),DateTime, 108),1,2) as hour,COUNT(*) total 
FROM logvasc
where LogTypeId = 10009
and DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101), 
substring(convert(varchar(10),DateTime, 108),1,2) 
) t2 
where t1.day = t2.day and t1.hour = t2.hour;

/* lieng money */
update ReportDailyStat
set liengMoney = (0 - t2.total)
from ReportDailyStat t1,(
select convert(varchar(10),DateTime, 101) as day,                                  
substring(convert(varchar(10),DateTime, 108),1,2) as hour, SUM(Money) as total
FROM logvasc
where LogTypeId = 10009
and  DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101),substring(convert(varchar(10),DateTime, 108),1,2)
) t2 
where t1.day = t2.day and t1.hour = t2.hour;  

/* Thong ke luot user choi game theo gio: 3 cay */
update ReportDailyStat
set bacayCount = t2.total
from ReportDailyStat t1,(select convert(varchar(10),DateTime, 101) as day,
substring(convert(varchar(10),DateTime, 108),1,2) as hour,COUNT(*) total 
FROM logvasc
where LogTypeId = 10011
and DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101), 
substring(convert(varchar(10),DateTime, 108),1,2) 
) t2 
where t1.day = t2.day and t1.hour = t2.hour;

 /* 3 cay money */
update ReportDailyStat
set bacayMoney = (0 - t2.total)
from ReportDailyStat t1,(
select convert(varchar(10),DateTime, 101) as day,                                  
substring(convert(varchar(10),DateTime, 108),1,2) as hour, SUM(Money) as total
FROM logvasc
where LogTypeId = 10011
and  DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101),substring(convert(varchar(10),DateTime, 108),1,2)
) t2 
where t1.day = t2.day and t1.hour = t2.hour; 

/* Thong ke luot user choi game theo gio: bau cua */
update ReportDailyStat
set baucuaCount = t2.total
from ReportDailyStat t1,(select convert(varchar(10),DateTime, 101) as day,
substring(convert(varchar(10),DateTime, 108),1,2) as hour,COUNT(*) total 
FROM logvasc
where LogTypeId = 10012
and DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101), 
substring(convert(varchar(10),DateTime, 108),1,2) 
) t2 
where t1.day = t2.day and t1.hour = t2.hour;

/* bau cau money */
update ReportDailyStat
set baucauMoney = (0 - t2.total)
from ReportDailyStat t1,(
select convert(varchar(10),DateTime, 101) as day,                                  
substring(convert(varchar(10),DateTime, 108),1,2) as hour, SUM(Money) as total
FROM logvasc
where LogTypeId = 10012
and  DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101),substring(convert(varchar(10),DateTime, 108),1,2)
) t2 
where t1.day = t2.day and t1.hour = t2.hour;  

/* Thong ke luot user choi game theo gio: picachu */
update ReportDailyStat
set picachuCount = t2.total
from ReportDailyStat t1,(select convert(varchar(10),DateTime, 101) as day,
substring(convert(varchar(10),DateTime, 108),1,2) as hour,COUNT(*) total 
FROM logvasc
where LogTypeId = 11111
and DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101), 
substring(convert(varchar(10),DateTime, 108),1,2) 
) t2 
where t1.day = t2.day and t1.hour = t2.hour;

/* picachu money */
update ReportDailyStat
set picachuMoney = (0 - t2.total)
from ReportDailyStat t1,(
select convert(varchar(10),DateTime, 101) as day,                                  
substring(convert(varchar(10),DateTime, 108),1,2) as hour, SUM(Money) as total
FROM logvasc
where LogTypeId = 11111 
and  DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101),substring(convert(varchar(10),DateTime, 108),1,2)
) t2 
where t1.day = t2.day and t1.hour = t2.hour; 

/* Thong ke luot user choi game theo gio*/
update ReportDailyStat
set uniqueUserGameCount = t2.total
from ReportDailyStat t1,(
Select DAY,hour,COUNT(*) as total
from (
select convert(varchar(10),DateTime, 101) as day,                                  
substring(convert(varchar(10),DateTime, 108),1,2) as hour, UserID
FROM logvasc
where LogTypeId IN (20,10003,10003,10005,10007,10009,10010,10011,10012,11111)
and  DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101),substring(convert(varchar(10),DateTime, 108),1,2), UserID ) t
Group by day, hour 
) t2 
where t1.day = t2.day and t1.hour = t2.hour;

/* Fee Money */
update ReportDailyStat
set feeMoney = (0 - t2.total)
from ReportDailyStat t1,(
select convert(varchar(10),DateTime, 101) as day,                                  
substring(convert(varchar(10),DateTime, 108),1,2) as hour, SUM(Money) as total
FROM logvasc
where LogTypeId IN (20,10003,10003,10005,10007,10009,10010,10011,10012,11111)
and  DATEDIFF(DAY,DateTime,GETDATE()) = 1
GROUP BY convert(varchar(10),DateTime, 101),substring(convert(varchar(10),DateTime, 108),1,2)
) t2 
where t1.day = t2.day and t1.hour = t2.hour;  

/* Revenue Money */
update ReportDailyStat
set revenueMoney = t2.total
from ReportDailyStat t1,(
select convert(varchar(10),revenueDate, 101) as day,                                  
substring(convert(varchar(10),revenueDate, 108),1,2) as hour, SUM(Money) as total
FROM LogRevenue
where DATEDIFF(DAY,revenueDate,GETDATE()) = 1
GROUP BY convert(varchar(10),revenueDate, 101),substring(convert(varchar(10),revenueDate, 108),1,2)
) t2 
where t1.day = t2.day and t1.hour = t2.hour;  
	
END
GO
/****** Object:  StoredProcedure [dbo].[uspReportByDaysNew]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

create PROCEDURE [dbo].[uspReportByDaysNew] 
	-- Add the parameters for the stored procedure here
	@fromDate datetime,
	@toDate datetime,
	@partnerId int
AS
BEGIN
	SET NOCOUNT ON;
select COALESCE(usertotal,0) as usertotal,COALESCE(card,0) as card,COALESCE(sms,0) as sms,(CONVERT(VARCHAR(10), COALESCE(created,dater), 103) ) created from
(select COUNT(userid) as usertotal, dateadd(DAY,0, datediff(day,0, registerDate)) as created from WorkingUser
where 	
	(@partnerId = 0 or COALESCE(partnerId,0) = @partnerId)
	and (@fromDate is null or (datediff(day, @fromDate, registerDate)> -1 and datediff(day, registerDate, @toDate)> -1 ))
group by dateadd(DAY,0, datediff(day,0, registerDate))
) t3 full join
(select COALESCE(t1.card,0) as card, COALESCE(t2.sms,0) as sms,COALESCE(t1.dater,t2.dater) dater from (
(select  COUNT(*) as card, dateadd(DAY,0, datediff(day,0, revenueDate)) as dater
from LogRevenue lv inner join [WorkingUser] u on lv.UserID = u.UserID
	inner join RevenueType rt on rt.RevenueTypeId = lv.RevenueTypeId
	inner join logtype lt on rt.ServiceCode = lt.serviceCode + ' ' + lt.CommandCode
	inner join Partner p on COALESCE(u.partnerId,0) = p.partnerId
where  (isCard=1) and (lt.serviceCode is not null and lt.serviceCode <> 'register') 
	and (@partnerId = 0 or COALESCE(u.partnerId,0) = @partnerId)
	and (@fromDate is null or (datediff(day, @fromDate, revenueDate)> -1 and datediff(day, revenueDate, @toDate)> -1 ))
group by dateadd(DAY,0, datediff(day,0, revenueDate))) t1 full join
(select  COUNT(*) as sms, dateadd(DAY,0, datediff(day,0, revenueDate)) as dater
from LogRevenue lv inner join [WorkingUser] u on lv.UserID = u.UserID
	inner join RevenueType rt on rt.RevenueTypeId = lv.RevenueTypeId
	inner join logtype lt on rt.provider+' ' + rt.serviceCode = lt.CommandCode + ' ' + lt.serviceCode
	inner join Partner p on COALESCE(u.partnerId,0) = p.partnerId
where  (isCard is null)
	and (lt.serviceCode is not null and lt.serviceCode <> 'register') 
	and (@partnerId = 0 or COALESCE(u.partnerId,0) = @partnerId)
	and (@fromDate is null or (datediff(day, @fromDate, revenueDate)> -1 and datediff(day, revenueDate, @toDate)> -1 ))
group by dateadd(DAY,0, datediff(day,0, revenueDate))
) t2 on t1.dater = t2.dater)) t4 
on t3.created = t4.dater
order by created desc
END
GO
/****** Object:  StoredProcedure [dbo].[uspReportByDays]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspReportByDays] 
	-- Add the parameters for the stored procedure here
	@fromDate datetime,
	@toDate datetime,
	@partnerId int
AS
BEGIN
	SET NOCOUNT ON;
select COALESCE(usertotal,0) as usertotal,COALESCE(card,0) as card,COALESCE(sms,0) as sms,CONVERT(VARCHAR(10), COALESCE(created,dater), 103)  created from
(select COUNT(userid) as usertotal, dateadd(DAY,0, datediff(day,0, registerDate)) as created from WorkingUser
where 	
	(@partnerId = -10 or COALESCE(partnerId,0) = @partnerId)
	and (@fromDate is null or (datediff(day, @fromDate, registerDate)> -1 and datediff(day, registerDate, @toDate)> -1 ))
group by dateadd(DAY,0, datediff(day,0, registerDate))
) t3 full join
(select COALESCE(t1.card,0) as card, COALESCE(t2.sms,0) as sms,COALESCE(t1.dater,t2.dater) dater from (
(select  COUNT(*) as card, dateadd(DAY,0, datediff(day,0, revenueDate)) as dater
from LogRevenue lv inner join [WorkingUser] u on lv.UserID = u.UserID
	inner join RevenueType rt on rt.RevenueTypeId = lv.RevenueTypeId
	inner join logtype lt on rt.ServiceCode = lt.serviceCode + ' ' + lt.CommandCode
	inner join Partner p on COALESCE(u.partnerId,0) = p.partnerId
where  (isCard=1) and (lt.serviceCode is not null and lt.serviceCode <> 'register') 
	and (@partnerId = -10 or COALESCE(u.partnerId,0) = @partnerId)
	and (@fromDate is null or (datediff(day, @fromDate, revenueDate)> -1 and datediff(day, revenueDate, @toDate)> -1 ))
group by dateadd(DAY,0, datediff(day,0, revenueDate))) t1 full join
(select  COUNT(*) as sms, dateadd(DAY,0, datediff(day,0, revenueDate)) as dater
from LogRevenue lv inner join [WorkingUser] u on lv.UserID = u.UserID
	inner join RevenueType rt on rt.RevenueTypeId = lv.RevenueTypeId
	inner join logtype lt on rt.provider+' ' + rt.serviceCode = lt.CommandCode + ' ' + lt.serviceCode
	inner join Partner p on COALESCE(u.partnerId,0) = p.partnerId
where  (isCard is null)
	and (lt.serviceCode is not null and lt.serviceCode <> 'register') 
	and (@partnerId = -10 or COALESCE(u.partnerId,0) = @partnerId)
	and (@fromDate is null or (datediff(day, @fromDate, revenueDate)> -1 and datediff(day, revenueDate, @toDate)> -1 ))
group by dateadd(DAY,0, datediff(day,0, revenueDate))
) t2 on t1.dater = t2.dater)) t4 
on t3.created = t4.dater
order by created desc
END
GO
/****** Object:  StoredProcedure [dbo].[uspReportByDayDetail]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspReportByDayDetail]
		@partnerId int,
		@date datetime,
		
		@isSMS bit,
		@isCard bit,
		@pageIndex int, 
		@pageSize int,
		@totalRec int output,
		@totalPage int output
	as
		set nocount on
		DECLARE @FirstRec int
		DECLARE @LastRec int
		SET @FirstRec = (@pageIndex - 1) * @pageSize + 1
		SET @LastRec = @pageIndex * @pageSize 
		CREATE TABLE #TemporaryTable (
			Row int IDENTITY(1,1) PRIMARY KEY,
			[userId] [bigint],
			[name] [nvarchar](100) NULL,
			[Money] [bigint] NULL,
			[description] [varchar](256) NULL,
			[DateTime] [datetime] NULL,
			[partnerName] [nvarchar](100) NULL,
			[phoneNumber] [varchar](20) NULL,
			[serviceCode] [varchar](60) NULL,
			[CommandCode] [varchar](100) NULL,
			[isCard] [bit] NULL,
		)
		INSERT INTO #TemporaryTable
		select u.UserID, u.Name, lv.Money, lv.Description, lv.revenueDate as 'DateTime', p.name as 'partnerName', COALESCE(lv.PhoneNumber,'') as 'PhoneNumber',
				  lt.serviceCode, lt.CommandCode, COALESCE(lt.isCard,0) as 'isCard'
			from LogRevenue lv inner join [WorkingUser] u on lv.UserID = u.UserID
				inner join RevenueType rt on rt.RevenueTypeId = lv.RevenueTypeId
				inner join logtype lt on rt.provider+' ' + rt.serviceCode = lt.CommandCode + ' ' + lt.serviceCode or rt.ServiceCode = lt.serviceCode + ' ' + lt.CommandCode
				inner join Partner p on COALESCE(u.partnerId,0) = p.partnerId
		where  
			((COALESCE(isCard,0) = 0 and @isSMS=1) or (isCard = 1 and @isCard=1))
			and (@partnerId = 0 or COALESCE(u.partnerId,0) = @partnerId)  -- 0: all partner is admin person. hard code :(
			and ((datediff(day, @date, revenueDate)> -1 and datediff(day, revenueDate, @date)> -1 ))
			and (lt.serviceCode is not null and lt.serviceCode <> 'register') order by revenueDate desc

		SELECT @totalRec=count(Row)	FROM #TemporaryTable

		SET @totalPage = @totalRec/@pageSize
		IF @totalRec > @totalPage*@pageSize
		BEGIN
		   SET	@totalPage = @totalPage +1
		END

		select Row,
			[userId],
			[name],
			[Money],
			[description],
			(CONVERT(VARCHAR(10), [DateTime], 103) + ' ' + CONVERT(VARCHAR(8), [DateTime], 108)) as 'datetime' ,
			[partnerName],
			[phoneNumber],
			[serviceCode],
			[CommandCode],
			[isCard] from #TemporaryTable WHERE (Row >= @FirstRec) AND (Row <= @LastRec)
		
		DROP TABLE #TemporaryTable
GO
/****** Object:  StoredProcedure [dbo].[uspLogRevenue]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspLogRevenue]
	@partnerId int,
	@isCard bit,  
	@isSMS bit
as
	set nocount on
	Declare @fromDate datetime = getDate()
	Declare @toDate datetime = getDate()
	Declare @typeCharging int = 0 -- 1 card, 2 sms, 3 ca 2
	
	if(@isCard=1) 
		set @typeCharging +=1
	if(@isSMS=1)
		set @typeCharging +=2
	
	if @toDate is null
		select @toDate = GETDATE()		
		if(@typeCharging=1)
		begin
			select top(10000) u.UserID, u.Name, lv.Money, lv.Description, lv.revenueDate as 'DateTime', p.name as 'partnerName', COALESCE(lv.PhoneNumber,'') as 'PhoneNumber',
					  lt.serviceCode, lt.CommandCode, COALESCE(lt.isCard,0) as 'isCard'
				from LogRevenue lv inner join [WorkingUser] u on lv.UserID = u.UserID
					inner join RevenueType rt on rt.RevenueTypeId = lv.RevenueTypeId
					inner join logtype lt on rt.ServiceCode = lt.serviceCode + ' ' + lt.CommandCode
					inner join Partner p on COALESCE(u.partnerId,0) = p.partnerId
			where  (@partnerId = -10 or COALESCE(u.partnerId,0) = @partnerId)  -- -10: all partner is admin person. hard code :(
				and (isCard=1)
				and (@fromDate is null or (datediff(day, @fromDate, revenueDate)> -1 and datediff(day, revenueDate, @toDate)> -1 ))
				and (lt.serviceCode is not null and lt.serviceCode <> 'register') order by revenueDate desc
				
		end else if(@typeCharging=2)
		begin 
			select top(10000) u.UserID, u.Name, lv.Money, lv.Description, lv.revenueDate as 'DateTime', p.name as 'partnerName', COALESCE(lv.PhoneNumber,'') as 'PhoneNumber',
					  lt.serviceCode, lt.CommandCode, COALESCE(lt.isCard,0) as 'isCard'
				from LogRevenue lv inner join [WorkingUser] u on lv.UserID = u.UserID
					inner join RevenueType rt on rt.RevenueTypeId = lv.RevenueTypeId
					inner join logtype lt on rt.provider+' ' + rt.serviceCode = lt.CommandCode + ' ' + lt.serviceCode
					inner join Partner p on COALESCE(u.partnerId,0) = p.partnerId
			where  (@partnerId = -10 or COALESCE(u.partnerId,0) = @partnerId)  -- -10: all partner is admin person. hard code :(
				and (isCard is null)
				and (@fromDate is null or (datediff(day, @fromDate, revenueDate)> -1 and datediff(day, revenueDate, @toDate)> -1 ))
				and (lt.serviceCode is not null and lt.serviceCode <> 'register') order by revenueDate desc
				
		end 
		begin
			select top(10000) u.UserID, u.Name, lv.Money, lv.Description, lv.revenueDate as 'DateTime', p.name as 'partnerName', COALESCE(lv.PhoneNumber,'') as 'PhoneNumber',
					  lt.serviceCode, lt.CommandCode, COALESCE(lt.isCard,0) as 'isCard'
				from LogRevenue lv inner join [WorkingUser] u on lv.UserID = u.UserID
					inner join RevenueType rt on rt.RevenueTypeId = lv.RevenueTypeId
					inner join logtype lt on rt.provider+' ' + rt.serviceCode = lt.CommandCode + ' ' + lt.serviceCode or rt.ServiceCode = lt.serviceCode + ' ' + lt.CommandCode
					inner join Partner p on COALESCE(u.partnerId,0) = p.partnerId
			where  (@partnerId = -10 or COALESCE(u.partnerId,0) = @partnerId)  -- -10: all partner is admin person. hard code :(
				and (@fromDate is null or (datediff(day, @fromDate, revenueDate)> -1 and datediff(day, revenueDate, @toDate)> -1 ))
				and (lt.serviceCode is not null and lt.serviceCode <> 'register') order by revenueDate desc
				
		end
GO
/****** Object:  StoredProcedure [dbo].[uspKMTimeGold]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspKMTimeGold]
as
	update logtype
		set money = money *2
	where iscard = 1 and isKM<>1
	
	update logtype
		set money = money *3/2
	where isSMS = 1  and isKM<>1
GO
/****** Object:  StoredProcedure [dbo].[uspKM]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[uspKM]
as
	update logtype
		set money = money *2
	where iscard = 1 and partnerId <> 96
		
	update logtype
		set money = money *3/2
	where isSMS = 1 and partnerId <> 96
GO
/****** Object:  StoredProcedure [dbo].[uspXEDailyReport]    Script Date: 03/17/2015 16:54:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspXEDailyReport]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @xeengInByTool bigint
	DECLARE @xeengInBySMS bigint
	DECLARE @xeengInByCard bigint
	DECLARE @xeengInByEvent bigint
	DECLARE @xeengInByRoulette bigint

	DECLARE @xeengOutByTool bigint
	DECLARE @xeengOutByExchange bigint
	DECLARE @xeengOutByEvent bigint
	DECLARE @xeengOutByCashShop bigint
	DECLARE @xeengOutByRoulette bigint

	DECLARE @xeengInWorkingUsers bigint
	
	DECLARE @goldInByTool bigint
	DECLARE @goldInByExchange bigint
	DECLARE @goldInByGiftCode bigint
	DECLARE @goldInByAddFriend bigint
	DECLARE @goldInByFreeGold bigint
	DECLARE @goldInByRegister bigint
	DECLARE @goldInByWrongCalc bigint
	DECLARE @goldInByEvent bigint
	DECLARE @goldInByRoulette bigint

	DECLARE @goldOutByTool bigint
	DECLARE @goldOutByGame bigint
	DECLARE @goldOutByEvent bigint
	DECLARE @goldOutByRoulette bigint

	DECLARE @goldInWorkingUsers bigint
	
	DECLARE @newUsers int
	DECLARE @activeUsers int
	DECLARE @returnUsers int
	DECLARE @newDevice int
	DECLARE @googlePlayCPINewDevice int
	DECLARE @appotaAndroidNewDevice int
	DECLARE @appotaIOSNewDevice int
	DECLARE @appStoreNewDevice int
	DECLARE @googlePlayNewDevice int
	DECLARE @mobigateNewDevice int
	DECLARE @mobihubNewDevice int
	DECLARE @mobigateCPINewDevice int
	
	DECLARE @deviceReturn int	
	DECLARE @activeDevice int
	DECLARE @googlePlayCPIDeviceReturn int
	DECLARE @appotaAndroidDeviceReturn int
	DECLARE @appotaIOSDeviceReturn int
	DECLARE @appStoreDeviceReturn int
	DECLARE @googlePlayDeviceReturn int
	DECLARE @mobigateDeviceReturn int
	DECLARE @mobihubDeviceReturn int
	DECLARE @mobigateCPIDeviceReturn int
	
	DECLARE @today datetime = getdate()
	DECLARE @reportDate date = DATEADD(DAY, -1, @today)
	
	IF OBJECT_ID('tempdb..#paidUser') IS NOT NULL DROP TABLE #paidUser
	

	--     - InWorkingUsers
	SELECT @goldInWorkingUsers = ISNULL(SUM(cash), 0)
	FROM workinguser
	
	SELECT @xeengInWorkingUsers = ISNULL(SUM(xeeng), 0)
	FROM workinguser
	
	-- [+] Xeeng
	
	--     - InByTool
	SELECT @xeengInByTool = ISNULL(SUM(moneyDiff), 0)
	FROM XELogMoneyHistory 
	WHERE DATEDIFF(DAY, modifyDate, @today) = 1
		AND reason = 0
		AND moneyType = 1
		AND moneyDiff > 0		


	--     - InBySMS
	SELECT @xeengInBySMS = ISNULL(SUM(moneyDiff), 0)
	FROM XELogMoneyHistory 
	WHERE DATEDIFF(DAY, modifyDate, @today) = 1
		AND reason = 2
		AND moneyType = 1
		AND moneyDiff > 0	
	
	
	--     - InByCard
	SELECT @xeengInByCard = ISNULL(SUM(moneyDiff), 0)
	FROM XELogMoneyHistory 
	WHERE DATEDIFF(DAY, modifyDate, @today) = 1
		AND reason = 3
		AND moneyType = 1
		AND moneyDiff > 0


	--    - InByEvent
	SELECT @xeengInByEvent = ISNULL(SUM(value), 0)
	FROM
	  (SELECT xeLogEventGiftsHistory.*,
			  xeEventItems.fee
	   FROM xeLogEventGiftsHistory,
			xeEventItems
	   WHERE xeLogEventGiftsHistory.evitCode = xeEventItems.code
	   	 AND DATEDIFF(DAY, useDate, @today) = 1
		 AND xeLogEventGiftsHistory.type = 'Xeng') tmp
	
	
	--    - InByRoulette
	SELECT @xeengInByRoulette = ISNULL(SUM(value), 0)
	FROM xeLogRouletteHistory
	WHERE DATEDIFF(DAY, date, @today) = 1 
		AND price > 0 
		AND priceType like 'Xeng'
	
	
	--     - OutByExchange
	SELECT @xeengOutByExchange = ISNULL(SUM(moneyDiff), 0)
	FROM XELogMoneyHistory 
	WHERE DATEDIFF(DAY, modifyDate, @today) = 1
		AND reason = 1
		AND moneyType = 1
		AND moneyDiff < 0
		
	--     - OutByTool
	SELECT @xeengOutByTool = ISNULL(SUM(moneyDiff), 0)
	FROM XELogMoneyHistory 
	WHERE DATEDIFF(DAY, modifyDate, @today) = 1
		AND reason = 0
		AND moneyType = 1
		AND moneyDiff < 0	


	--    - OutByEvent
	SELECT @xeengOutByEvent = -ISNULL(SUM(fee), 0)
	FROM
	  (SELECT xeLogEventGiftsHistory.*,
			  xeEventItems.fee
	   FROM xeLogEventGiftsHistory,
			xeEventItems
	   WHERE xeLogEventGiftsHistory.evitCode = xeEventItems.code
	     AND DATEDIFF(DAY, useDate, @today) = 1
		 AND xeEventItems.feeType = 'Xeng') tmp

	--     - OutByCashShop
	SELECT @xeengOutByCashShop = -ISNULL(SUM(price), 0)
	FROM xeLogCashShopHistory 
	WHERE DATEDIFF(DAY, [date], @today) = 1
		AND type = 'Xeng'

	--    - OutByRoulette
	SELECT @xeengOutByRoulette = -ISNULL(SUM(fee), 0)
	FROM xeLogRouletteHistory
	WHERE DATEDIFF(DAY, date, @today) = 1 
		AND fee > 0 
		AND feeType like 'Xeng'

	-- [+] Gold
	
	--     - InByTool
	SELECT @goldInByTool = ISNULL(SUM(moneyDiff), 0)
	FROM XELogMoneyHistory 
	WHERE DATEDIFF(DAY, modifyDate, @today) = 1
		AND reason = 0
		AND moneyType = 0
		AND moneyDiff > 0	
	
	
	--     - InByExchange
	SELECT @goldInByExchange = ISNULL(SUM(moneyDiff), 0)
	FROM XELogMoneyHistory 
	WHERE DATEDIFF(DAY, modifyDate, @today) = 1
		AND reason = 1
		AND moneyType = 0
		AND moneyDiff > 0	


	--     - InByAddFriend
	SELECT @goldInByAddFriend = ISNULL(SUM(moneyDiff), 0)
	FROM XELogMoneyHistory
	WHERE DATEDIFF(DAY, modifyDate, @today) = 1
	    AND moneyDiff > 0
	    AND reason = 10
	    

	--     - InByFreeGold
	SELECT @goldInByFreeGold = ISNULL(SUM(moneyDiff), 0)
	FROM XELogMoneyHistory
	WHERE DATEDIFF(DAY, modifyDate, @today) = 1
	    AND moneyDiff > 0
	    AND reason = 11
	    
	--     - InByRegister
	SELECT @goldInByRegister = ISNULL(SUM(moneyDiff), 0)
	FROM XELogMoneyHistory
	WHERE DATEDIFF(DAY, modifyDate, @today) = 1
	    AND moneyDiff > 0
	    AND reason = 13
	    
	    	    
	--     - InByGiftCode
	SELECT @goldInByGiftCode = ISNULL(SUM(money), 0)
	FROM logvasc
	WHERE DATEDIFF(DAY, DateTime, @today) = 1
	    AND Money > 0
	    AND LogTypeId = 111
		
		
	--     - InByWrongCalc
	SELECT @goldInByWrongCalc = ISNULL(SUM(moneyDiff), 0)
	FROM XELogMoneyHistory
	WHERE DATEDIFF(DAY, modifyDate, @today) = 1
	    AND reason = 14

	--    - InByEvent
	SELECT @goldInByEvent = ISNULL(SUM(value), 0)
	FROM
	  (SELECT xeLogEventGiftsHistory.*,
			  xeEventItems.fee
	   FROM xeLogEventGiftsHistory,
			xeEventItems
	   WHERE xeLogEventGiftsHistory.evitCode = xeEventItems.code
	     AND DATEDIFF(DAY, useDate, @today) = 1
		 AND xeLogEventGiftsHistory.type = 'Gold') tmp
	    
	--    - InByRoulette
	SELECT @goldInByRoulette = ISNULL(SUM(value), 0)
	FROM xeLogRouletteHistory
	WHERE DATEDIFF(DAY, date, @today) = 1 
		AND price > 0 
		AND priceType like 'Gold'

	--     - OutByTool
	SELECT @goldOutByTool = ISNULL(SUM(moneyDiff), 0)
	FROM XELogMoneyHistory 
	WHERE DATEDIFF(DAY, modifyDate, @today) = 1
		AND reason = 0
		AND moneyType = 0
		AND moneyDiff < 0


	--     - OutByGame
	SELECT @goldOutByGame = ISNULL(SUM(moneyDiff), 0)
	FROM XELogMoneyHistory
	WHERE DATEDIFF(DAY, modifyDate, @today) = 1
	    AND reason > 10000


	--    - OutByEvent
	SELECT @goldOutByEvent = -ISNULL(SUM(fee), 0)
	FROM
	  (SELECT xeLogEventGiftsHistory.*,
			  xeEventItems.fee
	   FROM xeLogEventGiftsHistory,
			xeEventItems
	   WHERE xeLogEventGiftsHistory.evitCode = xeEventItems.code
	     AND DATEDIFF(DAY, useDate, @today) = 1
		 AND xeLogEventGiftsHistory.type = 'Gold') tmp
	
	--    - OutByRoulette
	SELECT @goldOutByRoulette = -ISNULL(SUM(fee), 0)
	FROM xeLogRouletteHistory
	WHERE DATEDIFF(DAY, date, @today) = 1 
		AND fee > 0 
		AND feeType like 'Gold'
	
	-- [+] User
	
	--     - newUsers
	SELECT @newUsers = COUNT(*)
	FROM workinguser
	WHERE DATEDIFF(DAY, registerDate, @today) = 1
	
	--     - activeUsers
	SELECT @activeUsers = COUNT(*)
	FROM workinguser
	WHERE (DATEDIFF(DAY, lastLogin, @today) = 1)
		OR (firstOvernight IS NOT NULL
		AND DATEDIFF(DAY, firstOvernight, @today) = 1)
	
	--     - returnUsers
	SELECT @returnUsers = COUNT(*)
	FROM workinguser
	WHERE 
	(
		(DATEDIFF(DAY, lastLogin, @today) = 1) -- lần đăng nhập cuối trong ngày hôm qua
		OR (firstOvernight IS NOT NULL
		AND DATEDIFF(DAY, firstOvernight, @today) = 1) -- hoặc overnight từ ngày hôm kia sang ngày hôm qua
	)
	AND 
	DATEDIFF(DAY, registerDate, @today) = 2 -- đăng ký vào ngày hôm kia
	
	-- So luong device dang ky trong ngay
	select @newDevice = COUNT(distinct(mobileVersion))
	from workinguser
	where DATEPART(dy, registerDate) = DATEPART(dy, @today) - 1
	
	-- So luong device dang ky trong ngay GooglePlayCPI
	select @googlePlayCPINewDevice = COUNT(distinct(mobileVersion))
	from workinguser
	where DATEPART(dy, registerDate) = DATEPART(dy, @today) - 1
	  AND LEFT(partnerId,2) = 99
	  
	-- So luong device dang ky trong ngay Appota
	select @appotaIOSNewDevice = COUNT(distinct(mobileVersion))
	from workinguser
	where DATEPART(dy, registerDate) = DATEPART(dy, @today) - 1
	  AND partnerId = 92
	
	select @appotaAndroidNewDevice = COUNT(distinct(mobileVersion))
	from workinguser
	where DATEPART(dy, registerDate) = DATEPART(dy, @today) - 1
	  AND partnerId = 93
	  
	-- So luong device dang ky trong ngay App Store
	select @appStoreNewDevice = COUNT(distinct(mobileVersion))
	from workinguser
	where DATEPART(dy, registerDate) = DATEPART(dy, @today) - 1
	  AND partnerId = 94
	  
	-- So luong device dang ky trong ngay Google Play
	select @googlePlayNewDevice = COUNT(distinct(mobileVersion))
	from workinguser
	where DATEPART(dy, registerDate) = DATEPART(dy, @today) - 1
	  AND partnerId = 95
	
	-- So luong device dang ky trong ngay Mobigate
	select @mobigateNewDevice = COUNT(distinct(mobileVersion))
	from workinguser
	where DATEPART(dy, registerDate) = DATEPART(dy, @today) - 1
	  AND partnerId = 96
	  
	-- So luong device dang ky trong ngay mobihub
	select @mobihubNewDevice = COUNT(distinct(mobileVersion))
	from workinguser
	where DATEPART(dy, registerDate) = DATEPART(dy, @today) - 1
	  AND partnerId = 97
	  
	-- So luong device dang ky trong ngay mobigateCPI
	select @mobigateCPINewDevice = COUNT(distinct(mobileVersion))
	from workinguser
	where DATEPART(dy, registerDate) = DATEPART(dy, @today) - 1
	  AND partnerId = 98
	  
	-- So luong device quay lai trong ngay
	select @deviceReturn = COUNT(distinct(mobileVersion))
	from workinguser
	WHERE 
	(
		(DATEPART(dy, lastLogin) = DATEPART(dy, @today) - 1) -- lan dang nhap cuoi trong ngay hom qua
		OR (firstOvernight IS NOT NULL
		AND DATEPART(dy, firstOvernight) = DATEPART(dy, @today) - 1) -- overnight sang ngay hom qua
	)
	AND 
	DATEPART(dy, registerDate) = (DATEPART(dy, @today) - 2) -- dang ky vao ngay hom kia
	
	-- So luong device quay lai trong ngay GooglePlayCPI
	select @googlePlayDeviceReturn = COUNT(distinct(mobileVersion))
	from workinguser
	WHERE 
	(
		(DATEPART(dy, lastLogin) = DATEPART(dy, @today) - 1) -- lan dang nhap cuoi trong ngay hom qua
		OR (firstOvernight IS NOT NULL
		AND DATEPART(dy, firstOvernight) = DATEPART(dy, @today) - 1) -- overnight sang ngay hom qua
	)
	AND 
	DATEPART(dy, registerDate) = (DATEPART(dy, @today) - 2) -- dang ky vao ngay hom kia
	AND LEFT(partnerId,2) = 99
	
	-- So luong device quay lai trong ngay Appota
	select @appotaIOSDeviceReturn = COUNT(distinct(mobileVersion))
	from workinguser
	WHERE 
	(
		(DATEPART(dy, lastLogin) = DATEPART(dy, @today) - 1) -- lan dang nhap cuoi trong ngay hom qua
		OR (firstOvernight IS NOT NULL
		AND DATEPART(dy, firstOvernight) = DATEPART(dy, @today) - 1) -- overnight sang ngay hom qua
	)
	AND 
	DATEPART(dy, registerDate) = (DATEPART(dy, @today) - 2) -- dang ky vao ngay hom kia
	AND partnerId = 92
	
	select @appotaAndroidDeviceReturn = COUNT(distinct(mobileVersion))
	from workinguser
	WHERE 
	(
		(DATEPART(dy, lastLogin) = DATEPART(dy, @today) - 1) -- lan dang nhap cuoi trong ngay hom qua
		OR (firstOvernight IS NOT NULL
		AND DATEPART(dy, firstOvernight) = DATEPART(dy, @today) - 1) -- overnight sang ngay hom qua
	)
	AND 
	DATEPART(dy, registerDate) = (DATEPART(dy, @today) - 2) -- dang ky vao ngay hom kia
	AND partnerId = 93
	
	-- So luong device quay lai trong ngay App Store
	select @appStoreDeviceReturn = COUNT(distinct(mobileVersion))
	from workinguser
	WHERE 
	(
		(DATEPART(dy, lastLogin) = DATEPART(dy, @today) - 1) -- lan dang nhap cuoi trong ngay hom qua
		OR (firstOvernight IS NOT NULL
		AND DATEPART(dy, firstOvernight) = DATEPART(dy, @today) - 1) -- overnight sang ngay hom qua
	)
	AND 
	DATEPART(dy, registerDate) = (DATEPART(dy, @today) - 2) -- dang ky vao ngay hom kia
	AND partnerId = 94
	
	-- So luong device quay lai trong ngay Google Play
	select @googlePlayDeviceReturn = COUNT(distinct(mobileVersion))
	from workinguser
	WHERE 
	(
		(DATEPART(dy, lastLogin) = DATEPART(dy, @today) - 1) -- lan dang nhap cuoi trong ngay hom qua
		OR (firstOvernight IS NOT NULL
		AND DATEPART(dy, firstOvernight) = DATEPART(dy, @today) - 1) -- overnight sang ngay hom qua
	)
	AND 
	DATEPART(dy, registerDate) = (DATEPART(dy, @today) - 2) -- dang ky vao ngay hom kia
	AND partnerId  = 95
	
	-- So luong device quay lai trong ngay Mobigate
	select @mobigateDeviceReturn = COUNT(distinct(mobileVersion))
	from workinguser
	WHERE 
	(
		(DATEPART(dy, lastLogin) = DATEPART(dy, @today) - 1) -- lan dang nhap cuoi trong ngay hom qua
		OR (firstOvernight IS NOT NULL
		AND DATEPART(dy, firstOvernight) = DATEPART(dy, @today) - 1) -- overnight sang ngay hom qua
	)
	AND 
	DATEPART(dy, registerDate) = (DATEPART(dy, @today) - 2) -- dang ky vao ngay hom kia
	AND partnerId = 96
	
	-- So luong device quay lai trong ngay MobiHub
	select @mobihubDeviceReturn = COUNT(distinct(mobileVersion))
	from workinguser
	WHERE 
	(
		(DATEPART(dy, lastLogin) = DATEPART(dy, @today) - 1) -- lan dang nhap cuoi trong ngay hom qua
		OR (firstOvernight IS NOT NULL
		AND DATEPART(dy, firstOvernight) = DATEPART(dy, @today) - 1) -- overnight sang ngay hom qua
	)
	AND 
	DATEPART(dy, registerDate) = (DATEPART(dy, @today) - 2) -- dang ky vao ngay hom kia
	AND partnerId = 97
	
	-- So luong device quay lai trong ngay MobigateCPI
	select @mobigateCPIDeviceReturn = COUNT(distinct(mobileVersion))
	from workinguser
	WHERE 
	(
		(DATEPART(dy, lastLogin) = DATEPART(dy, @today) - 1) -- lan dang nhap cuoi trong ngay hom qua
		OR (firstOvernight IS NOT NULL
		AND DATEPART(dy, firstOvernight) = DATEPART(dy, @today) - 1) -- overnight sang ngay hom qua
	)
	AND 
	DATEPART(dy, registerDate) = (DATEPART(dy, @today) - 2) -- dang ky vao ngay hom kia
	AND partnerId = 98
	
	--     - activeDevice
	SELECT @activeDevice = COUNT(distinct(mobileVersion))
	from workinguser
	WHERE (DATEDIFF(DAY, lastLogin, @today) = 1)
		OR (firstOvernight IS NOT NULL
		AND DATEDIFF(DAY, firstOvernight, @today) = 1)	

	--SELECT @today AS date,
	--    @xeengInByTool AS xeengInByTool, 
	--	@xeengInBySMS AS xeengInBySMS, 
	--	@xeengInByCard AS xeengInByCard, 
	--	@xeengOutByTool AS xeengOutByTool, 
	--	@xeengOutByExchange AS xeengOutByExchange, 
	--	@xeengInWorkingUsers AS xeengInWorkingUsers,
		
	--	@goldInByTool AS goldInByTool, 
	--	@goldInByExchange AS goldInByExchange, 
	--	@goldInByAddFriend AS goldInByAddFriend, 
	--	@goldInByFreeGold AS goldInByFreeGold, 
	--	@goldInByRegister AS goldInByRegister,
	--	@goldInByGiftCode AS goldInByGiftCode, 
	--	@goldOutByTool AS goldOutByTool, 
	--	@goldOutByGame AS goldOutByGame, 
	--	@goldInWorkingUsers AS goldInWorkingUsers,
		
	--	@newUsers AS newUsers,
	--	@activeUsers AS activeUsers,
	--	@returnUsers AS returnUsers
		
	INSERT INTO XEDailyStatistics
	(executeDate, reportDate, xeengInByTool, xeengInBySMS, xeengInByCard, xeengInByEvent, xeengInByRoulette, xeengOutByTool, xeengOutByExchange, xeengOutByEvent, xeengOutByCashShop, xeengOutByRoulette, xeengInWorkingUsers,
	goldInByTool, goldInByExchange, goldInByAddFriend, goldInByFreeGold, goldInByRegister, goldInByGiftCode, goldInByWrongCalc, goldInByEvent, goldInByRoulette, goldOutByTool, goldOutByGame, goldOutByEvent, goldOutByRoulette, goldInWorkingUsers,
	newUsers, activeUsers, returnUsers, newDevice, returnDevice, activeDevice, returnDeviceGooglePlayCPI,returnDeviceAppotaAndroid, returnDeviceAppotaIOS, returnDeviceAppStore, returnDeviceGooglePlay, returnDeviceMobigate, returnDeviceMobihub, returnDeviceMobigateCPI,
	newDeviceGooglePlayCPI,newDeviceAppotaAndroid, newDeviceAppotaIOS, newDeviceAppStore,newDeviceGooglePlay,newDeviceMobigate, newDeviceMobihub, newDeviceMobigateCPI)
	VALUES
	(@today, @reportDate, @xeengInByTool, @xeengInBySMS, @xeengInByCard, @xeengInByEvent, @xeengInByRoulette, @xeengOutByTool, @xeengOutByExchange, @xeengOutByEvent, @xeengOutByCashShop, @xeengOutByRoulette, @xeengInWorkingUsers,
	@goldInByTool, @goldInByExchange, @goldInByAddFriend, @goldInByFreeGold, @goldInByRegister, @goldInByGiftCode, @goldInByWrongCalc, @goldInByEvent, @goldInByRoulette, @goldOutByTool, @goldOutByGame, @goldOutByEvent, @goldOutByRoulette, @goldInWorkingUsers,
	@newUsers, @activeUsers, @returnUsers, @newDevice, @deviceReturn, @activeDevice, @googlePlayCPIDeviceReturn, @appotaAndroidDeviceReturn, @appotaIOSDeviceReturn, @appStoreDeviceReturn, @googlePlayDeviceReturn, @mobigateDeviceReturn, @mobihubDeviceReturn, @mobigateCPIDeviceReturn,
	@googlePlayCPINewDevice, @appotaAndroidNewDevice, @appotaIOSNewDevice, @appStoreNewDevice, @googlePlayNewDevice, @mobigateNewDevice, @mobihubNewDevice, @mobigateCPINewDevice)

	-- temp
	UPDATE xeFreeGoldByDay
	SET receivedTimes = 0
	
	EXEC uspXEShopDailyReport
	EXEC uspXEChargingDailyReport
	EXEC uspXECheckOvernight

	-- xóa dữ liệu cũ
	DELETE FROM xeNumOfUserOnline
	WHERE DATEDIFF(DAY, dateReport, @today) > 32 -- 32 cho chắc :">

	EXEC uspXEDeviceDailyReport
END
GO
/****** Object:  Default [DF_logvasc_moneyType]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[logvasc] ADD  CONSTRAINT [DF_logvasc_moneyType]  DEFAULT ((0)) FOR [moneyType]
GO
/****** Object:  Default [DF_reportuser_partnerId]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[reportuser] ADD  CONSTRAINT [DF_reportuser_partnerId]  DEFAULT ((0)) FOR [partnerId]
GO
/****** Object:  Default [DF_reportuser_userTypeId]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[reportuser] ADD  CONSTRAINT [DF_reportuser_userTypeId]  DEFAULT ((0)) FOR [userTypeId]
GO
/****** Object:  Default [DF_reportuser_roleId]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[reportuser] ADD  CONSTRAINT [DF_reportuser_roleId]  DEFAULT ((0)) FOR [roleId]
GO
/****** Object:  Default [DF_reportuser_isActive]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[reportuser] ADD  CONSTRAINT [DF_reportuser_isActive]  DEFAULT ((1)) FOR [active]
GO
/****** Object:  Default [DF_roomlevel_isVip]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[roomlevel] ADD  CONSTRAINT [DF_roomlevel_isVip]  DEFAULT ((0)) FOR [isVip]
GO
/****** Object:  Default [DF__UserInfo__cityId__22401542]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[userinfo] ADD  DEFAULT ((0)) FOR [cityId]
GO
/****** Object:  Default [DF__UserInfo__jobId__2334397B]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[userinfo] ADD  DEFAULT ((0)) FOR [jobId]
GO
/****** Object:  Default [DF_workinguser_gold]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[workinguser] ADD  CONSTRAINT [DF_workinguser_gold]  DEFAULT ((0)) FOR [xeeng]
GO
/****** Object:  Default [DF_workinguser_isLock]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[workinguser] ADD  CONSTRAINT [DF_workinguser_isLock]  DEFAULT ((0)) FOR [isLock]
GO
/****** Object:  Default [DF_workinguser_accumulatedGold]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[workinguser] ADD  CONSTRAINT [DF_workinguser_accumulatedGold]  DEFAULT ((0)) FOR [accumulatedGold]
GO
/****** Object:  Default [DF_workinguser_specialPoint]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[workinguser] ADD  CONSTRAINT [DF_workinguser_specialPoint]  DEFAULT ((0)) FOR [specialPoint]
GO
/****** Object:  Default [DF_XEDailyStatistics_xeengInWorkingUsers]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[XEDailyStatistics] ADD  CONSTRAINT [DF_XEDailyStatistics_xeengInWorkingUsers]  DEFAULT ((0)) FOR [xeengInWorkingUsers]
GO
/****** Object:  Default [DF_XEDailyStatistics_goldInByWrongCalc]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[XEDailyStatistics] ADD  CONSTRAINT [DF_XEDailyStatistics_goldInByWrongCalc]  DEFAULT ((0)) FOR [goldInByWrongCalc]
GO
/****** Object:  Default [DF_xeExchange_item_id]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[xeExchange] ADD  CONSTRAINT [DF_xeExchange_item_id]  DEFAULT ((0)) FOR [item_id]
GO
/****** Object:  Default [DF_xeNumOfUserOnline_numTienLen]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[xeNumOfUserOnline] ADD  CONSTRAINT [DF_xeNumOfUserOnline_numTienLen]  DEFAULT ((0)) FOR [numTienLen]
GO
/****** Object:  Default [DF_xeNumOfUserOnline_numPhom]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[xeNumOfUserOnline] ADD  CONSTRAINT [DF_xeNumOfUserOnline_numPhom]  DEFAULT ((0)) FOR [numPhom]
GO
/****** Object:  Default [DF_xeNumOfUserOnline_numBaCay]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[xeNumOfUserOnline] ADD  CONSTRAINT [DF_xeNumOfUserOnline_numBaCay]  DEFAULT ((0)) FOR [numBaCay]
GO
/****** Object:  Default [DF_xeNumOfUserOnline_numBauCua]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[xeNumOfUserOnline] ADD  CONSTRAINT [DF_xeNumOfUserOnline_numBauCua]  DEFAULT ((0)) FOR [numBauCua]
GO
/****** Object:  Default [DF_xeNumOfUserOnline_numALTP]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[xeNumOfUserOnline] ADD  CONSTRAINT [DF_xeNumOfUserOnline_numALTP]  DEFAULT ((0)) FOR [numALTP]
GO
/****** Object:  Default [DF_xeNumOfUserOnline_numPikachu]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[xeNumOfUserOnline] ADD  CONSTRAINT [DF_xeNumOfUserOnline_numPikachu]  DEFAULT ((0)) FOR [numPikachu]
GO
/****** Object:  Default [DF_xeUserAvatar_isLock]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[xeUserAvatar] ADD  CONSTRAINT [DF_xeUserAvatar_isLock]  DEFAULT ((0)) FOR [isLock]
GO
/****** Object:  ForeignKey [FK__alertuSer__userI__004002F9]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[alertuser]  WITH CHECK ADD  CONSTRAINT [FK__alertuSer__userI__004002F9] FOREIGN KEY([userId])
REFERENCES [dbo].[workinguser] ([userId])
GO
ALTER TABLE [dbo].[alertuser] CHECK CONSTRAINT [FK__alertuSer__userI__004002F9]
GO
/****** Object:  ForeignKey [FK__alertuSer__userI__02284B6B]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[alertuser]  WITH CHECK ADD  CONSTRAINT [FK__alertuSer__userI__02284B6B] FOREIGN KEY([userId])
REFERENCES [dbo].[workinguser] ([userId])
GO
ALTER TABLE [dbo].[alertuser] CHECK CONSTRAINT [FK__alertuSer__userI__02284B6B]
GO
/****** Object:  ForeignKey [FK__LogRevenu__userI__2704CA5F]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[logrevenue]  WITH CHECK ADD  CONSTRAINT [FK__LogRevenu__userI__2704CA5F] FOREIGN KEY([userId])
REFERENCES [dbo].[workinguser] ([userId])
GO
ALTER TABLE [dbo].[logrevenue] CHECK CONSTRAINT [FK__LogRevenu__userI__2704CA5F]
GO
/****** Object:  ForeignKey [FK__LogRevenu__userI__27F8EE98]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[logrevenue]  WITH CHECK ADD  CONSTRAINT [FK__LogRevenu__userI__27F8EE98] FOREIGN KEY([userId])
REFERENCES [dbo].[workinguser] ([userId])
GO
ALTER TABLE [dbo].[logrevenue] CHECK CONSTRAINT [FK__LogRevenu__userI__27F8EE98]
GO
/****** Object:  ForeignKey [FK__LogRevenu__userI__28ED12D1]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[logrevenue]  WITH CHECK ADD  CONSTRAINT [FK__LogRevenu__userI__28ED12D1] FOREIGN KEY([userId])
REFERENCES [dbo].[workinguser] ([userId])
GO
ALTER TABLE [dbo].[logrevenue] CHECK CONSTRAINT [FK__LogRevenu__userI__28ED12D1]
GO
/****** Object:  ForeignKey [FK__LogRevenu__userI__29E1370A]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[logrevenue]  WITH CHECK ADD  CONSTRAINT [FK__LogRevenu__userI__29E1370A] FOREIGN KEY([userId])
REFERENCES [dbo].[workinguser] ([userId])
GO
ALTER TABLE [dbo].[logrevenue] CHECK CONSTRAINT [FK__LogRevenu__userI__29E1370A]
GO
/****** Object:  ForeignKey [FK__LogRevenu__userI__2AD55B43]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[logrevenue]  WITH CHECK ADD  CONSTRAINT [FK__LogRevenu__userI__2AD55B43] FOREIGN KEY([userId])
REFERENCES [dbo].[workinguser] ([userId])
GO
ALTER TABLE [dbo].[logrevenue] CHECK CONSTRAINT [FK__LogRevenu__userI__2AD55B43]
GO
/****** Object:  ForeignKey [FK__LogRevenu__userI__2BC97F7C]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[logrevenue]  WITH CHECK ADD  CONSTRAINT [FK__LogRevenu__userI__2BC97F7C] FOREIGN KEY([userId])
REFERENCES [dbo].[workinguser] ([userId])
GO
ALTER TABLE [dbo].[logrevenue] CHECK CONSTRAINT [FK__LogRevenu__userI__2BC97F7C]
GO
/****** Object:  ForeignKey [FK__logtype__partner__2CBDA3B5]    Script Date: 03/17/2015 16:54:40 ******/
ALTER TABLE [dbo].[logtype]  WITH CHECK ADD  CONSTRAINT [FK__logtype__partner__2CBDA3B5] FOREIGN KEY([partnerId])
REFERENCES [dbo].[partner] ([partnerId])
GO
ALTER TABLE [dbo].[logtype] CHECK CONSTRAINT [FK__logtype__partner__2CBDA3B5]
GO
