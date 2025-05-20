Question 1: Customers Without Orders
Tables: Customers(CustomerID, Name), Orders(OrderID, CustomerID, OrderDate)
Use a LEFT JOIN to find customers who never placed an order.
-------------------------------

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

-- Customers
INSERT INTO Customers (CustomerID, Name)
VALUES 
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana'),
(5, 'Eve');

-- Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES
(101, 1, '2025-05-01'),
(102, 2, '2025-05-02'),
(103, 1, '2025-05-03'),
(104, 4, '2025-05-05');


select * from Customers;
select * from Orders;

select 
	c.*
from 
	Customers as c 
left JOIN
	orders as o on c.CustomerID = o.CustomerID
where 
	o.OrderID is NULL;
    
