CREATE DATABASE [dbLektion1];
GO

USE [dbLektion1];
GO

CREATE TABLE tblCompany (
    fldId INT IDENTITY(1,1) PRIMARY KEY,
    fldCompanyName VARCHAR(255) NOT NULL,
    fldEmail VARCHAR(255)
);
GO

INSERT INTO tblCompany (fldCompanyName, fldEmail) VALUES 
    ('Bosse Nisse AB', 'info@bossenisse.se'),
    ('Lena Lamm Ltd.', 'info@llltd.co.uk'),
    ('Acme Emca Industries', 'questions@aeind.com');
GO

SELECT * from tblCompany ORDER BY fldCompanyName ASC;
GO


-- systemkatalogvyerna
SELECT name, database_id, compatibility_level 
  FROM sys.databases;
GO

SELECT db.name, mf.physical_name
FROM sys.databases AS db
    JOIN sys.master_files AS mf
    ON mf.database_id = db.database_id;
GO

sp_help tblCompany;
GO


CREATE TABLE Highscore (
    id INT IDENTITY(1, 1) PRIMARY KEY,
    userName VARCHAR(255) NOT NULL,
    date DATETIME2 NOT NULL,
    difficulty CHAR(1) NOT NULL,
    score INT NOT NULL
);
GO

INSERT INTO Highscore (userName, date, difficulty, score) VALUES
    ('Hampus', CURRENT_TIMESTAMP, 'M', 1);
GO

SELECT * FROM Highscore;
GO