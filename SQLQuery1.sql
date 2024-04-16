-- Insertion Script
INSERT INTO Faculties (Name) VALUES ('Faculty 1'), ('Faculty 2'), ('Faculty 3');

INSERT INTO Departments (Financing, Name, FacultyId) VALUES 
(10000, 'Department A', 1),
(15000, 'Department B', 1),
(12000, 'Department C', 2);

INSERT INTO Groups (Name, Year, DepartmentId) VALUES 
('Group 1', 1, 1),
('Group 2', 2, 1),
('Group 3', 1, 2);

INSERT INTO Subjects (Name) VALUES ('Subject 1'), ('Subject 2'), ('Subject 3');

INSERT INTO Teachers (Name, Salary, Surname) VALUES 
('John', 5000, 'Doe'),
('Alice', 5500, 'Smith');

INSERT INTO Lectures (DayOfWeek, LectureRoom, SubjectId, TeacherId) VALUES 
(1, 'Room 101', 1, 1),
(2, 'Room 102', 2, 1);

INSERT INTO GroupsLectures (GroupId, LectureId) VALUES 
(1, 1),
(2, 2);

-- Deletion Script
DELETE FROM GroupsLectures WHERE GroupId = 1;

-- Update Script
UPDATE Teachers SET Salary = 6000 WHERE Name = 'Alice';
