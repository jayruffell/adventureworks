INSERT INTO staging.[AdWorksOLTP].[Person]
SELECT
	[BusinessEntityID],
	[PersonType],
	-- [NameStyle],  -- as below
	-- [Title],
	[FirstName],
	[MiddleName]
	[LastName],
	-- [Suffix],
	-- [EmailPromotion] [int],
	-- [AdditionalContactInfo] NULL, -- UDT workaround
	-- [Demographics] NULL,
	[rowguid],
	[ModifiedDate]
FROM AdventureWorks.Person.Person

Select *
from staging.AdWorksOLTP.Person; -- check
GO