Question 6: Students and Courses Enrolled
Tables: Students(StudentID, Name), Enrollments(StudentID, CourseID), Courses(CourseID, Title)
Return each student’s name and the list of courses they are enrolled in.

--------------------------------------

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    Title VARCHAR(100)
);

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- Students
INSERT INTO Students (StudentID, Name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

-- Courses
INSERT INTO Courses (CourseID, Title) VALUES
(101, 'Math'),
(102, 'Science'),
(103, 'History');

-- Enrollments
INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 101),
(1, 102),
(2, 103),


(3, 101),
(3, 103);


SELECT
	s.Name as StudentName, string_agg(c.Title, ', ') as CourseName
FROM
	Students s  
JOIN
	Enrollments e on s.StudentID = e.StudentID
JOIN
	Courses c on c.CourseID = e.CourseID
group BY
	s.Name;
