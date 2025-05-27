---------------------------------------
-- DROP IF EXISTS
---------------------------------------
DROP TABLE IF EXISTS "user" CASCADE;
DROP TABLE IF EXISTS UserProfile CASCADE;
DROP TABLE IF EXISTS Category CASCADE;
DROP TABLE IF EXISTS Advertisement  CASCADE;
DROP TABLE IF EXISTS AdImage  CASCADE;
DROP TABLE IF EXISTS Message CASCADE;
DROP TABLE IF EXISTS Bookmark CASCADE;
DROP TABLE IF EXISTS Review CASCADE;
DROP TABLE IF EXISTS PaymentMethod CASCADE;
DROP TABLE IF EXISTS Transaction CASCADE;
DROP TABLE IF EXISTS PaymentGatewayDetails CASCADE;
DROP TABLE IF EXISTS Report CASCADE;
DROP TABLE IF EXISTS Notification CASCADE;
DROP TABLE IF EXISTS Location CASCADE;
DROP TABLE IF EXISTS CategoryAttribute CASCADE;
DROP TABLE IF EXISTS AdAttribute CASCADE;
DROP TABLE IF EXISTS "order" CASCADE;
DROP TABLE IF EXISTS OTP  CASCADE;
DROP TABLE IF EXISTS Commission CASCADE;
DROP TABLE IF EXISTS Wallet CASCADE;
DROP TABLE IF EXISTS WalletTransaction CASCADE;
DROP TABLE IF EXISTS Payout CASCADE;

---------------------------------------
-- CREATE TABLE
---------------------------------------
CREATE TABLE "user" (
    UserID SERIAL PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20),
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    LastLoginDate TIMESTAMP,
    ProfilePicture TEXT,
    UserType VARCHAR(50),
    Status VARCHAR(50)
);

CREATE TABLE UserProfile (
    ProfileID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address TEXT,
    City VARCHAR(50),
    Province VARCHAR(50),
    PostalCode VARCHAR(20),
    Biography TEXT,
    UserID INT UNIQUE REFERENCES "user"(UserID) ON DELETE CASCADE
);

CREATE TABLE Category (
    CategoryID SERIAL PRIMARY KEY,
    NameFa VARCHAR(100),
    NameEn VARCHAR(100),
    Slug VARCHAR(100),
    Description TEXT,
    ParentCategoryID INT REFERENCES Category(CategoryID) ON DELETE SET NULL
);

CREATE TABLE Advertisement (
    AdID SERIAL PRIMARY KEY,
    Title VARCHAR(200),
    Description TEXT,
    Price NUMERIC(10, 2),
    PublishDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ExpiryDate TIMESTAMP,
    Status VARCHAR(50),
    ViewCount INT DEFAULT 0,
    CategoryID INT REFERENCES Category(CategoryID),
    UserID INT REFERENCES "user"(UserID)
);

CREATE TABLE AdImage (
    ImageID SERIAL PRIMARY KEY,
    ImageURL TEXT,
    UploadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsMainImage BOOLEAN DEFAULT FALSE,
    AdID INT REFERENCES Advertisement(AdID) ON DELETE CASCADE
);

CREATE TABLE Message (
    MessageID SERIAL PRIMARY KEY,
    Content TEXT,
    SendDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsRead BOOLEAN DEFAULT FALSE,
    SenderID INT REFERENCES "user"(UserID),
    ReceiverID INT REFERENCES "user"(UserID),
    AdID INT REFERENCES Advertisement(AdID)
);

CREATE TABLE Bookmark (
    BookmarkID SERIAL PRIMARY KEY,
    BookmarkDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UserID INT REFERENCES "user"(UserID),
    AdID INT REFERENCES Advertisement(AdID)
);

CREATE TABLE Review (
    ReviewID SERIAL PRIMARY KEY,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ReviewerID INT REFERENCES "user"(UserID),
    TargetUserID INT REFERENCES "user"(UserID)
);

CREATE TABLE PaymentMethod (
    PaymentMethodID SERIAL PRIMARY KEY,
    MethodName VARCHAR(100),
    IsActive BOOLEAN DEFAULT TRUE
);

