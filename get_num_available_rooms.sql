CREATE OR REPLACE PROCEDURE get_num_available_rooms(hl_id IN NUMBER, available OUT NUMBER)
AS
BEGIN
SELECT COUNT(*) INTO available
FROM ROOM
WHERE  hotel_id = hl_id AND if_empty = 1;
END;

