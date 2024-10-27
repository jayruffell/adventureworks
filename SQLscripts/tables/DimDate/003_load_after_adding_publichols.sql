-- from chatgpt - not part of the tutorial but I wanted to play around with this.
UPDATE AdventureWorksDW.Sales.Dim_Date
SET IsPublicHol = h.is_hol
FROM AdventureWorksDW.Sales.Dim_Date d 
LEFT JOIN staging.dbo.holidays h ON 
d.DateKey = CONVERT(VARCHAR(8), h.date, 112);