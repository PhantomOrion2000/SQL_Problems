Question 5: Total Revenue per Category
Tables: Products(ProductID, CategoryID), Categories(CategoryID, Name), Sales(ProductID, Quantity, Price)
Join and calculate total revenue per product category.

--------------------------------------------------------------------

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Sales (
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

-- Categories
INSERT INTO Categories (CategoryID, Name) VALUES
(1, 'Electronics'),
(2, 'Furniture'),
(3, 'Clothing');

-- Products
INSERT INTO Products (ProductID, CategoryID) VALUES
(101, 1),
(102, 1),
(201, 2),
(301, 3);

-- Sales
INSERT INTO Sales (ProductID, Quantity, Price) VALUES
(101, 10, 100.00),   -- Revenue = 1000
(102, 5, 200.00),    -- Revenue = 1000
(201, 2, 500.00),    -- Revenue = 1000
(301, 4, 50.00);     -- Revenue = 200



SELECT
	c.Name, sum(s.Price*s.Quantity) as totalrevenue
FROM
	Categories c 
JOIN
	Products P on c.CategoryID = p.CategoryID
JOIN
	Sales s on p.ProductID = s.ProductID
group BY
	c.Name;