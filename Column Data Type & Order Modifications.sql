--Column Data Type & Order Modifications



--(price column)
-- new column with DECIMAL type to store numeric values 
		ALTER TABLE HotelsData
		ADD price_decimal DECIMAL(10,2);

--Convert & Update the new column with valid numeric values
-- Using TRY_CAST to avoid errors -> 'NA'
		UPDATE HotelsData
		SET price_decimal = TRY_CAST(price AS DECIMAL(10,2))
		WHERE TRY_CAST(price AS DECIMAL(10,2)) IS NOT NULL ;

--Drop the column 
		ALTER TABLE HotelsData
		DROP COLUMN price;

--Rename the column
		EXEC sp_rename 'HotelsData.price_decimal', 'price', 'COLUMN';


--(Base_price column)
		ALTER TABLE HotelsData
		ADD base_decimal DECIMAL(10,2);


		UPDATE HotelsData
		SET base_decimal = TRY_CAST(base_price AS DECIMAL(10,2))
		WHERE TRY_CAST(base_price AS DECIMAL(10,2)) IS NOT NULL ;


		ALTER TABLE HotelsData
		DROP COLUMN base_price;


		EXEC sp_rename 'HotelsData.base_decimal', 'base_price', 'COLUMN';


--(hotel_name column)
		ALTER TABLE HotelsData
		ADD hotel_nv NVARCHAR(255);

		UPDATE HotelsData
		SET hotel_nv = TRY_CAST(hotel_name AS NVARCHAR(255))
		WHERE TRY_CAST(hotel_name AS NVARCHAR(255)) IS NOT NULL ;

		ALTER TABLE HotelsData
		DROP COLUMN hotel_name;

		EXEC sp_rename 'HotelsData.hotel_nv', 'hotel_name', 'COLUMN';
		

--(Count column)
		ALTER TABLE HotelsData
		ADD c_int INT;

		UPDATE HotelsData
		SET c_int = TRY_CAST(count AS INT)
		WHERE TRY_CAST(count AS INT) IS NOT NULL ;

		ALTER TABLE HotelsData
		DROP COLUMN count;

		EXEC sp_rename 'HotelsData.c_int', 'count', 'COLUMN';


--(Latitude column)
		ALTER TABLE HotelsData
		ADD la_f FLOAT;

		UPDATE HotelsData
		SET la_f = TRY_CAST(latitude AS FLOAT)
		WHERE TRY_CAST(latitude AS FLOAT) IS NOT NULL ;

		ALTER TABLE HotelsData
		DROP COLUMN latitude;

		EXEC sp_rename 'HotelsData.la_f', 'latitude', 'COLUMN';


--(Longitude column)
		ALTER TABLE HotelsData
		ADD lo_f FLOAT;

		UPDATE HotelsData
		SET lo_f = TRY_CAST(longitude AS FLOAT)
		WHERE TRY_CAST(longitude AS FLOAT) IS NOT NULL ;

		ALTER TABLE HotelsData
		DROP COLUMN longitude;

		EXEC sp_rename 'HotelsData.lo_f', 'longitude', 'COLUMN';

-- View 
SELECT *
FROM HotelsData;

-------

--Renaming the old table
EXEC sp_rename 'HotelsData', 'oldHotelsData';

--Creating the new HotelsData table with a modified column order
CREATE TABLE HotelsData (
	hotel_id INT PRIMARY KEY,
	hotel_name VARCHAR(255),
	rating FLOAT,
	price DECIMAL(10,2),
	base_price DECIMAL(10,2),
	checkIN DATE,
	checkOut DATE,
	count INT,
	info VARCHAR(255),
	source VARCHAR(255),
	latitude FLOAT,
	longitude FLOAT
);
--retrieve the PK name 
SELECT name 
FROM sys.key_constraints 
WHERE type = 'PK' AND parent_object_id = OBJECT_ID('HotelsData');
--Dropping the current PK
ALTER TABLE HotelsData DROP CONSTRAINT PK__HotelsDa__45FE7E2628BD62D6;

-- Transferring data after Modifications
INSERT INTO HotelsData (hotel_id, hotel_name, rating, price, base_price, checkIn, checkOut, count, info, source, latitude, longitude)
SELECT hotel_id, hotel_name, rating, price, base_price, checkIn, checkOut, count, info, source, latitude, longitude
FROM oldHotelsData;

-- Checking for duplicate hotel_id 
SELECT hotel_id, COUNT(*)
FROM oldHotelsData
GROUP BY hotel_id 
HAVING COUNT(*) >1;

--Duplicate hotel_id values to comparison if it has same data
SELECT *
FROM oldHotelsData
WHERE hotel_id IN (
	SELECT hotel_id
	FROM oldHotelsData
	GROUP BY hotel_id
	HAVING COUNT(*) > 1)
ORDER BY hotel_id;


-- To make sure before dropping the old table 
SELECT *
FROM HotelsData;

DROP TABLE oldHotelsData;



		







