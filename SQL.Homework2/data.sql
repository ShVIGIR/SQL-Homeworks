-- Requirements:

--● Find all Students with FirstName = Antonio
SELECT * FROM Student
WHERE [FirstName] = 'Antonio'
GO

--● Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT * FROM Student 
WHERE [DateOfBirth] > '01.01.1999'
GO

--● Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT * FROM Student 
WHERE [LastName] LIKE 'J%' AND [EnrolledDate] >= '01.01.1998' AND [EnrolledDate] <= '1998.01.31'
GO

--● List all Students ordered by FirstName
SELECT * FROM Student
ORDER BY FirstName ASC
GO

--● List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
SELECT LastName FROM Teacher
UNION ALL
SELECT LastName FROM Student
GO

--no duplicates
SELECT LastName FROM Teacher
UNION 
SELECT LastName FROM Student
GO


--● Create Foreign key constraints from diagram or with script


--● List all possible combinations of Courses names and AchievementType names that can be passed by studentѕ
SELECT  c.Name, a.Name
FROM  [dbo].[Course] c , [dbo].[AchievementType] a 

SELECT c.Name, a.Name
FROM [dbo].[Course] c
CROSS JOIN [dbo].[AchievementType] a



--● List all Teachers without exam Grade
SELECT t.ID, t.FirstName, g.Grade 
FROM [dbo].[Teacher] t
LEFT JOIN [dbo].[Grade] g ON t.ID = g.TeacherID
WHERE g.Grade IS NULL
GO