Question 1: Rank Employees by Salary Within Departments
Table: Employees
Columns: EmployeeID, DepartmentID, EmployeeName, Salary

Task:
Assign a rank to each employee within their department based on their salary, with the highest paid ranked first.

Expected Output:
DepartmentID, EmployeeName, Salary, RankInDepartment

---------------------------------------------------


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    EmployeeName VARCHAR(100),
    Salary INT
);

INSERT INTO Employees (EmployeeID, DepartmentID, EmployeeName, Salary)
VALUES
(1, 101, 'Alice', 75000),
(2, 101, 'Bob', 82000),
(3, 101, 'Charlie', 82000),    -- tie with Bob
(4, 101, 'David', 70000),
(5, 102, 'Eve', 95000),
(6, 102, 'Frank', 88000),
(7, 102, 'Grace', 88000),      -- tie with Frank
(8, 103, 'Heidi', 65000),
(9, 103, 'Ivan', 66000),
(10, 103, 'Judy', 64000);

select * from Employees;


select 
	DepartmentID, EmployeeName, Salary,
    dense_rank() over(partition by departmentid order by salary DESC) as RankInDepartment
from 
	Employees;
    
    
select 
	DepartmentID, EmployeeName, Salary,
    rank() over(partition by departmentid order by salary DESC) as RankInDepartment
from 
	Employees;
    
select 
	DepartmentID, EmployeeName, Salary,
    row_number() over(partition by departmentid order by salary DESC) as RankInDepartment
from 
	Employees;