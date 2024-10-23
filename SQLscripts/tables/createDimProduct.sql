-- note ChatGPT says if's fine to allow NULLs (which the below code doesn't) and deal with them as part of an ETL or post ETL.
USE AdventureWorksDW;
GO

IF OBJECT_ID('Sales.Dim_Product', 'U') IS NOT NULL
BEGIN
    DROP TABLE Sales.Dim_Product;
END
GO

CREATE TABLE Sales.Dim_Product ( -- OLTP data does not come from Sales schema, but the DW is gonna be for doing sales reporting and analysis. So good schema to use.
	ProductKey INT PRIMARY KEY,
	ProductName NVARCHAR(60) NOT NULL,
	ProductModel NVARCHAR(60) NOT NULL,
	ProductCategory NVARCHAR(60) NOT NULL,
	ProductNumber NVARCHAR(60) NOT NULL,
	MakeFlag BIT NOT NULL,
	FinishedGoodsFlag BIT NOT NULL,
	Color NVARCHAR(20) NOT NULL,
	Size NVARCHAR(20) NOT NULL,
	SizeUnitMeasure NVARCHAR(20) NOT NULL,
	[Weight] DECIMAL NOT NULL,
	WeightUnitMeasure NVARCHAR(20) NOT NULL,
	ProductLine NVARCHAR(3) NOT NULL,
	ProductClass NVARCHAR(3) NOT NULL,
	ProductStyle NVARCHAR(3) NOT NULL,
	SellStartDateKey INT NOT NULL,
	SellEndDateKey INT NOT NULL,
	DiscontinuedDateKey INT NOT NULL,
	ModifiedDateKey INT NOT NULL
);