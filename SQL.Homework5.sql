--Declare scalar variable for storing FirstName values

DECLARE @FirstName NVARCHAR(50)
GO




--Assign value ‘Antonio’ to the FirstName variable
DECLARE @FirstName NVARCHAR(50)
SET @FirstName = 'Antonio';

SELECT @FirstName AS FirstName
GO

--Find all Students having FirstName same as the variable
DECLARE @FirstName NVARCHAR(50)
SET @FirstName = 'Antonio';

SELECT * 
FROM [dbo].[Student]
WHERE FirstName = @FirstName
GO
--Declare table variable that will contain StudentId, StudentName and DateOfBirth
DECLARE @StudentInfo TABLE (StudentId INT, StudentName NVARCHAR(100), DateOfBirth DATE)
GO
--Fill the table variable with all Female students
DECLARE @StudentInfo TABLE (StudentId INT, StudentName NVARCHAR(100), DateOfBirth DATE)
INSERT INTO  @StudentInfo
SELECT ID, CONCAT(FirstName, N' ', LastName) as StudentName, DateOfBirth
FROM [dbo].[Student]
WHERE [Gender] = 'F'

SELECT StudentId, StudentName, DateOfBirth 
FROM @StudentInfo
GO

--Declare temp table that will contain LastName and EnrolledDate columns
CREATE TABLE #LastNameftEnrolledDate (LastName NVARCHAR(100),EnroledDate DATE)
GO
--Fill the temp table with all Male students having First Name starting with ‘A’
DROP TABLE  IF EXISTS #LastNameftEnrolledDate
CREATE TABLE #LastNameftEnrolledDate(LastName NVARCHAR(100),EnrolledDate DATE)
INSERT INTO #LastNameftEnrolledDate 
SELECT LastName,EnrolledDate
FROM [dbo].[Student]
WHERE [Gender] = 'M' AND FirstName LIKE 'A%'
GO
SELECT LastName, EnrolledDate
FROM #LastNameftEnrolledDate
GO
--Retrieve the students from the table which last name is with 7 characters
SELECT LastName, EnrolledDate
FROM #LastNameftEnrolledDate
WHERE LEN (LastName) = 7
GO
--Find all teachers whose FirstName length is less than 5 and the first 3 characters of their FirstName and LastName are the same
SELECT * 
FROM [dbo].[Teacher]
WHERE LEN(FirstName) < 5 AND LEFT(FirstName, 3) = LEFT(LastName, 3)
GO
