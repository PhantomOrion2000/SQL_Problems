Question 5: Customers With More Than One Order
Table: Orders(CustomerID)
Use a subquery to return customers who placed more than one order.
----------------------
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT
);

INSERT INTO Orders (OrderID, CustomerID) VALUES
(1, 101),
(2, 102),
(3, 101),
(4, 103),
(5, 104),
(6, 102),
(7, 102),
(8, 105);


select DISTINCT customerid
from Orders 
where customerid in (
select customerid
from Orders
group by customerid
having count(orderid) > 1);
