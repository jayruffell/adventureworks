use AdventureWorksDW_SSIS

-- truncate table sales.Fact_SalesOrderDetail

select count(*) from sales.Fact_SalesOrderDetail

select top 1 * from sales.Fact_SalesOrderDetail