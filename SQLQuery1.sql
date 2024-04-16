-- 1. Вивести кількість викладачів кафедри «Software Development».
SELECT COUNT(*) AS TeacherCount
FROM Teachers T
JOIN Departments D ON T.Id = D.DepartmentId
WHERE D.Name = 'Software Development';

-- 2. Вивести кількість лекцій, які читає викладач “Dave McQueen”.
SELECT COUNT(*) AS LectureCount
FROM Lectures L
JOIN Teachers T ON L.TeacherId = T.Id
WHERE T.Name = 'Dave' AND T.Surname = 'McQueen';

-- 3. Вивести кількість занять, які проводяться в аудиторії “D201”.
SELECT COUNT(*) AS LectureCount
FROM Lectures
WHERE LectureRoom = 'D201';

-- 4. Вивести назви аудиторій та кількість лекцій, що проводяться в них.
SELECT LectureRoom, COUNT(*) AS LectureCount
FROM Lectures
GROUP BY LectureRoom;

-- 5. Вивести кількість студентів, які відвідують лекції викладача “Jack Underhill”.
SELECT COUNT(*) AS StudentCount
FROM GroupsLectures GL
JOIN Lectures L ON GL.LectureId = L.Id
JOIN Teachers T ON L.TeacherId = T.Id
WHERE T.Name = 'Jack' AND T.Surname = 'Underhill';

-- 6. Вивести середню ставку викладачів факультету Computer Science.
SELECT AVG(Salary) AS AverageSalary
FROM Teachers T
JOIN Departments D ON T.Id = D.DepartmentId
JOIN Faculties F ON D.FacultyId = F.Id
WHERE F.Name = 'Computer Science';

-- 7. Вивести мінімальну та максимальну кількість студентів серед усіх груп.
SELECT MIN(StudentCount) AS MinStudentCount, MAX(StudentCount) AS MaxStudentCount
FROM (
    SELECT COUNT(*) AS StudentCount
    FROM GroupsLectures GL
    JOIN Groups G ON GL.GroupId = G.Id
    GROUP BY GL.GroupId
) AS GroupStudents;

-- 8. Вивести середній фонд фінансування кафедр.
SELECT AVG(Financing) AS AverageFinancing
FROM Departments;

-- 9. Вивести повні імена викладачів та кількість читаних ними дисциплін.
SELECT CONCAT(Name, ' ', Surname) AS FullName, COUNT(*) AS SubjectCount
FROM Lectures L
JOIN Teachers T ON L.TeacherId = T.Id
GROUP BY FullName;

-- 10. Вивести кількість лекцій щодня протягом тижня.
SELECT DayOfWeek, COUNT(*) AS LectureCount
FROM Lectures
GROUP BY DayOfWeek;

-- 11. Вивести номери аудиторій та кількість кафедр, чиї лекції в них читаються.
SELECT LectureRoom, COUNT(DISTINCT D.Id) AS DepartmentCount
FROM Lectures L
JOIN Departments D ON L.TeacherId = D.Id
GROUP BY LectureRoom;

-- 12. Вивести назви факультетів та кількість дисциплін, які на них читаються.
SELECT F.Name AS FacultyName, COUNT(DISTINCT L.SubjectId) AS SubjectCount
FROM Lectures L
JOIN Departments D ON L.TeacherId = D.Id
JOIN Faculties F ON D.FacultyId = F.Id
GROUP BY F.Name;

-- 13. Вивести кількість лекцій для кожної пари викладач-аудиторія.
SELECT CONCAT(T.Name, ' ', T.Surname) AS TeacherFullName, L.LectureRoom, COUNT(*) AS LectureCount
FROM Lectures L
JOIN Teachers T ON L.TeacherId = T.Id
GROUP BY TeacherFullName, L.LectureRoom;
