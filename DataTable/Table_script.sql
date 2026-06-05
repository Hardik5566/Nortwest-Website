USE [nortwest_website]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[job_description](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_id] [int] NULL,
	[position] [varchar](max) NULL,
	[company] [varchar](max) NULL,
	[job_year] [varchar](max) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_academic_history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_id] [int] NULL,
	[course] [varchar](max) NULL,
	[institution] [varchar](max) NULL,
	[academic_year] [varchar](max) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_name] [varchar](650) NULL,
	[email] [varchar](350) NULL,
	[pwd] [nvarchar](150) NULL,
	[mibile_no] [varchar](15) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL
) ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------

CREATE TABLE [dbo].[tbl_agents](
	[agent_id] [int] IDENTITY(1,1) NOT NULL,
	[agency_name] [varchar](450) NULL,
	[business_name] [varchar](max) NULL,
	[contact_number] [varchar](15) NULL,
	business_suburb varchar(100),
	business_country varchar(100),
	email varchar(200),
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_appeal_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_no] [varchar](250) NULL,
	[student_last_name] [varchar](250) NULL,
	[student_given_name] [varchar](max) NULL,
	[student_full_name] [varchar](max) NULL,
	[email] [varchar](150) NULL,
	[country_code] [varchar](10) NULL,
	[contact_no] [varchar](20) NULL,
	[street_address] [varchar](max) NULL,
	[street_address_line_2] [varchar](max) NULL,
	[city] [varchar](50) NULL,
	[state_region] [varchar](150) NULL,
	[zip] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
create TABLE [dbo].[tbl_application_for_deferment_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	student_name [varchar](450) NULL,
	[student_id] [varchar](150) NULL,
	birth_date varchar(30) NULL,
	[reason] [varchar](max) NULL,
	[course] [varchar](250) NULL,
	course_start varchar(30),
	course_end varchar(30),
	deferment_start varchar(30),
	deferment_end varchar(30),
	[student_signature] [varchar](max) NULL,
	[sign_date] [datetime] NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL
	)
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_application_for_reassessment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_no] [varchar](250) NULL,
	[student_last_name] [varchar](250) NULL,
	[student_given_name] [varchar](max) NULL,
	[student_full_name] [varchar](max) NULL,
	[email] [varchar](150) NULL,
	[country_code] [varchar](10) NULL,
	[contact_no] [varchar](20) NULL,
	[street_address] [varchar](max) NULL,
	[street_address_line_2] [varchar](max) NULL,
	[city] [varchar](50) NULL,
	[state_region] [varchar](150) NULL,
	[zip] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_cancelation_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_no] [varchar](250) NULL,
	[student_last_name] [varchar](250) NULL,
	[student_given_name] [varchar](max) NULL,
	[student_full_name] [varchar](max) NULL,
	[email] [varchar](150) NULL,
	[country_code] [varchar](10) NULL,
	[contact_no] [varchar](20) NULL,
	[street_address] [varchar](max) NULL,
	[street_address_line_2] [varchar](max) NULL,
	[city] [varchar](50) NULL,
	[state_region] [varchar](150) NULL,
	[zip] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE dbo.tbl_change_course_forms(
	id int IDENTITY(1,1) NOT NULL,
	student_name varchar(450) NULL,
	std_id varchar(150),
	country varchar(70) NULL,
	passport_no varchar(350),
	dob varchar(30),
	course_enrolled varchar(350),
	intake varchar(30),
	address varchar(max) NULL,
	email varchar(150) NULL,
	country_code varchar(10) NULL,
	contact_no varchar(20) NULL,
	change_course varchar(350),
	reason_change_course varchar(max) NULL,
	student_signature varchar(max) NULL,
	sign_date varchar(30) NULL,
	status bit NULL,
	create_by int NULL,
	create_date datetime NULL,
	cmodify_by int NULL,
	modify_date datetime NULL,
	delete_by int NULL,
	delete_date datetime NULL
)

