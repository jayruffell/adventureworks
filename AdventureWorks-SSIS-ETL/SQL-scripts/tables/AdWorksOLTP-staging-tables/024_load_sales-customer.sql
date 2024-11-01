INSERT INTO staging.[AdWorksOLTP].[Customer]
SELECT
	[CustomerID],
	[PersonID],
	[StoreID],
	[TerritoryID],
	[rowguid],
	[ModifiedDate]
FROM AdventureWorks.Sales.Customer

Select count(*)
from staging.AdWorksOLTP.Customer; -- check
GO