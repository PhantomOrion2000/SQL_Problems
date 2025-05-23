Question 7: Orders with Customer & Product Info
Tables: Orders(OrderID, CustomerID, OrderDate), OrderItems(OrderID, ProductID, Quantity), Products(ProductID, Name, Price)
Join all tables to get complete details for each order including customer and product names and total cost.

------------------------------


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE OrderItems (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Customers
INSERT INTO Customers (CustomerID, Name) VALUES
(1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

-- Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(101, 1, '2024-05-01'),
(102, 2, '2024-05-02'),
(103, 3, '2024-05-03');

-- Products
INSERT INTO Products (ProductID, Name, Price) VALUES
(1, 'Laptop', 1000.00),
(2, 'Mouse', 25.00),
(3, 'Keyboard', 50.00);

-- OrderItems
INSERT INTO OrderItems (OrderID, ProductID, Quantity) VALUES
(101, 1, 1),      -- Alice - Laptop
(101, 2, 2),      -- Alice - 2 Mice
(102, 3, 1),      -- Bob - Keyboard
(103, 2, 1),      -- Charlie - Mouse
(103, 3, 1);      -- Charlie - Keyboard


select *, oi.Quantity*p.Price as totalcost
from orders o 
join OrderItems oi on o.OrderID = oi.OrderID
join Products p on p.ProductID = oi.ProductID;
