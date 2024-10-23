-- jay playing around with getting data into AdventureWorksDW, given select statement provided by the tutorial i'm following. may end up using ETL tools instead (like the tutorial did)

INSERT INTO AdventureWorksDW.Sales.Dim_Product
SELECT
P.ProductID AS ProductKey,
P.[Name] AS ProductName,
ISNULL(PM.[Name],'N/A') AS ProductModel,
ISNULL(PC.[Name],'N/A') AS ProductCategory,
P.ProductNumber AS ProductNumber,
P.MakeFlag,
P.FinishedGoodsFlag,
ISNULL(P.Color,'N/A') AS Color,
ISNULL(P.Size,'N/A') AS Size,
ISNULL(UM_Size.[Name],'N/A') AS SizeUnitMeasure,
ISNULL(P.[Weight],0) AS [Weight],
ISNULL(UM_Weight.[Name],'N/A') AS WeightUnitMeasure,
ISNULL(CAST(P.ProductLine AS NCHAR(3)),'N/A') ProductLine,
ISNULL(CAST(P.Class AS NCHAR(3)),'N/A') Class,
ISNULL(CAST(P.Style AS NCHAR(3)),'N/A') Style,
-- deal with date cols - see my Confluence page for benefits of having "mini snowflake schema" of dim product joinging to dim date. Code below re-formats date as YYYYMMDD (112 is the format code) and then converts to integer. ChatGPT can explain why this is a good idea.
CONVERT(INT, CONVERT(VARCHAR(8), P.SellStartDate, 112)) AS SellStartDateKey,
ISNULL(CONVERT(INT, CONVERT(VARCHAR(8), P.SellEndDate, 112)),'99991231') AS SellEndDateKey,
ISNULL(CONVERT(INT, CONVERT(VARCHAR(8), DiscontinuedDate, 112)),'99991231') AS DiscontinuedDateKey,
CONVERT(INT, CONVERT(VARCHAR(8), P.ModifiedDate, 112)) AS ModifiedDateKey

FROM AdventureWorks.Production.Product P
LEFT JOIN AdventureWorks.Production.ProductSubcategory PSC ON P.ProductSubcategoryID = PSC.ProductSubcategoryID
LEFT JOIN AdventureWorks.Production.ProductCategory PC ON PSC.ProductCategoryID = PC.ProductCategoryID
LEFT JOIN AdventureWorks.Production.ProductModel PM ON P.ProductModelID = PM.ProductModelID
LEFT JOIN AdventureWorks.Production.UnitMeasure UM_Size ON P.SizeUnitMeasureCode = UM_Size.UnitMeasureCode
LEFT JOIN AdventureWorks.Production.UnitMeasure UM_Weight ON P.WeightUnitMeasureCode = UM_Weight.UnitMeasureCode