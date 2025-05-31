INSERT INTO Users (Username, Password, Email, PhoneNumber, RegistrationDate, LastLoginDate, ProfilePicture, UserType, Status)
VALUES
('sarah_smith', 'hashedpass456', 'sarah@example.com', '+155512345',
    '2024-07-15 09:23:45', '2025-05-20 14:12:33',
    'https://example.com/sarah.jpg', 'regular', 'active'),

('mike_jones', 'securepass789', 'mike@example.com', '+155598765',
    '2024-08-22 11:45:12', '2025-05-25 18:34:21',
    'https://example.com/mike.png', 'regular', 'active'),

('emily_wilson', 'emilypass321', 'emily@example.com', '+144433322',
    '2024-06-03 14:56:30', '2025-05-15 10:45:19',
    'https://example.com/emily.jpg', 'premium', 'active'),

('david_brown', 'brownpass654', 'david@example.com', '+166677788',
    '2024-05-28 08:12:45', '2025-05-27 09:15:42',
    'https://example.com/david.png', 'admin', 'active'),

('lisa_jackson', 'lisapass987', 'lisa@example.com', '+177766655',
    '2024-09-18 16:23:11', '2025-04-12 11:22:33',
    'https://example.com/lisa.jpg', 'regular', 'active'),

('robert_garcia', 'rgarcia123', 'robert@example.com', '+188899900',
    '2024-11-05 13:44:55', '2025-05-10 19:08:47',
    'https://example.com/robert.jpg', 'premium', 'active'),

('amanda_lee', 'amandapass456', 'amanda@example.com', '+199911122',
    '2024-10-30 10:33:22', '2024-12-25 23:59:59',
    'https://example.com/amanda.png', 'regular', 'inactive'),

('james_miller', 'jmiller789', 'james@example.com', '+122233344',
    '2024-08-01 07:15:30', '2025-03-18 12:45:11',
    'https://example.com/james.jpg', 'regular', 'active'),

('natalie_clark', 'npass321654', 'natalie@example.com', '+133344455',
    '2024-07-07 12:12:12', '2025-05-22 08:45:33',
    'https://example.com/natalie.png', 'premium', 'active'),

('kevin_white', 'kwpass987123', 'kevin@example.com', '+144455566',
    '2024-09-30 18:45:22', '2025-01-15 16:33:44',
    'https://example.com/kevin.jpg', 'regular', 'active'),

('sophia_harris', 'sophpass456', 'sophia@example.com', '+155566677',
    '2024-06-12 09:08:07', '2025-05-26 17:32:41',
    'https://example.com/sophia.png', 'admin', 'active'),

('ryan_martin', 'ryanpass789', 'ryan@example.com', '+166677788',
    '2024-12-15 14:22:33', '2025-02-14 20:15:19',
    'https://example.com/ryan.jpg', 'regular', 'inactive'),

('olivia_thompson', 'oliviapass123', 'olivia@example.com', '+177788899',
    '2024-10-10 10:10:10', '2025-05-24 13:45:55',
    'https://example.com/olivia.png', 'regular', 'active'),

('daniel_robinson', 'danpass456', 'daniel@example.com', '+188899911',
    '2024-08-28 17:45:33', '2025-05-19 09:12:47',
    'https://example.com/daniel.jpg', 'premium', 'active'),

('mia_martinez', 'miapass789', 'mia@example.com', '+199911122',
    '2024-11-22 08:12:45', '2025-05-23 14:33:22',
    'https://example.com/mia.png', 'regular', 'active'),

('ethan_nguyen', 'ethanpass123', 'ethan@example.com', '+122233344',
    '2024-07-30 13:22:11', '2025-04-30 18:45:12',
    'https://example.com/ethan.jpg', 'regular', 'active'),

('ava_anderson', 'avapass456', 'ava@example.com', '+133344455',
    '2024-09-05 11:33:44', '2024-11-11 11:11:11',
    'https://example.com/ava.png', 'regular', 'inactive'),

('noah_taylor', 'noahpass789', 'noah@example.com', '+144455566',
    '2024-10-15 15:15:15', '2025-05-21 10:30:45',
    'https://example.com/noah.jpg', 'premium', 'active'),

('charlotte_thomas', 'cthomas123', 'charlotte@example.com', '+155566677',
    '2024-06-20 10:45:33', '2025-05-27 08:12:34',
    'https://example.c`om/charlotte.png', 'admin', 'active'),

('liam_walker', 'liampass456', 'liam@example.com', '+166677788',
    '2024-12-01 09:08:07', '2025-05-18 17:45:22',
    'https://example.com/liam.jpg', 'regular', 'active');

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
INSERT INTO UserProfiles (FirstName, LastName, Address, City, Province, PostalCode, Biography, UserID)
VALUES
('Sarah', 'Smith', '456 Oak Avenue', 'Los Angeles', 'CA', '90001', 'Digital marketer and photography enthusiast.', 1),
('Michael', 'Jones', '789 Pine Road', 'Chicago', 'IL', '60601', 'Software engineer who loves hiking on weekends.', 2),
('Emily', 'Wilson', '101 Maple Lane', 'Houston', 'TX', '77001', 'Premium member who enjoys exclusive content.', 3),
('David', 'Brown', '202 Elm Street', 'Phoenix', 'AZ', '85001', 'System administrator and community moderator.', 4),
('Lisa', 'Jackson', '303 Cedar Blvd', 'Philadelphia', 'PA', '19019', 'Book lover and amateur writer.', 5),
('Robert', 'Garcia', '404 Birch Court', 'San Antonio', 'TX', '78201', 'Premium user with a passion for cooking.', 6),
('Amanda', 'Lee', '505 Spruce Way', 'San Diego', 'CA', '92101', 'Inactive account - moved abroad.', 7),
('James', 'Miller', '606 Redwood Drive', 'Dallas', 'TX', '75201', 'Retired teacher enjoying his free time.', 8),
('Natalie', 'Clark', '707 Willow Circle', 'San Jose', 'CA', '95101', 'Premium member and travel blogger.', 9),
('Kevin', 'White', '808 Aspen Terrace', 'Austin', 'TX', '78701', 'Freelance graphic designer.', 10),
('Sophia', 'Harris', '909 Magnolia Avenue', 'Jacksonville', 'FL', '32201', 'Administrator and community leader.', 11),
('Ryan', 'Martin', '111 Palm Street', 'Fort Worth', 'TX', '76101', 'Account temporarily inactive.', 12),
('Olivia', 'Thompson', '222 Sequoia Road', 'Columbus', 'OH', '43201', 'Fitness instructor and nutrition coach.', 13),
('Daniel', 'Robinson', '333 Juniper Lane', 'Charlotte', 'NC', '28201', 'Premium member and photography professional.', 14),
('Mia', 'Martinez', '444 Sycamore Drive', 'San Francisco', 'CA', '94101', 'Student and part-time content creator.', 15),
('Ethan', 'Nguyen', '555 Red Cedar Way', 'Indianapolis', 'IN', '46201', 'Tech enthusiast and gadget collector.', 16),
('Ava', 'Anderson', '666 Silver Birch Blvd', 'Seattle', 'WA', '98101', 'Account no longer in use.', 17),
('Noah', 'Taylor', '777 Golden Oak Circle', 'Denver', 'CO', '80201', 'Premium member and outdoor adventure guide.', 18),
('Charlotte', 'Thomas', '888 Diamond Willow Lane', 'Washington', 'DC', '20001', 'Administrator and support specialist.', 19),
('Liam', 'Walker', '999 Platinum Maple Court', 'Boston', 'MA', '02101', 'Financial analyst and data visualization expert.', 20);
