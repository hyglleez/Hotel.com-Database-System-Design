CREATE OR REPLACE PROCEDURE implement_Coupon_Hurray15(Reservation_num NUMBER)
AS
BEGIN
UPDATE RESERVATION
SET price = price * 0.75
WHERE coupon_id = 'HURRAY15' AND reservation# = Reservation_num;
END;

