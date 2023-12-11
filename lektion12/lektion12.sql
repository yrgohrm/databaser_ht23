USE dbLektion11;

SELECT * FROM tblCarSale;

SELECT *
  FROM tblCarSale
 WHERE fldPrice > 
       (SELECT AVG(fldPrice)
          FROM tblCarSale);

SELECT * FROM tblCar
    WHERE
    fldMake IN 
        (SELECT fldMake FROM tblCar GROUP BY fldMake HAVING COUNT(*) > 2);


SELECT o.fldName
  FROM tblCarSale AS cs
       RIGHT JOIN tblOwner AS o
       ON o.fldId = cs.fldOwner
 WHERE cs.fldOwner IS NULL;

SELECT fldName
  FROM tblOwner
 WHERE fldId NOT IN
       (SELECT fldOwner FROM tblCarSale);


SELECT *
  FROM tblCar
 WHERE fldRegNo =
       (SELECT fldRegNo
          FROM tblCarSale
         ORDER BY fldPrice ASC
         LIMIT 1);

SELECT *
  FROM (SELECT fldOwner, fldPrice
          FROM tblCarSale
         ORDER BY fldPrice
         LIMIT 3) AS ls
  JOIN tblOwner AS o
    ON o.fldId = ls.fldOwner;
    
SELECT cs.fldOwner, cs.fldPrice, o.*
  FROM tblCarSale AS cs
  JOIN tblOwner AS o
    ON o.fldId = cs.fldOwner
 ORDER BY cs.fldPrice
 LIMIT 3; 

SELECT tblOwner.fldName,
       tblCarSale.fldRegNo,
       tblCar.fldMake,
       tblCar.fldModel,
       tblCarSale.fldMeterCount
  FROM tblOwner
       INNER JOIN tblCarSale ON tblOwner.fldId = tblCarSale.fldOwner
       INNER JOIN tblCar ON tblCarSale.fldRegNo = tblCar.fldRegNo
 WHERE tblCarSale.fldRegNo IN 
       (SELECT fldRegNo
          FROM tblCarSale
         WHERE fldMeterCount = 
               (SELECT MAX(fldMeterCount)
                  FROM tblCarSale));



SELECT fldId 
  FROM tblOrder 
 WHERE fldChildren = (SELECT MAX(fldChildren) 
                        FROM tblOrder);

SELECT * 
  FROM tblEmployee
  WHERE fldId IN (SELECT fldSoldBy
                    FROM tblOrder 
                   WHERE fldChildren = (SELECT MAX(fldChildren) 
                                          FROM tblOrder));

SELECT DISTINCT e.*
  FROM tblEmployee AS e
  JOIN tblOrder AS o
    ON e.fldId = o.fldSoldBy
 WHERE o.fldChildren = (SELECT MAX(fldChildren) 
                          FROM tblOrder);

SELECT fldName
  FROM tblEmployee
 WHERE fldId IN (SELECT fldSoldBy
                   FROM tblOrder
                  GROUP BY fldSoldBy
                 HAVING SUM(fldAdults) > 2);
                 
SELECT e.fldName
  FROM tblEmployee AS e
  JOIN tblOrder AS o
    ON e.fldId = o.fldSoldBy
 GROUP BY o.fldSoldBy
HAVING SUM(o.fldAdults) > 2;
                 

SELECT *
  FROM tblCustomer
 WHERE fldId IN (SELECT fldCustomer
                   FROM tblOrder
                  GROUP BY fldCustomer
                 HAVING SUM(fldAdults) > SUM(fldChildren));
