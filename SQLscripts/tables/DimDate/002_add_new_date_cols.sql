-- from chatgpt - not part of the tutorial but I wanted to play around with this.
ALTER TABLE DimDate
ADD Year INT,
    Quarter INT,
    Month INT,
    DayOfWeek VARCHAR(20),
    IsPublicHoliday BIT;