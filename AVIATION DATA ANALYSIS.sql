CREATE DATABASE AVIATION;
USE AVIATION;
CREATE TABLE Airlines(
Airline_id INT PRIMARY kEY,
Airline_name VARCHAR(100),
Origin_country VARCHAR(100)
);
INSERT INTO Airlines VALUES
(1, 'Indigo', 'India'),
(2, 'Air_India', 'India'),
(3, 'Emirates' , 'UAE'),
(4, 'Qatar_Airways', 'Qatar'),
(5, 'Singapore_Airlines', 'Singapore');

SELECT * FROM Airlines;

CREATE TABLE Airports(
Airport_Id INT PRIMARY KEY,
Airport_Code VARCHAR(100),
Airport_Name VARCHAR(300),
City VARCHAR(200),
Country VARCHAR (200)
);

INSERT INTO Airports VALUES
(1, 'CCU' , 'Netaji Subhash Chandra Bose International Airport', 'Kolkata', 'India'),
(2, 'DEL', 'Indira Gandhi International Airport' , 'Delhi', 'India'),
(3, 'BOM', 'Chhatrapati Shivaji International Airport', 'Mumbai', 'India'),
(4, 'DXB', 'Dubai International Airport', 'Dubai', 'UAE'),
(5, 'DOH', 'Hamad International Airport', 'Doha', 'Qatar'),
(6, 'SIN', 'Singapore Changi Airport', 'Singapore', 'Singapore'),
(7, 'BLR' , 'Kempegowda International Airport', 'Bangalore', 'India');

SELECT * FROM Airports;

CREATE TABLE Flights(
Flight_id INT PRIMARY KEY,
Airline_id INT,
Flight_no VARCHAR(300),
Origin_airport VARCHAR(300),
Destination_airport VARCHAR(300),
Departure_Date DATE,
Departure_Time TIME);
INSERT INTO flights VALUES
(101, 1, '6E-101', 1, 2, '2026-09-15', '08:00:00'),
(102, 1, '6E-205', 2, 3, '2026-09-15', '10:30:00'),
(103, 2, 'AI-401', 1, 2, '2026-09-15', '09:00:00'),
(104, 2, 'AI-505', 2, 4, '2026-09-16', '14:00:00'),
(105, 3, 'EK-573', 1, 4, '2026-09-16', '20:30:00'),
(106, 3, 'EK-502', 4, 2, '2026-09-17', '10:00:00'),
(107, 4, 'QR-541', 1, 5, '2026-09-17', '03:00:00'),
(108, 4, 'QR-578', 5, 2, '2026-09-18', '19:00:00'),
(109, 5, 'SQ-517', 1, 6, '2026-09-18', '23:30:00'),
(110, 5, 'SQ-406', 6, 2, '2026-09-19', '18:00:00'),
(111, 1, '6E-302', 1, 7, '2026-09-19', '07:30:00'),
(112, 2, 'AI-602', 1, 7, '2026-09-20', '11:00:00');

SELECT * FROM flights;

CREATE TABLE Bookings(
Booking_id INT PRIMARY KEY,
Flight_id INT,
Passenger_Name VARCHAR(500),
Travel_class VARCHAR(300),
Ticket_price DECIMAL(10,2),
Booking_date date
);

INSERT INTO bookings (booking_id, flight_id, passenger_name, travel_class, ticket_price, booking_date)
VALUES
(1, 101, 'Rahul Sharma', 'Economy', 6500, '2026-09-01'),
(2, 101, 'Ananya Roy', 'Business', 14500, '2026-09-02'),
(3, 102, 'Rohan Das', 'Economy', 5200, '2026-09-03'),
(4, 102, 'Priya Sen', 'Business', 12000, '2026-09-03'),
(5, 103, 'Arjun Mehta', 'Economy', 7000, '2026-09-02'),
(6, 103, 'Michael Smith', 'Business', 15500, '2026-09-04'),
(7, 104, 'Emma Johnson', 'Economy', 12500, '2026-09-05'),
(8, 104, 'Daniel Müller', 'Business', 28000, '2026-09-06'),
(9, 104, 'Sophie Dubois', 'First', 45000, '2026-09-06'),
(10, 105, 'Lucas Silva', 'Economy', 18000, '2026-09-04'),
(11, 105, 'Yuki Tanaka', 'Business', 42000, '2026-09-05'),
(12, 105, 'Ahmed Hassan', 'First', 75000, '2026-09-05'),
(13, 106, 'Olivia Brown', 'Economy', 19000, '2026-09-06'),
(14, 106, 'Matteo Rossi', 'Business', 45000, '2026-09-07'),
(15, 107, 'Elena Petrova', 'Economy', 16000, '2026-09-07'),
(16, 107, 'Carlos García', 'Business', 39000, '2026-09-07');
SELECT * FROM Bookings;

