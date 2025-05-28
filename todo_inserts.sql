---------------------------------------
-- INSERT INTO
---------------------------------------

--PaymentMethod
INSERT INTO PaymentMethod (MethodName, IsActive)
VALUES ('Credit Card', TRUE);

-- Transaction
INSERT INTO Transaction (TransactionDate, Amount, Status, PaymentGatewayDetails, PaymentMethodID)
VALUES (NOW(), 799.99, 'completed', 'TXN1234567890', 1);

-- PaymentGatewayDetails
INSERT INTO PaymentGatewayDetails (PaymentToken, ProcessorResponse, TransactionID)
VALUES ('abc123token', 'Approved', 1);

-- Report
INSERT INTO Report (ReportType, Description, ReportDate, Status, ReporterUserID, AdID, ReportedUserID)
VALUES ('Spam', 'This ad looks suspicious.', NOW(), 'pending', 1, 1, 1);

-- Notification
INSERT INTO Notification (Content, CreationDate, IsRead, Type, UserID, AdID)
VALUES ('Your ad has been approved.', NOW(), FALSE, 'system', 1, 1);

-- Location
INSERT INTO Location (Latitude, Longitude, Address, City, Province, AdID)
VALUES (40.7128, -74.0060, '123 Main St', 'New York', 'NY', 1);

-- CategoryAttribute
INSERT INTO CategoryAttribute (AttributeName, IsRequired, CategoryID)
VALUES ('Condition', TRUE, 1);

-- AdAttribute
INSERT INTO AdAttribute (AttributeName, AttributeValue, AdID, CategoryAttributeID)
VALUES ('Condition', 'New', 1, 1);

-- Order
INSERT INTO "order" (OrderDate, Status, AdID, BuyerID, TransactionID)
VALUES (NOW(), 'completed', 1, 1, 1);

-- OTP
INSERT INTO OTP (Code, ExpiryTime, IsUsed, CreationDate, Purpose, UserID, RelatedAdID, RelatedTransactionID)
VALUES ('123456', NOW() + INTERVAL '5 minutes', FALSE, NOW(), 'login', 1, 1, 1);

-- Commission
INSERT INTO Commission (Rate, FixedRate, MinAmount, TransactionID)
VALUES (5.00, 2.00, 10.00, 1);

-- Wallet
INSERT INTO Wallet (Balance, LastUpdated, UserID)
VALUES (100.00, NOW(), 1);

-- WalletTransaction
INSERT INTO WalletTransaction (Type, Amount, Status, CreatedAt, Description, RelatedTransactionID, WalletID)
VALUES ('credit', 50.00, 'success', NOW(), 'Refund for cancelled order', 1, 1);

-- Payout
INSERT INTO Payout (Amount, Status, PayoutDate, Notes, PaymentMethodID, WalletTransactionID)
VALUES (50.00, 'completed', NOW(), 'Monthly earnings payout', 1, 1);
