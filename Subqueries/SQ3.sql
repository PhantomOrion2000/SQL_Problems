Question 3: Products with No Orders
Tables: Products(ProductID), OrderItems(ProductID)
Use a subquery to return products that do not appear in any orders.

---------------------------------

CREATE TABLE Products (
    ProductID INT PRIMARY KEY
);

CREATE TABLE OrderItems (
    OrderID INT,
    ProductID INT
);


-- Products
INSERT INTO Products (ProductID) VALUES
(101), (102), (103), (104);

-- OrderItems (only some products used)
INSERT INTO OrderItems (OrderID, ProductID) VALUES
(1, 101),
(2, 102),
(3, 101);


select * from Products
where Products.productid not in (select OrderItems.productid from OrderItems);