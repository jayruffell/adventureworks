-- SET TABLE NAME VAR AND THEN RUN TO SEE WHEN LAST MODIFIED

DECLARE @TableNameWithoutSchema NVARCHAR(100);
SET @TableNameWithoutSchema = 'Fact_SalesOrderDetail';

USE AdventureWorksDW_SSIS;
SELECT 
    name AS TableName,
    schema_id,
    create_date,
    modify_date
FROM 
    sys.tables
WHERE 
    name = @TableNameWithoutSchema;  -- Remove the quotes
