CREATE DATABASE lektion8;
USE lektion8;

CREATE TABLE Course (
    id INT AUTO_INCREMENT PRIMARY KEY,
    courseBook VARCHAR(100),
    points INT UNSIGNED NOT NULL
);

INSERT INTO Course VALUES
    (DEFAULT, 'Nisses bok', 30);

INSERT INTO Course VALUES
    (DEFAULT, 'Nisses bok', NULL);
    
CREATE TABLE tblUser (
    fldId INT PRIMARY KEY,
    fldEmail VARCHAR(70),
    fldName VARCHAR(70)
);

INSERT INTO tblUser VALUES (0, 'bo@orm.se', 'Bo A Orm');

INSERT INTO tblUser VALUES (1, '', '');

INSERT INTO tblUser (fldId) VALUES (2);

SELECT * FROM tblUser;
    

INSERT INTO Course (courseBook) VALUES
    ('Nisses bok');
    
CREATE TABLE tblUser2 (
    fldId INT PRIMARY KEY,
    fldEmail VARCHAR(70) NOT NULL,
    fldName VARCHAR(70) NOT NULL
);


INSERT INTO tblUser2 VALUES (1, '', '');

CREATE TABLE tblAudit (
    fldTraceId CHAR(32) PRIMARY KEY,
    fldTimestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    fldLogText VARCHAR(200)
);

INSERT INTO tblAudit (fldTraceId, fldLogText) 
VALUES ('123e4567e89b12d3a456426614174000', 'My litte error');

INSERT INTO tblAudit (fldTraceId, fldLogText) 
VALUES ('123e4567e89b12d3a456426614174001', 'Some other error');

INSERT INTO tblAudit 
VALUES ('123e4567e89b12d3a456426614174002', '2023-11-26 00:00:00', 'Some other error');


INSERT INTO tblAudit 
VALUES ('123e4567e89b12d3a456426614174003', NULL, 'Null error');

SELECT * FROM tblAudit;

CREATE TABLE tblSomeThing (
    fldTraceId CHAR(32) PRIMARY KEY,
    fldStuff INT DEFAULT 34,
    fldLogText VARCHAR(200)
);

CREATE TABLE Newsletter (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL CHECK (email LIKE '%@%'),
    wantsNewsletter BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO Newsletter VALUES
    (DEFAULT, 'bosse@example.com', TRUE);

INSERT INTO Newsletter VALUES
    (DEFAULT, 'bosse2@example.com', DEFAULT);    
    

SELECT * FROM Newsletter;

CREATE TABLE Book (
    isbn VARCHAR(13) PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    author VARCHAR(50) NOT NULL, 
    year INT UNSIGNED,
    rating INT UNSIGNED CHECK (rating > 0 AND rating < 6)
);






