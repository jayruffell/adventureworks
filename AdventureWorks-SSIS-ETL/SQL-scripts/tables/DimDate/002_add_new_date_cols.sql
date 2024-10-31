-- from chatgpt - not part of the tutorial but I wanted to play around with this.
USE AdventureWorksDW_SSIS;

ALTER TABLE Sales.Dim_Date
ADD Year INT,
    Quarter INT,
    Month INT,
    DayOfWeek VARCHAR(20);