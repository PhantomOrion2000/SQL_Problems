Question 8: Most Popular Product Each Month
Tables: Orders(OrderID, OrderDate), OrderItems(OrderID, ProductID)
Group by month and ProductID, and return the product with the highest order count per month.

------------------------------------------------------


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT
);


-- Orders
INSERT INTO Orders VALUES
(1, '2024-06-01'),
(2, '2024-06-01'),
(3, '2024-06-15'),
(4, '2024-07-05'),
(5, '2024-07-10');

-- OrderItems
INSERT INTO OrderItems VALUES
(1, 1, 101),
(2, 1, 102),
(3, 2, 101),
(4, 3, 101),
(5, 4, 103),
(6, 5, 103),
(7, 5, 104);


    
with ProductCountPerMonth as(
    SELECT
        MONTH(O.OrderDate) as month,
        OI.ProductID,
        Count(productid) as itemCount
    from 
        Orders as O
    join 
        OrderItems AS OI on O.OrderID = OI.OrderID
    GROUP by 
        MONTH(O.OrderDate),
        OI.ProductID
),
ranked as (
  select *,
  		row_number() over(Partition by month order by itemCount DESC) as rnk
  from ProductCountPerMonth
)
select month, productid, rnk
from ranked
where rnk =1;
    