-- SELECT --
-- 1.DISPLAY ALL THE AIRLINES--
SELECT Airline_name FROM Airlines;
-- 2.DISPLAY ALL THE UNIQUE/AIRLINES NAME --
SELECT DISTINCT airline_name FROM Airlines;
-- 3.DISPLAY ALL THE AIRPORTS --
SELECT Airport_name FROM Airports;
-- DISPLAY THE UNIQUE AIRPORTS --
SELECT DISTINCT Airport_name FROM Airports;  
-- 4.DISPLAY ALL THE FLIGHTS --
SELECT Flight_no FROM Flights;
-- DISPLAY ALL THE UNIQUE FLIGHTS -- 
SELECT DISTINCT Flight_no FROM Flights;
-- 5.DISPLAY ALL THE BOOKINGS -- 
SELECT Booking_id FROM Bookings;
-- 6. DISPLAY PASSENGER NAMES AND THEIR TRAVEL CLASS --
SELECT Passenger_name , Travel_class FROM Bookings;
-- 7. DISPLAY FLIGHT NUMBERS AND DEPARTURE DATES --
SELECT Flight_no, Departure_Date FROM Flights;

-- WHERE --
-- 8. FIND ALL INDIAN AIRLINES --
SELECT Airline_name FROM Airlines WHERE Origin_country ='India';
-- 9. FIND ALL ECONOMY CLASS BOOKINGS --
SELECT Booking_id FROM Bookings WHERE Travel_class = 'Economy';
-- 10. FIND ALL BUSINESS CLASS BOOKINGS --
SELECT Booking_id FROM BOOKINGS WHERE Travel_class = 'Business';
-- 11. FIND TICKET COSTING MORE THAN 20,000
SELECT * FROM Bookings WHERE Ticket_price > 20000;
-- 12. FIND TICKET COSTING LESS THAN 10000 --
SELECT * FROM Bookings WHERE Ticket_price < 10000;
-- FIND TICKET COSTING MORE THAN 10000 AND LESS THAN 20000
SELECT * FROM Bookings WHERE Ticket_price > 10000 AND Ticket_price < 20000 ;
SELECT * FROM Bookings WHERE Ticket_price BETWEEN 10000 AND 20000 ;
-- 13.FIND FLIGHTS DEPARTING AFTER 2026-09-16 --
SELECT * FROM Flights WHERE Departure_date > '2026-09-16';

-- ORDER BY -- 
-- 14. DISPLAY TICKETS FROM CHEAPEST TO MOST EXPENSIVE --
SELECT booking_id, flight_id, travel_class , ticket_price FROM BOOKINGS ORDER BY ticket_price ASC;
-- 15. DISPLAY TICKETS FROM MOST EXPENSIVE TO CHEAPEST --
SELECT booking_id, flight_id, travel_class , ticket_price FROM BOOKINGS ORDER BY ticket_price DESC;
-- 16. DISPLAY AIRLINES IN ALPHABETICAL ORDER --
SELECT Airline_name FROM Airlines ORDER BY Airline_name ASC;
-- 17. DISPLAY FLIGHT ACCORDING TO THE DEPARTURE DATE AND EARLIEST FIRST
SELECT * FROM flights ORDER BY departure_date ASC, departure_time ASC;

