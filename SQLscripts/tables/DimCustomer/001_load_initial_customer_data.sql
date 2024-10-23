-- jay playing around with getting data into AdventureWorksDW, given select statement provided by the tutorial i'm following. may end up using ETL tools instead (like the tutorial did)
-- getting cols by looking at underlying AdventureWorks DB, as described in the COnfluence page I've written for summarising my learnings from the tutorial.
-- ALSO NOT BOTHERING WITH NULL HANDLING FOR NOW, only adding in if I find errors with loading. I could also update the create table code to allow NULLs, which ChatGPT thought was a good idea!

INSERT INTO AdventureWorksDW.Sales.Dim_Customer
SELECT
	CustomerID AS CustomerKey,
	ISNULL(s.[Name], 'N/A') AS StoreName,
	t.[Name] AS Territory,
	t.CountryRegionCode,
	t.[Group] AS TerritoryGroup,
-- deal with date cols - see my Confluence page for benefits of having "mini snowflake schema" of dim product joinging to dim date. Code below re-formats date as YYYYMMDD (112 is the format code) and then converts to integer. ChatGPT can explain why this is a good idea.
ISNULL(CONVERT(INT, CONVERT(VARCHAR(8), s.ModifiedDate, 112)), 99991231) AS ModifiedDateKey
FROM AdventureWorks.Sales.Customer c
LEFT JOIN AdventureWorks.Sales.Store s ON c.StoreID = s.BusinessEntityID
LEFT JOIN AdventureWorks.Sales.SalesTerritory t ON c.TerritoryID = t.TerritoryID