DROP DATABASE IF EXISTS dbLektion5;
CREATE DATABASE dbLektion5;
USE dbLektion5;

-- Exercise 4

CREATE TABLE tblEmployee 
(
    fldId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    fldFirstName VARCHAR(30),
    fldLastName VARCHAR(30),
    fldSalary INT UNSIGNED,
    fldDepartement VARCHAR(10),
    fldCity VARCHAR(20)
);

INSERT INTO tblEmployee VALUES
    (DEFAULT, 'Lars', 'Eriksson', 35000, 'Ekonomi', 'Göteborg'),
    (DEFAULT, 'Eliza', 'Hamilton', 42000, 'Ekonomi', 'Halmstad'),
    (DEFAULT, 'Nour', 'Amin', 32000, 'Inköp', 'Göteborg'),
    (DEFAULT, 'Elna', 'Lindström', 24000, 'Lager', 'Stockholm'),
    (DEFAULT, 'Erik', 'Smith', 24500, 'Lager', 'Uppsala'),
    (DEFAULT, 'Abdi', 'Merari', 25400, 'Inköp', 'Göteborg'),
    (DEFAULT, 'Bosse', 'Bredsladd', 22400, 'Inköp', 'Uppsala');

INSERT INTO tblEmployee VALUES
    (DEFAULT, 'Anna', 'Eriksson', 26000, 'Lager', 'Göteborg');
    
SELECT * FROM tblEmployee;

SELECT fldFirstName, fldLastName FROM tblEmployee WHERE fldCity = 'Göteborg';

SELECT fldFirstName, fldLastName, fldSalary FROM tblEmployee WHERE fldCity = 'Göteborg' AND fldSalary > 30000;

SELECT AVG(fldSalary) FROM tblEmployee WHERE fldDepartement = 'Lager';

SELECT fldFirstName, fldLastName, fldSalary FROM tblEmployee ORDER BY fldSalary DESC;

SELECT DISTINCT fldCity FROM tblEmployee WHERE fldDepartement = 'Inköp';

CREATE TABLE country
(
    id CHAR(2) PRIMARY KEY,
    country VARCHAR(70),
    language VARCHAR(40),
    population INT UNSIGNED,
    gdp INT
);

INSERT INTO country VALUES
('SE', 'Sverige', 'Svenska', 10099300, 530),
('CH', 'Schweiz', 'Tyska', 8654700, 703),
('SY', 'Syrien', 'Arabiska', 17500000, 40),
('EG', 'Egypten', 'Arabiska', 100685000, 1200),
('YE', 'Jemen', 'Arabiska', 23580000, 58);

SELECT * FROM country;

SELECT * FROM country WHERE language = 'Arabiska';

SELECT ROUND(population / 1000000) FROM country WHERE id = 'SE';

SELECT country, ROUND(gdp * 1000000000 / population) AS gpp FROM country ORDER BY gpp DESC;

-- DELETE FROM tblEmployee WHERE fldFirstName = 'Abdi';