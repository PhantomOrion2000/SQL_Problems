Question 2: Average Order Value per Customer
Table: Orders(CustomerID, OrderID, Amount)
Group by CustomerID and return their average order value.



----------------------------------------

CREATE TABLE Orders (
    CustomerID INT,
    OrderID INT,
    Amount DECIMAL(10, 2)
);


INSERT INTO Orders (CustomerID, OrderID, Amount) VALUES
(1, 201, 100.00),
(1, 202, 200.00),
(2, 203, 150.00),
(2, 204, 150.00),
(3, 205, 300.00);

select customerid, avg(Amount) as AvgOrderValue
from Orders
group by customerid;
