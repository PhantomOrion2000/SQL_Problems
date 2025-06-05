Question 3: Number of Orders per Month
Table: Orders(OrderDate)
Group orders by month and count them.

--------------------------------------------

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE
);


INSERT INTO Orders VALUES
(1, '2024-01-15'),
(2, '2024-01-20'),
(3, '2024-02-05'),
(4, '2024-02-22'),
(5, '2024-03-10'),
(6, '2024-03-18'),
(7, '2024-03-25');

select datepart(MONTH, orderdate) as month, count(*)
from Orders
group by datepart(MONTH, orderdate);
