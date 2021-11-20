CREATE DATABASE Academy
GO
USE Academy3
CREATE TABLE Positions(
Id int PRIMARY KEY IDENTITY(1,1),
[Name] nvarchar(50) NOT NULL
)

CREATE TABLE Employees(
Id int PRIMARY KEY IDENTITY(1,1),
FirstName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
EmailAddress nvarchar(100) NULL,
City nvarchar(50) NOT NULL,
Salary money NOT NULL,
HireDate date NOT NULL,
Id_Positions int FOREIGN KEY REFERENCES Positions(Id) NOT NULL
)

CREATE TABLE Faculties(
Id int PRIMARY KEY IDENTITY(1,1),
[Name] nvarchar(100) NOT NULL,
)

CREATE TABLE Groups(
Id int PRIMARY KEY IDENTITY(1,1),
[Name] nvarchar(20) NOT NULL,
Id_Faculty int FOREIGN KEY REFERENCES Faculties(Id) NOT NULL UNIQUE
)

CREATE TABLE Schedules(
Id int PRIMARY KEY IDENTITY(1,1),
Id_Group int FOREIGN KEY REFERENCES Groups(Id) NOT NULL UNIQUE
)

CREATE TABLE Students(
Id int PRIMARY KEY IDENTITY(1,1),
FirstName nvarchar(50) NOT NULL,
LastName nvarchar(50) NOT NULL,
Gender nvarchar(20) NOT NULL,
Id_Group int FOREIGN KEY REFERENCES Groups(Id) NOT NULL
)

CREATE TABLE Auditoriums(
Id int PRIMARY KEY IDENTITY(1,1),
Num int NOT NULL,
[Floor] int NOT NULL,
PlacesCount int NOT NULL
)

CREATE TABLE Teachers(
Id int PRIMARY KEY IDENTITY(1,1),
[Name] nvarchar(50) NOT NULL,
[Surname] nvarchar(50) NOT NULL,
Age int NOT NULL,
HireDate date NOT NULL,
Salary money NOT NULL
)

CREATE TABLE Lectures(
Id int PRIMARY KEY IDENTITY(1,1),
[Name] nvarchar(100) NOT NULL,
ClassTime int NOT NULL,
Id_Auditorium int FOREIGN KEY REFERENCES Auditoriums(Id) NOT NULL,
Id_Teacher int FOREIGN KEY REFERENCES Teachers(Id) NOT NULL
)

CREATE TABLE SchedulesLectures(
Id int PRIMARY KEY IDENTITY(1,1),
Id_Schedule int FOREIGN KEY REFERENCES Schedules(Id) NOT NULL,
Id_Lecture int FOREIGN KEY REFERENCES Lectures(Id) NOT NULL
)
GO
INSERT INTO Faculties([Name])
VALUES('Electrical and Electronic'),
('Computer Science'),
('Biochemistry')
GO
INSERT INTO Teachers([Name],Surname,Age,HireDate,Salary)
VALUES('Jasper','Mckenzie',34,'2018-12-24',800),
('Walker','Brennan',28,'2019-11-18',600),
('Marah','Norman',37,'2016-06-21',800),
('Gwendolyn','Graves',45,'2008-08-04',1000),
('Halee','Foster',24,'2020-05-07',1200),
('Samantha','Adams',36,'2015-06-19',1000)
GO
INSERT INTO Auditoriums(Num,[Floor],PlacesCount)
VALUES(140,1,30),
(156,1,40),
(177,1,50),
(220,2,35),
(258,2,45),
(290,2,55),
(344,3,40),
(348,3,55),
(380,3,60)
GO
INSERT INTO Lectures([Name], ClassTime, Id_Auditorium, Id_Teacher)
VALUES('Networks and Signal Processing',6,1,2),
('Optoelectronic and Quantum Technologies',8,3,3),
('Data Science',12,4,5),
('C/C++ language',10,5,4),
('Biology and Biotechnology',8,7,1),
('Molecular Biology',10,9,6)
GO
INSERT INTO Groups([Name], Id_Faculty)
VALUES('FSDE2202',2),
('RSDE2107',1),
('TSDE1100',3)
GO
INSERT INTO Schedules(Id_Group)
VALUES(1),
(2),
(3)
GO
INSERT INTO SchedulesLectures(Id_Schedule, Id_Lecture)
VALUES(1,3),
(1,4),
(2,1),
(2,2),
(3,5),
(3,6)
GO
INSERT INTO Students(FirstName, LastName, Gender, Id_Group)
VALUES('Wesley','Potter','Male',1),
('Martina','Richmond','Female',2),
('Vaughan','Pate','Male',3),
('Nicole','Lowe','Female',1),
('Chandler','Valenzuela','Male',2),
('Heather','Campbell','Female',3),
('Oliver','Mcfarland','Male',1),
('Hadassah','Chan','Female',2),
('Coby','Grimes','Male',3),
('Evelyn','Blackwell','Female',1),
('Acton','Jimenez','Male',2),
('Iola','Mccullough','Female',3)
GO
INSERT INTO Employees(FirstName, LastName, EmailAddress, City, Salary, HireDate, Id_Positions)
VALUES('Imogene','Talley','gravida.molestie@hotmail.ca','Perth',1170,'2017-12-27',1),
('Chase','Myers','semper.egestas@icloud.net','Oklahoma City',444,'2020-03-12',2),
('Zenaida','Baird','euismod.in@outlook.couk','Katsina',986,'2016-12-11',3),
('Colt','Richmond','odio.tristique.pharetra@google.org','Hà Tĩnh',887,'2016-12-20',2),
('Candice','Horton','amet.orci@yahoo.couk','Guadalupe',979,'2020-04-11',4),
('Michelle','Patel','a.mi@outlook.ca','Reynosa',301,'2016-07-12',2),
('Sawyer','Fischer','sociis@yahoo.org','Chelyabinsk',851,'2021-11-27',3),
('Aaron','Vazquez','libero@google.com','Miramichi',471,'2022-10-10',4),
('Duncan','Faulkner','posuere.at@aol.com','Sahiwal',1156,'2020-08-05',2),
('Ulric','Fox','dignissim@hotmail.com','Słupsk',1175,'2017-09-11',1)
GO
INSERT INTO Positions([Name])
VALUES('Mechanic'),
('Translator'),
('Security guard'),
('Library Asistant')


