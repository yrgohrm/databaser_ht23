CREATE LOGIN TestUser 
    WITH PASSWORD = 'someP4ssword',
    CHECK_EXPIRATION = OFF;
GO

USE Highscore;
GO

CREATE USER TestUser FOR LOGIN TestUser WITH DEFAULT_SCHEMA = dbo;
GO

CREATE ROLE highscore_reader;
GO

ALTER ROLE highscore_reader ADD MEMBER TestUser;
GO

GRANT SELECT
ON OBJECT :: dbo.highscore TO highscore_reader;
GO

REVOKE SELECT
ON OBJECT :: dbo.highscore TO highscore_reader;
GO