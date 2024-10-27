-- from chatgpt - not part of the tutorial but I wanted to play around with this.
USE AdventureWorksDW;

-- drop indexes first, required before dropping cols
DROP INDEX NI_SalesOrderStatusKey ON Sales.Fact_SalesOrderDetail
DROP INDEX NI_BillToAddressKey ON Sales.Fact_SalesOrderDetail
DROP INDEX NI_ShipToAddressKey ON Sales.Fact_SalesOrderDetail

GO

ALTER TABLE Sales.Fact_SalesOrderDetail
    DROP COLUMN 
    SpecialOfferKey, 
    SalesOrderStatusKey,
    SalesOnlineOrderFlagKey,
    SalesOrderAccountNumber,
    BillToAddressKey,
    ShipToAddressKey,
    ShipMethodKey    
GO