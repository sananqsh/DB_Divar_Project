-- Advertisements
---------------------------------------------------------------------------------------------------------------------
-- Real Estate Ads
INSERT INTO Advertisement (Title, Description, Price, PublishDate, ExpiryDate, Status, ViewCount, CategoryID, UserID)
VALUES
('Luxury Apartment in Tehran', '3 bedroom apartment with great view', 350000, NOW() - INTERVAL '5 days', NOW() + INTERVAL '25 days', 'active', 42, 11, 3),
('Office Space for Rent', 'Prime location in downtown', 1200, NOW() - INTERVAL '2 days', NOW() + INTERVAL '28 days', 'active', 18, 14, 7),
('Villa in North Tehran', '500sqm with private garden', 850000, NOW(), NOW() + INTERVAL '30 days', 'active', 7, 11, 2);

-- Vehicle Ads
INSERT INTO Advertisement (Title, Description, Price, PublishDate, ExpiryDate, Status, ViewCount, CategoryID, UserID)
VALUES
('2020 Peugeot 208', 'Low mileage, excellent condition', 18500, NOW() - INTERVAL '10 days', NOW() + INTERVAL '20 days', 'active', 89, 17, 5),
('Harley Davidson Sportster', '2018 model, custom parts', 12500, NOW() - INTERVAL '3 days', NOW() + INTERVAL '27 days', 'active', 34, 18, 8),
('Car Audio System', 'Brand new Pioneer speakers', 350, NOW(), NOW() + INTERVAL '30 days', 'active', 12, 19, 1);

-- Digital Goods Ads
INSERT INTO Advertisement (Title, Description, Price, PublishDate, ExpiryDate, Status, ViewCount, CategoryID, UserID)
VALUES
('Samsung Galaxy S22', '128GB, unlocked', 899, NOW() - INTERVAL '7 days', NOW() + INTERVAL '23 days', 'active', 76, 21, 4),
('Gaming PC Setup', 'RTX 3080, 32GB RAM', 2200, NOW() - INTERVAL '1 day', NOW() + INTERVAL '29 days', 'active', 45, 22, 6),
('PS5 Console', 'With 2 controllers', 650, NOW(), NOW() + INTERVAL '30 days', 'active', 102, 23, 9);

-- Home & Kitchen Ads
INSERT INTO Advertisement (Title, Description, Price, PublishDate, ExpiryDate, Status, ViewCount, CategoryID, UserID)
VALUES
('Persian Carpet', 'Handmade 4x6 meters', 2500, NOW() - INTERVAL '15 days', NOW() + INTERVAL '15 days', 'active', 28, 32, 10),
('Modern Sofa Set', 'Leather, excellent condition', 1200, NOW() - INTERVAL '4 days', NOW() + INTERVAL '26 days', 'active', 31, 30, 2),
('Kitchen Appliances Package', 'Fridge, oven, microwave', 850, NOW(), NOW() + INTERVAL '30 days', 'active', 19, 26, 5);

-- Services Ads
INSERT INTO Advertisement (Title, Description, Price, PublishDate, ExpiryDate, Status, ViewCount, CategoryID, UserID)
VALUES
('Professional Cleaning Service', 'Residential & commercial', 50, NOW() - INTERVAL '8 days', NOW() + INTERVAL '22 days', 'active', 23, 45, 7),
('English Tutoring', 'IELTS preparation', 20, NOW() - INTERVAL '1 day', NOW() + INTERVAL '29 days', 'active', 14, 47, 3),
('Car Maintenance', 'Oil change and inspection', 30, NOW(), NOW() + INTERVAL '30 days', 'active', 37, 38, 8);

-- Personal Items Ads
INSERT INTO Advertisement (Title, Description, Price, PublishDate, ExpiryDate, Status, ViewCount, CategoryID, UserID)
VALUES
('Designer Handbag', 'Louis Vuitton authentic', 950, NOW() - INTERVAL '12 days', NOW() + INTERVAL '18 days', 'active', 52, 48, 4),
('Gold Necklace', '18k with certificate', 1200, NOW() - INTERVAL '3 days', NOW() + INTERVAL '27 days', 'active', 41, 49, 1),
('Baby Clothes Set', 'Newborn, unused', 35, NOW(), NOW() + INTERVAL '30 days', 'active', 8, 51, 6);

