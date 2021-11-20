-- 1. Göstərilən qrupdakı tələbələr haqqında ətraflı məlumatın verilməsi.
CREATE FUNCTION StdListInfoForGroup(@groupName nvarchar(20))
RETURNS TABLE
RETURN 
SELECT Students.* 
FROM Groups INNER JOIN Students ON Students.Id_Group = Groups.Id
WHERE Groups.[Name] = @groupName

SELECT * FROM StdListInfoForGroup('FSDE2202')

-- 2. Müəyyən vəzifədəki İşçilərin verilməsi.
CREATE FUNCTION EmployeeListInfoForPos(@posName nvarchar(100))
RETURNS TABLE
RETURN 
SELECT Employees.* 
FROM Employees INNER JOIN Positions ON Employees.Id_Positions = Positions.Id
WHERE Positions.[Name] = @posName

SELECT * FROM EmployeeListInfoForPos('Translator')

-- 3. Müəyyən qrupun Həftəlik cədvəlinin dəqiqləşdirilmiş və ətraflı şəkildə göstərilməsi.
CREATE FUNCTION ScheduleForGroups(@groupName nvarchar(20))
RETURNS TABLE
RETURN
SELECT Groups.[Name] GroupsName, Lectures.[Name] LecturesName
FROM Groups INNER JOIN Schedules ON Groups.Id = Schedules.Id_Group
INNER JOIN SchedulesLectures ON SchedulesLectures.Id_Schedule = Schedules.Id
INNER JOIN Lectures ON SchedulesLectures.Id_Lecture = Lectures.Id
WHERE Groups.[Name] = @groupName

SELECT * FROM ScheduleForGroups('RSDE2107')

-- 4. Müəyyən müəllimin Həftəlik cədvəlinin dəqiqləşdirilmiş və ətraflı şəkildə göstərilməsi.
CREATE FUNCTION ScheduleForTeacher(@teacherName nvarchar(50), @teacherSurname nvarchar(50))
RETURNS TABLE
RETURN
SELECT Teachers.[Name] + Teachers.Surname TeachersFullname, Lectures.[Name] LecturesName
FROM Teachers INNER JOIN Lectures ON Teachers.Id = Lectures.Id_Teacher
INNER JOIN SchedulesLectures ON SchedulesLectures.Id_Lecture = Lectures.Id
INNER JOIN Schedules ON Schedules.Id = SchedulesLectures.Id_Schedule
WHERE Teachers.[Name] = @teacherName AND Teachers.Surname = @teacherSurname

SELECT * FROM ScheduleForTeacher('Walker', 'Brennan')

-- 5. Müəyyən auditoriyanin Həftəlik cədvəlinin dəqiqləşdirilmiş və ətraflı şəkildə göstərilməsi.
CREATE FUNCTION ScheduleForAuditorium(@audNum int)
RETURNS TABLE
RETURN
SELECT Auditoriums.Num AudNum , Lectures.[Name] LecturesName
FROM Auditoriums INNER JOIN Lectures ON Lectures.Id_Auditorium = Auditoriums.Id
WHERE Auditoriums.Num = @audNum

SELECT * FROM ScheduleForAuditorium(140)

-- 6. Müəyyən müəllimin 1 ayliq əmək haqqının hesablanması  (əmək haqqı ay ərzində kecirilən 
--dərslərin sayini bir dərsin qiymətinə vurularag tapilir; 1 ay - 4 həftədir). Bir dersin qiymeti 25 AZN
CREATE FUNCTION CalcTeacherSalary(@teacherName nvarchar(50), @teacherSurname nvarchar(50))
RETURNS int
AS
BEGIN
	DECLARE @oneLectCost int = 25
	DECLARE @tchSalary int

	SELECT @tchSalary = ClassTime * 4 * @oneLectCost FROM Lectures INNER JOIN Teachers ON Lectures.Id_Teacher = Teachers.Id
	WHERE Teachers.[Name] = @teacherName AND Teachers.Surname = @teacherSurname

	RETURN @tchSalary
END

SELECT dbo.CalcTeacherSalary('Samantha','Adams') AS TeacherSalary
