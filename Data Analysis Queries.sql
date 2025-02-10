--Data Analysis Queries

USE Riyadh_Hotels;

--Data Overview
SELECT *
FROM HotelsData;



--Data Cleaning
SELECT *
FROM HotelsData
WHERE 
	hotel_id IS NULL
	OR 
	hotel_name IS NULL
	OR
	SOURCE IS NULL
	OR
	price IS NULL
	OR
	base_price IS NULL
	OR
	checkIn IS NULL
	OR
	checkOut IS NULL
	OR
	count IS NULL
	OR
	rating IS NULL
	OR
	info IS NULL
	OR
	latitude IS NULL
	OR
	longitude IS NULL;
	
--Replaces NULL values with default values to ensure data consistency and avoid issues in Analysis
UPDATE HotelsData
SET
	hotel_name = ISNULL(hotel_name, 'NA'),
	SOURCE = ISNULL(source, 'NA'),
	price = ISNULL(price, 0), --replacing NUUL with 0
	base_price = ISNULL (base_price, 0),
	checkIn = ISNULL(checkin, '1900-01-01'),-- Using 1900-01-01 to indicate missing data values for clarity analysis
	checkOut = ISNULL(checkout, '1900-01-02'),
	count = ISNULL(count, -1), -- Uses -1 to indicate missing data for better clarity in analysis
	rating = ISNULL(rating, -1), 
	info = ISNULL(info, 'NA'),
	latitude = ISNULL(latitude, 0.0),
	longitude = ISNULL(longitude, 0.0);

--Checking
SELECT *
FROM HotelsData
WHERE 
	hotel_id IS NULL
	OR 
	hotel_name IS NULL
	OR
	SOURCE IS NULL
	OR
	price IS NULL
	OR
	base_price IS NULL
	OR
	checkIn IS NULL
	OR
	checkOut IS NULL
	OR
	count IS NULL
	OR
	rating IS NULL
	OR
	info IS NULL
	OR
	latitude IS NULL
	OR
	longitude IS NULL;


	

--Data Analysis 

--How many hotels we have?
SELECT 
	COUNT(DISTINCT hotel_name) AS 'Number of Hotels'
FROM HotelsData;

-- All hotels that have a rating of 5 
SELECT *
FROM HotelsData
WHERE rating = 5;


--The TOP 5 hotels with a rating of 5, based on highest price
SELECT TOP 5 hotel_name, rating, price
FROM HotelsData
WHERE rating = 5
ORDER BY price DESC;



--Which hotels have the highest number of booking?
SELECT hotel_name,
	COUNT(*) AS 'Total bookings'
FROM HotelsData
GROUP BY hotel_name
ORDER BY 'Total Bookings' DESC;


--What is the Average price per hotel?
SELECT hotel_name, 
	AVG(price) AS 'AVG Price'
FROM HotelsData
GROUP BY hotel_name
ORDER BY 'AVG Price';


-- Name of all Sources and their count
SELECT source,
	COUNT(*) AS Count
FROM HotelsData
GROUP BY source;


--How do prices vary based on booking platforms?
SELECT source,
	COUNT (price) AS Total_Bookings,
	MIN   (price) AS Min_Price,
	MAX   (price) AS Max_Price,
	AVG   (price) AS Avg_Price, 
	STDEV (price) AS Price_Stdev -- Standard Deviation 
FROM HotelsData
WHERE source 
	IN ('Fairmont','Prestigia.com','MakeMyTrip',
		'Hotels.com', 'Hyatt.com', 'Agoda.com',
		'StRegis.com', 'Trip.com', 'Expedia',
		'Sheraton.com', 'Booking.com', 'JW Marriott',
		'all.accor.com', 'Marriott', 'Marriott Hotels',
		'Vio.com', 'LeMeridien.com', 'Official Site')
GROUP BY source
ORDER BY Avg_Price;


--The relationship between hotel rating and price

SELECT rating, 
	CONVERT(DECIMAL(10,2), ROUND(AVG(price), 2)) AS AVGPrice --Rounding the AVG price 
FROM HotelsData
GROUP BY rating
ORDER BY rating DESC;


--The peak seasons for hotel bookings
SELECT MONTH(checkIn) AS Month, 
	  COUNT(*) AS Total_Bookings
FROM HotelsData
GROUP BY MONTH(checkIn) 
ORDER BY Total_Bookings DESC;





















   



