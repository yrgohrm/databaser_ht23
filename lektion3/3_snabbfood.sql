DROP DATABASE IF EXISTS dbFood;
CREATE DATABASE dbFood;
USE dbFood;

CREATE TABLE tblRestaurant
(
    fldId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fldStreet VARCHAR(50),
    fldZip VARCHAR(6),
    fldCity VARCHAR(30),
    fldDriveThrough TINYINT,
    fldOpenHour TIME,
    fldCloseHour TIME,
    fldEmail VARCHAR(100),
    fldRevenue INT UNSIGNED
);

INSERT INTO tblRestaurant (fldStreet, fldZip, fldCity, fldDriveThrough, fldOpenHour, fldCloseHour, fldEmail, fldRevenue)
VALUES
    ('Storgatan 122','903 34','Umeå',0,'08:00','21:00','umecentrum@snabbfood.se',8543000),
    ('Storgatan 30','891 34','Örnsköldsvik',1,'07:00','22:00','ovik@snabbfood.se',7843000),
    ('Bangårdsgatan 10','831 34','Östersund',1,'06:00','19:00','sundet@snabbfood.se',7654000),
    ('Kunsgatan 17','903 21','Umeå',0,'07:00','20:00','kungens@snabbfood.se',9320000),
    ('Thulegatan 5','852 32','Sundsvall',0,'10:00','19:00','thule@snabbfood.se',7700000),
    ('Nygatan 8','903 31','Umeå',1,'05:00','23:00','nygatan@snabbfood.se',10500000),
    ('Vinkeltået 4','853 53','Sundsvall',0,'10:00','21:00','vinkeln@snabbfood.se',6723000);