-- AGGREGATE FUNCTIONS -- 
-- 18.FIND THE TOTAL TICKET REVENUE --
SELECT SUM(Ticket_price) FROM Bookings;
-- 19.FIND THE AVERARGE TICKET PRICE --
SELECT AVG(Ticket_price) FROM Bookings;
-- 20.FIND THE CHEAPEST TICKET --
SELECT MIN(Ticket_price) FROM Bookings;
SELECT flight_id, travel_class, ticket_price FROM bookings WHERE ticket_price = (SELECT MIN(ticket_price) FROM bookings);
-- 21.FIND THE EXPENSIVE TICKET --
SELECT MAX(Ticket_price) FROM Bookings;
SELECT Flight_id, Travel_class ,Ticket_price FROM Bookings WHERE Ticket_price = (SELECT MIN(Ticket_price) FROM Bookings);
-- 22.FIND THE MOST EXPENSIVE TICKET PRICE --
SELECT MAX(Ticket_price) FROM Bookings;
SELECT Flight_id, Travel_class, Ticket_price FROM Bookings WHERE Ticket_price = (SELECT MAX(Ticket_price) FROM Bookings);
-- 23.COUNT THE TOTAL NUMBER OF BOOKINGS --
SELECT COUNT(Booking_id) FROM Bookings;
-- 24. COUNT THE NUMBER OF FLIGHTS --
SELECT COUNT(Flight_id) AS TOTAL_FLIGHTS FROM Bookings;

-- GROUP BY --
-- 24.FIND THE NUMBER OF BOOKINGS IN EACH TRAVEL CLASS --
SELECT Travel_class ,COUNT(Booking_id) FROM Bookings GROUP BY Travel_class;
-- 25.FIND THE AVERAGE TICKET PRICE FOR EACH TRAVEL CLASS -- 
SELECT Travel_class, AVG(Ticket_price) FROM Bookings GROUP BY Travel_class;
-- 26. FIND THE TOTAL REVENUE GENERATED BY EACH TRAVEL CLASS --
SELECT Travel_class, SUM(Ticket_price) FROM Bookings GROUP BY Travel_class;
-- 27. FIND THE CHEAPEST TICKET IN EACH TRAVEL CLASS --
SELECT Travel_class, MIN(Ticket_price) FROM Bookings GROUP BY Travel_class;
SELECT Travel_class, Ticket_price, Flight_id FROM BOOKINGS WHERE Ticket_price IN ( SELECT MIN(Ticket_price) FROM BOOKINGS GROUP BY Travel_class);
-- IN is used for dealing with multiple variables -- 


-- before joining , add columns to the flight table for establishing a primary key and foreign key relationship between flight and airport table --
ALTER TABLE Flights ADD COLUMN Origin_airport_code VARCHAR (300), ADD COLUMN Destination_airport_code VARCHAR(300);
UPDATE Flights SET Origin_airport_code = 'CCU', Destination_airport_code = 'DEL' WHERE Flight_id = 101;
UPDATE Flights SET Origin_airport_code = 'DEL', Destination_airport_code = 'BOM' WHERE Flight_id = 102;
UPDATE Flights SET Origin_airport_code = 'CCU', Destination_airport_code = 'DEL' WHERE Flight_id = 103;
UPDATE Flights SET Origin_airport_code = 'DEL', Destination_airport_code = 'DXB' WHERE Flight_id = 104;
UPDATE Flights SET Origin_airport_code = 'CCU', Destination_airport_code = 'DXB' WHERE Flight_id = 105;
UPDATE Flights SET Origin_airport_code = 'DXB', Destination_airport_code = 'DEL' WHERE Flight_id = 106;
UPDATE Flights SET Origin_airport_code = 'CCU', Destination_airport_code = 'DOH' WHERE Flight_id = 107;
UPDATE Flights SET Origin_airport_code = 'DOH', Destination_airport_code = 'DEL' WHERE Flight_id = 108;
UPDATE Flights SET Origin_airport_code = 'CCU', Destination_airport_code = 'SIN' WHERE Flight_id = 109;
UPDATE Flights SET Origin_airport_code = 'SIN', Destination_airport_code = 'DEL' WHERE Flight_id = 110;
UPDATE Flights SET Origin_airport_code = 'CCU', Destination_airport_code = 'BLR' WHERE Flight_id = 111;
UPDATE Flights SET Origin_airport_code = 'CCU', Destination_airport_code = 'BLR' WHERE Flight_id = 112;
SELECT * FROM Flights;

