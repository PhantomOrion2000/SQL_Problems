'Question 2: Stock Price Next-Day Comparison
Given a table Stocks with columns:

StockID

StockDate

ClosingPrice

Write a query to show the closing price of each stock alongside the next days closing price.
Output columns: StockID, StockDate, ClosingPrice, NextDayClosingPrice.'
----------------------------------------------
CREATE TABLE Stocks (
    StockID INT,
    StockDate DATE,
    ClosingPrice DECIMAL(10, 2)
);

INSERT INTO Stocks (StockID, StockDate, ClosingPrice)
VALUES
(1, '2025-05-10', 150.50),
(1, '2025-05-11', 152.00),
(1, '2025-05-12', 149.75),
(2, '2025-05-10', 85.25),
(2, '2025-05-11', 86.00),
(2, '2025-05-12', 87.50),
(3, '2025-05-10', 210.00),
(3, '2025-05-11', 212.50),
(3, '2025-05-12', 211.00),
(3, '2025-05-13', 213.75);

select * from Stocks;



select 
	StockID, StockDate, ClosingPrice,
    lead(ClosingPrice) over(partition by StockID order by StockDate) NextDayClosingPrice
From 
	Stocks;