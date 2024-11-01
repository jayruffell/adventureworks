-- per the online tutorial, prior to the ETL you want to drop non-clustered indexes, then load the data, then recreate them.  Testing each of these here  Before pasting the code into SSIS.

USE AdventureWorksDW_SSIS
DROP index NI_ProductKey ON Sales.Fact_SalesOrderDetail;
-- DROP index NI_SalesOrderStatusKey ON Sales.Fact_SalesOrderDetail;
DROP index NI_SalesOrderCustomerKey ON Sales.Fact_SalesOrderDetail;
DROP index NI_SalesPersonKey ON Sales.Fact_SalesOrderDetail;
DROP index NI_TerritoryKey ON Sales.Fact_SalesOrderDetail;
DROP index NI_SalesOrderDetailModifiedDateKey ON Sales.Fact_SalesOrderDetail;
DROP index NI_SalesOrderDateKey ON Sales.Fact_SalesOrderDetail;
DROP index NI_SalesOrderDueDateKey ON Sales.Fact_SalesOrderDetail;
DROP index NI_SalesOrderShipDateKey ON Sales.Fact_SalesOrderDetail;
DROP index NI_SalesOrderModifiedDateKey ON Sales.Fact_SalesOrderDetail;
-- DROP index NI_BillToAddressKey ON Sales.Fact_SalesOrderDetail;
-- DROP index NI_ShipToAddressKey ON Sales.Fact_SalesOrderDetail;
GO

CREATE nonclustered index NI_ProductKey ON Sales.Fact_SalesOrderDetail (ProductKey);
-- CREATE nonclustered index NI_SalesOrderStatusKey ON Sales.Fact_SalesOrderDetail (SalesOrderStatusKey);
CREATE nonclustered index NI_SalesOrderCustomerKey ON Sales.Fact_SalesOrderDetail (SalesOrderCustomerKey);
CREATE nonclustered index NI_SalesPersonKey ON Sales.Fact_SalesOrderDetail (SalesPersonKey);
CREATE nonclustered index NI_TerritoryKey ON Sales.Fact_SalesOrderDetail (TerritoryKey);
CREATE nonclustered index NI_SalesOrderDetailModifiedDateKey ON Sales.Fact_SalesOrderDetail (SalesOrderDetailModifiedDateKey);
CREATE nonclustered index NI_SalesOrderDateKey ON Sales.Fact_SalesOrderDetail (SalesOrderDateKey);
CREATE nonclustered index NI_SalesOrderDueDateKey ON Sales.Fact_SalesOrderDetail (SalesOrderDueDateKey);
CREATE nonclustered index NI_SalesOrderShipDateKey ON Sales.Fact_SalesOrderDetail (SalesOrderShipDateKey);
CREATE nonclustered index NI_SalesOrderModifiedDateKey ON Sales.Fact_SalesOrderDetail (SalesOrderModifiedDateKey);
-- CREATE nonclustered index NI_BillToAddressKey ON Sales.Fact_SalesOrderDetail (BillToAddressKey);
-- CREATE nonclustered index NI_ShipToAddressKey ON Sales.Fact_SalesOrderDetail (ShipToAddressKey);
GO