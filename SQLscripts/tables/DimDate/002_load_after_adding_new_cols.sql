-- from chatgpt - not part of the tutorial but I wanted to play around with this.
UPDATE DateDimension
SET Year = YEAR([date]),
    Quarter = CASE 
                WHEN MONTH([date]) IN (1, 2, 3) THEN 1
                WHEN MONTH([date]) IN (4, 5, 6) THEN 2
                WHEN MONTH([date]) IN (7, 8, 9) THEN 3
                ELSE 4
              END,
    Month = MONTH([date]),
    DayOfWeek = DATENAME(WEEKDAY, [date]);

-- Updating the IsPublicHoliday field manually or using a table with holiday data
-- Example: if you have a table called PublicHolidays with a column holiday_date
UPDATE DateDimension
SET IsPublicHoliday = CASE WHEN [date] IN (SELECT holiday_date FROM PublicHolidays) THEN 1 ELSE 0 END;
