-- Categories
INSERT INTO Categories (NameFa, NameEn, Slug, Description, ParentCategoryID)
VALUES
('املاک', 'Real Estate', 'real-estate', 'Properties and housing', NULL),
('وسایل نقلیه', 'Vehicles', 'vehicles', 'Cars, motorcycles, and transportation', NULL),
('کالای دیجیتال', 'Digital Goods', 'digital-goods', 'Electronics and digital products', NULL),
('خانه و آشپزخانه', 'Home & Kitchen', 'home-kitchen', 'Household items and kitchenware', NULL),
('خدمات', 'Services', 'services', 'Various professional services', NULL),
('وسایل شخصی', 'Personal Items', 'personal-items', 'Clothing, accessories, and personal goods', NULL),
('سرگرمی و فراغت', 'Entertainment & Leisure', 'entertainment-leisure', 'Hobbies, sports, and entertainment', NULL),
('اجتماعی', 'Social', 'social', 'Community and social services', NULL),
('تجهیزات و صنعتی', 'Industrial Equipment', 'industrial-equipment', 'Machinery and industrial tools', NULL),
('استخدام و کاریابی', 'Jobs & Recruitment', 'jobs-recruitment', 'Employment opportunities and hiring', NULL);

---------------------------------------------------------------------------------------------------------------------
-- Subcategories
-- Real Estate Subcategories
INSERT INTO Categories (NameFa, NameEn, Slug, Description, ParentCategoryID)
VALUES
('فروش مسکونی', 'Residential Sale', 'residential-sale', 'Apartments and houses for sale', 1),
('اجارهٔ مسکونی', 'Residential Rent', 'residential-rent', 'Apartments and houses for rent', 1),
('فروش اداری و تجاری', 'Commercial Sale', 'commercial-sale', 'Office and commercial spaces for sale', 1),
('اجارهٔ اداری و تجاری', 'Commercial Rent', 'commercial-rent', 'Office and commercial spaces for rent', 1),
('اجارهٔ کوتاه‌مدت', 'Short-term Rent', 'short-term-rent', 'Daily/weekly rentals', 1),
('پروژه‌های ساخت‌وساز', 'Construction Projects', 'construction-projects', 'New developments and construction', 1);

-- Vehicles Subcategories
INSERT INTO Categories (NameFa, NameEn, Slug, Description, ParentCategoryID)
VALUES
('خودرو', 'Cars', 'cars', 'Passenger vehicles', 2),
('موتورسیکلت', 'Motorcycles', 'motorcycles', 'Motorcycles and scooters', 2),
('قطعات یدکی و لوازم جانبی', 'Parts & Accessories', 'parts-accessories', 'Vehicle parts and accessories', 2),
('قایق و سایر وسایل نقلیه', 'Boats & Other Vehicles', 'boats-other', 'Marine and special vehicles', 2);

-- Digital Goods Subcategories
INSERT INTO Categories (NameFa, NameEn, Slug, Description, ParentCategoryID)
VALUES
('موبایل و تبلت', 'Mobile & Tablets', 'mobile-tablets', 'Smartphones and tablets', 3),
('رایانه', 'Computers', 'computers', 'PCs, laptops, and accessories', 3),
('کنسول، بازی‌ ویدئویی و آنلاین', 'Gaming', 'gaming', 'Consoles and video games', 3),
('صوتی و تصویری', 'Audio & Video', 'audio-video', 'TVs, speakers, and media', 3),
('تلفن رومیزی', 'Landline Phones', 'landline-phones', 'Home and office phones', 3);

-- Home & Kitchen Subcategories (continued in next Messages due to length)
INSERT INTO Categories (NameFa, NameEn, Slug, Description, ParentCategoryID)
VALUES
('لوازم خانگی برقی', 'Home Appliances', 'home-appliances', 'Electrical home appliances', 4),
('ظروف و لوازم آشپزخانه', 'Kitchenware', 'kitchenware', 'Cookware and utensils', 4),
('خوردنی و آشامیدنی', 'Food & Beverage', 'food-beverage', 'Groceries and consumables', 4),
('خیاطی و بافتنی', 'Sewing & Knitting', 'sewing-knitting', 'Fabric and needlework supplies', 4),
('مبلمان و صنایع چوب', 'Furniture', 'furniture', 'Home furniture and wood products', 4),
('نور و روشنایی', 'Lighting', 'lighting', 'Lamps and light fixtures', 4),
('فرش، گلیم، موکت', 'Flooring', 'flooring', 'Rugs and carpets', 4),
('تشک، روتختی، رختخواب', 'Bedding', 'bedding', 'Mattresses and bed linens', 4),
('لوازم دکوری و تزئینی', 'Decor', 'decor', 'Home decoration items', 4),
('تهویه، سرمایش، گرمایش', 'HVAC', 'hvac', 'Cooling and heating equipment', 4),
('شست‌وشو و نظافت', 'Cleaning', 'cleaning', 'Cleaning supplies', 4),
('حمام و سرویس بهداشتی', 'Bathroom', 'bathroom', 'Bathroom fixtures and accessories', 4);

