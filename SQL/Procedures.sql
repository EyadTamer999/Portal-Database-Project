/*<----- Procedures ----->*/

----------------(1)

 ------------a
 GO
-- Create the stored procedure in the specified schema
-- Create the stored procedure in the specified schema
-- Create the stored procedure in the specified schema
CREATE PROCEDURE UserRegister
    @user_id INT OUTPUT,
    @password VARCHAR(10),
    @usertype varchar(20),
    @userName varchar(20),
    @email varchar(100),
    @first_name varchar(20),
    @last_name varchar(20),
    @birth_date datetime,
    @GPA decimal,
    @semester INT,
    @address varchar(100),
    @faculty_code varchar(10),
    @major_code varchar(10),
    @company_name varchar(20),
    @representative_name varchar(20),
    @representative_email varchar(100),
    @phone_number varchar(20),
    @country_of_residence varchar(20)
AS
-- body of the stored procedure
BEGIN
    INSERT INTO Userr
        (Username,Email,phone_number,Password,Role)
    VALUES
        (@userName, @email, @phone_number, @password, @usertype)
    select @user_id = U.Userr_id
    from Userr U
    where U.Email = @email
    IF(@usertype = 'Student')
    BEGIN
        INSERT INTO Student
            (sid,first_name,last_name,Date_Of_Birth,Semester,Major_code,Adress, GPA)
        VALUES(@user_id, @first_name, @last_name, @birth_date, @Semester, CAST(@major_code AS INT), @address, @GPA)
    END

    IF(@usertype = 'Company')
    BEGIN
        INSERT INTO Company
            (Company_id,Name,representative_name,representative_email,Location)
        VALUES
            (@user_id, @userName, @Representative_name, @representative_email,@country_of_residence)
    END
    IF(@usertype = 'Lecturer')
    BEGIN
        INSERT INTO Lecturer
            (Lecturer_id,Schedule)
        VALUES
            (@user_id, NULL)
    END
    IF(@usertype = 'Teaching Assistant')
    BEGIN
        INSERT INTO Teaching_Assistant
            (TA_id,Schedule)
        VALUES
            (@user_id, NULL)
    END
    IF(@usertype = 'External examiner')
    BEGIN
        INSERT INTO External_Examiner
            (EE_id,Schedule)
        VALUES
            (@user_id, NULL)
    END
    IF(@usertype = 'Coordinator')
    BEGIN
        INSERT INTO Coordinator
            (coordinator_id)
        VALUES
            (@user_id)
    END
END
PRINT @User_id + ' ' + @Password
GO
--Helper proc
CREATE PROCEDURE GENERATEPWD(@OUTMESSAGE VARCHAR(10) OUTPUT)
AS
BEGIN
    SET NOCOUNT ON
    declare @LENGTH INT,@CharPool varchar(26),@PoolLength varchar(26),@LoopCount  INT
    DECLARE @RandomString VARCHAR(10),@CHARPOOLINT VARCHAR(9)


    SET @CharPool = 'A!B@C!D#E@FG#H$IJ$K%LM%N*PQR%ST&U*V(W)X_YZ'
    DECLARE @TMPSTR VARCHAR(3)

    SET @PoolLength = DataLength(@CharPool)
    SET @LoopCount = 0
    SET @RandomString = ''

    WHILE (@LoopCount <10)  
    BEGIN
        SET @TMPSTR =   SUBSTRING(@Charpool, CONVERT(int, RAND() * @PoolLength), 1)
        SELECT @RandomString  = @RandomString + CONVERT(VARCHAR(5), CONVERT(INT, RAND() * 10))
        IF(DATALENGTH(@TMPSTR) > 0)  
        BEGIN
            SELECT @RandomString = @RandomString + @TMPSTR
            SELECT @LoopCount = @LoopCount + 1
        END
    END
    SET @LOOPCOUNT = 0
    SET @OUTMESSAGE=@RandomString
END
GO

----------------(2)
------------a
-- Create the stored procedure in the specified schema
CREATE PROCEDURE LOGIN
    @email varchar(100),
    @password varchar(10),
    @user_id int output,
    @success bit output
AS

if exists(select *
from Userr
where Userr.email = @email and Userr.Password = @password)
set @success = 1
else
if exists(select *
from Employee
where Employee.Email = @email and Employee.Password = @password)
set @success = 1
else
set @success = 0

