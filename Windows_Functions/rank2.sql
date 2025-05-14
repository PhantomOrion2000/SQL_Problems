Given a table Products with columns:

ProductID

ProductName

Category

TotalSales

Write a query to rank products within each category based on their total sales, handling ties appropriately.
Output columns: Category, ProductName, TotalSales, SalesRank.
Now create the table and incert 10 values




CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    TotalSales INT
);

INSERT INTO Products (ProductID, ProductName, Category, TotalSales)
VALUES
(1, 'Laptop A', 'Electronics', 500),
(2, 'Laptop B', 'Electronics', 700),
(3, 'Laptop C', 'Electronics', 700),  
(4, 'Phone A', 'Electronics', 600),
(5, 'Shirt A', 'Clothing', 300),
(6, 'Shirt B', 'Clothing', 300),      
(7, 'Shirt C', 'Clothing', 500),
(8, 'Book A', 'Books', 150),
(9, 'Book B', 'Books', 200),
(10, 'Book C', 'Books', 200);  

Select * from Products;

select 
	Category, ProductName, TotalSales, 
    rank() over(partition by category order by totalsales desc) as SalesRank
from 
	Products;


    



