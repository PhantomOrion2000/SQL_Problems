Question 4: Highest Paid Employee per Department
Table: Employees(EmployeeID, DepartmentID, Salary)
Use a correlated subquery to return employees earning the highest salary within their department. 
------------------------

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    Salary INT
);

INSERT INTO Employees (EmployeeID, DepartmentID, Salary) VALUES
(1, 101, 50000),
(2, 101, 60000),  -- Highest in 101
(3, 102, 75000),
(4, 102, 70000),
(5, 103, 80000);  -- Only one in 103

SELECT * from Employees;

select employeeid
from Employees e 
where salary =(select max(salary)
from Employees
where departmentid = e.departmentid);
