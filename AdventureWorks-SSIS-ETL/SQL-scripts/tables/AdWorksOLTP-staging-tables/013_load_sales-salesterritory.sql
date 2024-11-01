
INSERT INTO [AdWorksOLTP].[SalesTerritory]
SELECT
	[TerritoryID],
	[Name],
	[CountryRegionCode],
	[Group] [nvarchar],
	[SalesYTD] [money],
	[SalesLastYear],
	[CostYTD],
	[CostLastYear],
	[rowguid],
	[ModifiedDate]
FROM AdventureWorks.Sales.SalesTerritory
GO

-- Select count(*)
-- from staging.AdWorksOLTP.SalesTerritory; -- check
-- GO