-- Entertainment & Leisure Ads
INSERT INTO Advertisement (Title, Description, Price, PublishDate, ExpiryDate, Status, ViewCount, CategoryID, UserID)
VALUES
('Concert Tickets', '2 tickets for Coldplay', 180, NOW() - INTERVAL '5 days', NOW() + INTERVAL '25 days', 'active', 67, 54, 9),
('Mountain Bike', 'Trek 2021 model', 450, NOW() - INTERVAL '2 days', NOW() + INTERVAL '28 days', 'active', 29, 57, 2),
('Persian Cat', '6 months old, vaccinated', 200, NOW(), NOW() + INTERVAL '30 days', 'active', 53, 58, 5);

-- Industrial Equipment Ads
INSERT INTO Advertisement (Title, Description, Price, PublishDate, ExpiryDate, Status, ViewCount, CategoryID, UserID)
VALUES
('Construction Tools', 'Complete set of tools', 800, NOW() - INTERVAL '9 days', NOW() + INTERVAL '21 days', 'active', 17, 67, 10),
('Industrial Generator', '50KVA, diesel', 12000, NOW() - INTERVAL '1 day', NOW() + INTERVAL '29 days', 'active', 9, 68, 3),
('Office Furniture', 'Desks and chairs', 500, NOW(), NOW() + INTERVAL '30 days', 'active', 24, 69, 7);

-- Jobs Ads
INSERT INTO Advertisement (Title, Description, Price, PublishDate, ExpiryDate, Status, ViewCount, CategoryID, UserID)
VALUES
('IT Specialist Needed', 'Full-time position', NULL, NOW() - INTERVAL '14 days', NOW() + INTERVAL '16 days', 'active', 38, 75, 1),
('Restaurant Staff', 'Waiters and cooks', NULL, NOW() - INTERVAL '4 days', NOW() + INTERVAL '26 days', 'active', 22, 74, 4),
('Delivery Driver', 'Own vehicle required', NULL, NOW(), NOW() + INTERVAL '30 days', 'active', 45, 42, 6);


---------------------------------------------------------------------------------------------------------------------
INSERT INTO Advertisement (Title, Description, Price, PublishDate, ExpiryDate, Status, ViewCount, CategoryID, UserID)
VALUES
('Cozy Studio for Rent', 'Fully furnished studio ideal for students', 5000, NOW() - INTERVAL '3 days', NOW() + INTERVAL '27 days', 'active', 18, 12, 2),
('Modern Office Space in Downtown', '120 sqm office with parking and amenities', 950000, NOW() - INTERVAL '8 days', NOW() + INTERVAL '22 days', 'active', 64, 13, 4),
('Short-Term Villa in Gilan', '3-bedroom villa with garden and pool', 800, NOW() - INTERVAL '2 days', NOW() + INTERVAL '13 days', 'active', 12, 15, 5),
('2020 Kia Sportage', 'Well-maintained SUV with 60k mileage', 980000, NOW() - INTERVAL '10 days', NOW() + INTERVAL '20 days', 'active', 102, 17, 7),
('Gaming PC Bundle', 'High-end gaming PC with RTX 3080 and monitor', 45000, NOW() - INTERVAL '4 days', NOW() + INTERVAL '26 days', 'active', 37, 22, 6),
('iPhone 13 Pro Max', 'Like new with box and accessories', 33000, NOW() - INTERVAL '6 days', NOW() + INTERVAL '24 days', 'active', 51, 21, 8),
('Home Theater System', '5.1 surround with Bluetooth and HDMI', 9000, NOW() - INTERVAL '7 days', NOW() + INTERVAL '23 days', 'active', 29, 24, 6),
('Stainless Steel Cookware Set', '12-piece premium kitchen set', 2200, NOW() - INTERVAL '2 days', NOW() + INTERVAL '28 days', 'active', 16, 27, 9),
('Queen Size Mattress', 'Memory foam mattress with 10-year warranty', 7800, NOW() - INTERVAL '9 days', NOW() + INTERVAL '21 days', 'active', 33, 33, 5),
('Vehicle Oil Change Service', 'Mobile oil change and filter replacement', 250, NOW() - INTERVAL '1 days', NOW() + INTERVAL '14 days', 'active', 7, 38, 4),
('Experienced Wedding Photographer', 'Full-day photography with editing', 1200, NOW() - INTERVAL '5 days', NOW() + INTERVAL '25 days', 'active', 34, 39, 2),
('Freelance Web Developer', 'Portfolio websites and ecommerce stores', 2000, NOW() - INTERVAL '6 days', NOW() + INTERVAL '24 days', 'active', 21, 40, 10),
('Home Cleaning Package', '4-hour deep cleaning with 2 staff', 450, NOW() - INTERVAL '3 days', NOW() + INTERVAL '27 days', 'active', 11, 45, 11),
('English Language Tutor', 'Native-level tutor available for IELTS prep', 150, NOW() - INTERVAL '2 days', NOW() + INTERVAL '18 days', 'active', 8, 47, 12),
('Men’s Winter Jacket', 'Waterproof insulated jacket - size L', 390, NOW() - INTERVAL '4 days', NOW() + INTERVAL '26 days', 'active', 23, 48, 13),
('Silver Necklace Set', '925 silver necklace with earrings', 1200, NOW() - INTERVAL '5 days', NOW() + INTERVAL '25 days', 'active', 14, 49, 13),
('BMX Bike', 'Used BMX in excellent condition', 1400, NOW() - INTERVAL '7 days', NOW() + INTERVAL '23 days', 'active', 66, 57, 14),
('Persian Cat for Sale', '2-year-old vaccinated and friendly cat', 3000, NOW() - INTERVAL '1 days', NOW() + INTERVAL '29 days', 'active', 9, 58, 15),
('Construction Cement Bags', 'Portland cement - 50kg bags', 750, NOW() - INTERVAL '8 days', NOW() + INTERVAL '22 days', 'active', 55, 66, 16);

