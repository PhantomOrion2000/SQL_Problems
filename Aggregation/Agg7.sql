CREATE TABLE Sales (
    StoreID INT,
    SaleDate DATE,
    Amount DECIMAL(10, 2)
);

INSERT INTO Sales VALUES
(1, '2024-06-01', 100.00),
(1, '2024-06-01', 200.00),
(1, '2024-06-02', 300.00),
(2, '2024-06-01', 400.00),
(2, '2024-06-02', 500.00),
(2, '2024-06-02', 100.00);

select storeid, saledate, avg(amount)
from Sales
GROUP by storeid, saledate
order by storeid, saledate;