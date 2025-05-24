
Question 2: Second Highest Salary
Table: Employees(EmployeeID, Salary)
Write a query to return the second highest distinct salary using a subquery.

------------------------------

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Salary INT
);

INSERT INTO Employees (EmployeeID, Salary) VALUES
(1, 50000),
(2, 60000),
(3, 70000),
(4, 80000),
(5, 60000);  -- Duplicate salary for testing "distinct"


select max(salary) from Employees
where salary < (select distinct max(salary) from Employees);