if exists(select Userr.Userr_id
from Userr
where Userr.email = @email and Userr.Password = @password)
select @user_id = Userr.Userr_id
from Userr
where Userr.email = @email and Userr.Password = @password
else
set @user_id = -1
Select @success, @user_id

------------b
GO
CREATE PROCEDURE ViewProfile
    @Userr_id int
AS

BEGIN
    if exists(select sid
    from Student
    where sid = @Userr_id)
BEGIN
        SELECT S.* , U.Username , U.Email, U.phone_number, U.Password
        FROM Student S, Userr U
        WHERE S.sid = @Userr_id AND U.Userr_id = @Userr_id
    END
    BEGIN
        --COMPANY
        if exists(select Company_id
        from Company
        where Company_id = @Userr_id)
            SELECT C.* , U.Username , U.Email, U.phone_number, U.Password
        FROM Company C, Userr U
        WHERE C.Company_id = @Userr_id AND U.Userr_id = @Userr_id
    END
    BEGIN
        --TA
        if exists(select TA_id
        from Teaching_Assistant
        where TA_id = @Userr_id)
                    SELECT TA.* , U.Username , U.Email, U.phone_number, U.Password
        FROM Teaching_Assistant TA, Userr U
        WHERE TA.TA_id = @Userr_id AND U.Userr_id = @Userr_id
    END
    BEGIN
        --EE
        if exists(select EE_id
        from External_Examiner
        where EE_id = @Userr_id)
                            SELECT EE.* , U.Username , U.Email, U.phone_number, U.Password
        FROM External_Examiner EE, Userr U
        WHERE EE.EE_id = @Userr_id AND U.Userr_id = @Userr_id
    END
    BEGIN
        --COORDINATOR
        if exists(select coordinator_id
        from Coordinator
        where coordinator_id = @Userr_id)
                                SELECT C.* , U.Username , U.Email, U.phone_number, U.Password
        FROM Coordinator C, Userr U
        WHERE C.coordinator_id = @Userr_id AND U.Userr_id = @Userr_id
    END
    BEGIN
        --Lecturer
        if exists(select Lecturer_id
        from Lecturer
        where Lecturer_id = @Userr_id)
                                    SELECT L.* , U.Username , U.Email, U.phone_number, U.Password
        FROM Lecturer L, Userr U
        WHERE L.Lecturer_id = @Userr_id AND U.Userr_id = @Userr_id
    END
END
GO

------------c
CREATE PROCEDURE ViewBachelorProjects
    @ProjectType varchar(20),
    @User_id int
AS
-- body of the stored procedure
BEGIN
    IF EXISTS(SELECT *
    FROM Industrial LEFT JOIN Student
        ON Industrial.Industrial_code = Student.Assigned_Project_code
    WHERE @ProjectType = 'Industrial' AND Student.sid = @User_id)
        BEGIN
        SELECT *
        FROM Industrial LEFT JOIN Student
            ON Industrial.Industrial_code = Student.Assigned_Project_code
        WHERE Student.sid = @User_id
    END
ELSE IF EXISTS(SELECT *
    FROM Industrial LEFT JOIN Student
        ON Industrial.Industrial_code = Student.Assigned_Project_code
    WHERE @ProjectType = 'Academic' AND Student.sid = @User_id)
        BEGIN
        SELECT *
        FROM Academic LEFT JOIN Student
            ON Academic.Academic_code = Student.Assigned_Project_code
        WHERE Student.sid = @User_id
    END
ELSE IF(@User_id = -1)
   BEGIN
        SELECT *
        From Bachelor_Project
    END
END
GO
----------------(3)

------------a
CREATE PROCEDURE MakePreferencesLocalProject
    @sid int ,
    @Bachelor_code int ,
    @prefrences_number int
-- add more stored procedure parameters here
AS
-- body of the stored procedure
INSERT INTO StudentPreferences
VALUES(@sid, @Bachelor_code, @prefrences_number)

GO
------------b
CREATE PROCEDURE ViewMyThesis
    @sid int
