-- ROW_NUMBER() Questions:
-- Question 1: Top 3 Employees per Department
-- Given a table Employees with columns:

-- EmployeeID

-- EmployeeName

-- Salary

-- DepartmentID

-- Write a query to find the top 3 highest-paid employees in each department.
-- Output columns: DepartmentID, EmployeeName, Salary, and EmployeeRank.

select * from
(
select 
	DepartmentID, EmployeeName, Salary,
    row_number() over(partition by DepartmentID order by Salary DEsc) as EmployeeRank
from Employees
) as cte
where EmployeeRank <=3;