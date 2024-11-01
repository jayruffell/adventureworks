INSERT INTO staging.[AdWorksOLTP].[SalesOrderDetail]
SELECT
    [SalesOrderID],
	[SalesOrderDetailID],
	[CarrierTrackingNumber],
	[OrderQty],
	[ProductID],
	[SpecialOfferID],
	[UnitPrice],
	[UnitPriceDiscount],
	[LineTotal],
	[rowguid],
	[ModifiedDate]
FROM AdventureWorks.Sales.SalesOrderDetail

Select count(*)
from staging.AdWorksOLTP.SalesOrderDetail; -- check
GO