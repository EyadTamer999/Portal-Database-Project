--1-A
--STUDENT
EXEC UserRegister @user_id = NULL, @password = NULL, @usertype = 'Student', @userName = 'student1', @email = 'email@user',
@first_name = 'ahmed', @last_name = 'test',@birth_date = '1-1-2002',
@GPA = 2.0, @semester = 2,@address='street123',@faculty_code='1',@major_code='1',@company_name=NULL,@representative_name='RepTest',
@representative_email='RepTest@email',@phone_number='12345678',@country_of_residence='testCountry'

EXEC UserRegister @user_id = NULL, @password = null, @usertype = 'Student', @userName = 'student2', @email = 'email2@user',
@first_name = 'MO', @last_name = 'test',@birth_date = '1-1-2002',
@GPA = 2.0, @semester = 2,@address='street123',@faculty_code='1',@major_code='1',@company_name=NULL,@representative_name='RepTest',
@representative_email='RepTest@email',@phone_number='12245678',@country_of_residence='testCountry'

--LECTUERER
EXEC UserRegister @user_id = NULL, @password = NULL, @usertype = 'Lecturer', @userName = 'Lecturer1', @email = 'LEC1@user',
@first_name = 'Slim', @last_name = 'test',@birth_date = '1-1-2002',
@GPA = NULL, @semester = NULL,@address='street123',@faculty_code='1',@major_code='1',@company_name=NULL,@representative_name= NULL,
@representative_email= NULL,@phone_number='12343278',@country_of_residence='testCountry'

--Compnay
EXEC UserRegister @user_id = NULL, @password = NULL, @usertype = 'Company', @userName = 'Comp1', @email = 'Comp1@user',
@first_name = NULL, @last_name = NULL,@birth_date = NULL,
@GPA = NULL, @semester = NULL,@address = NULL,@faculty_code='1',@major_code= NULL,@company_name='CompanyName1',@representative_name='RepTest',
@representative_email='RepTest@email',@phone_number='32131231',@country_of_residence = NULL

--2-A
exec LOGIN @email = 'LEC1@user', @password = '6%4*8%5J', @user_id = NULL, @success = NULL

--2-B
EXEC ViewProfile @Userr_id = 30
EXEC ViewProfile @Userr_id = 29

--2-C
EXEC ViewBachelorProjects @ProjectType = 'Industrial' , @User_id = 28

--3-A

--EXEC ViewMyBachelorProjectGrade @sid = 29, @BachelorGrade = 

--4-A
exec AddEmployee @CompanyID = 31, @email = 'E2Test@test', @name = 'emp2', @phone_number = '34232312', @field = 'testField', @Staff_id = NULL,  @Company_id_out = NULL, @password = NULL  

--5-A
 exec LecturerCreateLocalProject @Lecturer_id = 1,
    @proj_code ='1',
    @title= 'title' ,
    @description= 'description',
    @major_code ='major code'
--5-B
EXEC SpecifyThesisDeadline @deadline = '2003-8-9'
--5-C
EXEC CreateMeeting @Lecturer_id = 2,
    @start_time =  '12:00',
    @end_time = '3:00',
    @date = '10-10-2010',
    @meeting_point = 'POINT'
--5-D
EXEC LecturerAddToDo 
@meeting_id =3,
    @to_do_list = 'TEST,TEST,TEST'
--5-E
EXEC ViewMeetingLecturer 
@Lecturer_id =4,
    @meeting_id =5
--5-F
EXEC ViewEE 
--5-G
EXEC RecommendEE 
@Lecturer_id =6,
    @proj_code ='1',
    @EE_id =7
--5-H
EXEC SuperviseIndustrial
@Lecturer_id =8,
    @proj_code = '1'
--5-I
EXEC LecGradeThesis
@Lecturer_id =9,
    @sid =10,
    @thesis_title ='TITLE',
    @Lecturer_grade = 55
--5-J
EXEC LecGradedefense
@Lecturer_id =12,
    @sid =11,
    @defense_location = 'LOCATION',
    @Lecturer_grade = 55
--5-K
EXEC LecCreatePR
@Lecturer_id =15,
    @sid =23,
    @date ='10-10-2010',
    @content ='CONTENT'
--5-L
EXEC LecGradePR
@lecturer_id =32,
    @sid =9,
    @date = '10-10-2010',
    @lecturer_grade =55
--6-A
EXEC TACreatePR 
@TA_id =1,
    @sid =4,
    @date ='10-10-2010',
    @content ='CONTENT'
--7-B
EXEC TAAddToDo
@meeting_id =1,
    @to_do_list ='LIST,LIST,LIST'