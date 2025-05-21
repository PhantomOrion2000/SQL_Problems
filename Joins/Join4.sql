Question 4: Highest Sale per Region
Tables: Sales(SaleID, Region, Amount), Regions(RegionID, RegionName)
Join both tables and return the highest sale amount per region.

---------------------------


CREATE TABLE Regions (
    RegionID INT PRIMARY KEY,
    RegionName VARCHAR(100)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    Region INT,
    Amount DECIMAL(10,2)
);

-- Regions
INSERT INTO Regions (RegionID, RegionName)
VALUES 
(1, 'North'),
(2, 'South'),
(3, 'East');

-- Sales
INSERT INTO Sales (SaleID, Region, Amount)
VALUES 
(1, 1, 100),
(2, 1, 300),
(3, 2, 200),
(4, 2, 250),
(5, 3, 150),
(6, 3, 350);


SELECT
	r.RegionName,
    max(s.Amount) as HighestSale
from
	Regions as r 
join 
	Sales s on r.RegionID = s.Region
group BY
	r.RegionName;

	
