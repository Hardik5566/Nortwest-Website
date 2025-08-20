--------------------------
------- Country ----------
--------------------------
CREATE TABLE [dbo].[tbl_country](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[country_code] [varchar](10) NULL,
	[dial_code] [int] NULL,
	[name] [varchar](50) NULL,
	[active] [bit] NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

----------------------------------------
-------table student req forms----------
----------------------------------------
create table tbl_student_request_forms
(
	id int primary key identity(1,1),
	title varchar(10),
	first_name varchar(100),
	last_name varchar(100),
	gender varchar(10),
	student_id varchar(100),
	register_date datetime,
	residentia_adress varchar(max),
	residentia_suburb varchar(100),
	residentia_postcode varchar(50),
	mailing_adress varchar(max),
	mailing_suburb varchar(350),
	mailing_postcode varchar(50),
	email varchar(150),
	contact_no varchar(20),
	request varchar(100),
	detail varchar(max),
	documents varchar(max),
	student_signature varchar(max),
	sign_date datetime,
	status bit,
	create_by int,
	create_date datetime,
	cmodify_by int,
	modify_date datetime,
	delete_by int,
	delete_date datetime
)
----------------------------------------
-------table Change course  forms-------
----------------------------------------
create table tbl_change_course_forms
(
	id int primary key identity(1,1),
	student_no varchar(100),
	student_last_name varchar(100),
	student_given_name varchar(100),
	student_full_name varchar(350),
	email varchar(150),
	contact_no varchar(20),
	street_address varchar(max),
	address_line_2 varchar(max),
	city varchar(50),
	state_region varchar(100),
	zip varchar(50),
	country varchar(70),
	status bit,
	create_by int,
	create_date datetime,
	cmodify_by int,
	modify_date datetime,
	delete_by int,
	delete_date datetime
) 
----------------------------------------
-------table new_vet_orientation_form-------
----------------------------------------
create table tbl_new_elicos_orientation_form
(
	id int primary key identity(1,1),
	student_full_name varchar(350),
	campus varchar(30),
	email varchar(150),
	country_code varchar(10),
	contact_no varchar(20),
	student_id_no varchar(100),
	student_id_card nvarchar(max),
	aus_address varchar(max),
	overseas_address varchar(max),
	no_emergency varchar(10),
	student_issue varchar(50),
	attendance_week varchar(5),
	emergency_no varchar(20),
	problem varchar(30),
	complete_test varchar(20),
	student_declaration varchar(max),
	explanation varchar(max),
	achievements varchar(5),
	student_sign_name varchar(350),
	student_signature varchar(max),
	status bit,
	create_by int,
	create_date datetime,
	cmodify_by int,
	modify_date datetime,
	delete_by int,
	delete_date datetime
) 

----------------------------------------
-------table new_vet_orientation_form-------
----------------------------------------
create table tbl_new_vet_orientation_form
(
	id int primary key identity(1,1),
	student_full_name varchar(350),
	campus varchar(30),
	email varchar(150),
	qulification varchar(max),
	country_code varchar(10),
	contact_no varchar(20),
	student_id_no varchar(100),
	photo nvarchar(max),
	aus_line_1 varchar(500),
	aus_line_2 varchar(500),
	aus_cit varchar(300),
	aus_state varchar(150),
	aus_post_code varchar(150),
	over_add_line__1 varchar(500),
	over_add_line__2 varchar(500),
	over_cit varchar(300),
	over_country varchar(350),
	post_code varchar(150),
	usi_no varchar(max),

	late_assignment varchar(70),
	student_issue varchar(50),
	serious_injury varchar(35),
	student_visa varchar(50),
	change_contact_time varchar(50),
	special_leave varchar(250),
	academic_misconduct varchar(max),
	emergency_no varchar(20),
	student_declaration varchar(max),
	explanation varchar(max),
	achievements varchar(5),
	student_signature varchar(max),
	status bit,
	create_by int,
	create_date datetime,
	cmodify_by int,
	modify_date datetime,
	delete_by int,
	delete_date datetime
) 

----------------------------------------
-------table new_vet_orientation_form-------
----------------------------------------
create table tbl_deferment_suspension_form
(
	id int identity(1,1),
	stu_name varchar(300),
	stu_id varchar(50),
	email varchar(200),
	phone_code varchar(10),
	phone varchar(15),
	mobile_code varchar(10),
	mobile varchar(15),
	application_date datetime,
	course varchar(100),
	defer_suspend_reason varchar(max),
	defer_suspend_until varchar(100),
	address_on_leave varchar(1000),	
	signature varchar(max),
	print_name varchar(200),
	sign_date datetime,
	status bit,
	create_by int,
	create_date datetime,
	modify_by int,
	modify_date datetime,
	delete_by int,
	delete_date datetime
)

----------------------------------------
-------Table Credit Card Auth Form-------
----------------------------------------
create table tbl_credit_card_auth_form
(
	id int identity(1,1),
	stu_number varchar(100),
	stu_l_name varchar(300),
	stu_given_name varchar(300),
	stu_full_name varchar(300),
	email varchar(100),
	contact_code varchar(10),
	contact varchar(15),
	street_address varchar(1000),
	address_line2 varchar(100),
	country varchar(50),
	city varchar(50),
	state varchar(50),
	zip_code varchar(50),
	status bit,
	create_by int,
	create_date datetime,
	modify_by int,
	modify_date datetime,
	delete_by int,
	delete_date datetime
)





