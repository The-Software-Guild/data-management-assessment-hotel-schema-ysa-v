USE VandenbergHotelDB;

SELECT
    GuestName,
    RoomNumber,
    StartDate,
    EndDate
FROM Reservation
INNER JOIN Guest ON Reservation.GuestID = Guest.GuestID
INNER JOIN RoomReservation ON Reservation.ReservationID = RoomReservation.ReservationID
WHERE EndDate BETWEEN '2023-07-01' AND '2023=07-31';

SELECT
    GuestName,
    Room.RoomNumber,
    StartDate,
    EndDate
FROM Reservation
INNER JOIN Guest ON Reservation.GuestID = Guest.GuestID
INNER JOIN RoomReservation ON Reservation.ReservationID = RoomReservation.ReservationID
INNER JOIN Room ON RoomReservation.RoomNumber = Room.RoomNumber
INNER JOIN FloorEvenOdd ON Room.FloorEvenOddID = FloorEvenOdd.FloorEvenOddID
WHERE JacuzziID = 2;

SELECT
    GuestName,
    RoomNumber,
    StartDate,
    AdultsInRoom,
    ChildrenInRoom
FROM Reservation
INNER JOIN Guest ON Reservation.GuestID = Guest.GuestID
INNER JOIN RoomReservation ON Reservation.ReservationID = RoomReservation.ReservationID
WHERE Reservation.GuestID = 1;

SELECT
    Room.RoomNumber,
    ReservationID,
    SingleRoomCost
FROM Room
LEFT OUTER JOIN RoomReservation ON Room.RoomNumber = RoomReservation.RoomNumber;

SELECT
	RoomReservation.RoomNumber
FROM RoomReservation
INNER JOIN Reservation ON Reservation.ReservationID = RoomReservation.ReservationID
INNER JOIN Room ON Room.RoomNumber = RoomReservation.RoomNumber
INNER JOIN RoomType ON Room.RoomTypeID = RoomType.RoomTypeID
WHERE (StartDate BETWEEN '2023-04-01' AND '2023-04-30'
OR EndDate BETWEEN '2023-04-01' AND '2023-04-30')
AND MaxAdults > 2;

SELECT 
	GuestName,
    COUNT(*) AS ReservationCount 
FROM Reservation
INNER JOIN Guest g ON Reservation.GuestID = g.GuestID
WHERE Reservation.GuestID = g.GuestID
GROUP BY GuestName
ORDER BY ReservationCount DESC, GuestName;

SELECT
	Guestname,
    Street,
    City,
    State,
    Zip,
    Phone
FROM Guest
INNER JOIN Address ON Address.AddressID = Guest.AddressID
WHERE Phone = '5109655896';
    
