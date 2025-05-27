Question 10: Departments With Only One Employee
Table: Employees(EmployeeID, DepartmentID)
Use a subquery to return departments that have only one employee.

-------------------------------------------

CREATE TABLE Employees_(
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT
);

INSERT INTO Employees_ VALUES
(1, 10),
(2, 10),
(3, 20),
(4, 30),
(5, 30);



select departmentid
FROM Employees_ 
group by departmentid
having count(*) = 1;
