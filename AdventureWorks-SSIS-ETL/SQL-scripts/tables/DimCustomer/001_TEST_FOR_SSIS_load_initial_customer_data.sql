-- don't actually want to load the data here, cos thats what the SSIS package is for. But this is the SQL code I wanna put into the SSIS package - so testing here.

INSERT INTO AdventureWorksDW_SSIS.Sales.Dim_Customer
SELECT
	CustomerID AS CustomerKey,
	ISNULL(s.[Name], 'N/A') AS StoreName,
	t.[Name] AS Territory,
	t.CountryRegionCode,
	t.[Group] AS TerritoryGroup,
-- deal with date cols - see my Confluence page for benefits of having "mini snowflake schema" of dim product joinging to dim date. Code below re-formats date as YYYYMMDD (112 is the format code) and then converts to integer. ChatGPT can explain why this is a good idea.
ISNULL(CONVERT(INT, CONVERT(VARCHAR(8), s.ModifiedDate, 112)), 99991231) AS ModifiedDateKey
FROM staging.AdWorksOLTP.Customer c
LEFT JOIN staging.AdWorksOLTP.Store s ON c.StoreID = s.BusinessEntityID
LEFT JOIN staging.AdWorksOLTP.SalesTerritory t ON c.TerritoryID = t.TerritoryID
GO

-- -- return to empty table
-- TRUNCATE TABLE AdventureWorksDW_SSIS.Sales.Dim_Customer
-- GO