CREATE DATABASE IF NOT EXISTS SpotCheck;

-- Tables without Foreign Keys

CREATE TABLE Companies(
	CompanyID INT AUTO_INCREMENT NOT NULL,
	CompanyName VARCHAR(100) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	City VARCHAR(100) NOT NULL,
	State VARCHAR(2) NOT NULL,
	ZipCode VARCHAR(20) NOT NULL,
	CompanyUsername VARCHAR(100) NOT NULL,
	CompanyPassword VARCHAR(100) NOT NULL,
	IsDeleted TINYINT(1) DEFAULT 0 NOT NULL,

	PRIMARY KEY (CompanyID)
);

CREATE TABLE UserInfo(
	UserID INT AUTO_INCREMENT NOT NULL,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,	
	EmailAddress VARCHAR(100) NOT NULL,
	UserName VARCHAR(100) NOT NULL,
	Password VARCHAR(100) NOT NULL,
	IsDeleted TINYINT(1) DEFAULT 0 NOT NULL,

	PRIMARY KEY (UserID)
);

CREATE TABLE CameraStatuses
(
	CameraStatusID INT AUTO_INCREMENT NOT NULL,
	CameraStatus VARCHAR(100) NOT NULL,

	PRIMARY KEY (CameraStatusID)
);

-- Tables with Foreign Keys

CREATE TABLE Contacts(
	ContactID INT AUTO_INCREMENT NOT NULL,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL,
	EmailAddress VARCHAR(100) NOT NULL,
	CompanyID INT NOT NULL,
	IsDeleted TINYINT(1) DEFAULT 0 NOT NULL,

	PRIMARY KEY (ContactID),
	FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);

CREATE TABLE Lots(
	LotID INT AUTO_INCREMENT NOT NULL,
	LotName VARCHAR(100) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	City VARCHAR(100) NOT NULL,	
	State VARCHAR(2) NOT NULL,
	ZipCode VARCHAR(20) NOT NULL,
	CompanyID INT NOT NULL,
	CreateDate DATETIME,
	UpdateDate DATETIME,
	IsDeleted TINYINT(1) DEFAULT 0 NOT NULL,
	
	PRIMARY KEY (LotID),
	FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);

CREATE TABLE Cameras(
	CameraID INT AUTO_INCREMENT NOT NULL,
	CameraName VARCHAR(100) NOT NULL,
	LocalIpAddress VARCHAR(100) NOT NULL,
	ExternalIpAddress VARCHAR(100) NOT NULL,
	MacAddress VARCHAR(100) NOT NULL,
	TakeNewImage TINYINT(1) DEFAULT 0 NOT NULL,
	CameraStatusID INT DEFAULT 1 NOT NULL,
	LotID INT NOT NULL,
	CreateDate DATETIME,
	UpdateDate DATETIME,
	IsDeleted TINYINT(1) DEFAULT 0 NOT NULL,

	PRIMARY KEY (CameraID),
	FOREIGN KEY (LotID) REFERENCES Lots(LotID),
	FOREIGN KEY (CameraStatusID) REFERENCES CameraStatuses(CameraStatusID)
);

CREATE TABLE Spots(
	SpotID INT AUTO_INCREMENT NOT NULL,
	IsOpen TINYINT(1) NOT NULL,
	CameraID INT NOT NULL,
	CreateDate DATETIME,
	UpdateDate DATETIME,
	IsDeleted TINYINT(1) DEFAULT 0 NOT NULL,

	PRIMARY KEY (SpotID),
	FOREIGN KEY (CameraID) REFERENCES Cameras(CameraID)
);
	
CREATE TABLE HistoricalSpotAvailability(
	HistoricalSpotAvailabilityID INT AUTO_INCREMENT NOT NULL,
	SpotID INT NOT NULL,
	IsOpen TINYINT(1) NOT NULL,
	CreateDate DATETIME,

	PRIMARY KEY (HistoricalSpotAvailabilityID),
	FOREIGN KEY (SpotID) REFERENCES Spots(SpotID)
);

Create TABLE ImageCoordinates(
	SpotCoordinateID INT AUTO_INCREMENT NOT NULL,
	SpotID INT NOT NULL,
	TopLeftXCoordinate INT NOT NULL,
	TopLeftYCoordinate INT NOT NULL,
	BottomRightXCoordinate INT NOT NULL,
	BottomRightYCoordinate INT NOT NULL,

	PRIMARY KEY (SpotCoordinateID),
	FOREIGN KEY (SpotID) REFERENCES Spots(SpotID)
);

CREATE TABLE CameraImages
(
	CameraImageID INT AUTO_INCREMENT NOT NULL,
	CameraID INT NOT NULL,
	EncodedImageString TEXT NOT NULL,
	CreatedDate DATETIME NOT NULL,

	PRIMARY KEY (CameraImageID),
	FOREIGN KEY (CameraID) REFERENCES Cameras(CameraID)
);

-- Default Values

INSERT INTO CameraStatuses (CameraStatus) VALUES ("NoCompany");
INSERT INTO CameraStatuses (CameraStatus) VALUES ("Undeployed");
INSERT INTO CameraStatuses (CameraStatus) VALUES ("WaitingForImageRequest");
INSERT INTO CameraStatuses (CameraStatus) VALUES ("WaitingForSpots");
INSERT INTO CameraStatuses (CameraStatus) VALUES ("Deployed");

INSERT INTO Companies 
(
	CompanyName,
	Address,
	City,
	State,
	ZipCode,
	CompanyUsername,
	CompanyPassword
)
VALUES
(
	"Default Company",
	"Test Street",
	"Denver",
	"CO",
	"80022",
	"Username",
	"Password"
);