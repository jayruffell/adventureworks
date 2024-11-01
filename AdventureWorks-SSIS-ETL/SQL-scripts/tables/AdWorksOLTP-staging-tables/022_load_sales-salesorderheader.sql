INSERT INTO staging.[AdWorksOLTP].[SalesOrderHeader]
SELECT
	[SalesOrderID] [int],
	[RevisionNumber],
	[OrderDate],
	[DueDate],
	[ShipDate],
	[Status],
	-- [OnlineOrderFlag] [varchar] NOT NULL,
	-- [SalesOrderNumber] [varchar] NOT NULL,
	-- [PurchaseOrderNumber] [varchar] NULL,
	-- [AccountNumber] [varchar] NULL,
	[CustomerID],
	[SalesPersonID],
	[TerritoryID],
	-- [BillToAddressID],
	-- [ShipToAddressID],
	-- [ShipMethodID],
	-- [CreditCardID],
	-- [CreditCardApprovalCode] [varchar](15) NULL,
	-- [CurrencyRateID],
	[SubTotal],
	[TaxAmt],
	[Freight],
	[TotalDue],
	[Comment],
	[rowguid],
	[ModifiedDate]
FROM AdventureWorks.Sales.SalesOrderHeader

Select count(*)
from staging.AdWorksOLTP.SalesOrderHeader; -- check
GO