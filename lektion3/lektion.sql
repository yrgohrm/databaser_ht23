CREATE DATABASE IF NOT EXISTS dbLektion2;

CREATE TABLE someTable
(
    id INT PRIMARY KEY
);

DROP TABLE someTable;

CREATE TABLE otherTable
(
    street VARCHAR(255),
    streetNo INT,
    city VARCHAR(255),
    PRIMARY KEY (street, streetNo, city)
);

INSERT INTO tblCustomer VALUES (1, "Nisse", "Hult", "0777-778899");
INSERT INTO tblCustomer VALUES (3, "Lisa", "Petrushina", "0777-778899");

INSERT INTO tblCustomer VALUES 
    (1, "Nisse", "Hult", "0777-778899"),
    (2, 34, "Petrushina", "0777-778899");

SELECT * FROM tblCustomer;


USE dbDogs;

SELECT * FROM tblDog;

SELECT fldName, fldCount FROM tblDog WHERE fldCount > 100000;

-- fin kod
INSERT INTO tblDog (fldName, fldCount, fldSize)
VALUES ('Långhårig Collie', 4538, 'Mellan');

INSERT INTO tblDog VALUES
    (DEFAULT, 'Malinois', 2329, 'Mellan');
    
UPDATE tblDog SET fldCount = 2330 WHERE fldId = 32;

SELECT DISTINCT fldSize FROM tblDog;
SELECT DISTINCT fldSize, fldName FROM tblDog;

SELECT * FROM tblDog WHERE NOT fldSize = 'Mellan' AND (fldCount > 100000 OR fldCount < 20100);

SELECT * 
  FROM tblDog 
 WHERE NOT fldSize = 'Mellan' 
       AND (fldCount > 100000 OR fldCount < 20100)
 ORDER BY fldName DESC;
 
 SELECT fldName 
   FROM tblDog 
  WHERE fldSize = 'Liten' 
  ORDER BY fldCount DESC 
  LIMIT 3;
  
SELECT COUNT(fldName) AS "Antal hundraser" FROM tblDog LIMIT 3;

SELECT SUM(fldCount) FROM tblDog WHERE fldSize = 'Liten';

SELECT * FROM tblDog WHERE fldName LIKE '%terrier';

SELECT * FROM tblDog WHERE fldName LIKE 'B%';

SELECT SUM(fldCount) FROM tblDog;

SELECT fldName, (fldCount / 1567502) * 100 FROM tblDog ORDER BY fldCount DESC;