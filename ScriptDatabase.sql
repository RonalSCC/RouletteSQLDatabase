USE [master]
GO
/****** Object:  Database [MasivePrueba]    Script Date: 4/11/2021 8:17:07 p. m. ******/
CREATE DATABASE [MasivePrueba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasivePrueba', FILENAME = N'C:\Users\desarrollador7\MasivePrueba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasivePrueba_log', FILENAME = N'C:\Users\desarrollador7\MasivePrueba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MasivePrueba] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasivePrueba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasivePrueba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasivePrueba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasivePrueba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasivePrueba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasivePrueba] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasivePrueba] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MasivePrueba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasivePrueba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasivePrueba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasivePrueba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasivePrueba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasivePrueba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasivePrueba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasivePrueba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasivePrueba] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MasivePrueba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasivePrueba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasivePrueba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasivePrueba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasivePrueba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasivePrueba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasivePrueba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasivePrueba] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MasivePrueba] SET  MULTI_USER 
GO
ALTER DATABASE [MasivePrueba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasivePrueba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasivePrueba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasivePrueba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasivePrueba] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasivePrueba] SET QUERY_STORE = OFF
GO
USE [MasivePrueba]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [MasivePrueba]
GO
/****** Object:  Schema [LOGRUL]    Script Date: 4/11/2021 8:17:08 p. m. ******/
CREATE SCHEMA [LOGRUL]
GO
/****** Object:  Schema [ROU]    Script Date: 4/11/2021 8:17:08 p. m. ******/
CREATE SCHEMA [ROU]
GO
/****** Object:  Schema [RUL]    Script Date: 4/11/2021 8:17:08 p. m. ******/
CREATE SCHEMA [RUL]
GO
/****** Object:  Table [LOGRUL].[LogWebApi]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [LOGRUL].[LogWebApi](
	[LogWebApiID] [int] IDENTITY(1,1) NOT NULL,
	[API] [varchar](max) NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[IP] [varchar](max) NOT NULL,
	[Input] [varchar](max) NULL,
	[Output] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[LogWebApiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [RUL].[Bet]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RUL].[Bet](
	[BetID] [int] IDENTITY(1,1) NOT NULL,
	[RouletteID] [int] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
	[BetValue] [decimal](18, 2) NOT NULL,
	[Number] [int] NOT NULL,
	[Finished] [bit] NOT NULL,
	[Winner] [bit] NOT NULL,
 CONSTRAINT [PK__Bet__454024A957C1E094] PRIMARY KEY CLUSTERED 
(
	[BetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [RUL].[BetUser]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RUL].[BetUser](
	[UserID] [uniqueidentifier] NOT NULL,
	[UserName] [varchar](max) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [RUL].[Roulette]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RUL].[Roulette](
	[RouletteID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Open] [bit] NOT NULL,
	[WinningNumber] [int] NULL,
	[OpenningDate] [datetime] NOT NULL,
 CONSTRAINT [PK__Roulette__8371609C2ACA6E0E] PRIMARY KEY CLUSTERED 
(
	[RouletteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [RUL].[BetUser] ADD  DEFAULT (newid()) FOR [UserID]
GO
/****** Object:  StoredProcedure [LOGRUL].[RegisterLogWebApi]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [LOGRUL].[RegisterLogWebApi]
								      @API VARCHAR(MAX),
									  @RegistrationDate DATETIME,
									  @IP varchar(max),
									  @Input VARCHAR(MAX),
									  @Output VARCHAR(MAX)
AS
 
	INSERT INTO LOGRUL.LogWebApi (API, RegistrationDate, IP, Input, Output)
	VALUES (@API, @RegistrationDate, @IP, @Input, @Output);

GO
/****** Object:  StoredProcedure [RUL].[CreateBet]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [RUL].[CreateBet] 
@RouletteID			INT,
@UserID			    UNIQUEIDENTIFIER,
@BetValue			DECIMAL(18,2),
@Number				INT,
@Finished			BIT,
@Winner				BIT

AS
 
	INSERT INTO RUL.Bet (RouletteID, UserID, BetValue, Number, Finished, Winner)
	VALUES (@RouletteID, @UserID, @BetValue, @Number, @Finished, @Winner);
	SELECT SCOPE_IDENTITY();

GO
/****** Object:  StoredProcedure [RUL].[CreateBetUser]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [RUL].[CreateBetUser]
@UserID				UNIQUEIDENTIFIER,
@UserName			VARCHAR(MAX),
@Amount				DECIMAL(18,2),
@Active			BIT
AS
 
	INSERT into RUL.BetUser (UserID,
						UserName, 
						Amount, 
						Active)
	VALUES (@UserID,
			@UserName, 
			@Amount, 
			@Active); 
				SELECT SCOPE_IDENTITY();
GO
/****** Object:  StoredProcedure [RUL].[FinishRoulette]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [RUL].[FinishRoulette] 
@RouletteID			INT,
@BetWinnerID		INT = NULL,
@BetWinnerColorIDs VARCHAR(MAX) = NULL
AS

UPDATE RUL.Roulette SET [Open] = 0 WHERE RouletteID = @RouletteID
	UPDATE RUL.Bet SET Finished = 1 WHERE RouletteID = @RouletteID
	IF @BetWinnerID IS NOT NULL BEGIN  
    	UPDATE RUL.BetUser SET Amount = (Amount * 5) WHERE UserID = (SELECT b.UserID FROM RUL.Bet b WHERE b.BetID = @BetWinnerID)
		UPDATE RUL.Bet SET Winner = 1 WHERE BetID = @BetWinnerID
    END

	IF @BetWinnerColorIDs is NOT NULL BEGIN  
    	UPDATE RUL.BetUser SET Amount = (Amount * 1.8) WHERE UserID IN (SELECT b.UserID FROM RUL.Bet b WHERE b.BetID IN (select CONVERT(INT, value) from STRING_SPLIT(@BetWinnerColorIDs, ',')))
    	UPDATE RUL.Bet SET Winner = 1 WHERE BetID in (select CONVERT(INT, value) from STRING_SPLIT(@BetWinnerColorIDs, ','))

    END
GO
/****** Object:  StoredProcedure [RUL].[ListBets]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE Procedure [RUL].[ListBets]
	@BetID			INT = NULL
	AS
		SELECT 	b.BetID
				,b.RouletteID
				,b.UserID
				,b.BetValue
				,b.Number
				,b.Finished
				,b.Winner
		FROM rul.Bet b
		WHERE (@BetID is NULL OR b.BetID = @BetID)
GO
/****** Object:  StoredProcedure [RUL].[ListBetUser]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE Procedure [RUL].[ListBetUser]
	@UserID			UNIQUEIDENTIFIER = NULL
	AS
		SELECT 	bu.UserID
				,bu.UserName
				,bu.Amount
				,bu.Active
		FROM rul.BetUser bu
		WHERE (@UserID is NULL OR bu.UserID = @UserID)

GO
/****** Object:  StoredProcedure [RUL].[ListRoulettes]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [RUL].[ListRoulettes]
@RouletteID			INT = NULL
AS
	SELECT 
		r.RouletteID
		,r.Name
		,r.[Open]
		,r.WinningNumber
		,r.OpenningDate
	FROM rul.Roulette r
	WHERE (@RouletteID is NULL OR r.RouletteID = @RouletteID)
GO
/****** Object:  StoredProcedure [RUL].[RegisterRoulette]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [RUL].[RegisterRoulette]
@Name		VARCHAR(MAX),
@Open		BIT,
@OpenningDate		DATETIME
AS
 
	INSERT INTO RUL.Roulette([Name], [Open], OpenningDate) 
	VALUES (@Name, @Open,@OpenningDate)

	SELECT SCOPE_IDENTITY();

GO
/****** Object:  StoredProcedure [RUL].[UpdateBet]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [RUL].[UpdateBet] 
@BetID		INT,
@RouletteID			INT,
@UserID UNIQUEIDENTIFIER = NULL,
@BetValue DECIMAL(18,2) = NULL,
@Number INT = NULL,
@Finished BIT = NULL
AS
 
	UPDATE RUL.Bet 
	SET	RouletteID = ISNULL(@RouletteID, RouletteID)
		,UserID =  ISNULL(@UserID, UserID)
		,BetValue =  ISNULL(@BetValue, BetValue)
		,Number =  ISNULL(@Number, Number)
		,Finished =  ISNULL(@Finished, Finished)
	WHERE BetID = @BetID; 
	

GO
/****** Object:  StoredProcedure [RUL].[UpdateRoulette]    Script Date: 4/11/2021 8:17:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [RUL].[UpdateRoulette] 
@RouletteID			INT,
@Name VARCHAR(MAX) = NULL,
@Open BIT = NULL,
@WinningNumber INT = NULL,
@OpenningDate DATETIME = NULL
AS
 
	UPDATE RUL.Roulette 
	SET	[Name] = ISNULL(@Name, [Name])
		,[Open] = ISNULL(@Open, [Open])
		,WinningNumber =  ISNULL(@WinningNumber, WinningNumber)
		,OpenningDate = ISNULL(@OpenningDate, OpenningDate)
	WHERE RouletteID = @RouletteID;

GO
USE [master]
GO
ALTER DATABASE [MasivePrueba] SET  READ_WRITE 
GO
