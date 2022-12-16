CREATE DATABASE Portal
--Make user reg identity
CREATE TABLE Userr
(
    Userr_id INT PRIMARY KEY IDENTITY,
    -- primary key column
    Username VARCHAR(10),
    Password VARCHAR(10),
    Email VARCHAR(20) ,
    Role VARCHAR(20),
    phone_number VARCHAR(20),
    UNIQUE(Email),
    UNIQUE(phone_number),
    UNIQUE(Username)
    -- specify more columns here
);

CREATE TABLE Lecturer
(
    Lecturer_id INT PRIMARY KEY,
    -- primary key column
    Schedule VARCHAR(20),
    FOREIGN Key(Lecturer_id) REFERENCES Userr ON DELETE CASCADE ON UPDATE CASCADE
    -- specify more columns here
);

CREATE TABLE LecturerFields
(
    Lecturer_id INT,
    field VARCHAR(20),
    FOREIGN Key(Lecturer_id) REFERENCES Lecturer  ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(Lecturer_id ,field)
    -- specify more columns here
);

CREATE TABLE Company
(
    Company_id INT PRIMARY KEY,
    -- primary key column
    Name VARCHAR(20),
    Representative_name VARCHAR(20),
    Representative_Email VARCHAR(20),
    FOREIGN KEY(Company_id) REFERENCES Userr  ON DELETE CASCADE ON UPDATE CASCADE,
    Location VARCHAR(20),
    UNIQUE(Representative_Email),
    UNIQUE(Location)
    -- specify more columns here
);

CREATE TABLE Employee
(
    Staff_id INT IDENTITY,-- primary key column
    Company_id INT,
    PRIMARY KEY(Staff_id , Company_id),
    Username VARCHAR(20),
    Password varchar(20),
    Email VARCHAR(20),
    Field VARCHAR(20),
    Phone VARCHAR(20),
    FOREIGN KEY(Company_id) REFERENCES Company  ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE(Email),
    UNIQUE(Username)
    -- specify more columns here
);



CREATE TABLE External_Examiner
(
    EE_id INT PRIMARY KEY,-- primary key column
    Schedule VARCHAR(20),
    FOREIGN KEY(EE_id) REFERENCES Userr  ON DELETE CASCADE ON UPDATE CASCADE
    -- specify more columns here
);

CREATE TABLE Teaching_Assistant
(
    TA_id INT PRIMARY KEY,
    -- primary key column
    Schedule VARCHAR(20),
    FOREIGN KEY(TA_id) REFERENCES Userr  ON DELETE CASCADE ON UPDATE CASCADE
    -- specify more columns here
);

CREATE TABLE Coordinator
(
    coordinator_id INT PRIMARY KEY,
    -- primary key column
    FOREIGN KEY(coordinator_id) REFERENCES Userr  ON DELETE CASCADE ON UPDATE CASCADE
    -- specify more columns here
);


CREATE TABLE Faculty
(
    Faculty_Code INT PRIMARY KEY,
    -- primary key column
    Name VARCHAR(20) ,
    Dean INT,
    FOREIGN KEY(Dean) REFERENCES Lecturer(Lecturer_id)  ON DELETE CASCADE ON UPDATE CASCADE
    -- specify more columns here
);

CREATE TABLE Major
(
    Major_code INT PRIMARY KEY,
    -- primary key column
    Faculty_Code INT ,
    Major_name VARCHAR(20),
    FOREIGN KEY (Faculty_Code) REFERENCES Faculty ON DELETE CASCADE ON UPDATE CASCADE
    -- specify more columns here
);

CREATE TABLE Bachelor_Project
(
    Code INT PRIMARY KEY,
    -- primary key column
    Name VARCHAR(20),
    Submitted_Materials VARCHAR(20),
    Description VARCHAR(20),
    -- specify more columns here
);

CREATE TABLE MajorHasBachelorProject
(
    Major_code INT ,
    Code INT ,
    PRIMARY KEY (Major_code , Code),-- primary key column
    FOREIGN KEY (Major_code) REFERENCES Major ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Code) REFERENCES Bachelor_Project ON DELETE CASCADE ON UPDATE CASCADE
    -- specify more columns here
);

