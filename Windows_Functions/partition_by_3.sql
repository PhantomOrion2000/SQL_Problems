CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    TransactionDate DATE,
    Amount DECIMAL(10, 2)
);

INSERT INTO Transactions (TransactionID, CustomerID, TransactionDate, Amount)
VALUES
(1, 101, '2025-05-01', 100.00),
(2, 101, '2025-05-03', 150.00),
(3, 101, '2025-05-05', 120.00),
(4, 102, '2025-05-01', 80.00),
(5, 102, '2025-05-02', 85.00),
(6, 102, '2025-05-04', 70.00),
(7, 103, '2025-05-01', 50.00),
(8, 103, '2025-05-03', 50.00),
(9, 103, '2025-05-05', 100.00),
(10, 101, '2025-05-07', 200.00);

select * from Transactions;


With TransactionsPrevious as 
(
  select 
      CustomerID, TransactionDate, Amount,
      lag(Amount) over(partition by customerid order by transactiondate) as PreviousAmount
  from 
      Transactions
)
Select 
	CustomerID, TransactionDate, Amount, PreviousAmount,
    IF(Amount > PreviousAmount, 'Yes', 'No') AS Increased
FROM	
	TransactionsPrevious;


SELECT 
    CustomerID,
    TransactionDate,
    Amount,
    LAG(Amount) OVER (
        PARTITION BY CustomerID 
        ORDER BY TransactionDate
    ) AS PreviousAmount,
    CASE 
        WHEN Amount > LAG(Amount) OVER (PARTITION BY CustomerID ORDER BY TransactionDate) THEN 'Yes'
        ELSE 'No'
    END AS Increased
FROM Transactions;