-- JOINS --
-- 28. SELECT EACH FLIGHT NUMBER ALONG WITH THE AIRLINES OPERATING WITH IT --
SELECT Flights.Flight_no , Airlines.Airline_name FROM Flights JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id;
-- 29. SHOW EACH BOOKING ALONG WITH THE FLIGHT NUMBER --
SELECT bookings.*, flights.Flight_no FROM bookings JOIN flights ON bookings.Flight_id = flights.Flight_id;
-- 30. SHOW PASSENGER NAME , FLIGHT NUMBER AND AIRLINE NAME -- 
SELECT bookings.Passenger_name, flights.Flight_no, airlines.Airline_name FROM bookings JOIN flights ON bookings.Flight_id = flights.Flight_id JOIN airlines ON flights.Airline_id = airlines.Airline_id;
-- 31. SHOW FLIGHT NUMBER , ORIGIN CITY , DESTINATION CITY --
SELECT Flight_no , Origin_airport_code, Destination_airport_code FROM Flights;

-- JOIN + AGGREGATION --
-- 32. FIND THE TOTAL REVENUE GENERATED BY EACH AIRLINES --
SELECT Airlines.Airline_name, SUM(Bookings.Ticket_price) AS Total_revenue FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id GROUP BY Airlines.Airline_Name ORDER BY Total_revenue;
SELECT Airlines.Airline_name, SUM(Bookings.Ticket_price) AS Total_revenue FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id GROUP BY Airlines.Airline_Name ORDER BY Total_revenue DESC;
-- WHICH AIRLINE IS GENERATING THE MOST TICKET REVENUE --
SELECT Airlines.Airline_name,SUM(Bookings.Ticket_price) FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id GROUP BY Airlines.Airline_name ORDER BY SUM(Bookings.Ticket_price) DESC LIMIT 1;
-- Limit takes the first row --
-- 33. FIND THE AVERAGE TICKET PRICE OF EACH AIRLINE --
SELECT Airlines.Airline_name , AVG(Bookings.Ticket_price) FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Airlines.Airline_id GROUP BY Airlines.Airline_name;
SELECT Airlines.Airline_name , AVG(Bookings.Ticket_price) AS Average_ticket_price FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Airlines.Airline_id GROUP BY Airlines.Airline_name ORDER BY Average_ticket_price DESC;
-- 34. FIND THE CHEAPEST TICKET OFFERED BY THE AIRLINE --
SELECT Airlines.Airline_name , MIN(Bookings.Ticket_price) AS Ticket_price FROM Bookings RIGHT JOIN Flights ON BookingS.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id  GROUP BY Airlines.Airline_name ORDER BY Ticket_price ASC LIMIT 2;
-- FIND THE MOST EXPENSIVE TICKET OFFERED BY THE AIRLINE--
SELECT Airlines.Airline_name , MAX(Bookings.Ticket_price) AS Ticket_price FROM Bookings RIGHT JOIN Flights ON BookingS.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id  GROUP BY Airlines.Airline_name ORDER BY Ticket_price DESC LIMIT 1;
-- 35. FIND THE NUMBER OF BOOKINGS RECEIVED BY EACH OF THE AIRLINES --
SELECT Airlines.Airline_name, COUNT(Bookings.Booking_id) FROM Bookings LEFT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id GROUP BY Airlines.Airline_name;
-- WHICH AIRLINE HAS THE HIGHEST PASSENGER DEMAND --
SELECT Airlines.Airline_name, COUNT(Bookings.Booking_id) AS Total_no_of_bookings FROM Bookings LEFT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id GROUP BY Airlines.Airline_name ORDER BY Total_no_of_bookings DESC LIMIT 2;
-- 36. FIND THE REVENUE GENERATED BY EACH ROUTE --
SELECT Flights.Origin_airport_code , Flights.Destination_airport_code, SUM(Bookings.Ticket_price) FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id  GROUP BY Flights.Origin_airport_code , Flights.Destination_airport_code;
-- WHICH ROUTE IS GENERATING THE MOST REVENUE --
SELECT Flights.Origin_airport_code , Flights.Destination_airport_code, SUM(Bookings.Ticket_price) AS Total_revenue FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id  GROUP BY Flights.Origin_airport_code , Flights.Destination_airport_code ORDER BY Total_revenue DESC ;
SELECT Flights.Origin_airport_code , Flights.Destination_airport_code, SUM(Bookings.Ticket_price) AS Total_revenue FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id  GROUP BY Flights.Origin_airport_code , Flights.Destination_airport_code ORDER BY Total_revenue DESC LIMIT 1 ;
-- 37. FIND THE NUMBER OF BOOKINGS ON EACH ROUTE --
SELECT Flights.Origin_airport_code , Flights.Destination_airport_code, COUNT(Bookings.Booking_id) AS Total_number_of_bookings FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id  GROUP BY Flights.Origin_airport_code , Flights.Destination_airport_code ORDER BY Total_number_of_bookings DESC ;
-- WHICH ROUTE IS THE MOST POPULAR AMONG PASSENGERS --
SELECT Flights.Origin_airport_code , Flights.Destination_airport_code, COUNT(Bookings.Booking_id) AS Total_number_of_bookings FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id  GROUP BY Flights.Origin_airport_code , Flights.Destination_airport_code ORDER BY Total_number_of_bookings DESC LIMIT 1 ;
-- FIND THE AVERAGE TICKET PRICE FOR EACH OF THE ROUTE --
SELECT Flights.Origin_airport_code , Flights.Destination_airport_code, AVG(Bookings.Ticket_price) AS Average_revenue FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id  GROUP BY Flights.Origin_airport_code , Flights.Destination_airport_code ORDER BY Average_revenue DESC ;
-- WHICH ROUTE HAS THE HIGHEST AVERAGE FARE --
SELECT Flights.Origin_airport_code , Flights.Destination_airport_code, AVG(Bookings.Ticket_price) AS Average_revenue FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id  GROUP BY Flights.Origin_airport_code , Flights.Destination_airport_code ORDER BY Average_revenue DESC LIMIT 1;

