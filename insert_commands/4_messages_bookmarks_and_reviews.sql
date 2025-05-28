-- INSERT INTO MESSAGES
-- 🏠 AdID 1 — Luxury Apartment in Tehran (UserID = 3 is the ad owner)
INSERT INTO message (content, senddate, isread, senderid, receiverid, adid) VALUES
('Hi, is the apartment still available?', NOW() - INTERVAL '5 days', false, 6, 3, 1),
('Yes, it is still available. Would you like to schedule a visit?', NOW() - INTERVAL '5 days', false, 3, 6, 1),
('That would be great. Is Saturday afternoon okay?', NOW() - INTERVAL '4 days', false, 6, 3, 1);

-- 🚗 AdID 4 — 2020 Peugeot 208 (UserID = 5 is the ad owner)
INSERT INTO message (content, senddate, isread, senderid, receiverid, adid) VALUES
('I''m interested in the Peugeot 208. Has it been in any accidents?', NOW() - INTERVAL '3 days', false, 8, 5, 4),
('No accidents, it''s in perfect condition. You can come check it out if you''d like.', NOW() - INTERVAL '3 days', false, 5, 8, 4),
('Thanks. Can I see it tomorrow around 5pm?', NOW() - INTERVAL '2 days', false, 8, 5, 4);

-- 📱 AdID 7 — Samsung Galaxy S22 (UserID = 4 is the ad owner)
INSERT INTO message (content, senddate, isread, senderid, receiverid, adid) VALUES
('Hi, does the S22 come with the original box and charger?', NOW() - INTERVAL '6 days', false, 7, 4, 7),
('Yes, everything is included — box, charger, and even a new case.', NOW() - INTERVAL '6 days', false, 4, 7, 7),
('Perfect. Would you accept 850 for it?', NOW() - INTERVAL '5 days', false, 7, 4, 7);

-- 🏠 AdID 10 — Persian Carpet (UserID = 10 is the ad owner)
INSERT INTO message (content, senddate, isread, senderid, receiverid, adid) VALUES
('Is the Persian carpet handmade and authentic?', NOW() - INTERVAL '2 days', false, 2, 10, 10),
('Yes, it''s handmade in Tabriz, and I have a certificate of authenticity.', NOW() - INTERVAL '2 days', false, 10, 2, 10);

-- 🎫 AdID 19 — Concert Tickets (UserID = 9 is the ad owner)
INSERT INTO message (content, senddate, isread, senderid, receiverid, adid) VALUES
('Hey! Are the Coldplay tickets still available?', NOW() - INTERVAL '1 day', false, 1, 9, 19),
('Yes! They are for next Saturday’s show. Front section.', NOW() - INTERVAL '1 day', false, 9, 1, 19),
('Awesome. I’ll take them. Can we meet today?', NOW(), false, 1, 9, 19);

---------------------------------------------------------------------------------------------------------------------
-- Bookmark
INSERT INTO Bookmark (BookmarkDate, UserID, AdID)
VALUES
(NOW(), 1, 1),
(NOW() - INTERVAL '1 day', 1, 2),
(NOW() - INTERVAL '2 days', 3, 1),
(NOW() - INTERVAL '1 days', 4, 1);

---------------------------------------------------------------------------------------------------------------------
-- Review
INSERT INTO Review (Rating, Comment, ReviewDate, ReviewerID, TargetUserID)
VALUES
(5, 'Great seller!', NOW(), 1, 2),
(4, 'Has great prices.', NOW(), 1, 3),
(3, 'Medium quality stuff!', NOW(), 1, 3),
(1, 'Not a nice attitude...', NOW(), 4, 1),
(2, 'Not a nice attitude...', NOW(), 3, 1),
(1, 'Bad seller! :(', NOW(), 4, 4);
