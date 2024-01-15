CREATE DATABASE dbLektion2;
GO

USE dbLektion2;
GO

CREATE SCHEMA hampebampe;
GO

CREATE TABLE dbo.mytable (
    id INT PRIMARY KEY,
    apa TINYINT
);
GO


USE master;

SELECT DB_NAME(database_id) AS [database],
    MAX(user_scans) AS max_user_scans,
    AVG(user_scans) AS average_user_scans
FROM sys.dm_db_index_usage_stats
GROUP BY db_name(database_id)
ORDER BY average_user_scans DESC;

USE Northwind;

-- some queries to get the db used
SELECT *
FROM employees;

SELECT employeeid, firstname, lastname
FROM employees
WHERE lastname = 'Fuller';
GO

SELECT et.employeeId, e.FirstName, e.LastName, t.territoryDescription, r.regionDescription
FROM Employees AS e
    INNER JOIN [EmployeeTerritories] AS et
    ON (e.employeeId = et.employeeId)
    INNER JOIN [Territories] AS t
    ON (et.territoryId = t.territoryId)
    INNER JOIN [Region] AS r
    ON (t.RegionID = r.RegionID)
ORDER BY et.employeeId;
GO

-- then we can query the stats

SELECT OBJECT_NAME(idx.object_id) AS [table],
    idx.name AS [index], user_scans, user_seeks,
    CASE ustat.index_id
    WHEN 1 THEN 'CLUSTERED'
    ELSE 'NONCLUSTERED'
    END AS type
FROM sys.dm_db_index_usage_stats AS ustat
    JOIN sys.indexes idx
    ON  idx.object_id=ustat.object_id
        AND idx.index_id=ustat.index_id
        AND database_id=DB_ID('Northwind')
ORDER BY user_scans DESC;

DROP DATABASE IF EXISTS dbLektion2;
GO

CREATE DATABASE dbLektion2;
GO

USE dbLektion2;
GO

DROP TABLE IF EXISTS highscore;
GO
DROP TABLE IF EXISTS difficulty;
GO
DROP TABLE IF EXISTS player;
GO

CREATE TABLE player (player_id INT IDENTITY(1,1) PRIMARY KEY,
                     email VARCHAR(70) NOT NULL UNIQUE,
                     name VARCHAR(50) NOT NULL);
GO

CREATE TABLE difficulty (difficulty_id INT IDENTITY(1,1) PRIMARY KEY,
                         name VARCHAR(8) NOT NULL);
GO

CREATE TABLE highscore (id INT IDENTITY(1,1) PRIMARY KEY,
                        date DATETIMEOFFSET NOT NULL,
                        score INT NOT NULL,
                        difficulty_id INT FOREIGN KEY REFERENCES difficulty(difficulty_id),
                        player_id INT FOREIGN KEY REFERENCES player(player_id))
GO

INSERT INTO difficulty (name) VALUES ('easy');
INSERT INTO difficulty (name) VALUES ('normal');
INSERT INTO difficulty (name) VALUES ('hard');
GO

INSERT INTO player (email, name) VALUES ('nisse@hult.com', 'Nisse Hult')
INSERT INTO player (email, name) VALUES ('bosse@hult.com', 'Bosse Larsson')
INSERT INTO player (email, name) VALUES ('lena@lamm.se', 'Lena Lamm')
INSERT INTO player (email, name) VALUES ('leya@lamm.se', 'Leya Garcia')
GO

INSERT INTO highscore (date, score, difficulty_id, player_id) VALUES (SYSDATETIMEOFFSET(), 30,  2, 1)  -- normal, nisse
INSERT INTO highscore (date, score, difficulty_id, player_id) VALUES (SYSDATETIMEOFFSET(), 2,   3, 2)  -- hard, nisse
INSERT INTO highscore (date, score, difficulty_id, player_id) VALUES (SYSDATETIMEOFFSET(), 130, 1, 4)  -- normal, leya
INSERT INTO highscore (date, score, difficulty_id, player_id) VALUES (SYSDATETIMEOFFSET(), 221, 1, 3)  -- easy, lena
INSERT INTO highscore (date, score, difficulty_id, player_id) VALUES (SYSDATETIMEOFFSET(), 221, 3, 4)  -- hard, leya
GO

INSERT INTO highscore (date, score, difficulty_id, player_id) VALUES (SYSDATETIMEOFFSET(), FLOOR(RAND()*100), 1, 1);
GO 10000

-- CREATE INDEX score_idx ON highscore(score); -- subtree cost 0.671368
-- CREATE INDEX score_idx ON highscore(score DESC); -- subtree cost 0.671368
-- CREATE INDEX score_idx ON highscore(score DESC, date ASC); -- subtree cost 0.045614
-- CREATE INDEX score_idx ON highscore(score DESC, date ASC, player_id, difficulty_id); -- subtree cost 0.0131325
-- DROP INDEX highscore.score_idx;

SELECT TOP (10) h.score, p.name, d.name as difficulty, h.date AT TIME ZONE 'UTC' as date FROM highscore as h
    JOIN player as p ON p.player_id = h.player_id
    JOIN difficulty as d ON d.difficulty_id = h.difficulty_id
ORDER BY h.score DESC, h.date ASC;
GO

-- CREATE INDEX score_idx ON highscore(score DESC, date ASC); -- 0.045...
CREATE INDEX score_idx ON highscore(score DESC, date ASC, player_id, difficulty_id); -- 0.0131325

-- full table scan = O(n)
-- index seek = O(log n)

USE Northwind;
GO

SELECT et.EmployeeId, e.FirstName, e.LastName, t.TerritoryDescription, r.RegionDescription 
  FROM Employees AS e 
 INNER JOIN [EmployeeTerritories] AS et ON e.EmployeeID = et.EmployeeID
 INNER JOIN [Territories] AS t ON et.TerritoryID = t.TerritoryID
 INNER JOIN [Region] AS r ON t.RegionID = r.RegionID
 ORDER BY e.EmployeeID;
GO
