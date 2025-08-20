--------------------------------------
----------insert student req----------
--------------------------------------
create proc ins_student_request_forms_sp
(
	@title varchar(10),
	@first_name varchar(100),
	@last_name varchar(100),
	@gender varchar(10),
	@student_id varchar(100),
	@register_date datetime,
	@residentia_adress varchar(max),
	@residentia_suburb varchar(100),
	@residentia_postcode varchar(50),
	@mailing_adress varchar(max),
	@mailing_suburb varchar(350),
	@mailing_postcode varchar(50),
	@email varchar(150),
	@contact_no varchar(20),
	@request varchar(100),
	@detail varchar(max),
	@documents varchar(max),
	@student_signature varchar(max),
	@sign_date datetime,
	@create_by int
	
)
as
begin
	insert into tbl_student_request_forms
	values
	(
		@title,
		@first_name,
		@last_name,
		@gender,
		@student_id,
		@register_date,
		@residentia_adress,
		@residentia_suburb,
		@residentia_postcode,
		@mailing_adress,
		@mailing_suburb,
		@mailing_postcode,
		@email,
		@contact_no,
		@request,
		@detail,
		@documents,
		@student_signature,
		@sign_date,
		1,
		@create_by,
		dbo.get_india_time(),
		null,
		null,
		null,
		null
)
	select 'ok'
