INSERT INTO staging.[AdWorksOLTP].[ProductModel]
SELECT
    [ProductModelID],
	[Name],
	-- [CatalogDescription] [varchar] NULL, -- UDT col that isn't easliy convertered. shoulda copied UDT types over, but meh.
	-- [Instructions], -- as above
	[rowguid],
	[ModifiedDate]
FROM AdventureWorks.Production.ProductModel

Select count(*)
from staging.AdWorksOLTP.ProductModel; -- check
GO