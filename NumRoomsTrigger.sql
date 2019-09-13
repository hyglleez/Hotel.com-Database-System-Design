CREATE OR REPLACE TRIGGER NumRoomsTrigger
AFTER INSERT OR DELETE
ON ROOM
FOR EACH ROW BEGIN
    IF inserting 
    THEN
    UPDATE HOTEL
    SET NumRooms = NumRooms + 1
    WHERE :new.Hotel_id = Hotel_id;
    END IF;
    IF deleting 
    THEN
    UPDATE HOTEL
    SET 
    NumRooms = NumRooms -1
    WHERE :old.Hotel_id = Hotel_id;
    END IF;
END;
