Question 4 : Filtering with CTEs
Table: Employees(EmployeeID, DepartmentID, Salary)
Create a CTE to get employees with above-average salaries per department.
Then return only those earning more than twice the average in their department.
--------------------------------------------------------------------------

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees VALUES
(1, 1, 50000),
(2, 1, 60000),
(3, 1, 150000),
(4, 2, 40000),
(5, 2, 90000),
(6, 2, 80000);


with avg_salary_per_dept as (
	select departmentid, avg(salary) as dept_avg
  	from Employees
  	GROUP by departmentid
),
above_average as(
	select  E.employeeid, E.departmentid, E.Salary, A.dept_avg
  	from Employees E
  	join avg_salary_per_dept A on E.DepartmentID = A.DepartmentID
  	WHERE E.Salary > A.dept_avg
)
SELECT employeeid, departmentid, salary
from above_average
where salary > 2*dept_avg;