AS
IF EXISTS (
    SELECT*
FROM Student INNER JOIN GradeAcademicThesis ON Student.sid = GradeAcademicThesis.sid
WHERE  Student.sid = @sid AND lecturer_grade <> NULL AND EE_grade <> NULL)
    BEGIN
    DECLARE @AcademicGrade DECIMAL(3,2)
    DECLARE @EE_grade DECIMAL (3,1)
    DECLARE @LecGradedefense DECIMAL (3,1)

    SELECT GradeAcademicThesis.EE_grade
    FROM GradeAcademicThesis
    WHERE GradeAcademicThesis.sid = @sid
    SET @EE_grade = GradeAcademicThesis.EE_grade

    SELECT lecturer_grade
    FROM GradeAcademicThesis
    WHERE GradeAcademicThesis.sid = @sid
    SET @LecGradedefense = Lecturer_grade

    EXEC GradesAvgCalc
        @result = @AcademicGrade , @tmp1 = @EE_grade , @tmp2 = @LecGradedefense
    UPDATE Thesis SET Thesis.Total_grade = @result

END
ELSE IF EXISTS ( 
        SELECT *
FROM Student INNER JOIN GradeIndustrialThesis ON Student.sid = GradeIndustrialThesis.sid
WHERE  Student.sid = @sid AND Employee_grade <> NULL AND Company_grade <> NULL)
        DECLARE @IndustrialGrade DECIMAL(3,2)
DECLARE @Company_grade DECIMAL (3,1)
DECLARE @Employee_grade DECIMAL (3,1)

SELECT GradeIndustrialThesis.Company_grade
FROM GradeIndustrialThesis
WHERE GradeIndustrialThesis.sid = @sid
SET @Company_grade = Company_grade

SELECT Employee_grade
FROM GradeIndustrialThesis
WHERE GradeIndustrialThesis.sid = @sid
SET @Employee_grade = Employee_grade

EXEC GradesAvgCalc
        @result = @IndustrialGrade, @tmp1 = @Company_grade, @tmp2 = @Employee_grade
UPDATE Thesis SET Thesis.Total_grade = @result
        
GO
------------c

CREATE PROCEDURE SubmitMyThesis
    @sid int,
    @title varchar(50),
    @PDF_Document varchar(1000)
AS
INSERT INTO Thesis
    (sid,Title,PDF_doc)
VALUES(@sid, @title, @PDF_Document)
GO

------------d

CREATE PROCEDURE ViewMyProgressReports
    @sid int,
    @date DATE
AS
IF(@date<> null)
BEGIN
    SELECT *
    FROM ProgressReport
    WHERE @sid = sid AND @date = DATE
END
ELSE
SELECT *
FROM ProgressReport
GO

------------e

CREATE PROCEDURE ViewMyDefense
    @sid int
AS
IF EXISTS (
    SELECT*
FROM Student INNER JOIN GradeAcademicDefense ON Student.sid = GradeAcademicDefense.sid
WHERE  Student.sid = @sid AND lecturer_grade <> NULL AND EE_grade <> NULL)
    BEGIN
    DECLARE @AcademicGrade DECIMAL(3,2)
    DECLARE @EE_grade DECIMAL (3,1)
    DECLARE @LecGradedefense DECIMAL (3,1)

    SELECT GradeAcademicDefense.EE_grade
    FROM GradeAcademicThesis
    WHERE GradeAcademicDefense.sid = @sid
    SET @EE_grade = GradeAcademicDefense.EE_grade

    SELECT Lecturer_grade
    FROM GradeAcademicDefense
    WHERE GradeAcademicDefense.sid = @sid
    SET @LecGradedefense = Lecturer_grade

    EXEC GradesAvgCalc
        @result = @AcademicGrade , @tmp1 = @EE_grade , @tmp2 = @LecGradedefense
    UPDATE Thesis SET Thesis.Total_grade = @result

END
ELSE IF EXISTS ( 
        SELECT *
FROM Student INNER JOIN GradeIndustrialDefense ON Student.sid = GradeIndustrialDefense.sid
WHERE  Student.sid = @sid AND Employee_grade <> NULL AND Company_grade <> NULL)
        DECLARE @IndustrialGrade DECIMAL(3,2)
DECLARE @Company_grade DECIMAL (3,1)
DECLARE @Employee_grade DECIMAL (3,1)

SELECT Company_grade
FROM GradeIndustrialDefense
WHERE GradeIndustrialDefense.sid = @sid
SET @Company_grade = Company_grade

