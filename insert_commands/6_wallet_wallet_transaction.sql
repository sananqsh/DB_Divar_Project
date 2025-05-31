/* ──────────────── WALLETS ──────────────── */
-- one wallet per user; balances start wherever you like
INSERT INTO Wallet (Balance, UserID) VALUES
  (  500.00,  1),   -- sarah_smith
  ( 1250.75,  3),   -- emily_wilson
  (    0.00,  4),   -- david_brown (admin)
  (  300.25,  5),   -- lisa_jackson
  (10000.00,  9);   -- natalie_clark

/* ─────────── WALLET TRANSACTIONS ────────── */
/* Using sub-queries keeps you safe from unknown serial IDs. */
INSERT INTO WalletTransaction
        (Type,        Amount, Status,     Description,            WalletID)
VALUES
  ('deposit',        500.00, 'completed', 'Initial top-up',
                    (SELECT WalletID FROM Wallet WHERE UserID = 1)),
  ('deposit',       1500.00, 'completed', 'Monthly salary',
                    (SELECT WalletID FROM Wallet WHERE UserID = 3)),
  ('withdrawal',     200.00, 'completed', 'Bought ad #42',
                    (SELECT WalletID FROM Wallet WHERE UserID = 3)),
  ('deposit',       5000.00, 'pending',   'Incoming bank transfer',
                    (SELECT WalletID FROM Wallet WHERE UserID = 9)),
  ('refund',         250.00, 'completed', 'Order #123 refund',
                    (SELECT WalletID FROM Wallet WHERE UserID = 5)),
  ('withdrawal',    1200.00, 'failed',    'Attempted payout – card declined',
                    (SELECT WalletID FROM Wallet WHERE UserID = 5)),
  ('deposit',        750.00, 'completed', 'Promo bonus',
                    (SELECT WalletID FROM Wallet WHERE UserID = 1)),
  ('withdrawal',      50.00, 'completed', 'Fee: featured-ad upgrade',
                    (SELECT WalletID FROM Wallet WHERE UserID = 1));

/* ============================================================
   SECTION 2 – QUICK VISUAL CHECK
   ------------------------------------------------------------
   Two simple SELECTs so you can eyeball that the data landed
   as expected before moving on to analytics.
   ============================================================ */
SELECT * FROM Wallet            ORDER BY WalletID;
SELECT * FROM WalletTransaction ORDER BY WalletTransactionID;

/* ============================================================
   SECTION 3 – ANALYTICAL / REPORTING QUERIES
   ------------------------------------------------------------
   Snippets you can drop into dashboards or ad-hoc reports.
   ------------------------------------------------------------ */

-- 3.1 CURRENT BALANCES (largest first)
-- Shows every user’s live balance alongside their username.
SELECT u.Username,
       w.Balance
FROM   Wallet w
JOIN   "user" u USING (UserID)
ORDER  BY w.Balance DESC;

-- 3.2 DEPOSITS vs WITHDRAWALS PER WALLET
-- Helps spot heavy spenders or one-sided accounts.
SELECT WalletID,
       SUM(CASE WHEN Type='deposit'    THEN Amount END) AS deposits,
       SUM(CASE WHEN Type='withdrawal' THEN Amount END) AS withdrawals
FROM   WalletTransaction
GROUP  BY WalletID;

-- 3.3 NET CASH-FLOW BY DAY (completed only)
-- Positive = inflow; negative = outflow. Good for trend charts.
SELECT DATE(CreatedAt) AS day,
       SUM(CASE
             WHEN Type IN ('deposit','refund') THEN Amount   -- money in
             ELSE -Amount                                    -- money out
           END) AS net_change
FROM   WalletTransaction
WHERE  Status='completed'              -- ignore pending / failed
GROUP  BY day
ORDER  BY day DESC;

-- 3.4 TOP 5 SPENDERS (lifetime)
-- Ranks users by total completed withdrawals.
SELECT u.Username,
       SUM(t.Amount) AS total_spent
FROM   WalletTransaction t
JOIN   Wallet w USING (WalletID)
JOIN   "user" u USING (UserID)
WHERE  t.Type='withdrawal'
  AND  t.Status='completed'
GROUP  BY u.Username
ORDER  BY total_spent DESC
LIMIT  5;

-- 3.5 DORMANT WALLETS (no transactions in last 30 days)
-- Useful for churn or re-engagement campaigns.
SELECT w.WalletID,
       u.Username,
       w.Balance
FROM   Wallet w
JOIN   "user" u USING (UserID)
WHERE  NOT EXISTS (
        SELECT 1
        FROM   WalletTransaction t
        WHERE  t.WalletID = w.WalletID
          AND  t.CreatedAt >= NOW() - INTERVAL '30 days');

-- 3.6 BIGGEST SINGLE TRANSACTION EVER RECORDED
-- Quick way to locate outliers or large refunds/charges.
SELECT *
FROM   WalletTransaction
ORDER  BY Amount DESC
LIMIT  1;