---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------

-- 5. AdImage
INSERT INTO AdImage (ImageURL, UploadDate, IsMainImage, AdID)
VALUES
('https://example.com/Cozy_Studio_for.jpg', NOW() - INTERVAL '3 days', TRUE, 1),
('https://example.com/Cozy_Studio_for2.jpg', NOW() - INTERVAL '3 days', FALSE, 28),
('https://example.com/Cozy_Studio_for3.jpg', NOW() - INTERVAL '3 days', FALSE, 28),
('https://example.com/Modern_Office_Space.jpg', NOW() - INTERVAL '8 days', TRUE, 29),
('https://example.com/Modern_Office_Space2.jpg', NOW() - INTERVAL '8 days', FALSE, 29),
('https://example.com/Short-Term_Villa_in_Gilan.jpg', NOW() - INTERVAL '2 days', TRUE, 30),
('https://example.com/2020_Kia_Sportage.jpg', NOW() - INTERVAL '10 days', TRUE, 31),
('https://example.com/Gaming_PC_Bundle.jpg', NOW() - INTERVAL '4 days', TRUE, 32),
('https://example.com/iPhone_13_Pro.jpg', NOW() - INTERVAL '6 days', TRUE, 33),
('https://example.com/Home_Theater_System.jpg', NOW() - INTERVAL '7 days', TRUE, 34),
('https://example.com/Stainless_Steel_Cookware.jpg', NOW() - INTERVAL '2 days', TRUE, 35),
('https://example.com/Queen_Size_Mattress.jpg', NOW() - INTERVAL '9 days', TRUE, 36),
('https://example.com/Vehicle_Oil_Change.jpg', NOW() - INTERVAL '1 days', TRUE, 37),
('https://example.com/Experienced_Wedding_Photographer.jpg', NOW() - INTERVAL '5 days', TRUE, 38),
('https://example.com/Freelance_Web_Developer.jpg', NOW() - INTERVAL '6 days', TRUE, 39),
('https://example.com/Home_Cleaning_Package.jpg', NOW() - INTERVAL '3 days', TRUE, 40),
('https://example.com/English_Language_Tutor.jpg', NOW() - INTERVAL '2 days', TRUE, 41),
('https://example.com/Men_s_Winter_Jacket.jpg', NOW() - INTERVAL '4 days', TRUE, 42),
('https://example.com/Silver_Necklace_Set.jpg', NOW() - INTERVAL '5 days', TRUE, 43),
('https://example.com/BMX_Bike.jpg', NOW() - INTERVAL '7 days', TRUE, 44),
('https://example.com/Persian_Cat_for_Sale.jpg', NOW() - INTERVAL '1 days', TRUE, 45),
('https://example.com/Construction_Cement_Bags.jpg', NOW() - INTERVAL '8 days', TRUE, 46);

