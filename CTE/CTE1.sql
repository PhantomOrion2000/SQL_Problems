Question 1: Top 3 Customers per Month
Tables: Orders(OrderID, CustomerID, OrderDate, Amount)
Create a CTE to calculate total monthly spend per customer.
Then use ROW_NUMBER() in the CTE to return the top 3 spending customers per month
------------------------------------------------------------

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2)
);

INSERT INTO Orders VALUES
(1, 101, '2024-01-10', 200.00),
(2, 101, '2024-01-15', 150.00),
(3, 102, '2024-01-20', 500.00),
(4, 103, '2024-01-25', 300.00),
(5, 104, '2024-01-28', 400.00),
(6, 102, '2024-02-05', 250.00),
(7, 101, '2024-02-08', 450.00),
(8, 105, '2024-02-10', 600.00),
(9, 104, '2024-02-12', 350.00),
(10, 103, '2024-02-15', 200.00),
(11, 106, '2024-02-20', 700.00);


WITH monthly_spend_per_customer AS (
  SELECT 
    customerid, 
    MONTH(orderdate) AS month, 
    SUM(amount) AS total_spend
  FROM Orders
  GROUP BY customerid, MONTH(orderdate)
),
ranked_customers AS (
  SELECT 
    *, 
    ROW_NUMBER() OVER (PARTITION BY month ORDER BY total_spend DESC) AS ranking
  FROM monthly_spend_per_customer
)
SELECT *
FROM ranked_customers
WHERE ranking <= 3;