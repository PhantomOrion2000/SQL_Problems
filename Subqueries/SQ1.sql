Question 1: Customers With Above-Average Spend
Table: Orders(CustomerID, Amount)
Find all customers whose total spend is above the average total spend of all customers
--------------------------
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10, 2)
);

-- Sample data
INSERT INTO Orders (OrderID, CustomerID, Amount) VALUES
(1, 1, 200),
(2, 1, 300),
(3, 2, 150),
(4, 2, 100),
(5, 3, 700),
(6, 4, 400);

select * from Orders;

select 
Orders.CustomerID, sum(Orders.amount)
from Orders
group by Orders.customerid
having sum(Orders.amount) > (
  select avg(TotalSpend)
  from (
  	select 
    Orders.CustomerID, sum(Orders.amount) as TotalSpend
    from Orders
    group by Orders.customerid 
  ) as AverageTotalSpend
);
