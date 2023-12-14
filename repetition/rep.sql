CREATE DATABASE rep;
USE rep;

CREATE TABLE xyz (
    x INT,
    y INT,
    z INT,
    PRIMARY KEY (x, y)
);

CREATE TABLE abc (
    a INT PRIMARY KEY,
    b INT,
    c INT,
    x INT,
    y INT,
    FOREIGN KEY (x, y) REFERENCES xyz(x, y)
);

DROP TABLE IF EXISTS purchaseItem;

CREATE TABLE article (
    artNo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) CHECK (price >= 0)
);

CREATE TABLE company (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    street VARCHAR(255),
    zip VARCHAR(20)
);

CREATE TABLE purchaseItem (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    company INT UNSIGNED NOT NULL,
    purchaseArtNo VARCHAR(255) NOT NULL,
    ourArtNo INT UNSIGNED NOT NULL, 
    price DECIMAL(10,2),
    UNIQUE (company, purchaseArtNo),
    FOREIGN KEY (company) REFERENCES company(id),
    FOREIGN KEY (ourArtNo) REFERENCES article(artNo)
);

INSERT INTO article VALUES
    (DEFAULT, "Spik", 1.50);
    
INSERT INTO company VALUES
    (DEFAULT, "ACME", "Storgatan 2", "23456"),
    (DEFAULT, "Lamm Industries", "Lillgatan 1", "56756");

INSERT INTO purchaseItem VALUES
    (DEFAULT, 1, "2345", 1, 0.50),
    (DEFAULT, 2, "spk-12-X", 1, 0.25);


SELECT *
  FROM purchaseItem AS pi
  JOIN company AS c
    ON pi.company = c.id
  JOIN article AS a
    ON a.artNo = pi.ourArtNo;

SELECT * FROM purchaseItem;


USE dbLektion10;

SELECT fldRegNo 
  FROM tblCarSale
 WHERE fldRegNo <> 'ABC 123'
 GROUP BY fldRegNo 
HAVING COUNT(*) > 1;

SELECT fldRegNo, fldSellDate FROM tblCarSale GROUP BY fldRegNo, fldSellDate;

SELECT MIN(fldSellDate) FROM tblCarSale GROUP BY fldRegNo;

SELECT fldSellDate, COUNT(*) 
  FROM tblCarSale 
 GROUP BY fldSellDate;


