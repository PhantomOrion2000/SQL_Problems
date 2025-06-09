Question 3: Second Highest Transaction per Customer
Table: Transactions(TransactionID, CustomerID, Amount)
Use a CTE and ROW_NUMBER() to return each customer’s second highest transaction amount.

----------------------------------------------------------

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10, 2)
);

INSERT INTO Transactions VALUES
(1, 101, 500.00),
(2, 101, 700.00),
(3, 101, 600.00),
(4, 102, 300.00),
(5, 102, 500.00),
(6, 103, 200.00),
(7, 103, 400.00),
(8, 103, 100.00);

with transaction_ranking as(
	select *,
  			row_number() over(partition by customerid order by amount desc) as order_of_transaction_per_customer
  	from Transactions
)
select customerid, transactionid, amount
from transaction_ranking 
where order_of_transaction_per_customer = 2;