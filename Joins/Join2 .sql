Question 2: Employee and Manager Names
Table: Employees(EmployeeID, Name, ManagerID)
Join the Employees table to itself to get each employee along with their manager’s name.
------------------------------------------

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    ManagerID INT
);

INSERT INTO Employees (EmployeeID, Name, ManagerID)
VALUES 
(1, 'John', NULL),
(2, 'Alice', 1),
(3, 'Bob', 1),
(4, 'Charlie', 2),
(5, 'Diana', 2),
(6, 'Eve', 3);

select * from Employees;

select e1.EmployeeID, e1.name, e2.name as Manager
from Employees e1
left JOIN Employees e2 on e1.ManagerID = e2.EmployeeID;


