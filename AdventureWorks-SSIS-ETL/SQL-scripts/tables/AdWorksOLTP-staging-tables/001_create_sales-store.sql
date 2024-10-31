-- Name and Demographics had user defined types in original scripts - as shortcut I changed to varchar. Best practice is to recreate UDTs in target DB though.
USE staging
GO

CREATE TABLE [AdWorksOLTP].[Store](
	[BusinessEntityID] [int] NOT NULL,
	[Name] [varchar] NOT NULL,
	[SalesPersonID] [int] NULL,
	[Demographics] [varchar] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Store_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO