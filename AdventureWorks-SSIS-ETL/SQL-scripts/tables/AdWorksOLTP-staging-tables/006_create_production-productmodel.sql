-- Name had user defined types in original scripts - as shortcut I changed to varchar. Best practice is to recreate UDTs in target DB though.

USE staging
GO

/****** Object:  Table [Production].[ProductModel]    Script Date: 1/11/2024 11:03:54 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AdWorksOLTP].[ProductModel](
	[ProductModelID] [int] NOT NULL,
	[Name] [varchar] (200) NOT NULL,
	-- [CatalogDescription] [varchar] NULL, -- UDT col that isn't easliy convertered. shoulda copied UDT types over, but meh.
	-- [Instructions] [varchar] NULL, -- as above
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductModel_ProductModelID] PRIMARY KEY CLUSTERED 
(
	[ProductModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO