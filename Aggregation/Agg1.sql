Question 1: Total Revenue Per Product
Table: OrderItems(ProductID, Quantity, Price)
Group by ProductID and calculate total revenue as Quantity * Price.

-----------------------------------

CREATE TABLE OrderItems (
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2)
);

INSERT INTO OrderItems (ProductID, Quantity, Price) VALUES
(101, 2, 50.00),
(101, 1, 50.00),
(102, 3, 30.00),
(103, 1, 20.00),
(102, 2, 30.00);

SELECT productid , sum(Quantity * Price) as total_revenue
from OrderItems
group by productid;