INSERT INTO Advertisement (Title, Description, Price, PublishDate, ExpiryDate, Status, ViewCount, CategoryID, UserID)
VALUES
('Cozy Studio for Rent', 'Fully furnished studio ideal for students', 5000, NOW() - INTERVAL '3 days', NOW() + INTERVAL '27 days', 'active', 18, 12, 2),
('Modern Office Space in Downtown', '120 sqm office with parking and amenities', 950000, NOW() - INTERVAL '8 days', NOW() + INTERVAL '22 days', 'active', 64, 13, 4),
('Short-Term Villa in Gilan', '3-bedroom villa with garden and pool', 800, NOW() - INTERVAL '2 days', NOW() + INTERVAL '13 days', 'active', 12, 15, 5),
('2020 Kia Sportage', 'Well-maintained SUV with 60k mileage', 980000, NOW() - INTERVAL '10 days', NOW() + INTERVAL '20 days', 'active', 102, 17, 7),
('Gaming PC Bundle', 'High-end gaming PC with RTX 3080 and monitor', 45000, NOW() - INTERVAL '4 days', NOW() + INTERVAL '26 days', 'active', 37, 22, 6),
('iPhone 13 Pro Max', 'Like new with box and accessories', 33000, NOW() - INTERVAL '6 days', NOW() + INTERVAL '24 days', 'active', 51, 21, 8),
('Home Theater System', '5.1 surround with Bluetooth and HDMI', 9000, NOW() - INTERVAL '7 days', NOW() + INTERVAL '23 days', 'active', 29, 24, 6),
('Stainless Steel Cookware Set', '12-piece premium kitchen set', 2200, NOW() - INTERVAL '2 days', NOW() + INTERVAL '28 days', 'active', 16, 27, 9),
('Queen Size Mattress', 'Memory foam mattress with 10-year warranty', 7800, NOW() - INTERVAL '9 days', NOW() + INTERVAL '21 days', 'active', 33, 33, 5),
('Vehicle Oil Change Service', 'Mobile oil change and filter replacement', 250, NOW() - INTERVAL '1 days', NOW() + INTERVAL '14 days', 'active', 7, 38, 4),
('Experienced Wedding Photographer', 'Full-day photography with editing', 1200, NOW() - INTERVAL '5 days', NOW() + INTERVAL '25 days', 'active', 34, 39, 2),
('Freelance Web Developer', 'Portfolio websites and ecommerce stores', 2000, NOW() - INTERVAL '6 days', NOW() + INTERVAL '24 days', 'active', 21, 40, 10),
('Home Cleaning Package', '4-hour deep cleaning with 2 staff', 450, NOW() - INTERVAL '3 days', NOW() + INTERVAL '27 days', 'active', 11, 45, 11),
('English Language Tutor', 'Native-level tutor available for IELTS prep', 150, NOW() - INTERVAL '2 days', NOW() + INTERVAL '18 days', 'active', 8, 47, 12),
('Men’s Winter Jacket', 'Waterproof insulated jacket - size L', 390, NOW() - INTERVAL '4 days', NOW() + INTERVAL '26 days', 'active', 23, 48, 13),
('Silver Necklace Set', '925 silver necklace with earrings', 1200, NOW() - INTERVAL '5 days', NOW() + INTERVAL '25 days', 'active', 14, 49, 13),
('BMX Bike', 'Used BMX in excellent condition', 1400, NOW() - INTERVAL '7 days', NOW() + INTERVAL '23 days', 'active', 66, 57, 14),
('Persian Cat for Sale', '2-year-old vaccinated and friendly cat', 3000, NOW() - INTERVAL '1 days', NOW() + INTERVAL '29 days', 'active', 9, 58, 15),
('Construction Cement Bags', 'Portland cement - 50kg bags', 750, NOW() - INTERVAL '8 days', NOW() + INTERVAL '22 days', 'active', 55, 66, 16);