CREATE TABLE Transaction (
    TransactionID SERIAL PRIMARY KEY,
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount NUMERIC(10, 2),
    Status VARCHAR(50),
    PaymentGatewayDetails TEXT,
    PaymentMethodID INT REFERENCES PaymentMethod(PaymentMethodID)
);

CREATE TABLE PaymentGatewayDetails (
    PaymentGatewayDetailsID SERIAL PRIMARY KEY,
    PaymentToken TEXT,
    ProcessorResponse TEXT,
    TransactionID INT UNIQUE REFERENCES Transaction(TransactionID) ON DELETE CASCADE
);

CREATE TABLE Report (
    ReportID SERIAL PRIMARY KEY,
    ReportType VARCHAR(100),
    Description TEXT,
    ReportDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50),
    ReporterUserID INT REFERENCES "user"(UserID),
    AdID INT REFERENCES Advertisement(AdID),
    ReportedUserID INT REFERENCES "user"(UserID)
);

CREATE TABLE Notification (
    NotificationID SERIAL PRIMARY KEY,
    Content TEXT,
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsRead BOOLEAN DEFAULT FALSE,
    Type VARCHAR(100),
    UserID INT REFERENCES "user"(UserID),
    AdID INT REFERENCES Advertisement(AdID)
);

CREATE TABLE Location (
    LocationID SERIAL PRIMARY KEY,
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6),
    Address TEXT,
    City VARCHAR(50),
    Province VARCHAR(50),
    AdID INT REFERENCES Advertisement(AdID)
);

CREATE TABLE CategoryAttribute (
    CategoryAttributeID SERIAL PRIMARY KEY,
    AttributeName VARCHAR(100),
    IsRequired BOOLEAN DEFAULT FALSE,
    CategoryID INT REFERENCES Category(CategoryID)
);

CREATE TABLE AdAttribute (
    AttributeID SERIAL PRIMARY KEY,
    AttributeName VARCHAR(100),
    AttributeValue TEXT,
    AdID INT REFERENCES Advertisement(AdID),
    CategoryAttributeID INT REFERENCES CategoryAttribute(CategoryAttributeID)
);

CREATE TABLE "order" (
    OrderID SERIAL PRIMARY KEY,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50),
    AdID INT REFERENCES Advertisement(AdID),
    BuyerID INT REFERENCES "user"(UserID),
    TransactionID INT REFERENCES Transaction(TransactionID)
);

CREATE TABLE OTP (
    OTPID SERIAL PRIMARY KEY,
    Code VARCHAR(10),
    ExpiryTime TIMESTAMP,
    IsUsed BOOLEAN DEFAULT FALSE,
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Purpose VARCHAR(100),
    UserID INT REFERENCES "user"(UserID),
    RelatedAdID INT REFERENCES Advertisement(AdID),
    RelatedTransactionID INT REFERENCES Transaction(TransactionID)
);

CREATE TABLE Commission (
    CommissionID SERIAL PRIMARY KEY,
    Rate NUMERIC(5, 2),
    FixedRate NUMERIC(10, 2),
    MinAmount NUMERIC(10, 2),
    TransactionID INT REFERENCES Transaction(TransactionID)
);

CREATE TABLE Wallet (
    WalletID SERIAL PRIMARY KEY,
    Balance NUMERIC(12, 2) DEFAULT 0,
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UserID INT UNIQUE REFERENCES "user"(UserID)
);

CREATE TABLE WalletTransaction (
    WalletTransactionID SERIAL PRIMARY KEY,
    Type VARCHAR(50),
    Amount NUMERIC(10, 2),
    Status VARCHAR(50),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Description TEXT,
    RelatedTransactionID INT REFERENCES Transaction(TransactionID),
    WalletID INT REFERENCES Wallet(WalletID)
);

-- Separate payout table using WalletTransactionID as FK
CREATE TABLE Payout (
    PayoutID SERIAL PRIMARY KEY,
    Amount NUMERIC(10, 2),
    Status VARCHAR(50),
    PayoutDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Notes TEXT,
    PaymentMethodID INT REFERENCES PaymentMethod(PaymentMethodID),
    WalletTransactionID INT UNIQUE REFERENCES WalletTransaction(WalletTransactionID)
);
