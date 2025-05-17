Question 1: Next Flight Schedule
Given a table Flights with columns:

FlightID

Airline

DepartureTime

Write a query to list each flight along with the next flight’s departure time for the same airline.
Output columns: FlightID, Airline, DepartureTime, NextFlightDepartureTime.

--------------------------------------


CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    Airline VARCHAR(50),
    DepartureTime DATETIME
);

INSERT INTO Flights (FlightID, Airline, DepartureTime)
VALUES
(1, 'AirX', '2025-05-17 08:00:00'),
(2, 'SkyJet', '2025-05-17 09:30:00'),
(3, 'AirX', '2025-05-17 12:00:00'),
(4, 'SkyJet', '2025-05-17 13:15:00'),
(5, 'AirX', '2025-05-17 18:00:00'),
(6, 'SkyJet', '2025-05-17 20:00:00'),
(7, 'FlyHigh', '2025-05-17 06:45:00'),
(8, 'FlyHigh', '2025-05-17 11:00:00'),
(9, 'FlyHigh', '2025-05-17 16:30:00'),
(10, 'SkyJet', '2025-05-17 22:15:00');

select * from Flights;

select 
	FlightID, Airline, DepartureTime, 
    lead(DepartureTime, 1) over(partition by Airline order by DepartureTime) as NextFlightDepartureTime
from 
	Flights;
    