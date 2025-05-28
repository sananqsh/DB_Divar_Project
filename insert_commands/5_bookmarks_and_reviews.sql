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
