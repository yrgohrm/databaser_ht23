CREATE DATABASE dbLektion7;
USE dbLektion7;

CREATE TABLE tblPassport (
    fldPassNo INT AUTO_INCREMENT PRIMARY KEY,
    fldIssued DATE,
    fldCountry VARCHAR(100)
);

CREATE TABLE tblPerson (
    fldPersNo CHAR(12) PRIMARY KEY,
    fldPassNo INT UNIQUE,
    FOREIGN KEY (fldPassNo) REFERENCES tblPassport(fldPassNo)
);

INSERT INTO tblPassport VALUES (DEFAULT, CURRENT_TIME(), 'Sverige');

SELECT * FROM tblPassport;

INSERT INTO tblPerson VALUES ('197110104712', 1);

SELECT * FROM tblPerson;


INSERT INTO tblPerson VALUES ('194110104709', 2);
