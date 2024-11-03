-- don't actually want to load the data here, cos thats what the SSIS package is for. But this is the SQL code I wanna put into the SSIS package - so testing here.
INSERT INTO AdventureWorksDW_SSIS.Sales.Fact_SalesOrderDetail
SELECT
	SD.SalesOrderDetailID AS SalesOrderDetailKey,
	SH.SalesOrderID AS SalesOrderKey,
	SD.ProductID AS ProductKey,
	SH.CustomerID AS SalesOrderCustomerKey,
	ISNULL(SH.SalesPersonID,0) AS SalesPersonKey,
	SH.TerritoryID AS TerritoryKey,
	CONVERT(INT, CONVERT(VARCHAR(8),SD.ModifiedDate,112)) AS SalesOrderDetailModifiedDateKey,
	CONVERT(INT, CONVERT(VARCHAR(8),SH.OrderDate,112)) AS SalesOrderDateKey,
	CONVERT(INT, CONVERT(VARCHAR(8),SH.DueDate,112)) AS SalesOrderDueDateKey,
	CONVERT(INT, CONVERT(VARCHAR(8),SH.ShipDate,112)) AS SalesOrderShipDateKey,
	CONVERT(INT, CONVERT(VARCHAR(8),SH.ModifiedDate,112)) AS SalesOrderModifiedDateKey,
	SD.OrderQty,
	SD.UnitPrice,
	SD.UnitPriceDiscount,
	SD.LineTotal,
	SH.SubTotal AS SalesOrderSubTotal,
	SH.TaxAmt AS SalesOrderTaxAmount,
	SH.Freight AS SalesOrderFreightAmount,
	SH.TotalDue AS SalesOrderTotalDueAmount
FROM staging.AdWorksOLTP.SalesOrderDetail SD
	LEFT JOIN staging.AdWorksOLTP.SalesOrderHeader SH ON SD.SalesOrderID = SH.SalesOrderID
GO

-- -- return to empty table
-- TRUNCATE TABLE AdventureWorksDW_SSIS.Sales.Fact_SalesOrderDetail
-- GO