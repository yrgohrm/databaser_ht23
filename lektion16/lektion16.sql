BEGIN TRANSACTION; -- Starta en transaktion

UPDATE account SET balance = balance + 5000 WHERE id = 2;

IF @@ROWCOUNT <> 1
    ROLLBACK TRANSACTION;
ELSE
    BEGIN

        UPDATE account SET balance = balance - 5000 WHERE id = 1 AND balance >= 5000;

        IF @@ROWCOUNT <> 1
            ROLLBACK TRANSACTION; -- Gör hela transaktionen ogjord
        ELSE
            COMMIT TRANSACTION;  -- Spara resultatet på riktigt

    END



SET XACT_ABORT ON
BEGIN TRANSACTION;
    UPDATE account SET balance = balance + 5000 WHERE id = 2;
    UPDATE account SET balance = balance - 5000 WHERE id = 1 AND balance >= 5000;
COMMIT TRANSACTION;
