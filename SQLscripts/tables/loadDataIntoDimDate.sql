-- jay playing around with getting data into AdventureWorksDW, given select statement provided by the tutorial i'm following. may end up using ETL tools instead (like the tutorial did)
-- ChatGPT gave me this logic.

WITH DateRange AS (
    SELECT CAST('1980-01-01' AS DATE) AS DateValue
    UNION ALL
    SELECT DATEADD(DAY, 1, DateValue)
    FROM DateRange
    WHERE DateValue < '2030-12-31'
),
-- jay adding default value, using default used in tutorial thruout.
DateRange_inc_Default AS (
	SELECT * From DateRange
	UNION ALL
	Select CAST('9999-12-31' AS DATE) AS DateValue
)

INSERT INTO AdventureWorksDW.Sales.Dim_Date (DateKey, DateValue)
SELECT 
    CONVERT(INT, CONVERT(VARCHAR(8), DateValue, 112)) AS DateKey,
    DateValue
FROM DateRange_inc_Default
OPTION (MAXRECURSION 0);


