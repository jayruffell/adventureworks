-- Name had user defined types in original scripts - as shortcut I changed to varchar. Best practice is to recreate UDTs in target DB though.

USE staging
GO

/****** Object:  Table [Person].[Person]    Script Date: 1/11/2024 11:03:54 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AdWorksOLTP].[Person](
	[BusinessEntityID] [int] NOT NULL,
	-- [PersonType] [nchar](2) NOT NULL,
	-- [NameStyle] [varchar] (200) NOT NULL, -- UDT workaround
	-- [Title] [nvarchar](8) NULL,
	[FirstName] [nvarchar] (200) NOT NULL,
	[MiddleName] [nvarchar] (200) NULL,
	[LastName] [nvarchar] (200) NULL, 
	-- [Suffix] [nvarchar](10) NULL,
	-- [EmailPromotion] [int] NOT NULL,
	-- [AdditionalContactInfo] [varchar] NULL, -- UDT workaround
	-- [Demographics] [varchar] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Person_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
