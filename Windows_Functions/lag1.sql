--Question 1: Monthly Revenue Comparison
--Given a table MonthlyRevenue with columns:

--Month (e.g., '2024-01', '2024-02', ...)

--Revenue

-- Write a query to show each month’s revenue alongside the previous month's revenue.
-- Output columns: Month, Revenue, PreviousMonthRevenue.



CREATE TABLE MonthlyRevenue (
    Month DATE,
    Revenue DECIMAL(10,2)
);

INSERT INTO MonthlyRevenue (Month, Revenue) VALUES
('2023-08-01', 10000.00),
('2023-09-01', 12000.00),
('2023-10-01', 11500.00),
('2023-11-01', 13000.00),
('2023-12-01', 12500.00),
('2024-01-01', 14000.00),
('2024-02-01', 13500.00),
('2024-03-01', 15000.00),
('2024-04-01', 15500.00),
('2024-05-01', 16000.00);

select * from MonthlyRevenue;

select 
	Month, Revenue,
    lag(Revenue, 1, 0) over(order by Month) as PreviousMonthRevenue
FROM	
	MonthlyRevenue;