----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_change_of_campus_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	std_id varchar(150),
	passport_no varchar(350),
	student_name varchar(max) NULL,
	date_of_birth varchar(30),
	[street_address] [varchar](max) NULL,
	[country_code] [varchar](10) NULL,
	[contact_no] [varchar](20) NULL,
	[email] [varchar](150) NULL,
	course_enrolled varchar(450),
	intake_date varchar(30),
	change_campus varchar(200),
	current_campus varchar(200),
	course_name varchar(450),
	reason_change_course varchar(max),
	[student_signature] [varchar](max) NULL,
	[sign_date] varchar(30) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL
)
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_complaint_and_feedback_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_no] [varchar](250) NULL,
	[student_last_name] [varchar](250) NULL,
	[student_given_name] [varchar](max) NULL,
	[student_full_name] [varchar](max) NULL,
	[email] [varchar](150) NULL,
	[country_code] [varchar](10) NULL,
	[contact_no] [varchar](20) NULL,
	[street_address] [varchar](max) NULL,
	[street_address_line_2] [varchar](max) NULL,
	[city] [varchar](50) NULL,
	[state_region] [varchar](150) NULL,
	[zip] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
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
) ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_course](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[programme] [varchar](350) NULL,
	[course_name] [varchar](450) NULL,
	[course_code] [varchar](50) NULL,
	[cricos_code] [varchar](50) NULL,
	[description] [varchar](max) NULL,
	[flyer] [nvarchar](max) NULL,
	[total_week] [int] NULL,
	[study_week] [int] NULL,
	[weeks_holiday] [int] NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_course_intake](
	[intake_id] [int] IDENTITY(1,1) NOT NULL,
	[intake_date] [varchar](30) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL
) ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_course_intake_termbreak](
	[termbreak_id] [int] IDENTITY(1,1) NOT NULL,
	[intake_id] [int] NULL,
	[term_break_start] [varchar](30) NULL,
	[term_break_end] [varchar](30) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL
) ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_credit_card_auth_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stu_number] [varchar](100) NULL,
	[stu_l_name] [varchar](300) NULL,
	[stu_given_name] [varchar](300) NULL,
	[stu_full_name] [varchar](300) NULL,
	[email] [varchar](100) NULL,
	[contact_code] [varchar](10) NULL,
	[contact] [varchar](15) NULL,
	[street_address] [varchar](1000) NULL,
	[address_line2] [varchar](100) NULL,
	[country] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[zip_code] [varchar](50) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL
) ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE dbo.tbl_credit_transfer_application(
    id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	student_last_name VARCHAR(250) NULL,
	title VARCHAR(50) NULL,
    student_given_name VARCHAR(MAX) NULL,
	birth_date VARCHAR(30) NULL,
	street_address VARCHAR(MAX) NULL,
	postcode VARCHAR(50) NULL,
	state_region VARCHAR(150) NULL,
	email VARCHAR(150) NULL,
	country_code VARCHAR(10) NULL,
    contact_no VARCHAR(20) NULL,
	student_id VARCHAR(150) NULL,
	course_code VARCHAR(150) NULL,
	course_title VARCHAR(350) NULL,
    application_date DATETIME NULL,
	unit_codes VARCHAR(MAX) NULL,
    unit_titles VARCHAR(MAX) NULL,
    evidence_supplied VARCHAR(MAX) NULL,
    ct_granted VARCHAR(MAX) NULL,
	student_signature VARCHAR(MAX) NULL,
    sign_date DATETIME NULL,
	student_full_name VARCHAR(MAX) NULL,
    status BIT NULL,
    create_by INT NULL,
    create_date DATETIME NULL,
    modify_by INT NULL,
    modify_date DATETIME NULL,
    delete_by INT NULL,
    delete_date DATETIME NULL
)
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_cricos_student_withdrwal_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](100) NULL,
	[last_name] [varchar](100) NULL,
	[withdraw_date] [datetime] NULL,
	[student_id] [varchar](100) NULL,
	[current_course] [varchar](150) NULL,
	[subsequent_course] [varchar](150) NULL,
	[reason_for_withdrawal] [varchar](250) NULL,
	[student_signature] [varchar](max) NULL,
	[sign_date] [datetime] NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_ept_answer](
	[ans_id] [int] IDENTITY(1,1) NOT NULL,
	[rb_1_from_france] [varchar](30) NULL,
	[rb_2_how_old] [varchar](30) NULL,
	[rb_3_where] [varchar](30) NULL,
	[rb_4_windows] [varchar](30) NULL,
	[rb_5_man_over] [varchar](30) NULL,
	[rb_6_how_many_student] [varchar](30) NULL,
	[rb_7_name_peter] [varchar](30) NULL,
	[rb_8_artist] [varchar](30) NULL,
	[rb_9_20_desks] [varchar](30) NULL,
	[rb_10_romantic_films] [varchar](30) NULL,
	[rb_11_right_now] [varchar](30) NULL,
	[rb_12_at_school] [varchar](30) NULL,
	[rb_13_piece_of_cake] [varchar](30) NULL,
	[rb_14_living_room] [varchar](30) NULL,
	[rb_15_meat] [varchar](30) NULL,
	[rb_16_buses_late] [varchar](30) NULL,
	[rb_17_to_restaurant] [varchar](30) NULL,
	[rb_18_shopping] [varchar](30) NULL,
	[rb_19_in_the_park] [varchar](30) NULL,
	[rb_20_seen_fireworks] [varchar](30) NULL,
	[rb_21_many_years] [varchar](30) NULL,
	[rb_22_as_soon_as] [varchar](30) NULL,
	[rb_23_lots_of_tourists] [varchar](30) NULL,
	[rb_24_to_speak] [varchar](30) NULL,
	[rb_25_to_cinema] [varchar](30) NULL,
	[rb_26_wasnt_interested] [varchar](30) NULL,
	[rb_27_iam_afraid] [varchar](30) NULL,
	[rb_28_got_driver_licence] [varchar](30) NULL,
	[rb_29_a_little] [varchar](30) NULL,
	[rb_30_on_the_baby] [varchar](30) NULL,
	[rb_31_these_little_things] [varchar](30) NULL,
	[rb_32_ran_into_cofee] [varchar](30) NULL,
	[rb_33_he_won] [varchar](30) NULL,
	[rb_34_to_jane] [varchar](30) NULL,
	[rb_35_is_dinner] [varchar](30) NULL,
	[rb_36_the_flight] [varchar](30) NULL,
	[rb_37_on_the_A2] [varchar](30) NULL,
	[rb_38_takes_place] [varchar](30) NULL,
	[rb_39_in_the_fight] [varchar](30) NULL,
	[rb_40_part_of_city] [varchar](30) NULL,
	[about_article] [varchar](100) NULL,
	[advantage_eng_learning] [varchar](100) NULL,
	[advantage_stay_country] [varchar](100) NULL,
	[time_money_resourse] [varchar](100) NULL,
	[max_opportunity_for_english] [varchar](100) NULL
) ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_ept_test_form](
	[ept_form_id] [int] IDENTITY(1,1) NOT NULL,
	[f_name] [varchar](200) NULL,
	[l_name] [varchar](200) NULL,
	[email] [varchar](300) NULL,
	[std_id_number] [varchar](100) NULL,
	[nationality] [varchar](200) NULL,
	[date_of_birth] [datetime] NULL,
	[passport_no] [varchar](100) NULL,
	[stu_signature] [varchar](max) NULL,
	[rb_1_from_france] [varchar](20) NULL,
	[rb_2_how_old] [varchar](20) NULL,
	[rb_3_where] [varchar](30) NULL,
	[rb_4_windows] [varchar](30) NULL,
	[rb_5_man_over] [varchar](30) NULL,
	[rb_6_how_many_student] [varchar](30) NULL,
	[rb_7_name_peter] [varchar](30) NULL,
	[rb_8_artist] [varchar](30) NULL,
	[rb_9_20_desks] [varchar](30) NULL,
	[rb_10_romantic_films] [varchar](30) NULL,
	[rb_11_right_now] [varchar](30) NULL,
	[rb_12_at_school] [varchar](30) NULL,
	[rb_13_piece_of_cake] [varchar](30) NULL,
	[rb_14_living_room] [varchar](30) NULL,
	[rb_15_meat] [varchar](30) NULL,
	[rb_16_buses_late] [varchar](30) NULL,
	[rb_17_to_restaurant] [varchar](30) NULL,
	[rb_18_shopping] [varchar](30) NULL,
	[rb_19_in_the_park] [varchar](30) NULL,
	[rb_20_seen_fireworks] [varchar](30) NULL,
	[rb_21_many_years] [varchar](30) NULL,
	[rb_22_as_soon_as] [varchar](30) NULL,
	[rb_23_lots_of_tourists] [varchar](30) NULL,
	[rb_24_to_speak] [varchar](30) NULL,
	[rb_25_to_cinema] [varchar](30) NULL,
	[rb_26_wasnt_interested] [varchar](30) NULL,
	[rb_27_iam_afraid] [varchar](30) NULL,
	[rb_28_got_driver_licence] [varchar](30) NULL,
	[rb_29_a_little] [varchar](30) NULL,
	[rb_30_on_the_baby] [varchar](30) NULL,
	[rb_31_these_little_things] [varchar](30) NULL,
	[rb_32_ran_into_cofee] [varchar](30) NULL,
	[rb_33_he_won] [varchar](30) NULL,
	[rb_34_to_jane] [varchar](30) NULL,
	[rb_35_is_dinner] [varchar](30) NULL,
	[rb_36_the_flight] [varchar](30) NULL,
	[rb_37_on_the_A2] [varchar](30) NULL,
	[rb_38_takes_place] [varchar](30) NULL,
	[rb_39_in_the_fight] [varchar](30) NULL,
	[rb_40_part_of_city] [varchar](30) NULL,
	[about_article] [varchar](200) NULL,
	[advantage_eng_learning] [varchar](300) NULL,
	[advantage_stay_country] [varchar](300) NULL,
	[time_money_resourse] [varchar](300) NULL,
	[max_opportunity_for_english] [varchar](300) NULL,
	[advantage_learn_eng_in_country] [varchar](max) NULL,
	[learn_english_differ_method] [varchar](max) NULL,
	[why_choose_study_english] [varchar](max) NULL,
	[summary_of_passage] [varchar](max) NULL,
	[who_is_gabi] [varchar](max) NULL,
	[fiona_actress] [varchar](10) NULL,
	[where_gabi_boss] [varchar](max) NULL,
	[where_fiona_now] [varchar](max) NULL,
	[fiona_second_operation] [varchar](max) NULL,
	[fiona_mobile_number_is] [varchar](10) NULL,
	[what_happened_to_fiona] [varchar](max) NULL,
	[recorded_audio] [varchar](max) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_gte_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[family_name] [varchar](250) NULL,
	[given_name] [varchar](250) NULL,
	[student_id] [varchar](50) NULL,
	[birth_date] [datetime] NULL,
	[country] [varchar](50) NULL,
	[citizenship] [varchar](150) NULL,
	[agent_name] [varchar](250) NULL,
	[agent_code] [varchar](70) NULL,
	[agent_email] [varchar](90) NULL,
	[course_selected] [varchar](max) NULL,
	[current_add] [varchar](max) NULL,
	[marital_status] [varchar](10) NULL,
	[family] [varchar](5) NULL,
	[family_detail] [varchar](250) NULL,
	[health_condition] [varchar](5) NULL,
	[health_conditiondetail] [varchar](250) NULL,
	[refused_visa_aus] [varchar](5) NULL,
	[refused_visa_aus_upd] [nvarchar](250) NULL,
	[refused_visa_aus_detail] [varchar](250) NULL,
	[student_visa_other] [varchar](5) NULL,
	[student_visa_other_detail] [varchar](250) NULL,
	[visited_aus_breached] [varchar](5) NULL,
	[doc_evidence_upd] [nvarchar](250) NULL,
	[visited_aus_breached_detail] [varchar](250) NULL,
	[apply_admision] [varchar](5) NULL,
	[apply_admision_detail] [varchar](250) NULL,
	[previous_studied] [varchar](5) NULL,
	[previous_studied_detail] [varchar](250) NULL,
	[relatives_aus] [varchar](5) NULL,
	[relatives_aus_detail] [varchar](250) NULL,
	[accommodation_plan] [varchar](5) NULL,
	[accommodation_plan_detail] [varchar](250) NULL,
	[criminal_record] [varchar](5) NULL,
	[criminal_record_detail] [varchar](250) NULL,
	[gaps_education] [varchar](5) NULL,
	[gaps_education_detail] [varchar](250) NULL,
	[undertaken_IELTS] [varchar](5) NULL,
	[undertaken_IELTS_upd] [nvarchar](250) NULL,
	[undertaken_IELTS_detail] [varchar](250) NULL,
	[plans_intention_study_aus] [varchar](max) NULL,
	[type_of_job] [varchar](max) NULL,
	[sort_long_term] [varchar](max) NULL,
	[expect_learn] [varchar](max) NULL,
	[decide_study_aus] [varchar](max) NULL,
	[other_course] [varchar](max) NULL,
	[nortwest_institute] [varchar](max) NULL,
	[livine_expence] [varchar](5) NULL,
	[detail_familiy] [varchar](250) NULL,
	[lerning_exp] [varchar](5) NULL,
	[lerning_exp_detail] [nvarchar](max) NULL,
	[course] [varchar](max) NULL,
	[change_area_study] [varchar](max) NULL,
	[work_desc] [varchar](5) NULL,
	[work_explain] [nvarchar](max) NULL,
	[planing_while_study] [nvarchar](max) NULL,
	[term_condition] [varchar](5) NULL,
	[student_signature] [varchar](max) NULL,
	[sign_date] [datetime] NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_job_description](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[form_id] [int] NULL,
	[position] [varchar](max) NULL,
	[company] [varchar](max) NULL,
	[job_year] [int] NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_new_elicos_orientation_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_full_name] [varchar](350) NULL,
	[campus] [varchar](30) NULL,
	[student_id_card] [nvarchar](max) NULL,
	[email] [varchar](150) NULL,
	[country_code] [varchar](10) NULL,
	[contact_no] [varchar](20) NULL,
	[student_id_no] [varchar](100) NULL,
	[aus_address] [varchar](max) NULL,
	[overseas_address] [varchar](max) NULL,
	[police_fire_emergency] [varchar](10) NULL,
	[student_issue] [varchar](50) NULL,
	[attendance_week] [varchar](5) NULL,
	[emergency_no] [varchar](20) NULL,
	[problem] [varchar](30) NULL,
	[complete_test] [varchar](20) NULL,
	[student_sign_name] [varchar](350) NULL,
	[student_signature] [varchar](max) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[cmodify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_new_vet_orientation_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_full_name] [varchar](350) NULL,
	[campus] [varchar](30) NULL,
	[email] [varchar](150) NULL,
	[qulification] [varchar](max) NULL,
	[country_code] [varchar](10) NULL,
	[contact_no] [varchar](20) NULL,
	[student_id_no] [varchar](100) NULL,
	[photo] [nvarchar](max) NULL,
	[aus_line_1] [varchar](500) NULL,
	[aus_line_2] [varchar](500) NULL,
	[aus_cit] [varchar](300) NULL,
	[aus_state] [varchar](150) NULL,
	[aus_post_code] [varchar](150) NULL,
	[over_add_line__1] [varchar](500) NULL,
	[over_add_line__2] [varchar](500) NULL,
	[over_cit] [varchar](300) NULL,
	[over_country] [varchar](350) NULL,
	[post_code] [varchar](150) NULL,
	[usi_no] [varchar](max) NULL,
	[late_assignment] [varchar](70) NULL,
	[student_issue] [varchar](50) NULL,
	[serious_injury] [varchar](35) NULL,
	[student_visa] [varchar](50) NULL,
	[change_contact_time] [varchar](50) NULL,
	[special_leave] [varchar](250) NULL,
	[academic_misconduct] [varchar](max) NULL,
	[emergency_no] [varchar](20) NULL,
	[student_declaration] [varchar](max) NULL,
	[explanation] [varchar](max) NULL,
	[achievements] [varchar](5) NULL,
	[student_signature] [varchar](max) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[cmodify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_policies](
	[policies_id] [int] IDENTITY(1,1) NOT NULL,
	[policies_name] [varchar](650) NULL,
	[policies_file] [nvarchar](max) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_public_holiday](
	[holiday_id] [int] IDENTITY(1,1) NOT NULL,
	[holiday_name] [varchar](650) NULL,
	[holiday_date] [date] NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL
) ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_refund_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](100) NULL,
	[last_name] [varchar](100) NULL,
	[birth_date] [datetime] NULL,
	[nationality] [varchar](50) NULL,
	[country_code] [varchar](10) NULL,
	[contact_no] [varchar](20) NULL,
	[email] [varchar](150) NULL,
	[passport_no] [varchar](150) NULL,
	[student_address] [varchar](max) NULL,
	[course_detail] [varchar](max) NULL,
	[reson_of_refund] [varchar](max) NULL,
	[account_hold_name] [varchar](250) NULL,
	[bank_code] [varchar](100) NULL,
	[card_number] [varchar](150) NULL,
	[bank_name] [varchar](150) NULL,
	[account_address] [varchar](max) NULL,
	[swift_code] [varchar](100) NULL,
	[student_name] [varchar](250) NULL,
	[student_signature] [varchar](max) NULL,
	[sign_date] [datetime] NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_special_leave_request_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_no] [varchar](250) NULL,
	[student_last_name] [varchar](250) NULL,
	[student_given_name] [varchar](max) NULL,
	[student_full_name] [varchar](max) NULL,
	[email] [varchar](150) NULL,
	[country_code] [varchar](10) NULL,
	[contact_no] [varchar](20) NULL,
	[street_address] [varchar](max) NULL,
	[street_address_line_2] [varchar](max) NULL,
	[city] [varchar](50) NULL,
	[state_region] [varchar](150) NULL,
	[zip] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_student_details_form](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_no] [varchar](250) NULL,
	[student_last_name] [varchar](250) NULL,
	[student_given_name] [varchar](max) NULL,
	[student_full_name] [varchar](max) NULL,
	[email] [varchar](150) NULL,
	[country_code] [varchar](10) NULL,
	[contact_no] [varchar](20) NULL,
	[street_address] [varchar](max) NULL,
	[street_address_line_2] [varchar](max) NULL,
	[city] [varchar](50) NULL,
	[state_region] [varchar](150) NULL,
	[zip] [varchar](50) NULL,
	[country] [varchar](50) NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE [dbo].[tbl_student_request_forms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](10) NULL,
	[first_name] [varchar](100) NULL,
	[last_name] [varchar](100) NULL,
	[gender] [varchar](10) NULL,
	[student_id] [varchar](100) NULL,
	[register_date] [datetime] NULL,
	[residential_adress] [varchar](max) NULL,
	[residential_suburb] [varchar](100) NULL,
	[residential_postcode] [varchar](50) NULL,
	[mailing_adress] [varchar](max) NULL,
	[mailing_suburb] [varchar](350) NULL,
	[mailing_postcode] [varchar](50) NULL,
	[email] [varchar](150) NULL,
	[country_code] [varchar](10) NULL,
	[contact_no] [varchar](20) NULL,
	[request] [varchar](100) NULL,
	[detail] [varchar](max) NULL,
	[documents] [nvarchar](max) NULL,
	[student_signature] [varchar](max) NULL,
	[sign_date] [datetime] NULL,
	[status] [bit] NULL,
	[create_by] [int] NULL,
	[create_date] [datetime] NULL,
	[cmodify_by] [int] NULL,
	[modify_date] [datetime] NULL,
	[delete_by] [int] NULL,
	[delete_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
----------------------------------------
----------------------------------------
----------------------------------------
create TABLE dbo.tbl_release_request_form(
	id int IDENTITY(1,1) NOT NULL,
	student_name varchar(450) NULL,
	std_id varchar(150),
	country varchar(70) NULL,
	passport_no varchar(350),
	dob varchar(30),
	course_enrolled varchar(350),
	intake varchar(30),
	address varchar(max) NULL,
	email varchar(150) NULL,
	country_code varchar(10) NULL,
	contact_no varchar(20) NULL,
	reason_for_release varchar(max) NULL,
	student_signature varchar(max) NULL,
	sign_date varchar(30) NULL,
	status bit NULL,
	create_by int NULL,
	create_date datetime NULL,
	cmodify_by int NULL,
	modify_date datetime NULL,
	delete_by int NULL,
	delete_date datetime NULL
)
----------------------------------------
----------------------------------------
----------------------------------------
create TABLE dbo.tbl_qualification_issuance_form(
	id int IDENTITY(1,1) NOT NULL,
	student_name varchar(450) NULL,
	std_id varchar(150),
	course varchar(150),
	date_request varchar(30),
	documents nvarchar(max),
	status bit NULL,
	create_by int NULL,
	create_date datetime NULL,
	cmodify_by int NULL,
	modify_date datetime NULL,
	delete_by int NULL,
	delete_date datetime NULL
)
----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE dbo.tbl_gst_form
(
    FormID INT IDENTITY(1,1) PRIMARY KEY,
    visa_type NVARCHAR(MAX),      -- e.g., "Tourist|Student"
    visa_from_date NVARCHAR(MAX),  -- e.g., "2023-01-01|2024-05-01"
    visa_expiry_date NVARCHAR(MAX),-- e.g., "2023-12-31|2025-04-30"
    job_titles NVARCHAR(MAX),      -- e.g., "Developer|Analyst"
    job_salaries NVARCHAR(MAX),    -- e.g., "50000|60000"
    job_start_date NVARCHAR(MAX),  -- e.g., "2022-01-01|2023-01-01"
    job_end_date NVARCHAR(MAX),    -- e.g., "2022-12-31|2023-12-31"
    job_current nvarchar(550),  
	has_employee varchar(50),
	currently_employed varchar(500),
	complete_high_school varchar(150),
	highschool varchar(350),
	complete_university_school varchar(150),
	university varchar(350),
	education_qualificaton nvarchar(max),
	level_of_study nvarchar(max),
	study_year nvarchar(max),
	plan_to_fund nvarchar(max),
	total_access_fund varchar(50),
	financial_evidance varchar(max),
	has_course_exp varchar(10),
	course_experience varchar(max),
	has_study_gap varchar(10),
	study_gap nvarchar(max),
	reason_for_australia varchar(max),
	career_goals_australia varchar(max),
	home_country_ties varchar(max),
	australia_family_ties varchar(max),
	post_study_plan varchar(max),
	other_relevant_info varchar(max),

    student_name NVARCHAR(200),
    sign_date DATE,
    signature_img NVARCHAR(MAX),
	status bit NULL,
	create_by int NULL,
	create_date datetime NULL,
	cmodify_by int NULL,
	modify_date datetime NULL,
	delete_by int NULL,
	delete_date datetime NULL
);
----------------------------------------
----------------------------------------
----------------------------------------
create table tbl_course_entrty_form
(
	stu_id int identity(1,1),
	name varchar(200),
	dob datetime,
	phone varchar(15),
	email varchar(50),
	std_id varchar(50),
	interested_course varchar(max),
	hope_from_course varchar(max),
	career_goal varchar(max),
	past_course varchar(max),
	course_experience varchar(max),
	learning_style varchar(max),
	sel_learning_style varchar(max),
 
	learning_material varchar(max),
	learning_material_other varchar(200),
	support_for_course varchar(max),
	other_support varchar(max),
 
	currently_working bit,
	workspace varchar(200),
	updated_cv varchar(max),
	worked_in_industry bit,
	role varchar(100),
	applying_rpl bit,
	other_information varchar(max),
	completed_course bit,
	transcripts varchar(max),
 
	regular_access bit,
	solution_and_strategy varchar(max),
	approx_computer_use varchar(200),
	digital_literacy bit,
	discuss_solution varchar(max),
	score varchar(30),
 
	login_pc varchar(100),
	send_email varchar(100),
	navigate_website varchar(100),
	create_folder varchar(100),
	find_information varchar(100),
	attach_document varchar(100),
	save_emails varchar(100),
	login_on_system varchar(100),
	use_social_media varchar(100),
 
	candidate_suitable bit,
	additional_information bit,
	details varchar(max),
	additional_support varchar(max),
	contain_online_component bit,
	comments varchar(max),
 
	suitable_for_enrolment varchar(max),
	staff_name varchar(100),
	position varchar(100),
	signature varchar(max),
	signature_date datetime,
 
	create_by int,
	create_date datetime,
	modify_by int,
	modify_date datetime,
	delete_by int,
	delete_date datetime,
)
 ----------------------------------------
----------------------------------------
----------------------------------------
create TABLE tbl_contact_us_form(
	id int IDENTITY(1,1) NOT NULL,
	name varchar(450),
	email varchar(350),
	message nvarchar(max),
	status bit,
	create_by int,
	create_date datetime,
	cmodify_by int,
	modify_date datetime,
	delete_by int,
	delete_date datetime
)
 ----------------------------------------
----------------------------------------
----------------------------------------
CREATE TABLE tbl_new_agent_form
(
    agent_id INT IDENTITY(1,1) PRIMARY KEY,
	agency_name        VARCHAR(450),
    agency_location    VARCHAR(500),
    website            VARCHAR(500),
	contact_name       VARCHAR(250),
    contact_email      VARCHAR(350),
    contact_no_code     VARCHAR(5),
	contact_no			VARCHAR(25),
	status             BIT,
	create_by          INT,
    create_date        DATETIME,
	modify_by          INT,
    modify_date        DATETIME,
	delete_by          INT,
    delete_date        DATETIME
)