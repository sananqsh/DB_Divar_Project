/* ============================================================
   SECTION 0 – OPTIONAL: reset just the payout-related tables
   ------------------------------------------------------------
   Uncomment the TRUNCATE below if you want to wipe only the
   data we’re about to seed (keeps all your other fixtures).
   ============================================================ */
/*
TRUNCATE Payouts,
         WalletTransactions,
         PaymentMethods
  RESTART IDENTITY
  CASCADE;  -- wipes dependent rows (e.g., unique FK in Payouts)
*/

/* ============================================================
   SECTION 1 – PAYMENT METHODS (global catalogue)
   ------------------------------------------------------------
   No UserID FK in the table itself, so we encode the owner
   in the MethodName for clarity.  Feel free to adapt.
   ============================================================ */
INSERT INTO PaymentMethods (MethodName, IsActive) VALUES
  ('sarah_smith – Visa ****4242',   TRUE),
  ('emily_wilson – Bank Transfer',  TRUE),
  ('lisa_jackson – PayPal',         TRUE),
  ('natalie_clark – Crypto Wallets', TRUE);

/* ============================================================
   SECTION 2 – WALLET TRANSACTIONS that will become PAYOUTS
   ------------------------------------------------------------
   • One new withdrawal per user who’s cashing out.
   • Status starts as "processing"; you’ll flip to "completed"
     once the external transfer settles.
   • We fetch WalletID dynamically so ID drift is never scary.
   ============================================================ */
INSERT INTO WalletTransactions
        (Type,        Amount, Status,      Description,              WalletID)
VALUES
  ('withdrawal',   250.00,  'processing', 'Payouts request #PX101',
                   (SELECT WalletID FROM Wallets WHERE UserID = 1)),  -- Sarah
  ('withdrawal',  1000.00,  'processing', 'Payouts request #PX102',
                   (SELECT WalletID FROM Wallets WHERE UserID = 3)),  -- Emily
  ('withdrawal',   150.00,  'processing', 'Payouts request #PX103',
                   (SELECT WalletID FROM Wallets WHERE UserID = 5)),  -- Lisa
  ('withdrawal',  5000.00,  'processing', 'Payouts request #PX104',
                   (SELECT WalletID FROM Wallets WHERE UserID = 9));  -- Natalie

/* ============================================================
   SECTION 3 – PAYOUT ROWS (one-to-one with the txns above)
   ------------------------------------------------------------
   • Links:  PaymentMethodID  → chosen method
             WalletTransactionID → ledger row just inserted
   • Notes column is handy for external reference numbers.
   ============================================================ */
INSERT INTO Payouts
        (Amount, Status,        Notes,                       PaymentMethodID,    WalletTransactionID)
VALUES
  ( 250.00,  'initiated',  'Stripe transfer #STR337',         -- Sarah
   (SELECT PaymentMethodID FROM PaymentMethods
     WHERE MethodName LIKE 'sarah_smith%'),
   (SELECT WalletTransactionID FROM WalletTransactions
     WHERE Description = 'Payouts request #PX101')),

  (1000.00, 'initiated',  'ACH batch file 2025-05-31-A',      -- Emily
   (SELECT PaymentMethodID FROM PaymentMethods
     WHERE MethodName LIKE 'emily_wilson%'),
   (SELECT WalletTransactionID FROM WalletTransactions
     WHERE Description = 'Payouts request #PX102')),

  ( 150.00, 'initiated',  'PayPal batch P-9281',              -- Lisa
   (SELECT PaymentMethodID FROM PaymentMethods
     WHERE MethodName LIKE 'lisa_jackson%'),
   (SELECT WalletTransactionID FROM WalletTransactions
     WHERE Description = 'Payouts request #PX103')),

  (5000.00, 'initiated',  'Crypto tx 0xAbC…',                 -- Natalie
   (SELECT PaymentMethodID FROM PaymentMethods
     WHERE MethodName LIKE 'natalie_clark%'),
   (SELECT WalletTransactionID FROM WalletTransactions
     WHERE Description = 'Payouts request #PX104'));

/* ============================================================
   SECTION 4 – QUICK SANITY CHECKS
   ------------------------------------------------------------ */
-- Show the newly inserted payment methods
SELECT * FROM PaymentMethods ORDER BY PaymentMethodID;

-- Show the ledger rows marked for payout
SELECT * FROM WalletTransactions
WHERE Description LIKE 'Payouts request%'
ORDER BY WalletTransactionID;

-- Show the payout table with method names joined in
SELECT p.PayoutID,
       u.Username,
       p.Amount,
       p.Status,
       p.PayoutDate,
       pm.MethodName
FROM   Payouts p
JOIN   WalletTransactions wt USING (WalletTransactionID)
JOIN   Wallets w            USING (WalletID)
JOIN   Users u            USING (UserID)
JOIN   PaymentMethods pm    USING (PaymentMethodID)
ORDER  BY p.PayoutID;

/* ============================================================
   SECTION 5 – HANDY ANALYTICAL QUERIES
   ------------------------------------------------------------ */

-- 5.1  Total payouts per user (completed + initiated)
SELECT u.Username,
       COUNT(*)         AS payout_count,
       SUM(p.Amount)    AS total_payout
FROM   Payouts p
JOIN   WalletTransactions wt USING (WalletTransactionID)
JOIN   Wallets w            USING (WalletID)
JOIN   Users u            USING (UserID)
GROUP  BY u.Username
ORDER  BY total_payout DESC;

-- 5.2  Current pipeline: payouts still in progress
SELECT p.PayoutID,
       u.Username,
       p.Amount,
       p.Status,
       pm.MethodName
FROM   Payouts p
JOIN   WalletTransactions wt USING (WalletTransactionID)
JOIN   Wallets w            USING (WalletID)
JOIN   Users u            USING (UserID)
JOIN   PaymentMethods pm    USING (PaymentMethodID)
WHERE  p.Status IN ('initiated','processing');

-- 5.3  Payouts volume by payment method
SELECT pm.MethodName,
       COUNT(*)      AS payouts,
       SUM(p.Amount) AS volume
FROM   Payouts p
JOIN   PaymentMethods pm USING (PaymentMethodID)
GROUP  BY pm.MethodName
ORDER  BY volume DESC;