SELECT Employee_grade
FROM GradeIndustrialDefense
WHERE GradeIndustrialDefense.sid = @sid
SET @Employee_grade = Employee_grade

EXEC GradesAvgCalc
        @result = @IndustrialGrade, @tmp1 = @Company_grade, @tmp2 = @Employee_grade
UPDATE Defense SET Defense.Total_grade = @result

GO

-----HELPER PROCS-----
CREATE PROC GradesAvgCalc
    @tmp1 DECIMAL(3,2),
    --Grade one
    @tmp2 DECIMAL(3,2),
    --Grade two
    @result DECIMAL(3,2) OUTPUT
AS
SET @result = (@tmp1 + @temp2) / 2
GO

CREATE PROC TotalBpCalculator
    @thesis_grade DECIMAL(3,2),
    @defense_grade DECIMAL(3,2),
    @cumulative_grade DECIMAL(3,2),
    @result DECIMAL(3,2) OUTPUT
AS
SET @result = ((0.3 * @thesis_grade) + ( 0.3 * @defense_grade) + (0.4 * @cumulative_grade))
GO
--------------------------------------
------------f

CREATE PROCEDURE UpdateMyDefense
    @sid int,
    @defense_content VARCHAR(1000)
AS
SELECT sid
FROM Defense
WHERE sid = @sid
UPDATE Defense
SET
    Defense.Content = @defense_content
    WHERE Defense.sid = @sid

GO
-------------------------------checkk defence content again


------------g

CREATE PROCEDURE ViewMyBachelorProjectGrade
    @sid int,
    @BachelorGrade Decimal(3,1) OUTPUT

AS
IF EXISTS(
        SELECT *
FROM Student INNER JOIN Defense ON Student.sid = Defense.sid
    INNER JOIN Thesis ON Thesis.sid = Student.sid
    INNER JOIN ProgressReport ON ProgressReport.sid = ProgressReport.sid
WHERE Student.sid = @sid
    )
    BEGIN
    DECLARE @tempThesis Decimal(3,1)
    DECLARE @tempDefense Decimal(3,1)
    DECLARE @tempCumGrade Decimal(3,1)

    SELECT @tempThesis = total_grade
    FROM Thesis
    WHERE Thesis.sid = @sid

    EXEC TotalBpCalculator @result = @BachelorGrade OUTPUT,
    @thesis_grade = @tempThesis,
    @defense_grade = @tempDefense,
    @cumulative_grade = @tempCumGrade

END
GO

------------h

CREATE PROCEDURE ViewNotBookedMeetings
    @sid int
-- add more stored procedure parameters here
AS
-- body of the stored procedure
SELECT *
FROM Meeting
WHERE @sid = Meeting_ID AND Meeting_Point = NULL

GO

------------i
CREATE PROCEDURE BookMeeting
    @sid INT,
    @meeting_id INT
AS
INSERT INTO Meeting
    (Meeting_ID , Lecturer_id)
VALUES
    (@meeting_id , @sid)
GO

------------j
CREATE PROCEDURE ViewMeeting
    @meeting_id int,
    @sid int
AS
IF (@meeting_id = NULL)
    BEGIN
    SELECT *
    FROM Meeting m INNER JOIN MeetingToDoList m2
        ON m.Meeting_ID = m2.Meeting_ID
END
ELSE
    BEGIN
    SELECT *
    FROM Meeting m INNER JOIN MeetingToDoList m2
        ON m.Meeting_ID = m2.Meeting_ID
    WHERE @meeting_id = m.Meeting_ID
END
--Book a meeting 
GO
---------------check again in view meeting


------------k

CREATE PROCEDURE StudentAddToDo
    @meeting_id int,
    @to_do_list varchar(200)
AS
UPDATE MeetingToDoList SET
ToDoList = ToDoList + @to_do_list
WHERE
Meeting_ID = @meeting_id
GO

-----(4)
--(A)

CREATE PROCEDURE AddEmployee
    @CompanyID int,
    @email varchar(100),
    @name varchar(20),
    @phone_number varchar(20),
    @field varchar(25),
    @Staff_id int output,
    @Company_id_out int output,
    @password varchar(10) output

