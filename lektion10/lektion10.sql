SELECT fldRegNo, COUNT(fldRegNo) 
  FROM tblCarSale 
 GROUP BY fldRegNo 
HAVING COUNT(fldRegNo) > 1;

SELECT fldMake, COUNT(DISTINCT fldModel)
  FROM tblCarSale
 GROUP BY fldMake;
 
SELECT YEAR(fldSellDate) AS SELL_YEAR, COUNT(*)
  FROM tblCarSale
 GROUP BY SELL_YEAR
 ORDER BY SELL_YEAR;
 
SELECT fldMake, fldModel, ROUND(AVG(fldPrice), -3) AS 'Average price'
  FROM tblCarSale
 GROUP BY fldMake, fldModel;

SELECT YEAR(fldSellDate) AS SELL_YEAR, ROUND(AVG(fldPrice), -3) AS 'Avg'
  FROM tblCarSale
 WHERE fldPrice >= 50000
 GROUP BY YEAR(fldSellDate)
 ORDER BY SELL_YEAR;
 
SELECT MIN(fldPrice)
  FROM tblCarSale
 WHERE fldMake = 'Volvo' AND fldModel = 'V70';

USE dbLektion10;

SELECT fldMake, fldModel, ROUND(AVG(fldPrice), -3) AS 'Avg price'
  FROM tblCarSale
 WHERE fldMake IN ('Volvo', 'Honda')
 GROUP BY fldMake, fldModel
HAVING AVG(fldPrice) > 50000
 ORDER BY AVG(fldPrice) DESC
 LIMIT 3;
  
  
  