Question 6: Orders Per Customer Per Year
Table: Orders(CustomerID, OrderDate)
Group by CustomerID and YEAR(OrderDate) to get order counts per year.

------------------------------------------------

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);


INSERT INTO Orders VALUES
(1, 1, '2023-05-10'),
(2, 1, '2023-12-01'),
(3, 1, '2024-02-15'),
(4, 2, '2024-01-20'),
(5, 3, '2023-07-08'),
(6, 3, '2024-03-18');

select customerid, YEAR(orderdate) as year, count(*)
from Orders
Group by customerid, YEAR(orderdate)
order by customerid, year;
