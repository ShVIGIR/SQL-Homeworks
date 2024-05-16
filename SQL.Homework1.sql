USE [Master]
GO
 IF EXISTS (SELECT name FROM sys.databases WHERE name = N'SEDCACADEMYDB')
 ALTER DATABASE [SEDCACADEMYDB] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
 GO

USE [Master]
GO
DROP DATABASE IF EXISTS[SEDCACADEMYDB]
GO

CREATE DATABASE [SEDCACADEMYDB]
GO

USE [SEDCACADEMYDB]
GO

CREATE TABLE [Student](
ID INT IDENTITY (1,1),
FirstName NVARCHAR(100) NOT NULL,
LastName NVARCHAR(100) NOT NULL,
DateOfBirth DATE NOT NULL,
EnrolledDate DATE NOT NULL,
Gender NCHAR(1) NULL,
NationalIDNumber NVARCHAR(20) NULL,
StudentCardNumber INT NOT NULL
CONSTRAINT PK_Student PRIMARY KEY CLUSTERED (Id)
)
GO
CREATE TABLE [Teacher](
ID INT IDENTITY (1,1),
FirstName NVARCHAR (100) NOT NULL,
LastName NVARCHAR(100) NOT NULL,
DateOfBirth DATE NULL,
AcademicRank NVARCHAR(50) NOT NULL,
HireDate DATE NOT NULL
CONSTRAINT PK_Teacher PRIMARY KEY CLUSTERED (Id)
)
GO
CREATE TABLE [Grade](
ID INT IDENTITY (1,1),
StudentID INT NOT NULL,
CourseID INT NOT NULL,
TeacherID INT NOT NULL,
Grade INT NOT NULL,
Comment NVARCHAR(MAX) NULL,
CreatedDate DATE NOT NULL
CONSTRAINT PK_Grade PRIMARY KEY CLUSTERED (Id)
)
GO
CREATE TABLE [Course](
ID INT IDENTITY (1,1),
[Name] NVARCHAR(50) NOT NULL,
Credit BIGINT NOT NULL,
AcademicYear INT NOT NULL,
Semester INT NOT NULL
CONSTRAINT PK_Course PRIMARY KEY CLUSTERED (Id)
)
GO
CREATE TABLE [AchievementType](
ID INT IDENTITY (1,1),
[Name] NVARCHAR(50) NOT NULL,
[Description] NVARCHAR(MAX) NOT NULL,
ParticipationRate INT NULL
CONSTRAINT PK_AchivementType PRIMARY KEY CLUSTERED (Id)
)
GO
CREATE TABLE [GradeDetails](
ID INT IDENTITY (1,1),
GradeId INT NOT NULL,
AchievementTypeId NVARCHAR(50) NOT NULL,
AchievementPoints BIGINT NOT NULL,
AchievementMaxPoints BIGINT NOT NULL,
AchievementDate DATE NOT NULL
CONSTRAINT PK_GradeDetails PRIMARY KEY CLUSTERED (Id)
)
GO

SELECT * FROM dbo.Student
SELECT * FROM dbo.Teacher
SELECT * FROM dbo.Grade
SELECT * FROM dbo.Course
SELECT * FROM dbo.AchievementType
SELECT * FROM dbo.GradeDetails