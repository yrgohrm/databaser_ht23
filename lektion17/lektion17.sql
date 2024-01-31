USE Northwind;
GO

CREATE PROCEDURE dbo.stockWithPriceLessThan
    @Price AS MONEY
AS
BEGIN
    SET NOCOUNT ON
    SELECT ProductID, ProductName, UnitPrice 
    FROM Products 
    WHERE UnitPrice < @Price AND UnitsInStock > 0;
END
GO

EXEC stockWithPriceLessThan 10
EXEC stockWithPriceLessThan 20
GO


CREATE PROCEDURE dbo.highestPriceLessThan
    @Price AS MONEY,                -- input
    @HighestPrice AS MONEY OUTPUT,  -- output
    @HighestID AS INT OUTPUT        -- output
AS
    SET NOCOUNT ON
    SELECT TOP(1) @HighestID = ProductID, @HighestPrice = UnitPrice 
      FROM Products 
     WHERE UnitPrice < @Price AND UnitsInStock > 0
    ORDER BY UnitPrice DESC;
GO

DECLARE @HP AS MONEY
DECLARE @HID AS INT

-- HighestPrice and HighestID are outputs, below HP and HID will be set to the
-- output values, the syntax is backwards to be the same as for input assignments...
EXEC dbo.highestPriceLessThan 20, @HighestPrice = @HP OUTPUT, @HighestID = @HID OUTPUT;
SELECT @HID, @HP;
GO

CREATE PROCEDURE dbo.increasePrice
    @ProductID INT
AS
    DECLARE @UnitPrice AS MONEY

    SELECT @UnitPrice = UnitPrice FROM Products
     WHERE ProductID = @ProductID

    IF @UnitPrice < 50
        UPDATE Products 
        SET UnitPrice = ROUND(UnitPrice * 1.1, 1, 1)
        WHERE ProductID = @ProductID;
    ELSE
        UPDATE Products 
        SET UnitPrice = ROUND(UnitPrice * 1.03, 1, 1)
        WHERE ProductID = @ProductID;
GO

SELECT ProductID, ProductName, UnitPrice FROM Products WHERE ProductID IN (9, 62);
GO

EXEC  dbo.increasePrice 9
EXEC  dbo.increasePrice 62
GO

SELECT ProductID, ProductName, UnitPrice FROM Products WHERE ProductID IN (9, 62);
GO
