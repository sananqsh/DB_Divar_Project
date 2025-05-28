-- See advertisements with their category and subcategories:
SELECT a.adid, a.title, subc.namefa, c.namefa
FROM advertisement a
JOIN category subc ON a.categoryid=subc.categoryid
LEFT JOIN category c ON subc.parentcategoryid=c.categoryid
ORDER BY c.categoryid, subc.categoryid;

-- Check messages an advertisement:
SELECT
    a.adid,
    a.title AS advertisement_title,
    m.messageid,
    m.content,
    m.senddate,
    sender.username AS sender_name,
    receiver.username AS receiver_name,
    (a.userid=senderid) AS from_owner
FROM message m
JOIN advertisement a ON m.adid = a.adid
JOIN "user" sender ON m.senderid = sender.userid
JOIN "user" receiver ON m.receiverid = receiver.userid
WHERE
    (m.senderid = a.userid OR m.receiverid = a.userid) -- One party must be the ad owner
    AND m.senderid <> m.receiverid -- Exclude self-messages
    AND a.adid=1
ORDER BY a.adid, m.senddate;

-- Average rate for each seller (ordered to see top sellers)
SELECT u.username, up.firstname, up.lastname, AVG(rating) as rate
FROM "user" u
JOIN review r ON u.userid = r.targetuserid
JOIN userprofile up ON u.userid = up.userid
GROUP BY u.userid, u.username, up.firstname, up.lastname
ORDER BY rate DESC;
