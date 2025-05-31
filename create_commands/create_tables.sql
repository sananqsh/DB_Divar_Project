---------------------------------------
-- DROP IF EXISTS
---------------------------------------
DROP TABLE IF EXISTS Users CASCADE;
DROP TABLE IF EXISTS UserProfiles CASCADE;
DROP TABLE IF EXISTS Categories CASCADE;
DROP TABLE IF EXISTS Advertisements  CASCADE;
DROP TABLE IF EXISTS AdImages  CASCADE;
DROP TABLE IF EXISTS Messages CASCADE;
DROP TABLE IF EXISTS Bookmarks CASCADE;
DROP TABLE IF EXISTS Reviews CASCADE;
DROP TABLE IF EXISTS PaymentMethods CASCADE;
DROP TABLE IF EXISTS Transactions CASCADE;
DROP TABLE IF EXISTS PaymentGatewayDetails CASCADE;
DROP TABLE IF EXISTS Reports CASCADE;
DROP TABLE IF EXISTS Notifications CASCADE;
DROP TABLE IF EXISTS Locations CASCADE;
DROP TABLE IF EXISTS CategoryAttributes CASCADE;
DROP TABLE IF EXISTS AdAttributes CASCADE;
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS OTPs  CASCADE;
DROP TABLE IF EXISTS Commissions CASCADE;
DROP TABLE IF EXISTS Wallets CASCADE;
DROP TABLE IF EXISTS WalletTransactions CASCADE;
DROP TABLE IF EXISTS Payouts CASCADE;

---------------------------------------
-- CREATE TABLE
---------------------------------------
CREATE TABLE Users (
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

CREATE TABLE UserProfiles (
    ProfileID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Address TEXT,
    City VARCHAR(50),
    Province VARCHAR(50),
    PostalCode VARCHAR(20),
    Biography TEXT,
    UserID INT UNIQUE REFERENCES Users(UserID) ON DELETE CASCADE
);

CREATE TABLE Categories (
    CategoryID SERIAL PRIMARY KEY,
    NameFa VARCHAR(100),
    NameEn VARCHAR(100),
    Slug VARCHAR(100),
    Description TEXT,
    ParentCategoryID INT REFERENCES Categories(CategoryID) ON DELETE SET NULL
);

CREATE TABLE Advertisements (
    AdID SERIAL PRIMARY KEY,
    Title VARCHAR(200),
    Description TEXT,
    Price NUMERIC(10, 2),
    PublishDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ExpiryDate TIMESTAMP,
    Status VARCHAR(50),
    ViewCount INT DEFAULT 0,
    CategoryID INT REFERENCES Categories(CategoryID),
    UserID INT REFERENCES Users(UserID)
);

CREATE TABLE AdImages (
    ImageID SERIAL PRIMARY KEY,
    ImageURL TEXT,
    UploadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsMainImage BOOLEAN DEFAULT FALSE,
    AdID INT REFERENCES Advertisements(AdID) ON DELETE CASCADE
);

CREATE TABLE Messages (
    MessageID SERIAL PRIMARY KEY,
    Content TEXT,
    SendDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsRead BOOLEAN DEFAULT FALSE,
    SenderID INT REFERENCES Users(UserID),
    ReceiverID INT REFERENCES Users(UserID),
    AdID INT REFERENCES Advertisements(AdID)
);

CREATE TABLE Bookmarks (
    BookmarkID SERIAL PRIMARY KEY,
    BookmarkDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UserID INT REFERENCES Users(UserID),
    AdID INT REFERENCES Advertisements(AdID)
);

CREATE TABLE Reviews (
    ReviewID SERIAL PRIMARY KEY,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ReviewerID INT REFERENCES Users(UserID),
    TargetUserID INT REFERENCES Users(UserID)
);

CREATE TABLE PaymentMethods (
    PaymentMethodID SERIAL PRIMARY KEY,
    MethodName VARCHAR(100),
    IsActive BOOLEAN DEFAULT TRUE
);

CREATE TABLE Transactions (
    TransactionID SERIAL PRIMARY KEY,
    TransactionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount NUMERIC(10, 2),
    Status VARCHAR(50),
    PaymentMethodID INT REFERENCES PaymentMethods(PaymentMethodID)
);

CREATE TABLE PaymentGatewayDetails (
    PaymentGatewayDetailsID SERIAL PRIMARY KEY,
    PaymentToken TEXT,
    ProcessorResponse TEXT,
    TransactionID INT UNIQUE REFERENCES Transactions(TransactionID) ON DELETE CASCADE
);

CREATE TABLE Reports (
    ReportID SERIAL PRIMARY KEY,
    ReportType VARCHAR(100),
    Description TEXT,
    ReportDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50),
    ReporterUserID INT REFERENCES Users(UserID),
    AdID INT REFERENCES Advertisements(AdID),
    ReportedUserID INT REFERENCES Users(UserID)
);

