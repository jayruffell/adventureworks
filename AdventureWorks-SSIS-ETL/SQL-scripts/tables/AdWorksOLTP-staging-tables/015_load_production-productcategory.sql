INSERT INTO staging.[AdWorksOLTP].[ProductCategory]
SELECT
	*
FROM AdventureWorks.Production.ProductCategory

Select count(*)
from staging.AdWorksOLTP.ProductCategory; -- check
GO