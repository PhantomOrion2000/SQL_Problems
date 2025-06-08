Question 10: Categories with No Sales
Tables: Products(ProductID, CategoryID), OrderItems(ProductID)
Group products and orders to identify categories that had zero sales.

--------------------------------------------

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    ProductID INT
);


-- Products
INSERT INTO Products VALUES
(1, 10),
(2, 10),
(3, 20),
(4, 20),
(5, 30); -- This category will have no sales

-- OrderItems (Products 1, 2, and 3 sold; 4 and 5 not sold)
INSERT INTO OrderItems VALUES
(1, 1),
(2, 2),
(3, 3);


select distinct categoryid
from Products p 
left join OrderItems OI on p.ProductID = OI.ProductID
where OI.ProductID is NULL;