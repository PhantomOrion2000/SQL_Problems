--Given a table Students with columns:

--StudentID

--StudentName

--ExamScore

--Write a query to rank students based on their exam scores. Students with equal scores should have the same rank, and ranks should skip numbers after ties (1,1,3...).
--Output columns: StudentID, StudentName, ExamScore, Rank.

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    ExamScore INT
);

INSERT INTO Students (StudentID, StudentName, ExamScore)
VALUES
(16, 'Priya Sharma', 91),
(17, 'Ravi Kumar', 85),
(18, 'Sneha Roy', 91),     
(19, 'Tushar Mehta', 78),
(20, 'Anjali Verma', 85),  
(21, 'Vikram Das', 72),
(22, 'Meena Iyer', 88),
(23, 'Karan Singh', 78),   
(24, 'Reena Paul', 95),
(25, 'Amit Nair', 88); 

--delete from Students;

select * from Students;


select 
	StudentID, StudentName, ExamScore, 
    rank() over(order by ExamScore DESC) as Rank
from 
	Students;