-- Services Subcategories
INSERT INTO Categories (NameFa, NameEn, Slug, Description, ParentCategoryID)
VALUES
('موتور و ماشین', 'Vehicle Services', 'vehicle-services', 'Auto repair and maintenance', 5),
('پذیرایی، مراسم', 'Catering & Events', 'catering-events', 'Party and event services', 5),
('رایانه‌ای و موبایل', 'Tech Services', 'tech-services', 'Computer and phone repair', 5),
('مالی، حسابداری، بیمه', 'Financial Services', 'financial-services', 'Accounting and insurance', 5),
('حمل و نقل', 'Transportation', 'transportation', 'Moving and delivery', 5),
('پیشه و مهارت', 'Trades', 'trades', 'Skilled labor services', 5),
('آرایشگری و زیبایی', 'Beauty', 'beauty', 'Hair and beauty services', 5),
('نظافت', 'Cleaning Services', 'cleaning-services', 'Home and office cleaning', 5),
('باغبانی و درختکاری', 'Gardening', 'gardening', 'Landscaping services', 5),
('آموزشی', 'Educational', 'educational', 'Tutoring and lessons', 5);

-- Personal Items Subcategories
INSERT INTO Categories (NameFa, NameEn, Slug, Description, ParentCategoryID)
VALUES
('کیف، کفش، لباس', 'Fashion', 'fashion', 'Clothing and accessories', 6),
('زیورآلات و اکسسوری', 'Jewelry', 'jewelry', 'Watches and jewelry', 6),
('آرایشی، بهداشتی، درمانی', 'Beauty Products', 'beauty-products', 'Cosmetics and toiletries', 6),
('کفش و لباس بچه', 'Kids" Clothing', 'kids-clothing', 'Children"s wear', 6),
('وسایل بچه و اسباب‌بازی', 'Kids'' Items', 'kids-items', 'Toys and baby gear', 6),
('لوازم التحریر', 'Stationery', 'stationery', 'Office and school supplies', 6);

-- Entertainment & Leisure Subcategories
INSERT INTO Categories (NameFa, NameEn, Slug, Description, ParentCategoryID)
VALUES
('بلیت', 'Tickets', 'tickets', 'Event tickets', 7),
('تور و چارتر', 'Tours', 'tours', 'Travel packages', 7),
('کتاب و مجله', 'Books & Magazines', 'books-magazines', 'Reading materials', 7),
('دوچرخه، اسکیت، اسکوتر', 'Sports Equipment', 'sports-equipment', 'Bikes and skateboards', 7),
('حیوانات', 'Pets', 'pets', 'Animals and pet supplies', 7),
('کلکسیون و سرگرمی', 'Hobbies', 'hobbies', 'Collectibles and games', 7),
('آلات موسیقی', 'Musical Instruments', 'musical-instruments', 'Instruments and gear', 7),
('ورزش و تناسب اندام', 'Fitness', 'fitness', 'Exercise equipment', 7),
('اسباب‌‌بازی', 'Toys', 'toys', 'Games and playthings', 7);

-- Social Subcategories
INSERT INTO Categories (NameFa, NameEn, Slug, Description, ParentCategoryID)
VALUES
('رویداد', 'Events', 'events', 'Community gatherings', 8),
('داوطلبانه', 'Volunteer', 'volunteer', 'Volunteer opportunities', 8),
('گم‌شده‌ها', 'Lost & Found', 'lost-found', 'Missing items', 8);

-- Industrial Equipment Subcategories
INSERT INTO Categories (NameFa, NameEn, Slug, Description, ParentCategoryID)
VALUES
('مصالح و تجهیزات ساختمان', 'Construction Materials', 'construction-materials', 'Building supplies', 9),
('ابزارآلات', 'Tools', 'tools', 'Hand and power tools', 9),
('ماشین‌آلات صنعتی', 'Industrial Machinery', 'industrial-machinery', 'Factory equipment', 9),
('تجهیزات کسب‌وکار', 'Business Equipment', 'business-equipment', 'Office and retail fixtures', 9),
('عمده‌فروشی', 'Wholesale', 'wholesale', 'Bulk goods', 9);

-- Jobs & Recruitment Subcategories
INSERT INTO Categories (NameFa, NameEn, Slug, Description, ParentCategoryID)
VALUES
('اداری و مدیریت', 'Administrative', 'administrative', 'Office jobs', 10),
('سرایداری و نظافت', 'Maintenance', 'maintenance', 'Custodial work', 10),
('معماری، عمران و ساختمانی', 'Construction Jobs', 'construction-jobs', 'Building trades', 10),
('خدمات فروشگاه و رستوران', 'Retail & Food', 'retail-food', 'Store and restaurant jobs', 10),
('رایانه و فناوری اطلاعات', 'IT Jobs', 'it-jobs', 'Tech positions', 10),
('مالی، حسابداری، حقوقی', 'Finance & Legal', 'finance-legal', 'Accounting and law', 10),
('بازاریابی و فروش', 'Marketing', 'marketing', 'Sales jobs', 10),
('صنعتی، فنی، مهندسی', 'Engineering', 'engineering', 'Technical jobs', 10),
('آموزشی', 'Education', 'education', 'Teaching positions', 10),
('حمل و نقل', 'Transportation Jobs', 'transportation-jobs', 'Driving jobs', 10),
('درمانی، زیبایی، بهداشتی', 'Healthcare', 'healthcare', 'Medical jobs', 10),
('هنری و رسانه', 'Creative', 'creative', 'Media and arts jobs', 10);
