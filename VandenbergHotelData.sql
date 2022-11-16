SHOW DATABASES;

USE VandenbergHotelDB;

SHOW TABLES;

INSERT INTO Address (Street, City, State, Zip) 
	VALUES ('3459 Wisconsin Ave', 'Saint Louis', 'MO', '63118');

INSERT INTO Guest (GuestName, AddressID, Phone)
	VALUES ('Ysabel Vandenberg', 01, '5109655896');
    
SELECT *
FROM Guest;

SELECT *
FROM Address;

INSERT INTO Address (Street, City, State, Zip) VALUES 
	('379 Old Shore Street', 'Council Bluffs', 'IA', '51501'),
    ('750 Wintergreen Dr.', 'Wasilla', 'AK', '99654'),
    ('9662 Foxrun Lane', 'Harlingen', 'TX', '78552'),
    ('9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096'),
    ('762 Wild Rose Street', 'Saginaw', 'MI', '48601'),
    ('7 Poplar Dr.', 'Arvada', 'CO', '80003'),
    ('70 Oakwood St', 'Zion', 'IL', '60099'),
    ('7556 Arrowhead St.', 'Cumberland', 'RI', '02864'),
    ('77 West Surrey Street', 'Oswego', 'NY', '13126'),
    ('939 Linda Rd.', 'Burke', 'VA', '22015'),
    ('87 Queen St.', 'Drexel Hill', 'PA', '19026');
    
INSERT INTO Guest (GuestName, AddressID, Phone) VALUES 
	('Mack Simmer', 02, '2915530508'),
	('Bettyann Seery', 03, '4782779632'),
	('Duane Cullison', 04, '3084940198'),
	('Karie Yang', 05, '2147300298'),
	('Aurore Lipton', 06, '3775070974'),
	('Zachery Luechtefeld', 07, '8144852615'),
	('Jeremiah Pendergrass', 08, '2794910906'),
	('Walter Holaway', 09, '4463966785'),
	('Wilfred Vise', 10, '8347271001'),
	('Maritza Tilton', 11, '4463516860'),
	('Joleen Tison', 12, '2318932755');

SELECT *
FROM Guest;

INSERT INTO BedConfig (DoubleQueens, King, PullOut) VALUES
	(1, 0, 0),
    (0, 1, 0),
    (1, 1, 1);
    
SELECT *
FROM BedConfig;

INSERT INTO ApplianceConfig (HasFridge, HasMicrowave, HasStoveAndOven) VALUES
	(1, 0, 0),
    (0, 1, 0),
    (1, 1, 0),
    (1, 1, 1);

INSERT INTO Jacuzzi (HasJacuzzi, AdditionalCost) VALUES
	(0),
    (1, 25);
    
INSERT INTO EvenOrOdd (EvenOrOdd) VALUES
	('Odd'),
    ('Even');
    
INSERT INTO Floor (FloorNum) VALUES
	(1),
    (2),
    (3);

INSERT INTO RoomType (RoomTypeName, BedConfigID, ApplianceConfigID, BasePrice, MaxAdults, MaxBaseAdults, AdditionalAdultPrice, ADAAccessible, NumBedrooms) VALUES
	('Double', 1, 1, 174.99, 4, 2, 10),
    ('Double', 1, 2, 174.99, 4, 2, 10),
    ('Single King', 2, 3, 149.99, 2),
    ('Suite', 3, 4, 399.99, 8, 3, 20, 1, 2);
    
INSERT INTO FloorEvenOdd (FloorNum, EvenOrOddID, JacuzziID, ADAAccessible) VALUES
	(1, 0, 0),
    (1, 1, 0),
    (2, 0, 0, 1),
    (2, 1, 1),
    (3, 0, 0, 1),
    (3, 1, 1);

INSERT INTO Room (RoomNumber, RoomTypeID, FloorEvenOddID) VALUES
	(201, 2, 
    

    