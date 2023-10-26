DROP DATABASE IF EXISTS dbDogs;
CREATE DATABASE dbDogs;
USE dbDogs;

CREATE TABLE tblDog
(
    fldId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fldName VARCHAR(40),
    fldCount INT UNSIGNED,
    fldSize VARCHAR(6)
);

INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Labrador retriever', 191988, 'Stor');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Tysk schäferhund', 129186, 'Stor');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Pudel', 118653, 'Mellan');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Chihuahua', 107114, 'Liten');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Golden retriever', 92994, 'Stor');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Yorkshireterrier', 92438, 'Mellan');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Tax', 81516, 'Liten');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Beagle', 53938, 'Mellan');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Boxer', 52983, 'Stor');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Dvärgschnauzer', 45263, 'Liten');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Shih tzu', 44564, 'Mellan');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Engelsk bulldogg', 44325, 'Mellan');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Tysk spets', 40530, 'Mellan');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Cocker spaniel', 40174, 'Mellan');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Cavalier king charles spaniel', 39670, 'Liten');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Fransk bulldogg', 39337, 'Liten');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Mops', 33528, 'Liten');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Rottweiler', 31447, 'Stor');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Engelsk setter', 29771, 'Stor');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Malteser', 28909, 'Liten');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Engelsk springer spaniel', 28050, 'Mellan');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Korthårig vorsteh', 23855, 'Stor');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Staffordshire bullterrier', 23562, 'Stor');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Border collie', 23262, 'Stor');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Shetland sheepdog', 22805, 'Liten');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Dobermann', 20941, 'Stor');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('West highland white terrier', 20001, 'Liten');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Berner sennenhund', 20001, 'Stor');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Grand danois', 20001, 'Stor');
INSERT INTO  tblDog (fldName, fldCount, fldSize) VALUES ('Breton', 19828, 'Mellan');
