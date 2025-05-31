-- See advertisements with their Categories and subcategories:
SELECT a.adid, a.title, subc.namefa, c.namefa
FROM Advertisements a
JOIN Categories subc ON a.categoryid=subc.categoryid
LEFT JOIN Categories c ON subc.parentcategoryid=c.categoryid
ORDER BY c.categoryid, subc.categoryid;

-- Check messages an Advertisements:
SELECT
    a.adid,
    a.title AS advertisement_title,
    m.messageid,
    m.content,
    m.senddate,
    sender.username AS sender_name,
    receiver.username AS receiver_name,
    (a.userid=senderid) AS from_owner
FROM Messages m
JOIN Advertisements a ON m.adid = a.adid
JOIN Users sender ON m.senderid = sender.userid
JOIN Users receiver ON m.receiverid = receiver.userid
WHERE
    (m.senderid = a.userid OR m.receiverid = a.userid) -- One party must be the ad owner
    AND m.senderid <> m.receiverid -- Exclude self-messages
    AND a.adid=1
ORDER BY a.adid, m.senddate;

-- Average rate for each seller (ordered to see top sellers)
SELECT u.userid, u.username, AVG(rating) as rate, COUNT(rating) as no_rates, concat(up.firstname, ' ', up.lastname) as full_name
FROM Users u
JOIN Reviews r ON u.userid = r.targetuserid
JOIN UserProfiles up ON u.userid = up.userid
GROUP BY u.userid, u.username, up.firstname, up.lastname
ORDER BY rate DESC;
