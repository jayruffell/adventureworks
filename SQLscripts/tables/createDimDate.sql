-- inferred columns from the tutorial in the readme.  the tutorial did not specifically create this table, but it provided an ERD  of table names.

USE AdventureWorksDW

IF OBJECT_ID('Sales.Dim_Date', 'U') IS NOT NULL
BEGIN
    DROP TABLE Sales.Dim_Date;
END
GO

CREATE TABLE Sales.Dim_Date (
    DateKey INT PRIMARY KEY,
    DateValue DATE NOT NULL
);
