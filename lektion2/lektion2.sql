SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS dbLektion2;

USE dbLektion2;

CREATE TABLE tblCustomer
(
    fldCustomerNo INT PRIMARY KEY,
    fldFirstName VARCHAR(30),
    fldLastName VARCHAR(30),
    fldTelephone VARCHAR(15)
);

INSERT INTO tblCustomer VALUES 
    (1, "Nisse", "Hult", "0777-778899"),
    (2, "Petra", "Petrushina", "0777-778899");

SELECT * FROM tblCustomer;