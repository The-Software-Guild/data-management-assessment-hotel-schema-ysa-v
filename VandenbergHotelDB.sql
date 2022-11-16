show databases;
DROP DATABASE IF EXISTS VandenbergHotelDB;
CREATE DATABASE VandenbergHotelDB;
SHOW DATABASES;
USE VandenbergHotelDB;
CREATE TABLE BedConfig (
	BedConfigID TINYINT AUTO_INCREMENT,
	DoubleQueens BOOL,
    King BOOL,
    PullOut BOOL,
    CONSTRAINT pk_BedConfig
		PRIMARY KEY (BedConfigID)
);
DESCRIBE BedConfig;

CREATE TABLE Address (
	AddressID INT AUTO_INCREMENT,
    Street VARCHAR(100),
    City VARCHAR(50),
    State CHAR(2),
    Zip TINYINT(5),
    CONSTRAINT pk_Adress
		PRIMARY KEY (AddressID)
);
DESCRIBE Address;

CREATE TABLE ApplianceConfig (
	ApplianceConfigID TINYINT AUTO_INCREMENT,
    HasFridge TINYINT,
    HasMicrowave BOOL,
    HasStoveAndOven BOOL,
	CONSTRAINT pk_ApplianceConfig
		PRIMARY KEY (ApplianceConfigID)
);
DESCRIBE ApplianceConfig;

CREATE TABLE Jacuzzi (
	JacuzziID TINYINT AUTO_INCREMENT,
    HasJacuzzi BOOL,
    AdditionalCost DECIMAL(5,2),
	CONSTRAINT pk_Jacuzzi
		PRIMARY KEY (JacuzziID)
);
DESCRIBE Jacuzzi;

CREATE TABLE EvenOrOdd (
	EvenOrOddID TINYINT AUTO_INCREMENT,
    EvenOrOdd VARCHAR(4),
	CONSTRAINT pk_EvenOrOdd
		PRIMARY KEY (EvenOrOddID)
);
DESCRIBE EvenOrOdd;

CREATE TABLE Floor (
	FloorNum TINYINT,
	CONSTRAINT pk_Floor
		PRIMARY KEY (FloorNum)
);
DESCRIBE Floor;

CREATE TABLE Guest (
	GuestID INT AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Phone CHAR(10) NOT NULL UNIQUE,
    AddressID INT,
	CONSTRAINT pk_Guest
		PRIMARY KEY (GuestID),
	CONSTRAINT fk_Guest_Address
		FOREIGN KEY (AddressID)
        REFERENCES Address(AddressID)
);
DESCRIBE Guest;

CREATE TABLE Reservation (
	ReservationID INT AUTO_INCREMENT,
	GuestID INT,
    StartDate DATE,
    EndDate DATE,
    TotalCost DECIMAL(10,2),
    TotalAdults TINYINT,
    TotalChildren TINYINT,
	CONSTRAINT pk_Reservation
		PRIMARY KEY (ReservationID),
	CONSTRAINT fk_Reservation_Guest
		FOREIGN KEY (GuestID)
        REFERENCES Guest(GuestID)
);
DESCRIBE Reservation;

CREATE TABLE RoomType (
	RoomTypeID TINYINT AUTO_INCREMENT,
    RoomTypeName VARCHAR(10) NOT NULL,
    BedConfigID TINYINT NOT NULL,
    ApplianceConfigID TINYINT NOT NULL,
    BasePrice DECIMAL(6,2) NOT NULL,
    MaxAdults TINYINT NOT NULL,
    MaxBaseAdults TINYINT,
    AdditionalAdultPrice DECIMAL(6,2),
    ADAAccessible BOOL,
    NumBedrooms TINYINT,
	CONSTRAINT pk_RoomType
		PRIMARY KEY (RoomTypeID),
	CONSTRAINT fk_RoomType_BedConfig
		FOREIGN KEY (BedConfigID)
        REFERENCES BedConfig(BedConfigID),
	CONSTRAINT fk_RoomType_ApplianceConfig
		FOREIGN KEY (ApplianceConfigID)
        REFERENCES ApplianceConfig(ApplianceConfigID)
);
DESCRIBE RoomType;

CREATE TABLE FloorEvenOdd (
	FloorNum TINYINT,
    EvenOrOddID TINYINT,
    ADAAccessible BOOL,
    JacuzziID TINYINT NOT NULL,
	CONSTRAINT pk_FloorEvenOdd
		PRIMARY KEY (FloorNum, EvenOrOddID),
	CONSTRAINT fk_FloorEvenOdd_Floor
		FOREIGN KEY (FloorNum)
        REFERENCES Floor(FloorNum),
	CONSTRAINT fk_FloorEvenOdd_EvenOrOdd
		FOREIGN KEY (EvenOrOddID)
        REFERENCES EvenOrOdd(EvenOrOddID),
	CONSTRAINT fk_FloorEvenOdd_Jacuzzi
		FOREIGN KEY (JacuzziID)
        REFERENCES Jacuzzi(JacuzziID)
);
DESCRIBE FloorEvenOdd;

CREATE TABLE Room (
	RoomNumber TINYINT,
    RoomTypeID TINYINT NOT NULL,
	FloorNum TINYINT NOT NULL,
	CONSTRAINT pk_Room
		PRIMARY KEY (RoomNumber),
	CONSTRAINT fk_Room_RoomType
		FOREIGN KEY (RoomTypeID)
        REFERENCES RoomType(RoomTypeID),
	CONSTRAINT fk_Room_Floor
		FOREIGN KEY (FloorNum)
        REFERENCES Floor(FloorNum)
);
DESCRIBE Room;

CREATE TABLE SingleRoomReservation (
	RoomReservedID INT AUTO_INCREMENT,
    RoomNumber TINYINT NOT NULL,
    AdultsInRoom TINYINT NOT NULL,
	ChildrenInRoom TINYINT NOT NULL,
    RoomCost DECIMAL(10,2) NOT NULL,
	CONSTRAINT pk_SingleRoomReservation
		PRIMARY KEY (RoomReservedID),
	CONSTRAINT fk_SingleRoomReservation_Room
		FOREIGN KEY (RoomNumber)
        REFERENCES Room(RoomNumber)
);
DESCRIBE SingleRoomReservation;

CREATE TABLE RoomReservation (
	ReservationID INT,
    RoomReservedID INT,
	CONSTRAINT pk_RoomReservation
		PRIMARY KEY (ReservationID, RoomReservedID),
	CONSTRAINT fk_RoomReservation_Reservation
		FOREIGN KEY (ReservationID)
        REFERENCES Reservation(ReservationID),
	CONSTRAINT fk_RoomReservation_SingleRoomReservation
		FOREIGN KEY (RoomReservedID)
        REFERENCES SingleRoomReservation(RoomReservedID)
);
DESCRIBE RoomReservation;

SHOW TABLES;

