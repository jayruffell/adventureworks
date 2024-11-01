-- Name had user defined types in original scripts - as shortcut I changed to varchar. Best practice is to recreate UDTs in target DB though.

USE staging
GO

/****** Object:  Table [Sales].[SalesOrderHeader]    Script Date: 1/11/2024 11:03:54 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AdWorksOLTP].[SalesOrderHeader](
	[SalesOrderID] [int],
	[RevisionNumber] [tinyint] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[ShipDate] [datetime] NULL,
	[Status] [tinyint] NOT NULL,
	-- [OnlineOrderFlag] [varchar] NOT NULL,
	-- [SalesOrderNumber] [varchar] NOT NULL,
	-- [PurchaseOrderNumber] [varchar] NULL,
	-- [AccountNumber] [varchar] NULL,
	[CustomerID] [int] NOT NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	-- [BillToAddressID] [int] NOT NULL,
	-- [ShipToAddressID] [int] NOT NULL,
	-- [ShipMethodID] [int] NOT NULL,
	-- [CreditCardID] [int] NULL,
	-- [CreditCardApprovalCode] [varchar](15) NULL,
	-- [CurrencyRateID] [int] NULL,
	[SubTotal] [money] NOT NULL,
	[TaxAmt] [money] NOT NULL,
	[Freight] [money] NOT NULL,
	[TotalDue] [money] NOT NULL,
	[Comment] [nvarchar](128) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesOrderHeader_SalesOrderID] PRIMARY KEY CLUSTERED 
(
	[SalesOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO