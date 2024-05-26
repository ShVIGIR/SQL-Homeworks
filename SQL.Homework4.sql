USE [SEDC_ACADEMY_HOMEWORK]
GO

SELECT * FROM [dbo].[AchievementType]
SELECT * FROM [dbo].[Course]
SELECT * FROM [dbo].[Grade]
SELECT * FROM [dbo].[GradeDetails]
SELECT * FROM [dbo].[Student]
SELECT * FROM [dbo].[Teacher]



--Calculate the count of all grades per Teacher in the system
SELECT t.FirstName + ' ' + t.LastName as Teacher, COUNT(g.Grade) as AllGrades
FROM [dbo].[Grade] g
INNER JOIN [dbo].[Teacher] t on g.TeacherID = t.ID
GROUP BY t.FirstName + ' ' + t.LastName
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT t.FirstName + ' ' + t.LastName as Teacher, COUNT(g.Grade) as AllGrades
FROM [dbo].[Grade] g
INNER JOIN [dbo].[Teacher] t on g.TeacherID = t.ID
INNER JOIN [dbo].[Student] s on s.ID = g.StudentID
WHERE s.ID < 100
GROUP BY t.FirstName + ' ' + t.LastName
GO


--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT s.FirstName + ' ' + s.LastName as Student, MAX (g.Grade) as MaxGrade, AVG (g.Grade) as AvgGrade
FROM [dbo].[Student] s
INNER JOIN [dbo].[Grade] g on g.StudentID = s.ID
GROUP BY s.FirstName + ' ' + s.LastName 
GO

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.FirstName + ' ' + t.LastName as Teacher, COUNT(g.Grade) as AllGrades
FROM [dbo].[Grade] g
INNER JOIN [dbo].[Teacher] t on g.TeacherID = t.ID
GROUP BY t.FirstName + ' ' + t.LastName
HAVING COUNT(g.Grade) > 200
GO


--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
SELECT s.FirstName + ' ' + s.LastName as Student, COUNT(g.Grade) as GradeCount, MAX (g.Grade) as MaxGrade, AVG (g.Grade) as AvgGrade
FROM [dbo].[Student] s
INNER JOIN [dbo].[Grade] g on g.StudentID = s.ID
GROUP BY s.FirstName + ' ' + s.LastName 
HAVING MAX (g.Grade) = AVG (g.Grade)
GO

--List Student First Name and Last Name next to the other details from previous query
SELECT s.FirstName as FirstName, s.LastName as LastName, COUNT(g.Grade) as GradeCount, MAX (g.Grade) as MaxGrade, AVG (g.Grade) as AvgGrade
FROM [dbo].[Student] s
INNER JOIN [dbo].[Grade] g on g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName 
HAVING MAX (g.Grade) = AVG (g.Grade)
GO


--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vv_StudentGrades
AS
SELECT s.ID as StudentId, COUNT (g.Grade) as GradeCount
FROM [dbo].[Student] s
INNER JOIN [dbo].[Grade] g on g.StudentID = s.ID
GROUP BY S.ID
GO

SELECT * FROM  vv_StudentGrades
GO

--Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW  vv_StudentGrades
AS
SELECT s.FirstName, s.LastName, COUNT (g.Grade) as GradeCount
FROM [dbo].[Student] s
INNER JOIN [dbo].[Grade] g on g.StudentID = s.ID
GROUP BY s.FirstName, s.LastName
GO

SELECT * FROM  vv_StudentGrades
GO


--List all rows from view ordered by biggest Grade Count
SELECT * FROM vv_StudentGrades sg
ORDER BY sg.GradeCount DESC
GO