CREATE TABLE Student
(
    sid INT PRIMARY KEY,
    -- primary key column
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    Major_code INT,
	Assigned_Project_code INT,
    Date_Of_Birth Date,
    Adress VARCHAR(20),
    Age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(Date_Of_Birth)),
    Semester INT,
    GPA Decimal(4,2),
    FOREIGN KEY(sid) REFERENCES userr  ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Assigned_Project_code) REFERENCES Bachelor_Project  ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(Major_code) REFERENCES Major ON DELETE NO ACTION ON UPDATE NO ACTION,
    CHECK (GPA BETWEEN 0.9 AND 5.0)
    -- specify more columns here
);


CREATE TABLE BachelorSubmittedMaterials
(
    Code INT PRIMARY KEY,
    -- primary key column
    Material VARCHAR(20),
    FOREIGN KEY(Code) REFERENCES Bachelor_Project  ON DELETE CASCADE ON UPDATE CASCADE
    -- specify more columns here
);

CREATE TABLE Academic
(
    Academic_code INT PRIMARY KEY,
    -- primary key column
    Lecturer_id INT ,
    TA_id INT,
    EE_id INT,
	FOREIGN KEY(Academic_code) REFERENCES Bachelor_Project  ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(Lecturer_id) REFERENCES Lecturer  ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(TA_id) REFERENCES Teaching_Assistant  ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(EE_id) REFERENCES External_Examiner ON DELETE NO ACTION ON UPDATE NO ACTION
    -- specify more columns here
);

CREATE TABLE Industrial
(
    Industrial_code INT PRIMARY KEY,
    -- primary key column
    Company_id INT,
    Lecturer_id INT,
    Staff_id INT,
    FOREIGN KEY(Company_id) REFERENCES Company  ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(Lecturer_id) REFERENCES Lecturer  ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(Staff_id , Company_id) REFERENCES Employee  ON DELETE NO ACTION ON UPDATE NO ACTION
    -- specify more columns here
);

CREATE TABLE Meeting
(
    Meeting_ID INT PRIMARY KEY,
    -- primary key column
    Lecturer_id INT,
    STime Time,
    ETime Time,
    Duration AS DATEDIFF(MINUTE, ETime ,STime),
    Datee DATE ,
    Meeting_Point VARCHAR(20),
    FOREIGN KEY(Lecturer_id) REFERENCES Lecturer ON DELETE CASCADE ON UPDATE CASCADE,
    -- specify more columns here
);

CREATE TABLE MeetingToDoList
(
    Meeting_ID INT ,
    ToDoList VARCHAR (200) ,
    PRIMARY KEY (Meeting_ID , ToDoList),
    -- primary key column
    FOREIGN KEY (Meeting_ID) REFERENCES Meeting ON DELETE CASCADE ON UPDATE CASCADE
    -- specify more columns here
);

CREATE TABLE MeetingAttendents
(
    Meeting_ID INT ,
    Attendant_id INT ,
    PRIMARY KEY (Meeting_ID , Attendant_id),
    -- primary key column
    FOREIGN KEY (Meeting_ID) REFERENCES Meeting ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Attendant_id) REFERENCES Userr ON DELETE NO ACTION ON UPDATE NO ACTION
    -- specify more columns here
);

CREATE TABLE Thesis
(
    sid INT,
    -- primary key column
    Title VARCHAR(20),
    PRIMARY KEY (sid , Title),
    FOREIGN Key (sid) REFERENCES Student ON DELETE CASCADE ON UPDATE CASCADE,
    Deadline DATE ,
    PDF_doc VARCHAR(20),
    Total_grade DECIMAL
    -- specify more columns here
);

CREATE TABLE Defense
(
    sid INT ,
    Location VARCHAR(20),
    PRIMARY key (sid,Location),-- primary key column,
    Content VARCHAR(20),
    Time Time ,
    Date DATE,
    Total_grade DECIMAL,
    FOREIGN KEY (sid) REFERENCES Student ON DELETE CASCADE ON UPDATE CASCADE
    -- specify more columns here
);


CREATE TABLE ProgressReport
(
    sid Int ,
    Date DATE ,
	UpdatingUserr_id INT ,
    PRIMARY KEY (sid , Date),
    -- primary key column
    FOREIGN KEY (sid) REFERENCES Student ON DELETE CASCADE ON UPDATE CASCADE,
    Content VARCHAR(20),
    Grade DECIMAL,
    FOREIGN KEY (UpdatingUserr_id) REFERENCES Userr,
    -- specify more columns here
);
 
