CREATE TABLE tParkingLot(
	[LotID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Address] [varchar](100) NOT NULL,
	[ZipCode] [int] NOT NULL,
	[City] [varchar](100) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[LotName] [varchar](100) NOT NULL,
	[ContactID] [int] NULL,
	--[OpenSpots] [int] NOT NULL,
	--[TotalSpots] [int] NOT NULL 
);

CREATE TABLE tSpot(
	[SpotID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[FloorNum] [int] NULL,
	[LotID] [int] NOT NULL,
	[IsOpen] [bit] NOT NULL,
	[DeviceID] [int],
	[UpdateDate [datetime]]
);
	
CREATE TABLE tLotUsage(
	[LotUsageID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[SpotID] [int] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[ChangeType] [varchar] NOT NULL
);

CREATE TABLE tUserInfo(
	[UserID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[LastName] [varchar](100) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[EmailAddress] [varchar](100) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL
);

CREATE TABLE tDevice(
	[DeviceID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[DeviceName] [varchar](100) NOT NULL,
	[LocalIpAddress] [varchar](100) NOT NULL,
	[ExternalIpAddress] [varchar](100) NOT NULL,
	[MacAddress] [varchar](100) NOT NULL,
	[LastUpdateDate] [datetime] NOT NULL,
	[CompanyID] [int],
	[TakeNewImage] [bit] DEFAULT 0 NOT NULL,
	[DeviceStatusID] [int] DEFAULT 1 NOT NULL,
	[ParkingLotID] [int]
);

CREATE TABLE tCompany(
	[CompanyID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[CompanyName] [varchar](100) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[ZipCode] [int] NOT NULL,
	[City] [varchar](100) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[CompanyUsername] [varchar](100) NOT NULL,
	[CompanyPassword] [varchar](100) NOT NULL
);

CREATE TABLE tContact(
	[ContactID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[EmailAddress] [varchar](100) NOT NULL,
	[CompanyID] [int] NOT NULL
);

Create TABLE tSpotImageCoordinates(
	[SpotCoordinateID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[SpotID] [int] NOT NULL,
	[TopLeftXCoordinate] [int] NOT NULL,
	[TopLeftYCoordinate] [int] NOT NULL,
	[BottomRightXCoordinate] [int] NOT NULL,
	[BottomRightYCoordinate] [int] NOT NULL
);

CREATE TABLE tSpotAvailability(
	[SpotAvailabilityID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[SpotID] [int] NOT NULL,
	[IsOpen] [bit] NOT NULL
);

CREATE TABLE tParkingLotCoordinates(
	[ParkingLotCoordinateID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ParkingLotID] [int] NOT NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL,
);

CREATE TABLE tDeviceStatus
(
	[DeviceStatusID] [int] IDENTITY(1,1),
	[DeviceStatus] [varchar](200) NOT NULL,
)

CREATE TABLE tDeviceImages
(
	[DeviceImageID] [int] IDENTITY(1,1),
	[DeviceID] [int] NOT NULL,
	[EncodedImageString] [VARCHAR](MAX) NOT NULL,
	[CreatedDate] [datetime] NOT NULL
)


ALTER TABLE tParkingLot
ADD Coordinates geography