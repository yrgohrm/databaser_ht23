USE dbDogs;

SELECT * FROM tblDog LIMIT 3;

SELECT fldName, fldSize FROM tblDog WHERE fldSize = 'Stor';

SELECT COUNT(*) FROM tblDog WHERE fldSize = 'Stor';

SELECT fldName, fldCount 
  FROM tblDog 
 WHERE fldSize = 'Liten' 
 ORDER BY fldCount DESC 
 LIMIT 5;
 
-- gör inte alls det vi tror, sum görs före limit
SELECT SUM(fldCount) 
  FROM tblDog 
 WHERE fldSize = 'Liten' 
 ORDER BY fldCount DESC 
 LIMIT 5;

-- lägg till två hundraser
INSERT INTO tblDog VALUES
    (DEFAULT, 'Gatukorsning', 123456, 'Stor'),
    (DEFAULT, 'Liten smågnagare', 3455, 'Liten', 134);

-- med en lista på fält kan vi ange dem i valfri ordning
INSERT INTO tblDog (fldCount, fldSize, fldName) VALUES
    (1234, 'Stor', 'Aphund');

SELECT fldId FROM tblDog WHERE fldName = 'Gatukorsning';

-- primärnyckeln är ett säkrare val
DELETE FROM tblDog WHERE fldName = 'Liten smågnagare';

