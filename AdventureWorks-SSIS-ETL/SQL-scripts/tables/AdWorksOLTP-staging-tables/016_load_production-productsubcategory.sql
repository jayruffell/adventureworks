INSERT INTO staging.[AdWorksOLTP].[ProductSubcategory]
SELECT
	*
FROM AdventureWorks.Production.ProductSubcategory

Select count(*)
from staging.AdWorksOLTP.ProductSubcategory; -- check
GO