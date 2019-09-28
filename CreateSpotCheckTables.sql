CREATE TABLE tParkingLot(
	[LotID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[ZipCode] [int] NOT NULL,
	[City] [varchar](100) NOT NULL,
	[State] [varchar](20) NOT NULL,
	[LotName] [varchar](100) NOT NULL,
	[ContactID] [int] NULL,
	[Latitude] [decimal](9, 6) NULL,
	[Longitude] [decimal](9, 6) NULL
);

CREATE TABLE tSpot(
	[SpotID] [int] IDENTITY(1,1) NOT NULL,
	[FloorNum] [int] NULL,
	[LotID] [int] NOT NULL,
	[OpenFlag] [bit] NOT NULL,
);
	
CREATE TABLE tLotUsage(
	[LotUsageID] [int] IDENTITY(1,1) NOT NULL,
	[SpotID] [int] NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[ChangeType] [varchar] NOT NULL
);

CREATE TABLE tUserInfo(
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[EmailAddress] [varchar](100) NOT NULL
);

CREATE TABLE tDevice(
	[DeviceID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceName] [varchar](100) NOT NULL,
	[LocalIpAddress] [varchar](100) NOT NULL,
	[ExternalIpAddress] [varchar](100) NOT NULL,
	[MacAddress] [varchar](100) NOT NULL,
	[LotID] [int],
	[FloorNumber] [int],
	[LastUpdateDate] [datetime] NOT NULL,
	[CompanyID] [int] NOT NULL
);

CREATE TABLE tCompany(
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](100) NOT NULL,
	[Address] [varchar](100) NOT NULL
);

CREATE TABLE tContact(
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[EmailAddress] [varchar](100) NOT NULL,
	[CompanyID] [int] NOT NULL
);