--Question 2: Latest Order per Customer
--Given a table Orders with columns:

--OrderID

--CustomerID

--OrderDate

--Amount

--Write a query to find the latest order (by date) for each customer.
--Output columns: CustomerID, OrderID, OrderDate, Amount.

select CustomerID, OrderID, OrderDate, Amount from
(
  select 
  	CustomerID, OrderID, OrderDate, Amount,
  	row_number() over(partition by customerid order by OrderDate DESC) as date_order
  from 
  	Orders
) as cte
where date_order = 1