-- IF I WANT THE AIRLINES NAME TOO--
-- TOTAL REVENUE AIRLINE AND ROUTE WISE --
SELECT Airlines.Airline_name, Flights.Origin_airport_code, Flights.Destination_airport_code, SUM(Bookings.Ticket_price) AS Total_Revenue FROM Flights LEFT JOIN Bookings ON Flights.Flight_id = Bookings.Flight_id JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id GROUP BY Airlines.Airline_name, Flights.Origin_airport_code, Flights.Destination_airport_code;
-- AVERAGE REVENUE AIRLINE AND ROUTE WISE --    
SELECT Airlines.Airline_name,
       Flights.Origin_airport_code,
       Flights.Destination_airport_code,
       AVG(Bookings.Ticket_price) AS Average_Revenue
FROM Flights
LEFT JOIN Bookings
ON Flights.Flight_id = Bookings.Flight_id
JOIN Airlines
ON Flights.Airline_id = Airlines.Airline_id
GROUP BY Airlines.Airline_name,
         Flights.Origin_airport_code,
         Flights.Destination_airport_code;
         
SELECT Airlines.Airline_name,
       Flights.Origin_airport_code,
       Flights.Destination_airport_code,
       AVG(Bookings.Ticket_price) AS Average_Revenue
FROM Flights
LEFT JOIN Bookings
ON Flights.Flight_id = Bookings.Flight_id
JOIN Airlines
ON Flights.Airline_id = Airlines.Airline_id
GROUP BY Airlines.Airline_name,
         Flights.Origin_airport_code,
         Flights.Destination_airport_code
ORDER BY Average_Revenue DESC;


