Question 9: Cities With No Orders
Tables: Customers(City), Orders(CustomerID)
Find cities where no customers have placed an order.

---------------------------------

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT
);

INSERT INTO Customers VALUES
(1, 'New York'),
(2, 'Chicago'),
(3, 'Los Angeles'),
(4, 'Seattle');

INSERT INTO Orders VALUES
(1, 1),
(2, 3); -- Customers 2 and 4 placed no orders

SELECT
	Customers.City
from Customers
where Customers.CustomerID not in (select customerid from Orders)


