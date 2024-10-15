--// Script to create our first fact table along with additional indexes //--
-- J note: id cols are called "keys"  following suggestion from kimball.  
USE AdventureWorksDW;
GO

IF OBJECT_ID('Sales.Fact_salesorderDetail', 'U') IS NOT NULL
BEGIN
    DROP TABLE Sales.Fact_SalesOrderDetail;
END
GO

CREATE TABLE Sales.Fact_SalesOrderDetail (
	SalesOrderDetailKey int PRIMARY KEY, -- SQL Sever will automatically create a clustered index on the primary key here. JAY NOTE: the type of index to use  is context dependent, so don't just copy this code for other uses.
	SalesOrderKey INT NOT NULL,
	ProductKey INT NOT NULL,
	SpecialOfferKey INT NOT NULL,
	SalesOrderStatusKey INT NOT NULL,
	SalesOnlineOrderFlagKey INT NOT NULL,
	SalesOrderAccountNumber nvarchar(16) NOT NULL,
	SalesOrderCustomerKey INT NOT NULL,
	SalesPersonKey INT NOT NULL,
	TerritoryKey INT NOT NULL,
	BillToAddressKey INT NOT NULL,
	ShipToAddressKey INT NOT NULL,
	ShipMethodKey INT NOT NULL,
	SalesOrderDetailModifiedDateKey INT NOT NULL,
	SalesOrderDateKey INT NOT NULL,
	SalesOrderDueDateKey INT NOT NULL,
	SalesOrderShipDateKey INT NOT NULL,
	SalesOrderModifiedDateKey INT NOT NULL,
	OrderQty INT NOT NULL,
	UnitPrice MONEY NOT NULL,
	UnitPriceDiscount MONEY NOT NULL,
	LineTotal MONEY NOT NULL,
	SalesOrderSubTotal MONEY NOT NULL,
	SalesOrderTaxAmount MONEY NOT NULL,
	SalesOrderFreighAmount MONEY NOT NULL,
	SalesOrderTotalDueAmount MONEY NOT NULL
);

--Create nonclustered indexes for our *potentially* often used dimension keys
-- JAY NOTE: the type of index to use  is context dependent, so don't just copy this code for other uses.

CREATE nonclustered index NI_ProductKey ON Sales.Fact_SalesOrderDetail (ProductKey);
CREATE nonclustered index NI_SalesOrderStatusKey ON Sales.Fact_SalesOrderDetail (SalesOrderStatusKey);
CREATE nonclustered index NI_SalesOrderCustomerKey ON Sales.Fact_SalesOrderDetail (SalesOrderCustomerKey);
CREATE nonclustered index NI_SalesPersonKey ON Sales.Fact_SalesOrderDetail (SalesPersonKey);
CREATE nonclustered index NI_TerritoryKey ON Sales.Fact_SalesOrderDetail (TerritoryKey);
CREATE nonclustered index NI_SalesOrderDetailModifiedDateKey ON Sales.Fact_SalesOrderDetail (SalesOrderDetailModifiedDateKey);
CREATE nonclustered index NI_SalesOrderDateKey ON Sales.Fact_SalesOrderDetail (SalesOrderDateKey);
CREATE nonclustered index NI_SalesOrderDueDateKey ON Sales.Fact_SalesOrderDetail (SalesOrderDueDateKey);
CREATE nonclustered index NI_SalesOrderShipDateKey ON Sales.Fact_SalesOrderDetail (SalesOrderShipDateKey);
CREATE nonclustered index NI_SalesOrderModifiedDateKey ON Sales.Fact_SalesOrderDetail (SalesOrderModifiedDateKey);
CREATE nonclustered index NI_BillToAddressKey ON Sales.Fact_SalesOrderDetail (BillToAddressKey);
CREATE nonclustered index NI_ShipToAddressKey ON Sales.Fact_SalesOrderDetail (ShipToAddressKey);