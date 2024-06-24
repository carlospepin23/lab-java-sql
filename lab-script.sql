-- Author: Carlos Pepin Delgado <carlos.pepin1@upr.edu>

DROP SCHEMA IF EXISTS lab;
CREATE SCHEMA lab;
USE lab;

CREATE TABLE blog (
	author VARCHAR(255),
	title VARCHAR(255),
	word_count INT,
	views INT
);

CREATE TABLE airline (
	Customer_Name VARCHAR(255),
	Customer_Status VARCHAR(255),
	Flight_Number VARCHAR(255),
	Aircraft VARCHAR(255),
	Total_Aircraft_Seats INT,
	Flight_Mileage INT,
	Total_Customer_Mileage INT
);

CREATE TABLE customers (
    Name VARCHAR(255),
    Status VARCHAR(255),
    Number_of_flight VARCHAR(255)
);

INSERT INTO blog (author,title,word_count,views) VALUES
('Maria Charlotte','Best Paint Colors',814,14),
('Juan Perez','Small Space Decorating Tips',1146,221),
('Maria Charlotte','Hot Accessories',986,105),
('Maria Charlotte','Mixing Textures',765,22),
('Juan Perez','Kitchen Refresh',1242,307),
('Maria Charlotte','Homemade Art Hacks',1002,193),
('Gemma Alcocer','Refinishing Wood Floors',1571,7542);

INSERT INTO airline (Customer_Name, Customer_Status, Flight_Number, Aircraft, Total_Aircraft_Seats, Flight_Mileage, Total_Customer_Mileage) VALUES
('Agustine Riviera','Silver','DL143','Boeing 747',400,135,115235),
('Agustine Riviera','Silver','DL122','Airbus A330',236,4370,115235),
('Alaina Sepulvida','None','DL122','Airbus A330',236,4370,6008),
('Tom Jones','Gold','DL122','Airbus A330',236,4370,205767),
('Tom Jones','Gold','DL53','Boeing 777',264,2078,205767),
('Sam Rio','None','DL143','Boeing 747',400,135,2653),
('Tom Jones','Gold','DL222','Boeing 777',264,1765,205767),
('Jessica James','Silver','DL143','Boeing 747',400,135,127656),
('Sam Rio','None','DL143','Boeing 747',400,135,2653),
('Ana Janco','Silver','DL222','Boeing 777',264,1765,136773),
('Jennifer Cortez','Gold','DL222','Boeing 777',264,1765,300582),
('Jessica James','Silver','DL122','Airbus A330',236,4370,127656),
('Sam Rio','None','DL37','Boeing 747',400,531,2653),
('Christian Janco','Silver','DL222','Boeing 777',264,1765,14642);

INSERT INTO customers (Name,Status,Number_of_flight) VALUES
('Agustine Riviera','Silver','DL143'),
('Agustine Riviera','Silver','DL122'),
('Alaina Sepulvida','None','DL122'),
('Tom Jones','Gold','DL122'),
('Tom Jones','Gold','DL53'),
('Sam Rio','None','DL143'),
('Tom Jones','Gold','DL222'),
('Jessica James','Silver','DL143'),
('Sam Rio','None','DL143'),
('Ana Janco','Silver','DL222'),
('Jennifer Cortez','Gold','DL222'),
('Jessica James','Silver','DL122'),
('Sam Rio','None','DL37'),
('Christian Janco','Silver','DL222');

-- Task 1
SELECT COUNT(Flight_Number) AS total_flight_numbers FROM airline;

-- Task 2
SELECT AVG(Flight_Mileage) AS average_flight_distance FROM airline;

-- Task 3
SELECT AVG(Total_Aircraft_Seats) AS average_number_of_seats FROM airline;

-- Task 4
SELECT Customer_Status, AVG(Total_Customer_Mileage) AS average_miles_flown
FROM airline
GROUP BY Customer_Status;

-- Task 5
SELECT Customer_Status, MAX(Total_Customer_Mileage) AS max_number_of_miles_flown_by_status
FROM airline
GROUP BY Customer_Status;

-- Task 6
SELECT COUNT(*) AS total_boeing_aircraft
FROM airline
WHERE Aircraft LIKE '%Boeing%';

-- Task 7
select distinct Flight_Number as flights_between_300_and_2000_miles
from airline
where Flight_Mileage between 300 and 2000;

-- Task 8
SELECT c.Status, AVG(a.Flight_Mileage) AS average_flight_distance_booked_by_status
FROM customers c
JOIN airline a ON c.Number_of_flight = a.Flight_Number
GROUP BY c.Status;

-- Task 9
SELECT c.Status, a.Aircraft, COUNT(*) AS most_often_booked_aircraft_by_gold_status
FROM customers c
JOIN airline a ON c.Number_of_flight = a.Flight_Number
WHERE c.Status = 'Gold'
GROUP BY c.Status, a.Aircraft
ORDER BY bookings_count DESC
LIMIT 1;

