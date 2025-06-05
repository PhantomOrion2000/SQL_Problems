Question 4: Highest-Spending Customer
Table: Orders(CustomerID, Amount)
Use GROUP BY and ORDER BY to find the customer who spent the most.


----------------------------------------------------


CREATE TABLE Orders (
    CustomerID INT,
    OrderID INT PRIMARY KEY,
    Amount DECIMAL(10, 2)
);

INSERT INTO Orders VALUES
(1, 101, 150.00),
(1, 102, 250.00),
(2, 103, 400.00),
(3, 104, 100.00),
(2, 105, 100.00);

select customerid, sum(Amount) as spent
from Orders
group by customerid
order by sum(amount) desc
limit 1;