USE dbLektion11;

SELECT * FROM tblCarSale;
SELECT * FROM tblCar;

SELECT tblCar.fldRegNo
  FROM tblCarSale
  JOIN tblCar
    ON tblCarSale.fldRegNo = tblCar.fldRegNo;
    
SELECT * 
  FROM tblCarSale AS cs 
       JOIN tblCar AS c 
       ON c.fldRegNo = cs.fldRegNo 
       JOIN tblOwner AS o 
       ON o.fldId = cs.fldOwner;

SELECT * FROM tblOwner;

SELECT * 
  FROM tblCarSale AS cs1 
       JOIN tblCarSale AS cs2 
       ON cs1.fldRegNo = cs2.fldRegNo 
          AND cs1.fldSellDate < cs2.fldSellDate 
          AND cs1.fldPrice < cs2.fldPrice;

SELECT *
  FROM tblCarSale AS cs 
       RIGHT JOIN tblOwner AS o 
       ON o.fldId = cs.fldOwner;
          
SELECT o.fldName 
  FROM tblCarSale AS cs 
       RIGHT JOIN tblOwner AS o 
       ON o.fldId = cs.fldOwner 
 WHERE cs.fldOwner IS NULL;
 
 
SELECT o.fldDate, o.fldFrom, o.fldTo, c.fldName
  FROM tblOrder AS o
  JOIN tblCustomer AS c
    ON o.fldCustomer = c.fldId;
    
SELECT o.fldDate, a1.fldName AS 'from', a2.fldName AS 'to', c.fldName
  FROM tblOrder AS o
  JOIN tblCustomer AS c
    ON o.fldCustomer = c.fldId
  JOIN tblAirport AS a1
    ON a1.fldIcao = o.fldFrom
  JOIN tblAirport AS a2
    ON a2.fldIcao = o.fldTo;
    
SELECT emp.fldName AS Person,
       sup.fldName AS Chef
  FROM tblEmployee AS emp
  LEFT JOIN tblEmployee AS sup
    ON emp.fldSupervisor = sup.fldId;
    

    
    
    
    
    