AS
declare @pass varchar(8)
exec GENERATEPWD @pass output
set @password = @pass

Select @Staff_id = Staff_id
from Employee
where Company_id = @CompanyID

select @password = Password
from Employee
where Company_id = @CompanyID

select @Company_id_out = Company_id
from Employee
where Email = @email

INSERT INTO Employee
    (Company_id , email , Username , Phone , Field, Password)
VALUES
    (@CompanyID, @email, @name, @phone_number, @field, @pass)
GO
--(B)


--(B)
CREATE PROCEDURE CompanyCreateLocalProject
    @company_id int,
    @proj_code varchar(10) OUTPUT,
    @title varchar(50),
    @description varchar(200),
    @major_code varchar(10)
AS
INSERT INTO Bachelor_Project
    (Description, Name)
VALUES(@description, @title)

    select @proj_code = B.Code
    from Bachelor_Project B
    where B.Name = @title


INSERT INTO MajorHasBachelorProject
    (Major_code, Code)
VALUES
    (@major_code, @proj_code)
INSERT INTO Industrial
    (Industrial_code, Company_id)
VALUES
    (CAST(@proj_code AS INT), @company_id)
GO    

--(C)
CREATE PROCEDURE AssignEmploye
    @bachelor_code varchar(10),
    @staff_id int,
    @Company_id int
AS
UPDATE Industrial SET
Staff_id = @staff_id
WHERE Company_id = @Company_id AND Industrial_code = cast(@bachelor_code as int)
SELECT e.staff_id, b.Name, b.Submitted_Materials, b.Description, b.Code
FROM Employee e INNER JOIN Industrial l on l.Staff_id = e.Staff_id INNER JOIN Bachelor_Project b on b.Code= l.Industrial_code
go

--(D)
CREATE PROCEDURE CompanyGradeThesis
    @Company_id int,
    @sid int,
    @thesis_title varchar(50),
    @Company_grade Decimal(4,2)
AS
UPDATE GradeIndustrialThesis SET
 Company_grade = @Company_grade
 WHERE 
 sid = @sid AND Company_id = @Company_id 
 GO
--(E)
CREATE PROCEDURE  CompanyGradedefense
    @Company_id int,
    @sid int,
    @defense_location varchar(5),
    @Company_grade Decimal(4,2)
AS
UPDATE GradeIndustrialDefense SET
 Company_grade=@Company_grade
  WHERE 
 sid = @sid AND Company_id=@Company_id
 GO

--(F)
CREATE PROCEDURE CompanyGradePR
    @Company_id int,
    @sid int,
    @date datetime,
    @Company_grade decimal(4,2)
AS
UPDATE GradeIndustrialPR SET
 GradeIndustrialPR.Company_grade = @Company_grade
 WHERE sid = @sid AND C_id=@Company_id
 GO


----------------(5)
--------------a
CREATE PROCEDURE LecturerCreateLocalProject
    @Lecturer_id int,
    @proj_code varchar(10),
    @title varchar(50),
    @description varchar(200),
    @major_code varchar(10)
AS
INSERT INTO Bachelor_Project
    (Code,Name, description, Submitted_Materials)
VALUES(@proj_code, @title,@description, NULL )
INSERT INTO Academic
    (Academic_code,Lecturer_id,TA_id,EE_id)
VALUES(@proj_code, @Lecturer_id, NULL, NULL
)
GO

--------------b
CREATE PROCEDURE SpecifyThesisDeadline
    @deadline datetime
AS
UPDATE Thesis SET
Thesis.Deadline = @deadline
--
GO

--------------c
CREATE PROCEDURE CreateMeeting
    @Lecturer_id int,
    @start_time time,
    @end_time time,
    @date datetime,
    @meeting_point varchar(5)
AS
INSERT INTO Meeting
    (STime, ETime, Meeting_Point)
Values
    (@start_time, @end_time, @meeting_point)
--
GO
--------------d
CREATE PROCEDURE LecturerAddToDo
    @meeting_id int,
    @to_do_list varchar(200)
AS
UPDATE MeetingToDoList SET
ToDoList = ToDoList + @to_do_list
WHERE 
Meeting_ID = @meeting_id
--
GO
--------------e
CREATE PROCEDURE ViewMeetingLecturer
    @Lecturer_id int,
    @meeting_id int