end
--------------------------------------
----------insert Change course  forms---
--------------------------------------
CREATE PROCEDURE ins_change_course_form_sp
(
    @student_no VARCHAR(100),
    @student_last_name VARCHAR(100),
    @student_given_name VARCHAR(100),
    @student_full_name VARCHAR(350),
    @email VARCHAR(150),
    @contact_no VARCHAR(20),
    @street_address VARCHAR(MAX),
    @address_line_2 VARCHAR(MAX),
    @city VARCHAR(50),
    @state_region VARCHAR(100),
    @zip VARCHAR(50),
    @country VARCHAR(70),
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_change_course_forms
    VALUES
    (
        @student_no,
        @student_last_name,
        @student_given_name,
        @student_full_name,
        @email,
        @contact_no,
        @street_address,
        @address_line_2,
        @city,
        @state_region,
        @zip,
        @country,
        1,
        @create_by,
        dbo.get_india_time(),  -- assuming get_india_time() is a function to return the current India time
        NULL,                   -- cmodify_by
        NULL,                   -- modify_date
        NULL,                   -- delete_by
        NULL                    -- delete_date
    )
    
    SELECT 'ok'  -- Confirmation message
END
---------------------------------------------
-----insert tbl_new_elicos_orientation_form---
---------------------------------------------
ALTER PROCEDURE [dbo].[ins_tbl_new_elicos_orientation_form_sp]
(
    @student_full_name VARCHAR(350),
    @campus VARCHAR(30),
	@student_id_card nVARCHAR(MAX),
	@email VARCHAR(150),
	@country_code varchar(10),
    @contact_no VARCHAR(20),
    @student_id_no VARCHAR(100),
    @aus_address VARCHAR(MAX),
    @overseas_address VARCHAR(MAX),
    @no_emergency VARCHAR(10),
    @student_issue VARCHAR(50),
    @attendance_week VARCHAR(5),
    @emergency_no VARCHAR(20),
    @problem VARCHAR(30),
    @complete_test VARCHAR(20),
    @student_sign_name VARCHAR(350),
    @student_signature VARCHAR(MAX),
    @create_by INT
)
AS
BEGIN
INSERT INTO tbl_new_elicos_orientation_form 
    VALUES (
        @student_full_name,
		@campus,
		@student_id_card,
		@email,
		@country_code,
		@contact_no,
		@student_id_no,
		@aus_address,
		@overseas_address,
		@no_emergency,
		@student_issue,
		@attendance_week,
		@emergency_no,
		@problem,
		@complete_test,
		@student_sign_name,
		@student_signature,
		1,
        @create_by,
        dbo.get_india_time(),
		null,
		null,
		null,
		null
    )
	
	declare @id int =@@identity

	exec sel_new_elicos_orientation_form_sp @id
END;


----------------------------------------
-----insert Newb Vet Orientation Form---
----------------------------------------
alter procedure ins_new_vet_orientation_form_sp
(
    @studentfullname varchar(350),
    @campus varchar(30),
    @email varchar(150),
    @qualification varchar(max),
    @countrycode varchar(10),
    @contactno varchar(20),
    @studentidno varchar(100),
    @photo nvarchar(max),
    @ausline1 varchar(500),
    @ausline2 varchar(500),
    @auscit varchar(300),
    @ausstate varchar(150),
    @auspostcode varchar(150),
    @overaddline1 varchar(500),
    @overaddline2 varchar(500),
    @overcit varchar(300),
    @overcountry varchar(350),
    @postcode varchar(150),
    @usino varchar(max),
    @lateassignment varchar(70),
    @studentissue varchar(50),
    @seriousinjury varchar(35),
    @studentvisa varchar(50),
    @changecontacttime varchar(50),
    @specialleave varchar(250),
    @academicmisconduct varchar(max),
    @emergencyno varchar(20),
    @studentdeclaration varchar(max),
    @explanation varchar(max),
    @achievements varchar(5),
    @studentsignature nvarchar(max),
    @createby int
	)
as
begin
    insert into tbl_new_vet_orientation_form
	values
    (
        @studentfullname,
        @campus,
        @email,
        @qualification,
        @countrycode,
        @contactno,
        @studentidno,
        @photo,
        @ausline1,
        @ausline2,
        @auscit,
        @ausstate,
        @auspostcode,
        @overaddline1,
        @overaddline2,
        @overcit,
        @overcountry,
        @postcode,
        @usino,
        @lateassignment,
        @studentissue,
        @seriousinjury,
        @studentvisa,
        @changecontacttime,
        @specialleave,
        @academicmisconduct,
        @emergencyno,
        @studentdeclaration,
        @explanation,
        @achievements,
        @studentsignature,
        1,
        @createby,
		dbo.get_india_time(),
		null,
		null,
		null,
		null
    )

	declare @id int =@@identity

	exec sel_new_vet_orientation_form_sp @id
end

----------------------------------------
-----insert Newb Vet Orientation Form---
----------------------------------------
create proc dis_country_sp
as
begin
	select 
		[country_id],
		[country_code],
		[dial_code],
		[name]
	from 
		[tbl_country]
	where
		status=1
end


----------------------------------------
-----insert Newb Vet Orientation Form---
----------------------------------------
--sel_new_vet_orientation_form_sp 1
alter proc sel_new_vet_orientation_form_sp
(
	@id int
)
as
begin
	select 
	student_full_name
	,campus
	,email
	,qulification
	,country_code
	,contact_no
	,student_id_no
	,photo as student_photo
	,aus_line_1
	,aus_line_2
	,aus_cit
	,aus_state
	,aus_post_code
	,over_add_line__1
	,over_add_line__2
	,over_cit as over_city
	,over_country
	,post_code
	,usi_no
	,late_assignment
	,student_issue
	,serious_injury
	,student_visa
	,change_contact_time
	,special_leave
	,academic_misconduct
	,emergency_no
	,student_declaration
	,explanation
	,achievements
	,student_signature as [signature]
	,format(create_date,'dd MMM, yyyy') as [date]
from
	tbl_new_vet_orientation_form
where
	id=@id
end

----------------------------------------
-----sel New elicos Orientation Form---
----------------------------------------
alter proc [dbo].[sel_new_elicos_orientation_form_sp]
(
	@id int
)
as
begin
	select 
	id,
    student_full_name,
    campus,
    student_id_card,
    email,
    country_code,
    contact_no,
    student_id_no,
    aus_address,
    overseas_address,
    police_fire_emergency,
    student_issue,
    attendance_week,
    emergency_no,
    problem,
    complete_test,
    student_sign_name,
    student_signature,
    status,
    create_by,
    create_date
from
	tbl_new_elicos_orientation_form
where
	id=@id
end


----------------------------------------
-----Insert Credit Card Auth Form ---
----------------------------------------
CREATE PROCEDURE ins_credit_card_auth_form
    @stu_number VARCHAR(100),
    @stu_l_name VARCHAR(300),
    @stu_given_name VARCHAR(300),
    @stu_full_name VARCHAR(300),
    @email VARCHAR(100),
    @contact_code VARCHAR(10),
    @contact VARCHAR(15),
    @street_address VARCHAR(1000),
    @address_line2 VARCHAR(100),
    @country VARCHAR(50),
    @city VARCHAR(50),
    @state VARCHAR(50),
    @zip_code VARCHAR(50),    
    @create_by INT
AS
BEGIN


    INSERT INTO tbl_credit_card_auth_form 
   
    VALUES 
    (
        @stu_number, 
		@stu_l_name, 
		@stu_given_name, 
		@stu_full_name, 
		@email, 
		@contact_code, 
        @contact, 
		@street_address, 
		@address_line2, 
		@country, 
		@city, 
		@state, 
		@zip_code, 
		1,
        @create_by, 
		dbo.get_india_time(),
		null,
		null,
		null,
		null
    );
    
    SELECT SCOPE_IDENTITY() AS InsertedID;
END

----------------------------------------
-----Select Credit Card Auth Form---
----------------------------------------
alter proc sel_credit_card_auth_form_sp
(
@id int
)
as
begin

    select 
        id,
        stu_number,
        stu_l_name,
        stu_given_name,
        stu_full_name,
        email,
        contact_code,
        contact,
        street_address,
        address_line2,
        country,
        city,
        state,
        zip_code
    from tbl_credit_card_auth_form
	where
		id = @id
end;




