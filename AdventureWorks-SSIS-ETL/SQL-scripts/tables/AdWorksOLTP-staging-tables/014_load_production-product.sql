
INSERT INTO staging.[AdWorksOLTP].[Product]
SELECT
	[ProductID],
	[Name],
	[ProductNumber],
	-- [MakeFlag],
	-- [FinishedGoodsFlag], -- conversion issues from UDT
	[Color],
	[SafetyStockLevel],
	[ReorderPoint],
	[StandardCost],
	[ListPrice],
	[Size],
	[SizeUnitMeasureCode],
	[WeightUnitMeasureCode],
	[Weight],
	[DaysToManufacture],
	[ProductLine],
	[Class],
	[Style],
	[ProductSubcategoryID],
	[ProductModelID],
	[SellStartDate],
	[SellEndDate],
	[DiscontinuedDate],
	[rowguid] [uniqueidentifier],
	[ModifiedDate]
FROM AdventureWorks.Production.Product

Select count(*)
from staging.AdWorksOLTP.Product; -- check
GO