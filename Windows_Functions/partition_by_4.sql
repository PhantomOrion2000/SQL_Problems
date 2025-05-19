Question 4 : Flag First Purchase per Customer
Table: Purchases
Columns: PurchaseID, CustomerID, PurchaseDate, Item

Task:
For the purchases table, flag the first purchase made by each customer chronologically.

Expected Output:
CustomerID, PurchaseDate, Item, IsFirstPurchase (Yes/No)

--------------------




CREATE TABLE Purchases (
    PurchaseID INT PRIMARY KEY,
    CustomerID INT,
    PurchaseDate DATE,
    Item VARCHAR(100)
);

INSERT INTO Purchases (PurchaseID, CustomerID, PurchaseDate, Item)
VALUES
(1, 101, '2025-05-01', 'Laptop'),
(2, 101, '2025-05-04', 'Mouse'),
(3, 102, '2025-05-02', 'Monitor'),
(4, 102, '2025-05-03', 'Keyboard'),
(5, 103, '2025-05-01', 'Tablet'),
(6, 103, '2025-05-05', 'Cover'),
(7, 101, '2025-05-06', 'Desk'),
(8, 102, '2025-05-07', 'Chair'),
(9, 104, '2025-05-01', 'Phone'),
(10, 104, '2025-05-03', 'Earphones');

select * from Purchases;


select 
      CustomerID, PurchaseDate, Item,
  	  Case	
      when row_number() over(partition by customerid order by PurchaseDate) = 1 then 'Yes'
  	  else 'No'
      end as IsFirstPurchase
From 
      Purchases;
