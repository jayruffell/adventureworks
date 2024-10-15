-- jay playing around with getting data into AdventureWorksDW, given select statement provided by the tutorial i'm following. may end up using ETL tools instead (like the tutorial did)
-- USE AdventureWorks
-- GO

INSERT INTO AdventureWorksDW.Sales.Fact_SalesOrderDetail
SELECT
SD.SalesOrderDetailID AS SalesOrderDetailKey,
SH.SalesOrderID AS SalesOrderKey,
SD.ProductID AS ProductKey,
SD.SpecialOfferID AS SpecialOfferKey,
SH.Status AS SalesOrderStatusKey,
SH.OnlineOrderFlag AS SalesOnlineOrderFlag,
SH.AccountNumber AS SalesOrderAccountNumber,
SH.CustomerID AS SalesOrderCustomerKey,
ISNULL(SH.SalesPersonID,0) AS SalesPersonKey,
SH.TerritoryID AS TerritoryKey,
SH.BillToAddressID AS BillToAddressKey,
SH.ShipToAddressID AS ShipToAddressKey,
SH.ShipMethodID AS ShipMethodKey,
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
FROM AdventureWorks.Sales.SalesOrderDetail SD
	LEFT JOIN AdventureWorks.Sales.SalesOrderHeader SH ON SD.SalesOrderID = SH.SalesOrderID