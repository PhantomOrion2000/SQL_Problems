Question 3: Products Not Sold
Tables: Products(ProductID, Name), OrderDetails(OrderID, ProductID)
Find all products that were never sold using a LEFT JOIN and IS NULL.

---------------------------

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT
);

-- Products
INSERT INTO Products (ProductID, Name)
VALUES 
(1, 'Laptop'),
(2, 'Mouse'),
(3, 'Keyboard'),
(4, 'Monitor'),
(5, 'Webcam');

-- OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID)
VALUES 
(101, 1),
(102, 2),
(103, 1),
(104, 4);


SELECT
	p.*
From 
	Products as p 
left join 
	OrderDetails as od on p.ProductID = od.ProductID
where 
	od.OrderID is NULL;
    


