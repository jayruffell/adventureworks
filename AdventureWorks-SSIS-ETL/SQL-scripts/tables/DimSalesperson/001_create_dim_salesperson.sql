-- inferred columns from the tutorial in the readme.  the tutorial did not specifically create this table, but it provided an ERD  of table names.
-- note ChatGPT says if's fine to allow NULLs (which the below code doesn't) and deal with them as part of an ETL or post ETL.
USE AdventureWorksDW_SSIS;
GO

CREATE TABLE Sales.Dim_SalesPerson (
	SalesPersonKey INT PRIMARY KEY,
	FirstName NVARCHAR(50) NULL,
	MiddleName NVARCHAR(50) NULL,
	LastName NVARCHAR(50) NULL,
	FullName NVARCHAR(100) NULL,
	Territory NVARCHAR(50) NOT NULL,
	CountryRegionCode NVARCHAR(10) NOT NULL,
	TerritoryGroup NVARCHAR(50) NOT NULL,
	ModifiedDateKey INT NOT NULL
);