CREATE TABLE GradeIndustrialPR
(
    Lecturer_id INT ,
    C_id INT ,
    sid INT ,
    Date DATE,
    PRIMARY KEY (sid , Date),
    Company_grade DECIMAL(4,2),
    Lecturer_grade DECIMAL (4,2)
    -- primary key coulmns
    FOREIGN KEY(Lecturer_id) REFERENCES Lecturer ON DELETE CASCADE ON UPDATE CASCADE ,
    FOREIGN KEY(C_id) REFERENCES Company(Company_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(sid, Date) REFERENCES ProgressReport(sid , Date) ON DELETE NO ACTION ON UPDATE NO ACTION
    ,
);

CREATE TABLE GradeAcademicPR
(
    Lecturer_id INT,
    sid INT,
    Date DATE ,
    Lecturer_grade DECIMAL(3,2),
    PRIMARY KEY (sid , Date),
    -- primary key columns
    FOREIGN KEY(Lecturer_id) REFERENCES Lecturer ON DELETE CASCADE ON UPDATE CASCADE ,
    FOREIGN KEY(sid, Date) REFERENCES ProgressReport ON DELETE NO ACTION ON UPDATE NO ACTION

    -- specify more columns here
);

CREATE TABLE GradeAcademicThesis
(
    Lecturer_id INT ,
    EE_id INT,
    sid INT,
    Title varchar(20),
    EE_grade DECIMAL(3,2),
    Lecturer_grade DECIMAL(3,2),
    PRIMARY KEY(sid,Title),
    -- primary key columns
    FOREIGN KEY(Lecturer_id) REFERENCES Lecturer ON DELETE CASCADE ON UPDATE CASCADE ,
    FOREIGN KEY(EE_id) REFERENCES External_Examiner ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY(sid,Title) REFERENCES Thesis ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE GradeAcademicDefense
(
    Lecturer_id INT ,
    EE_id INT,
    sid INT,
    Title varchar(20),
    Location varchar(20),
    EE_grade DECIMAL(3,2),
    Lecturer_grade DECIMAL(3,2),
    PRIMARY KEY(sid,Title),
    -- primary key columns
    FOREIGN KEY(Lecturer_id) REFERENCES Lecturer ON DELETE CASCADE ON UPDATE CASCADE ,
    FOREIGN KEY(EE_id) REFERENCES External_Examiner ON DELETE NO ACTION ON UPDATE NO ACTION ,
    FOREIGN KEY(sid, Location) REFERENCES Defense ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE GradeIndustrialThesis
(
    Company_id INT ,
    Staff_id INT,
    sid INT,
    Title varchar(20),
    Company_grade DECIMAL(3,2),
    Employee_grade DECIMAL(3,2),
    PRIMARY KEY(sid,Title),
    -- primary key columns
    FOREIGN KEY(Company_id) REFERENCES Company ON DELETE NO ACTION ON UPDATE NO ACTION ,
    FOREIGN KEY(Staff_id, Company_id) REFERENCES Employee ON DELETE CASCADE ON UPDATE CASCADE ,
    FOREIGN KEY(sid,Title) REFERENCES Thesis(sid,Title)  ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE GradeIndustrialDefense
(
    Company_id INT ,
    Staff_id INT,
    sid INT,
    Title varchar(20),
    Location varchar(20),
    Company_grade DECIMAL(3,2),
    Employee_grade DECIMAL(3,2),
    PRIMARY KEY(sid,Title),
    -- primary key columns
    FOREIGN KEY(Company_id) REFERENCES Company ON DELETE NO ACTION ON UPDATE NO ACTION ,
    FOREIGN KEY(Staff_id, Company_id) REFERENCES Employee ON DELETE NO ACTION ON UPDATE NO ACTION ,
    FOREIGN KEY(sid, Location) REFERENCES Defense(sid,Location) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE LecturerRecommendEE
(
    Lecturer_id INT ,
    EE_id INT ,
    Academic_code INT ,
    PRIMARY KEY (EE_id ,Academic_code),-- primary key columns
    FOREIGN KEY (Lecturer_id) references Lecturer ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (EE_id) references External_Examiner ON DELETE NO ACTION ON UPDATE NO ACTION ,
    FOREIGN KEY (Academic_code) references Academic ON DELETE NO ACTION ON UPDATE NO ACTION
    -- specify more columns here
);

CREATE TABLE StudentPreferences
(
    sid INT ,
    p_code INT ,
    PreferenceNumber INT ,
    PRIMARY KEY (sid,p_code),-- primary key columns
    FOREIGN KEY (sid) references Student ON DELETE CASCADE ON UPDATE CASCADE ,
    FOREIGN KEY (p_code) references Bachelor_Project ON DELETE NO ACTION ON UPDATE NO ACTION
    -- specify more columns here
);