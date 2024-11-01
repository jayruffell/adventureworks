INSERT INTO staging.[AdWorksOLTP].[UnitMeasure]
SELECT
	*
FROM AdventureWorks.Production.UnitMeasure

Select count(*)
from staging.AdWorksOLTP.UnitMeasure; -- check
GO

Select count(*)
from AdventureWorks.Production.UnitMeasure; -- check
GO