-- 39. WHICH AIRLINE HAS THE MOST BUSINESS CLASS BOOKING --
SELECT Bookings.Travel_class, COUNT(Bookings.Booking_id) FROM Bookings GROUP BY Bookings.Travel_class;
SELECT Airlines.Airline_name, Bookings.Travel_class, COUNT(Bookings.Booking_id) FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id GROUP BY Airlines.Airline_name, Bookings.Travel_class;
SELECT Airlines.Airline_name, Bookings.Travel_class, COUNT(Bookings.Booking_id) FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id GROUP BY Airlines.Airline_name, Bookings.Travel_class ORDER BY COUNT(Bookings.Booking_id) DESC;
SELECT Airlines.Airline_name, Bookings.Travel_class, COUNT(Bookings.Booking_id) FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id WHERE Bookings.Travel_class = 'Business' GROUP BY Airlines.Airline_name, Bookings.Travel_class ORDER BY COUNT(Bookings.Booking_id) DESC ;
SELECT Airlines.Airline_name, Bookings.Travel_class, COUNT(Bookings.Booking_id) FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id WHERE Bookings.Travel_class = 'Business' GROUP BY Airlines.Airline_name, Bookings.Travel_class ORDER BY COUNT(Bookings.Booking_id) DESC LIMIT 3;

-- 40. WHICH AIRLINE GENERATES THE MOST BUSINESS CLASS REVENUE --
SELECT Airlines.Airline_name , Bookings.Travel_class, SUM(Bookings.Ticket_price) FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id WHERE Travel_class = 'Business' GROUP BY Airlines.Airline_name , Bookings.Travel_class ORDER BY SUM(Bookings.Ticket_price) DESC;
SELECT Airlines.Airline_name , Bookings.Travel_class, SUM(Bookings.Ticket_price) FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id WHERE Travel_class = 'Business' GROUP BY Airlines.Airline_name , Bookings.Travel_class ORDER BY SUM(Bookings.Ticket_price) DESC LIMIT 1;

-- 41. WHICH ORIGIN AIRPORT HAS THE HIGHEST NUMBER OF BOOKINGS --
SELECT Flights.Origin_airport_code, COUNT(Bookings.Booking_id) AS Number_of_Bookings FROM Flights LEFT JOIN Bookings ON Flights.Flight_id = Bookings.Flight_id GROUP BY Flights.Origin_airport_code ORDER BY Number_of_Bookings DESC;
SELECT Airports.Airport_Name, COUNT(Bookings.Booking_id) AS Number_of_Bookings FROM Flights LEFT JOIN Bookings ON Flights.Flight_id = Bookings.Flight_id JOIN Airports ON Flights.Origin_airport_code = Airports.Airport_Code GROUP BY Airports.Airport_Name ORDER BY Number_of_Bookings DESC;
SELECT Airports.Airport_Name, COUNT(Bookings.Booking_id) AS Number_of_Bookings FROM Flights LEFT JOIN Bookings ON Flights.Flight_id = Bookings.Flight_id JOIN Airports ON Flights.Origin_airport_code = Airports.Airport_Code GROUP BY Airports.Airport_Name ORDER BY Number_of_Bookings DESC LIMIT 1;

-- 42 . FIND AIRLINES WHOSE TOTAL REVENUE IS GREATER THAN 50000 --
SELECT Airlines.Airline_name , SUM(Bookings.Ticket_price) AS Total_revenue FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id GROUP BY Airlines.Airline_name HAVING Total_revenue > 50000;

-- 43. FIND ROUTES WHOSE TOTAL REVENUE IS GREATER THAN 50,000 --
SELECT Flights.Origin_airport_code , Flights.Destination_airport_code, SUM(Bookings.Ticket_price) AS Total_revenue FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id GROUP BY Flights.Origin_airport_code , Flights.Destination_airport_code HAVING Total_revenue > 50000 ORDER BY Total_revenue DESC;
SELECT Flights.Origin_airport_code , Flights.Destination_airport_code, SUM(Bookings.Ticket_price) AS Total_revenue FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id GROUP BY Flights.Origin_airport_code , Flights.Destination_airport_code HAVING Total_revenue > 50000 ORDER BY Total_revenue DESC LIMIT 1;

-- 44. FIND AIRLINES WHOSE AVERAGE TICKET PRICE IS GREATER THAN 20000--
SELECT Airlines.Airline_name , AVG(Bookings.Ticket_price) AS Average_ticket_price FROM Bookings RIGHT JOIN Flights ON Bookings.Flight_id = Flights.Flight_id RIGHT JOIN Airlines ON Flights.Airline_id = Airlines.Airline_id GROUP BY Airlines.Airline_name HAVING Average_ticket_price > 20000 ORDER BY Average_ticket_price DESC;