CREATE TABLE Notifications (
    NotificationID SERIAL PRIMARY KEY,
    Content TEXT,
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    IsRead BOOLEAN DEFAULT FALSE,
    Type VARCHAR(100),
    UserID INT REFERENCES Users(UserID),
    AdID INT REFERENCES Advertisements(AdID)
);

CREATE TABLE Locations (
    LocationID SERIAL PRIMARY KEY,
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6),
    Address TEXT,
    City VARCHAR(50),
    Province VARCHAR(50),
    AdID INT REFERENCES Advertisements(AdID)
);

CREATE TABLE CategoryAttributes (
    CategoryAttributeID SERIAL PRIMARY KEY,
    AttributeName VARCHAR(100),
    IsRequired BOOLEAN DEFAULT FALSE,
    CategoryID INT REFERENCES Categories(CategoryID)
);

CREATE TABLE AdAttributes (
    AttributeID SERIAL PRIMARY KEY,
    AttributeName VARCHAR(100),
    AttributeValue TEXT,
    AdID INT REFERENCES Advertisements(AdID),
    CategoryAttributeID INT REFERENCES CategoryAttributes(CategoryAttributeID)
);

CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Status VARCHAR(50),
    AdID INT REFERENCES Advertisements(AdID),
    BuyerID INT REFERENCES Users(UserID),
    TransactionID INT REFERENCES Transactions(TransactionID)
);

CREATE TABLE OTPs (
    OTPID SERIAL PRIMARY KEY,
    Code VARCHAR(10),
    ExpiryTime TIMESTAMP,
    IsUsed BOOLEAN DEFAULT FALSE,
    CreationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Purpose VARCHAR(100),
    UserID INT REFERENCES Users(UserID),
    RelatedAdID INT REFERENCES Advertisements(AdID),
    RelatedTransactionID INT REFERENCES Transactions(TransactionID)
);

CREATE TABLE Commissions (
    CommissionID SERIAL PRIMARY KEY,
    Rate NUMERIC(5, 2),
    FixedRate NUMERIC(10, 2),
    MinAmount NUMERIC(10, 2),
    TransactionID INT REFERENCES Transactions(TransactionID)
);

CREATE TABLE Wallets (
    WalletID SERIAL PRIMARY KEY,
    Balance NUMERIC(12, 2) DEFAULT 0,
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UserID INT UNIQUE REFERENCES Users(UserID)
);

CREATE TABLE WalletTransactions (
    WalletTransactionID SERIAL PRIMARY KEY,
    Type VARCHAR(50),
    Amount NUMERIC(10, 2),
    Status VARCHAR(50),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Description TEXT,
    RelatedTransactionID INT REFERENCES Transactions(TransactionID),
    WalletID INT REFERENCES Wallets(WalletID)
);

-- Separate payout table using WalletTransactionID as FK
CREATE TABLE Payouts (
    PayoutID SERIAL PRIMARY KEY,
    Amount NUMERIC(10, 2),
    Status VARCHAR(50),
    PayoutDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Notes TEXT,
    PaymentMethodID INT REFERENCES PaymentMethods(PaymentMethodID),
    WalletTransactionID INT UNIQUE REFERENCES WalletTransactions(WalletTransactionID)
);
