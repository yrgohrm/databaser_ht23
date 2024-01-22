USE Northwind;
GO

SELECT OBJECT_DEFINITION(OBJECT_ID('dbo.Alphabetical list of products'))
GO

EXEC sp_helptext 'dbo.Alphabetical list of products'
GO

SELECT * FROM [Alphabetical list of products] WHERE CategoryName = 'Condiments';
GO

SELECT Products.*, Categories.CategoryName
FROM Categories
    INNER JOIN Products
    ON Categories.CategoryID = Products.CategoryID
WHERE (((Products.Discontinued)=0))
    AND CategoryName = 'Condiments';
GO





CREATE VIEW dbo.EmployeeAndTerritories
AS
    SELECT e.EmployeeID, e.FirstName, e.LastName, t.TerritoryID, t.TerritoryDescription
    FROM Employees AS e
        JOIN EmployeeTerritories AS et
        ON e.EmployeeID = et.EmployeeID
        JOIN Territories AS t
        ON t.TerritoryID = et.TerritoryID;
GO

SELECT * FROM EmployeeAndTerritories;


SELECT * FROM EmployeeAndTerritories WHERE EmployeeID = 2;
GO


SELECT * FROM EmployeeAndTerritories WHERE TerritoryID = '01581';
GO


UPDATE EmployeeAndTerritories SET FirstName = 'Allan' WHERE TerritoryID = '01581';
GO

UPDATE EmployeeAndTerritories SET FirstName = 'Nisse', TerritoryDescription = 'hahaha' WHERE TerritoryID = '01581';
GO



CREATE VIEW dbo.EmployeeNames
AS
    SELECT FirstName, LastName FROM Employees
    ORDER BY LastName;
GO




CREATE VIEW dbo.EncEmployeeNames
    WITH ENCRYPTION
AS
    SELECT FirstName, LastName 
    FROM Employees;
GO

SELECT * FROM EncEmployeeNames;
GO

SELECT OBJECT_DEFINITION(OBJECT_ID('dbo.EncEmployeeNames'))
EXEC sp_helptext 'dbo.EncEmployeeNames'
GO



CREATE VIEW dbo.SbEmployeeNames
    WITH SCHEMABINDING
AS
    SELECT FirstName, LastName 
    FROM dbo.Employees;
GO

SELECT * FROM SbEmployeeNames;

ALTER TABLE Employees DROP COLUMN LastName;
GO




CREATE VIEW dbo.CoEmployeeNames
AS
    SELECT FirstName, LastName 
    FROM Employees
    WHERE FirstName LIKE 'M%'
    WITH CHECK OPTION;           -- Whoa! Inte samma plats!
GO

-- DROP VIEW CoEmployeeNames;

SELECT * FROM CoEmployeeNames;

-- Fungerar ej! The attempted insert ... failed … did not qualify ...
INSERT INTO CoEmployeeNames VALUES ('Erika', 'Ericsson');
GO



CREATE VIEW ProductAndCategories
AS
    SELECT p.ProductName, c.CategoryName
      FROM Products AS p
      JOIN Categories AS c
        ON p.CategoryID = c.CategoryID;
GO

SELECT ProductName 
  FROM ProductAndCategories
 WHERE CategoryName = 'Condiments'
 ORDER BY ProductName;
GO

CREATE VIEW TerritoryCount
AS
    SELECT e.EmployeeID, e.FirstName, e.LastName, COUNT(et.TerritoryID) as 'Territories'
    FROM Employees AS e
    JOIN EmployeeTerritories AS et
        ON e.EmployeeID = et.EmployeeID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName;
GO

SELECT * FROM TerritoryCount;