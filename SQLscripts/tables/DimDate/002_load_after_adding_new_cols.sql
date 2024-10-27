-- from chatgpt - not part of the tutorial but I wanted to play around with this.
UPDATE AdventureWorksDW.Sales.Dim_Date
SET Year = YEAR([DateValue]),
    Quarter = CASE 
                WHEN MONTH([DateValue]) IN (1, 2, 3) THEN 1
                WHEN MONTH([DateValue]) IN (4, 5, 6) THEN 2
                WHEN MONTH([DateValue]) IN (7, 8, 9) THEN 3
                ELSE 4
              END,
    Month = MONTH([DateValue]),
    DayOfWeek = DATENAME(WEEKDAY, [DateValue]);