AS
BEGIN
    IF @meeting_id = null SELECT*
    FROM Meeting 
ELSE SELECT*
    FROM Meeting
    WHERE 
Meeting_ID = @meeting_id
END
--
GO
-------------f
CREATE PROCEDURE ViewEE
AS
BEGIN
            SELECT *
        FROM External_Examiner E, LecturerRecommendEE l
    EXCEPT
        SELECT *
        FROM External_Examiner E, LecturerRecommendEE l
        WHERE E.EE_id = l.EE_id
END
--
GO

-------------g
CREATE PROCEDURE RecommendEE
    @Lecturer_id int,
    @proj_code varchar(10),
    @EE_id int
AS
INSERT INTO LecturerRecommendEE
    (Lecturer_id , Academic_code , EE_id )
VALUES
    (@Lecturer_id , @proj_code, @EE_id)
 --
 GO

------------h
CREATE PROCEDURE SuperviseIndustrial
    @Lecturer_id int,
    @proj_code varchar(10)
AS
UPDATE Industrial SET
 Lecturer_id = @Lecturer_id
 WHERE
 Industrial_code = @proj_code
 --
 GO
------------i
CREATE PROCEDURE LecGradeThesis
    @Lecturer_id int,
    @sid int,
    @thesis_title varchar(50),
    @Lecturer_grade Decimal(4,2)
AS
UPDATE GradeAcademicThesis SET
 Lecturer_grade = @Lecturer_grade
 WHERE 
 sid = @sid AND Lecturer_grade = @Lecturer_id 
 --
 GO
------------j
CREATE PROCEDURE LecGradedefense
    @Lecturer_id INT,
    @sid INT,
    @defense_location VARCHAR(5),
    @Lecturer_grade DECIMAL(4, 2)
AS
IF EXISTS (SELECT sid
FROM GradeAcademicDefense
WHERE sid = @sid)
 BEGIN
    UPDATE GradeAcademicDefense
    SET Lecturer_grade = @Lecturer_grade
    WHERE @sid = sid AND @defense_location = GradeAcademicDefense.Location
END
ELSE BEGIN
    INSERT INTO GradeAcademicDefense
        (Lecturer_id, EE_id, sid,Title,EE_grade,Lecturer_grade)
    VALUES
        (@lecturer_id, NULL, @sid, @defense_location, NULL, @lecturer_grade)
END
GO
-----------k
CREATE PROCEDURE LecCreatePR
    @Lecturer_id int,
    @sid int,
    @date datetime,
    @content varchar(1000)
AS
INSERT INTO ProgressReport
    (UpdatingUserr_id,sid, Date, Content)
Values
    (@Lecturer_id , @sid , @date , @content)
 GO

----------l
CREATE PROCEDURE LecGradePR
    @lecturer_id INT,
    @sid INT,
    @date DATETIME,
    @lecturer_grade DECIMAL(4, 2)
AS
IF EXISTS (SELECT sid
FROM GradeAcademicPR
WHERE sid = @sid)
    BEGIN
    UPDATE GradeAcademicPR
        SET Lecturer_grade = @lecturer_grade
        WHERE @sid = sid
END
ELSE BEGIN
    INSERT INTO GradeAcademicPR
        (Lecturer_id, sid, Date, Lecturer_grade)
    VALUES
        (@lecturer_id, @sid, @date, @lecturer_grade)
END
GO


----------------(6)
------------a
--

CREATE PROCEDURE TACreatePR
    @TA_id int,
    @sid int,
    @date date,
    @content varchar(1000)
AS
INSERT INTO ProgressReport
    (sid, date, UpdatingUserr_id , Content)
VALUES(@sid, @date, @TA_id, @content)
GO


------------b
CREATE PROCEDURE TAAddToDo
    @meeting_id int,
    @to_do_list varchar(200)
AS
UPDATE MeetingToDoList SET
ToDoList = ToDoList + @to_do_list
WHERE
Meeting_ID = @meeting_id
--
GO
----------------(7)
------------a
--
CREATE PROCEDURE EEGradeThesis
    @EE_id int,
    @sid int,
    @thesis_title varchar(50),
    @EE_grade Decimal(4,2)
