INSERT INTO staging.[AdWorksOLTP].[SalesPerson]
SELECT
	*
FROM AdventureWorks.Sales.SalesPerson

Select count(*)
from staging.AdWorksOLTP.SalesPerson; -- check
GO