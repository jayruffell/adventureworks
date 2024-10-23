-- inferred columns from the tutorial in the readme.  the tutorial did not specifically create this table, but it provided an ERD  of table names.
-- note ChatGPT says if's fine to allow NULLs (which the below code doesn't) and deal with them as part of an ETL or post ETL.
USE AdventureWorksDW;
GO

IF OBJECT_ID('Sales.Dim_Customer', 'U') IS NOT NULL
BEGIN
    DROP TABLE Sales.Dim_Customer;
END
GO

CREATE TABLE Sales.Dim_Customer (
	CustomerKey INT PRIMARY KEY,
	StoreName NVARCHAR(50) NOT NULL,
	Territory NVARCHAR(50) NOT NULL,
	CountryRegionCode NVARCHAR(10) NOT NULL,
	TerritoryGroup NVARCHAR(50) NOT NULL,
	ModifiedDateKey INT NOT NULL
);