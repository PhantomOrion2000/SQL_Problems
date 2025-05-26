CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, Price) VALUES
(1, 50.00),
(2, 75.00),
(3, 100.00),
(4, 60.00),
(5, 200.00);


select *
from Products
where price > (select avg(price) from Products);
