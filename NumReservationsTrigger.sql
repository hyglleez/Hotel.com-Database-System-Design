CREATE OR REPLACE TRIGGER NumReservationsTrigger
AFTER INSERT OR DELETE
ON RESERVATION
FOR EACH ROW BEGIN
    IF inserting 
    THEN
    UPDATE H_ACCOUNT
    SET NumReservations = NumReservations + 1
    WHERE :new.Account_id = Account_id;
    END IF;
    IF deleting 
    THEN
    UPDATE H_ACCOUNT
    SET 
    NumReservations = NumReservations -1
    WHERE :old.Account_id = Account_id;
    END IF;
END;
