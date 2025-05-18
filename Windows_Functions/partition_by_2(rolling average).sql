Question 2 : Calculate Average Order Value per Customer Over Time
Table: Orders
Columns: OrderID, CustomerID, OrderDate, Amount

Task:
Calculate a rolling average order amount per customer, ordered by date.

Expected Output:
CustomerID, OrderDate, Amount, AverageToDate

----------------------------------------------------------

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount)
VALUES
(1, 101, '2025-05-01', 100.00),
(2, 101, '2025-05-03', 150.00),
(3, 101, '2025-05-05', 200.00),
(4, 102, '2025-05-02', 80.00),
(5, 102, '2025-05-06', 120.00),
(6, 103, '2025-05-01', 50.00),
(7, 103, '2025-05-04', 75.00),
(8, 103, '2025-05-07', 125.00),
(9, 101, '2025-05-07', 250.00),
(10, 102, '2025-05-08', 100.00);

select * from Orders;

SELECT 
	CustomerID, OrderDate, Amount,
    avg(amount) over(
    	partition by customerid
      	order BY orderdate
      	Rows between unbounded preceding and current row
    ) as AverageToDate
from 
	Orders;