AS
UPDATE GradeAcademicThesis SET
EE_grade = @EE_grade
WHERE 
sid = @sid AND EE_id = @EE_id 
--
GO
------------b
--
CREATE PROCEDURE EEGradedefense
    @EE_id int,
    @sid int,
    @defense_location varchar(5),
    @EE_grade Decimal(4,2)
AS
UPDATE GradeAcademicDefense SET
EE_grade=@EE_grade
WHERE 
sid = @sid AND EE_id=@EE_id
--
GO
----------------(8)

----------a

CREATE PROCEDURE ViewUsers
    @User_type varchar(20),
    @User_id int
AS

Select *
from Userr
where @User_id = Userr_id AND @User_type = role
GO
----------b
--
CREATE PROCEDURE AssignAllStudentsToLocalProject
AS
SELECT *
FROM Student s INNER JOIN StudentPreferences sp ON s.sid = sp.sid
    INNER JOIN Bachelor_Project bp on sp.p_code = bp.Code
GO

----------c
CREATE PROCEDURE AssignTAs
    @coordinator_id int,
    @TA_id int,
    @proj_code varchar(10)
AS
IF EXISTS(SELECT Coordinator.coordinator_id
FROM Coordinator
WHERE Coordinator.coordinator_id = @coordinator_id )
   IF EXISTS(SELECT Teaching_Assistant.TA_id
FROM Teaching_Assistant
WHERE Teaching_Assistant.TA_id = @TA_id)
        IF EXISTS(SELECT Academic.Academic_code
FROM Academic
WHERE Academic.Academic_code = @proj_code)
            UPDATE Academic.Academic_code SET Academic.TA_id = @TA_id WHERE Academic_code = @proj_code 
        ELSE
            INSERT INTO Academic
    (Academic_code, TA_id)
VALUES
    (@proj_code, @TA_id)
GO


----------d
--
CREATE PROCEDURE ViewRecommendation
    @lecture_id int
AS
IF NOT EXISTS (SELECT *
FROM LecturerRecommendEE
WHERE @lecture_id = LecturerRecommendEE.Lecturer_id)
    SELECT *
FROM LecturerRecommendEE
    ELSE (SELECT *
FROM LecturerRecommendEE
WHERE @lecture_id = LecturerRecommendEE.Lecturer_id)
GO
--

----------e
--
CREATE PROCEDURE AssignEE
    @coordinator_id int,
    @EE_id int,
    @proj_code varchar(10)
AS
UPDATE LecturerRecommendEE 
SET EE_id = @EE_id
WHERE @proj_code = Academic_code
GO
----------F
--
CREATE PROCEDURE ScheduleDefense
    @sid int,
    @date datetime,
    @time time,
    @location varchar(5)
AS
UPDATE Defense
SET Location = @location, Date = @date, Time = @time
Where sid = @sid
GO

----------------(9)
----------a
--
CREATE PROCEDURE EmployeeGradeThesis
    @Employee_id int,
    @sid int,
    @thesis_title varchar(50),
    @Employee_grade Decimal(4,2)
AS
UPDATE GradeIndustrialThesis
 SET Employee_grade = @Employee_grade
 WHERE 
 sid = @sid AND Staff_id = @Employee_id AND @thesis_title = GradeIndustrialThesis.Title
GO
----------b
--
CREATE PROCEDURE EmployeeGradeDefense
    @Employee_id int,
    @sid int,
    @defense_location varchar(5),
    @Employee_grade Decimal(4,2)
AS
UPDATE GradeIndustrialDefense SET
 Location = @defense_location
 WHERE 
 sid = @sid AND Staff_id = @Employee_id AND GradeIndustrialDefense.location = @defense_location
GO

----------c	
--
CREATE PROCEDURE EmployeeCreatePR
    @Employee_id int,
    @sid int,
    @date datetime,
    @content varchar(1000)
AS
INSERT INTO ProgressReport
    (sid, Date, UpdatingUserr_id, Content)
VALUES(@sid, @date, @Employee_id, @content)
GO
--

CREATE PROCEDURE UserType
    @email varchar(100),
    @role varchar(50) output
as
if exists(select Userr.Role from Userr where  @email = Email)
set @role = (select Userr.Role from Userr where  @email = Email)
else if exists(select Staff_id from Employee where  @email = Email)
set @role = 'Employee'
else 
set @role = '0'

select @role
Go