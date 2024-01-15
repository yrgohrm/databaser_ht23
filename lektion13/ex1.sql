USE tempdb;
GO

DROP DATABASE IF EXISTS newsletter;
GO

CREATE DATABASE newsletter;
GO

USE newsletter;
GO

CREATE TABLE newsletter (
    email VARCHAR(150) PRIMARY KEY
);
GO

INSERT INTO newsletter VALUES
    ('nisse@example.com'),
    ('lena@example.com'),
    ('bosse@example.com');
GO

SELECT * FROM newsletter;
GO

EXEC sp_helpdb 'newsletter';
GO

USE dbLektion1;
GO

SELECT * FROM Highscore;
SELECT difficulty, MAX(score) FROM Highscore GROUP BY difficulty;