Given a table Transactions with columns:

TransactionID

CustomerID

SpendAmount

Write a query to rank customers based on total spending, ensuring customers with equal spend have the same rank (dense ranking).
Output columns: CustomerID, TotalSpend, Rank.

-------------------------------------------



CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    SpendAmount DECIMAL(10,2)
);

INSERT INTO Transactions (TransactionID, CustomerID, SpendAmount) VALUES
(1, 101, 250.00),
(2, 102, 180.50),
(3, 103, 300.00),
(4, 101, 100.00),
(5, 104, 180.50),
(6, 105, 120.00),
(7, 106, 300.00),
(8, 102, 100.00),
(9, 107, 250.00),
(10, 108, 200.00);

SELECT * from Transactions;


select 
    CustomerID,
    sum(SpendAmount) as TotalSpend,
    dense_rank() over( order by sum(SpendAmount) DESC) as Rank
from
    Transactions
GROUP BY
	customerid;


 