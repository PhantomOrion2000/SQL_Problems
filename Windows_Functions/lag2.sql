Question 2: Employee Salary Changes
Given a table EmployeeSalaries with columns:

EmployeeID

Salary

EffectiveDate

Write a query to list each employee’s salary and the salary they had previously (chronologically).
Output columns: EmployeeID, EffectiveDate, Salary, PreviousSalary.
-------------------------------------------

CREATE TABLE EmployeeSalaries (
    EmployeeID INT,
    Salary DECIMAL(10, 2),
    EffectiveDate DATE
);

INSERT INTO EmployeeSalaries (EmployeeID, Salary, EffectiveDate) VALUES
(1, 50000, '2023-01-01'),
(1, 55000, '2023-06-01'),
(1, 60000, '2024-01-01'),
(2, 45000, '2023-02-15'),
(2, 47000, '2024-01-15'),
(3, 70000, '2023-03-01');


select * from EmployeeSalaries;

select 
	EmployeeID, EffectiveDate, Salary, 
    lag(Salary, 1, 0) over(partition by employeeid order by EffectiveDate) as PreviousSalary
from 
	EmployeeSalaries;