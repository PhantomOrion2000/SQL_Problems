Question 5: Product Count per Category
Table: Products(ProductID, CategoryID)
Group by CategoryID and count the number of products in each.

-----------------------------------------------

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT
);


INSERT INTO Products VALUES
(1, 101),
(2, 101),
(3, 102),
(4, 102),
(5, 102),
(6, 103);

select categoryid, count(*)
from Products
GROUP by categoryid;