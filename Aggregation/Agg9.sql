Question 9: Customers with Highest Order Frequency
Table: Orders(CustomerID, OrderDate)
Group by CustomerID and count the number of orders. Return the top 5.

-------------------------------

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);


INSERT INTO Orders VALUES
(1, 1, '2024-06-01'),
(2, 1, '2024-06-02'),
(3, 2, '2024-06-01'),
(4, 1, '2024-06-03'),
(5, 3, '2024-06-01'),
(6, 4, '2024-06-01'),
(7, 5, '2024-06-01'),
(8, 2, '2024-06-02'),
(9, 2, '2024-06-03'),
(10, 5, '2024-06-02');

select 
	customerid, count(orderid) as OrderCount
from 
	Orders
GROUP BY
	customerid
order by 
	OrederCount Desc
Limit 5;
