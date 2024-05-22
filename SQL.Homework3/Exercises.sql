SELECT * FROM [dbo].[Students]
SELECT * FROM [dbo].[Courses]
SELECT * FROM [dbo].[Enrollments]

--7. Find all unique courses students are taking, using the CourseName column.
SELECT CourseName FROM [dbo].[Courses]
UNION 
SELECT CourseName FROM [dbo].[Enrollments]
G0


--8. Find all courses students are taking, including duplicates.
SELECT CourseName FROM [dbo].[Courses]
UNION ALL
SELECT CourseName FROM [dbo].[Enrollments]
GO


--9. Find common courses between those students are taking and those available in the Courses table.
SELECT CourseName FROM [dbo].[Courses]
INTERSECT
SELECT CourseName FROM [dbo].[Enrollments]
GO


--10. Create combinations of each student with each course.
SELECT s.FirstName, e.CourseName
FROM [dbo].[Students] s
CROSS JOIN [dbo].[Enrollments] e
GO


--11. Find all students and their courses, including students who may not be enrolled in any courses.
SELECT s.FirstName, e.CourseName FROM [dbo].[Students] s
LEFT JOIN [dbo].[Enrollments]e ON e.StudentID = s.StudentID
GO

--12. Find all students whose name starts with 'M'.
SELECT * FROM [dbo].[Students]
WHERE [FirstName] LIKE 'M%'
GO


--13. Find all courses students are taking that have more than 3 credits.
SELECT s.FirstName, e.CourseName, c.CourseCredits
FROM [dbo].[Students] s
JOIN [dbo].[Enrollments] e ON e.StudentID = s.StudentID
JOIN [dbo].[Courses] c ON c.CourseName = e.CourseName
WHERE c.CourseCredits > 3
GO


--14. BONUS - Find all courses and students enrolled in those courses, including courses where no students may be enrolled.
SELECT s.FirstName, C.CourseName
FROM [dbo].[Students] s 
JOIN [dbo].[Enrollments] e ON e.StudentID = s.StudentID
FULL JOIN [dbo].[Courses] c ON c.CourseName = e.CourseName
GO
