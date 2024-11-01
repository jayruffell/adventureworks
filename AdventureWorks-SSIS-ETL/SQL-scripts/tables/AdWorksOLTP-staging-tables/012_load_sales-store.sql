INSERT INTO [staging].[AdWorksOLTP].[Store]

SELECT
	[BusinessEntityID],
	[Name],
	[SalesPersonID],
	-- [Demographics], -- user defined type I can't easily convert.
	[rowguid],
	[ModifiedDate]
from AdventureWorks.Sales.Store;
GO

-- Select count(*)
-- from staging.AdWorksOLTP.Store; -- check
-- GO
