DROP DATABASE IF EXISTS dbLektion4;
CREATE DATABASE dbLektion4;
USE dbLektion4;

CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    newsletter BOOL,
    spam BOOL
);

INSERT INTO contacts VALUES
    (0, 'Nisse Nilsson', 'nisse@example.com', true, false),
    (0, 'Lars Tigerslott', 'lasse@example.com', false, true),
    (0, 'Pernilla Bronsspade', 'nilla@example.com', true, false),
    (0, 'Bo Skogsrot', 'bo@example.com', true, false),
    (0, 'Bosse Bredsladd', 'bosse@example.com', false, false),
    (0, 'Odenvarg Putter', 'putter@example.com', true, true);

CREATE TABLE secret (
    id INT AUTO_INCREMENT PRIMARY KEY
);

INSERT INTO secret VALUES
    (0), (0), (0);
