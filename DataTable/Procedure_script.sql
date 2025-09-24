USE [nortwest_website]
GO
/****** Object:  StoredProcedure [dbo].[del_course_intake_termbreak_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[del_course_intake_termbreak_sp]
(
	@delete_by INT,
	@id int
)
AS
BEGIN
    update 
		tbl_course_intake_termbreak
	set
		status=0,
		delete_by=@delete_by,
		delete_date=dbo.GetCurrentAUTTime()
	where 
		termbreak_id=@id
    SELECT 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[del_course_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[del_course_sp]
(
	@id int,
	@delete_by int
)
AS
BEGIN
	update
		tbl_course 
	set 
		status = 0, 
		delete_by = @delete_by,
		delete_date = dbo.GetCurrentAUTTime() 
	where 
		course_id = @id
	select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[del_intake_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[del_intake_sp]
(
	@id int,
	@delete_by int
)
as
begin
	update tbl_course_intake
		set status=0,
			delete_by=@delete_by,
			delete_date=dbo.GetCurrentAUTTime()
		where intake_id=@id
	select 'ok'
end
GO
/****** Object:  StoredProcedure [dbo].[del_policies_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[del_policies_sp]
(
	@id int,
	@delete_by int
)
as
begin
	update 
		tbl_policies
	set 
		status = 0,
		delete_by = @delete_by,
		delete_date = dbo.GetCurrentAUTTime()
	where 
		policies_id = @id
	select 'ok'
end
GO
/****** Object:  StoredProcedure [dbo].[del_public_holidays_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[del_public_holidays_sp]
(
	@holiday_id int,
	@delete_by int
)
AS
BEGIN
	update tbl_public_holiday
		set
			status = 0,
			delete_by = @delete_by,
			delete_date=dbo.GetCurrentAUTTime()
		where
		 holiday_id=@holiday_id
		select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[dis_all_form_count_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter proc [dbo].[dis_all_form_count_sp]
as
begin
    SELECT 
        (SELECT COUNT(id) FROM tbl_student_request_forms) AS total_student_request,
        (SELECT COUNT(id) FROM tbl_application_for_deferment_form) AS total_deferment,
        (SELECT COUNT(id) FROM tbl_change_course_forms) AS total_change_course,
        (SELECT COUNT(id) FROM tbl_cancelation_form) AS total_cancellation,
        (SELECT COUNT(id) FROM tbl_special_leave_request_form) AS total_special_leave_request,
        (SELECT COUNT(id) FROM tbl_credit_card_auth_form) AS total_credit_card_authorization,
        (SELECT COUNT(id) FROM tbl_student_details_form) AS total_student_detail,
        (SELECT COUNT(id) FROM tbl_credit_transfer_application) AS total_credit_transfer,
        (SELECT COUNT(id) FROM tbl_application_for_reassessment) AS total_app_for_reassessment,
        (SELECT COUNT(id) FROM tbl_application_for_reassessment) AS total_appeal_form,
        (SELECT COUNT(id) FROM tbl_complaint_and_feedback_form) AS total_complaint,
        (SELECT COUNT(id) FROM tbl_change_of_campus_form) AS total_campus_change,
        (SELECT COUNT(id) FROM tbl_cricos_student_withdrwal_form) AS total_student_withdraw,
        (SELECT COUNT(id) FROM tbl_refund_form) AS total_refund,
        (SELECT COUNT(id) FROM tbl_gte_form) AS total_GTE,
        (SELECT COUNT(ept_form_id) FROM tbl_ept_test_form) AS total_ept,
        (SELECT COUNT(id) FROM tbl_new_elicos_orientation_form) AS total_elicos,
        (SELECT COUNT(id) FROM tbl_new_vet_orientation_form) AS total_vet,
		(SELECT COUNT(id) FROM tbl_release_request_form) AS total_relese_req,
		(SELECT COUNT(id) FROM tbl_qualification_issuance_form) AS total_qualification_issuance,
		(SELECT COUNT(FormID) FROM tbl_gst_form) AS total_gst,
		(SELECT COUNT(stu_id) FROM tbl_course_entrty_form) AS total_course_entry,
		(SELECT COUNT(agent_form_id) FROM tbl_agent_app_form) AS total_agent_form,
		(SELECT COUNT(id) FROM tbl_contact_us_form) AS total_contact_form
end
GO
/****** Object:  StoredProcedure [dbo].[dis_appeal_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[dis_appeal_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
AS
BEGIN

    SELECT 
        id,
         student_no,
		student_last_name,
		student_given_name,
		student_full_name ,
		email ,
		country_code ,
		contact_no ,
		street_address ,
		street_address_line_2 ,
		city ,
		state_region ,
		zip ,
		country ,
		format(create_date,'dd MMM, yyyy') as [date]

    FROM tbl_appeal_form
	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
END;
GO
/****** Object:  StoredProcedure [dbo].[dis_application_for_deferment_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dis_application_for_deferment_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
as 
begin
	select
		id,
		student_name,
		student_id,
		format(deferment_date,'dd-MM-yyyy') as deferment_date,
		course,
		email,
		phone_code,
		phone_no,
		contact_code,
		contact_no,
		format(create_date,'dd-MM-yyyy') as [date]
		from tbl_application_for_deferment_form
			where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
end
GO
/****** Object:  StoredProcedure [dbo].[dis_application_for_reassessment_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[dis_application_for_reassessment_sp]
(
	@from_date datetime,
	@to_date datetime
)
AS
BEGIN

    SELECT 
        id,
         student_no,
		student_last_name,
		student_given_name,
		student_full_name ,
		email ,
		country_code ,
		contact_no ,
		street_address ,
		street_address_line_2 ,
		city ,
		state_region ,
		zip ,
		country ,
		format(create_date,'dd MMM, yyyy') as [date]

    FROM tbl_application_for_reassessment
	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
END;
GO
/****** Object:  StoredProcedure [dbo].[dis_calender_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dis_calender_sp]
as
begin
	select 
		i.course_code,
		i.course_id,
		i.intake_date,
		t.intake_id,
		t.term_break_start,
		t.term_break_end
	from 
		tbl_course_intake as i
	join tbl_course_intake_termbreak as t
		on i.intake_id=t.intake_id
	where
		i.status=1 
	and 
		t.status=1
end
GO
/****** Object:  StoredProcedure [dbo].[dis_cancelation_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dis_cancelation_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
AS
BEGIN

    SELECT 
        id,
         student_no,
		student_last_name,
		student_given_name,
		student_full_name ,
		email ,
		country_code ,
		contact_no ,
		street_address ,
		street_address_line_2 ,
		city ,
		state_region ,
		zip ,
		country ,
		format(create_date,'dd MMM, yyyy') as [date]

    FROM tbl_cancelation_form
	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
END;
GO
/****** Object:  StoredProcedure [dbo].[dis_change_course_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dis_change_course_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
AS
BEGIN

    SELECT 
        id,
         student_no,
		student_last_name,
		student_given_name,
		student_full_name ,
		email ,
		country_code ,
		contact_no ,
		street_address ,
		address_line_2 ,
		city ,
		state_region ,
		zip ,
		country ,
		format(create_date,'dd MMM, yyyy') as [date]

    FROM tbl_change_course_forms
	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
END;
GO
/****** Object:  StoredProcedure [dbo].[dis_change_of_campus_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dis_change_of_campus_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
AS
BEGIN
	 SELECT 
        id,
        std_id,
        passport_no,
        student_name,
        format(cast(date_of_birth as date),'dd MMM,yyyy') as date_of_birth,
        street_address,
        country_code,
        contact_no,
        email,
        course_enrolled,
       format(cast( intake_date as date),'dd MMM,yyyy') as intake_date,
        change_campus,
        current_campus,
        course_name,
        reason_change_course,
        student_signature,
        format(cast( sign_date as date),'dd MMM,yyyy') as sign_date,
        status,
		format(create_date,'dd MMM, yyyy') as [date]

    FROM tbl_change_of_campus_form
	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
END;
GO
/****** Object:  StoredProcedure [dbo].[dis_complaint_and_feedback_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[dis_complaint_and_feedback_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
AS
BEGIN

    SELECT 
        id,
         student_no,
		student_last_name,
		student_given_name,
		student_full_name ,
		email ,
		country_code ,
		contact_no ,
		street_address ,
		street_address_line_2 ,
		city ,
		state_region ,
		zip ,
		country ,
		format(create_date,'dd MMM, yyyy') as [date]

    FROM tbl_Complaint_and_feedback_form
	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
END;
GO
/****** Object:  StoredProcedure [dbo].[dis_country_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dis_country_sp]
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
GO
/****** Object:  StoredProcedure [dbo].[dis_course_admin_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[dis_course_admin_sp]
AS
BEGIN
	select 
		course_id,
		programme,
		course_name,
		course_code,
		cricos_code,
		description,
		flyer,
		total_week,
		study_week,
		weeks_holiday,
		status 
	from 
		tbl_course 
	where 
		status = 1
END
GO
/****** Object:  StoredProcedure [dbo].[dis_course_source_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dis_course_source_sp]
AS
BEGIN
	SELECT 
		course_name,
		(course_code + '-' + CAST(course_id AS varchar)) as course_value
	FROM 
		tbl_course
	WHERE 
	status = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[dis_course_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dis_course_sp]
(
    @programme VARCHAR(350) = NULL
)
AS
BEGIN
    SELECT 
        course_id,
        programme,
        course_name,
        course_code,
        cricos_code,
        description,
        flyer,
        total_week,
        study_week,
        weeks_holiday,
        status
    FROM tbl_course
    WHERE status = 1
      AND (@programme IS NULL OR programme = @programme)
END
GO
/****** Object:  StoredProcedure [dbo].[dis_credit_card_auth_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dis_credit_card_auth_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
AS
BEGIN

    SELECT 
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
        zip_code,
		format(create_date,'dd MMM, yyyy') as [date]

    FROM tbl_credit_card_auth_form
	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
END;
GO
/****** Object:  StoredProcedure [dbo].[dis_credit_transfer_application_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[dis_credit_transfer_application_sp]
(
	@from_date datetime,
	@to_date datetime
)
AS
BEGIN

    SELECT 
        id,
         student_no,
		student_last_name,
		student_given_name,
		student_full_name ,
		email ,
		country_code ,
		contact_no ,
		street_address ,
		street_address_line_2 ,
		city ,
		state_region ,
		zip ,
		country ,
		format(create_date,'dd MMM, yyyy') as [date]

    FROM tbl_credit_transfer_application
	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
END;
GO
/****** Object:  StoredProcedure [dbo].[dis_cricos_student_withdrawal_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dis_cricos_student_withdrawal_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
AS
BEGIN

    SELECT 
        id,
		first_name,
		last_name,
		format(withdraw_date,'dd MMM, yyyy') as withdraw_date,
		student_id,
		current_course,
		subsequent_course,
		reason_for_withdrawal,
		student_signature,
		format(sign_date,'dd MMM, yyyy') as sign_date,
		format(create_date,'dd MMM, yyyy') as [date]

    FROM tbl_cricos_student_withdrwal_form
	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
END;
GO
/****** Object:  StoredProcedure [dbo].[dis_ept_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dis_ept_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
as
begin
select
	  [ept_form_id]
      ,[f_name]
      ,[l_name]
      ,[email]
      ,[std_id_number]
      ,[nationality]
      ,format(date_of_birth,'dd MMM,yyyy') as date_of_birth
      
      ,format(create_date,'dd MMM,yyyy') as [date] 
      
  from
	tbl_ept_test_form
	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
end
GO
/****** Object:  StoredProcedure [dbo].[dis_gte_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[dis_gte_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
as
begin
select 
	id,
	family_name,
	given_name,
	student_id,
	format(birth_date, 'dd-MM-yyyy') as birth_date,
	country,
	
	agent_name, 
	
	agent_email,
format(create_date, 'dd-MM-yyyy') as [date]	
from 
	tbl_gte_form

	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	

end


GO
/****** Object:  StoredProcedure [dbo].[dis_intake_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[dis_intake_sp]
as
begin
	SELECT 
    i.intake_id,
    i.intake_date,
	format(cast(i.intake_date as date),'yyyy') as year
FROM tbl_course_intake i

WHERE i.status = 1
end
GO
/****** Object:  StoredProcedure [dbo].[dis_intake_tearmbreak_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[dis_intake_tearmbreak_sp]
(
	@intake_id int
)
as
begin
	select 
		t.termbreak_id,
		t.intake_id,
		FORMAT(CAST(t.term_break_start AS DATE), 'dd, MMM yyyy') AS term_break_start,
		FORMAT(CAST(t.term_break_end AS DATE), 'dd, MMM yyyy') AS term_break_end,
		t.term_break_end,
		i.intake_date
	from 
		tbl_course_intake_termbreak as t
	join 
		tbl_course_intake as i
	on 
		t.intake_id=i.intake_id
	where 
		t.status=1
	and 
		t.intake_id=@intake_id
end
GO
/****** Object:  StoredProcedure [dbo].[dis_new_elicos_orientation_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dis_new_elicos_orientation_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
as
begin
select 
	id,
	student_id_no,
	student_full_name,
	campus,
	email,
	'+'+country_code+''+contact_no as contact_no,
	format(create_date,'dd MMM, yyyy') as [date]
from
	tbl_new_elicos_orientation_form
where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)

	
end
GO
/****** Object:  StoredProcedure [dbo].[dis_new_vet_orientation_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[dis_new_vet_orientation_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
as
begin
select 
	id,
	student_id_no,
	student_full_name,
	campus,
	email,
	qulification,
	'+'+country_code+''+contact_no as contact_no,
	format(create_date,'dd MMM, yyyy') as [date]
from
	tbl_new_vet_orientation_form
where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
end
GO
/****** Object:  StoredProcedure [dbo].[dis_policies_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dis_policies_sp]
as
begin
	select 
		policies_id,
		policies_name,
		policies_file,
		status
	from 
		tbl_policies
	where 
		status = 1
end
GO
/****** Object:  StoredProcedure [dbo].[dis_public_holidays_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------
CREATE PROCEDURE [dbo].[dis_public_holidays_sp]
AS
BEGIN
	SELECT 
        holiday_id,
        holiday_name,
		format(holiday_date,'dd,MMM yyyy') as holiday_date,
        status
    FROM tbl_public_holiday
    WHERE status = 1
    ORDER BY holiday_date 
END
GO
/****** Object:  StoredProcedure [dbo].[dis_refund_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dis_refund_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
AS
BEGIN

    SELECT 
        id,
		first_name,
		last_name,
		format(birth_date,'dd MMM, yyyy') as birth_date,
		nationality,
		country_code,
		contact_no,
		email,
		format(create_date,'dd MMM, yyyy') as [date]

    FROM tbl_refund_form
	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
END;
GO
/****** Object:  StoredProcedure [dbo].[dis_special_leave_request_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dis_special_leave_request_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
AS
BEGIN

    SELECT 
        id,
       student_no,
	student_last_name,
	student_given_name,
	student_full_name ,
	email ,
	country_code ,
	contact_no,
	street_address ,
	street_address_line_2 ,
	city ,
	state_region ,
	zip ,
	country ,
		format(create_date,'dd MMM, yyyy') as [date]

    FROM tbl_special_leave_request_form
	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
END;
GO
/****** Object:  StoredProcedure [dbo].[dis_student_details_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[dis_student_details_form_sp]
(
	@from_date datetime,
	@to_date datetime
)
AS
BEGIN

    SELECT 
        id,
         student_no,
		student_last_name,
		student_given_name,
		student_full_name ,
		email ,
		country_code ,
		contact_no ,
		street_address ,
		street_address_line_2 ,
		city ,
		state_region ,
		zip ,
		country ,
		format(create_date,'dd MMM, yyyy') as [date]

    FROM tbl_student_details_form
	where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
END;
GO
/****** Object:  StoredProcedure [dbo].[dis_student_request_forms_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[dis_student_request_forms_sp]
(
	@from_date datetime,
	@to_date datetime
)
as 
begin
	select
		id,
		title,
		first_name,
		last_name,
		student_id,
		gender,
		format(register_date,'dd-MM-yyyy') as register_date,
		email,
		country_code,
		contact_no,
		
		format(create_date,'dd-MM-yyyy') as [date]
		from tbl_student_request_forms
			where
	status=1
	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
	
end
GO
/****** Object:  StoredProcedure [dbo].[dis_tbl_agents_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dis_tbl_agents_sp]
AS
BEGIN
   SELECT 
        agent_id,
        agency_name,
        business_name,
        contact_number,
        status
    FROM 
		tbl_agents
	where 
		status = 1
END
GO
/****** Object:  StoredProcedure [dbo].[ins_academic_history_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ins_academic_history_sp]
    @form_id int,
    @course varchar(max),
    @institution varchar(max),
    @academic_year varchar(max),    
    @create_by int
as
begin

    insert into tbl_academic_history 
    select
	@form_id,
    c.item as course,
    i.item as institution,
    y.item as academic_year,
	1,
	@create_by,
	dbo.get_india_time(),
	null,
	null,
	null,
	null
	from
		dbo.SplitString(@course, '|') as c
	join
		dbo.SplitString(@institution, '|') as i
	on i.[index] = c.[index]
	join
		dbo.SplitString(@academic_year, '|') as y
	on y.[index] = c.[index]

end;
GO
/****** Object:  StoredProcedure [dbo].[ins_appeal_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ins_appeal_form_sp]
(
    @student_no VARCHAR(250),
    @student_last_name VARCHAR(250),
    @student_given_name VARCHAR(MAX),
    @student_full_name VARCHAR(MAX),
    @email VARCHAR(150),
    @country_code VARCHAR(10),
    @contact_no VARCHAR(20),
    @street_address VARCHAR(MAX),
    @street_address_line_2 VARCHAR(MAX),
    @city VARCHAR(50),
    @state_region VARCHAR(150),
    @zip VARCHAR(50),
    @country VARCHAR(50),
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_appeal_form 
    
    VALUES 
    (
        @student_no, 
        @student_last_name, 
        @student_given_name, 
        @student_full_name, 
        @email, 
        @country_code, 
        @contact_no, 
        @street_address, 
        @street_address_line_2, 
        @city, 
        @state_region, 
        @zip, 
        @country, 
        1, 
        @create_by, 
        dbo.get_india_time(),
		null,
		null,
		null,
		null
    )
	select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_application_for_deferment_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_application_for_deferment_form_sp]
(
	@student_name varchar(250),
	@student_id varchar(150),
	@deferment_date datetime,
	@course varchar(250),
	@reason varchar(max),
	@enrolment_until varchar(max),
	@address_while_on_leave varchar(max),
	@email varchar(150),
	@phone_code varchar(10),
	@phone_no varchar(20),
	@contact_code varchar(10),
	@contact_no varchar(20),
	@student_signature varchar(max),
	@sign_date datetime,
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_application_for_deferment_form 
	VALUES 
    (
        @student_name, 
        @student_id, 
        @deferment_date, 
        @course, 
        @reason, 
        @enrolment_until, 
        @address_while_on_leave, 
        @email,
		@phone_code,
		@phone_no,
		@contact_code,
		@contact_no,
		@student_signature,
		@sign_date,
        1, -- Assuming active status by default
        @create_by, 
        dbo.get_india_time(), -- Current timestamp for create_date
        NULL, -- Modify_by (initially null)
        NULL, -- Modify_date (initially null)
        NULL, -- Delete_by (initially null)
        NULL  -- Delete_date (initially null)
    )

    

	declare @id int = scope_identity()


	select 
		student_name,
		student_id,
		format(deferment_date,'dd-MM-yyyy') as deferment_date,
		course,
		reason,
		enrolment_until,
		address_while_on_leave,
		email,
		phone_code,
		phone_no,
		contact_code,
		contact_no,
		student_signature,
		format(sign_date,'dd-MM-yyyy') as sign_date
		from
			tbl_application_for_deferment_form
		where id = @id
END 
GO
/****** Object:  StoredProcedure [dbo].[ins_application_for_reassessment_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ins_application_for_reassessment_sp]
(
    @student_no VARCHAR(250),
    @student_last_name VARCHAR(250),
    @student_given_name VARCHAR(MAX),
    @student_full_name VARCHAR(MAX),
    @email VARCHAR(150),
    @country_code VARCHAR(10),
    @contact_no VARCHAR(20),
    @street_address VARCHAR(MAX),
    @street_address_line_2 VARCHAR(MAX),
    @city VARCHAR(50),
    @state_region VARCHAR(150),
    @zip VARCHAR(50),
    @country VARCHAR(50),
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_application_for_reassessment 
    
    VALUES 
    (
        @student_no, 
        @student_last_name, 
        @student_given_name, 
        @student_full_name, 
        @email, 
        @country_code, 
        @contact_no, 
        @street_address, 
        @street_address_line_2, 
        @city, 
        @state_region, 
        @zip, 
        @country, 
        1, 
        @create_by, 
        dbo.get_india_time(),
		null,
		null,
		null,
		null
    )
	select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_cancelation_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ins_cancelation_form_sp]
(
    @student_no VARCHAR(250),
    @student_last_name VARCHAR(250),
    @student_given_name VARCHAR(MAX),
    @student_full_name VARCHAR(MAX),
    @email VARCHAR(150),
    @country_code VARCHAR(10),
    @contact_no VARCHAR(20),
    @street_address VARCHAR(MAX),
    @street_address_line_2 VARCHAR(MAX),
    @city VARCHAR(50),
    @state_region VARCHAR(150),
    @zip VARCHAR(50),
    @country VARCHAR(50),
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_cancelation_form 
    
    VALUES 
    (
        @student_no, 
        @student_last_name, 
        @student_given_name, 
        @student_full_name, 
        @email, 
        @country_code, 
        @contact_no, 
        @street_address, 
        @street_address_line_2, 
        @city, 
        @state_region, 
        @zip, 
        @country, 
        1, 
        @create_by, 
        dbo.get_india_time(),
		null,
		null,
		null,
		null
    )
	select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_change_course_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_change_course_form_sp]
(
    @student_no VARCHAR(100),
    @student_last_name VARCHAR(100),
    @student_given_name VARCHAR(100),
    @student_full_name VARCHAR(350),
    @email VARCHAR(150),
	@country_code varchar(10),
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
		@country_code,
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
GO
/****** Object:  StoredProcedure [dbo].[ins_change_of_campus_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_change_of_campus_form_sp]
(
    @std_id              VARCHAR(150),
    @passport_no         VARCHAR(350),
    @student_name        VARCHAR(MAX),
    @date_of_birth       VARCHAR(30),
    @street_address      VARCHAR(MAX),
    @country_code        VARCHAR(10),
    @contact_no          VARCHAR(20),
    @email               VARCHAR(150),
    @course_enrolled     VARCHAR(450),
    @intake_date         VARCHAR(30),
    @change_campus       VARCHAR(200),
    @current_campus     VARCHAR(200),
    @course_name         VARCHAR(450),
    @reason_change_course VARCHAR(MAX),
    @student_signature   VARCHAR(MAX), 
    @sign_date           varchar(30),
    @create_by           INT
)
AS
BEGIN
    INSERT INTO [dbo].[tbl_change_of_campus_form]
		VALUES
			(
				@std_id,
				@passport_no,
				@student_name,
				@date_of_birth,
				@street_address,
				@country_code,
				@contact_no,
				@email,
				@course_enrolled,
				@intake_date,
				@change_campus,
				@current_campus,
				@course_name,
				@reason_change_course,
				@student_signature,
				@sign_date,
				1, -- Active by default
				@create_by,
				dbo.GetCurrentAUTTime(),
				null,
				null,
				null,
				null
			)
		declare	@id int=@@identity
	exec [dbo].[sel_change_of_campus_form_sp] @id
END
GO
/****** Object:  StoredProcedure [dbo].[ins_complaint_and_feedback_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ins_complaint_and_feedback_form_sp]
(
    @student_no VARCHAR(250),
    @student_last_name VARCHAR(250),
    @student_given_name VARCHAR(MAX),
    @student_full_name VARCHAR(MAX),
    @email VARCHAR(150),
    @country_code VARCHAR(10),
    @contact_no VARCHAR(20),
    @street_address VARCHAR(MAX),
    @street_address_line_2 VARCHAR(MAX),
    @city VARCHAR(50),
    @state_region VARCHAR(150),
    @zip VARCHAR(50),
    @country VARCHAR(50),
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_Complaint_and_feedback_form 
    
    VALUES 
    (
        @student_no, 
        @student_last_name, 
        @student_given_name, 
        @student_full_name, 
        @email, 
        @country_code, 
        @contact_no, 
        @street_address, 
        @street_address_line_2, 
        @city, 
        @state_region, 
        @zip, 
        @country, 
        1, 
        @create_by, 
        dbo.get_india_time(),
		null,
		null,
		null,
		null
    )
	select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_course_intake_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_course_intake_sp]
(
    @intake_date VARCHAR(30),
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_course_intake
	VALUES
    (
        @intake_date,
        1,
        @create_by,
        dbo.GetCurrentAUTTime(),
		null,
		null,
		null,
		null
    )
	SELECT 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_course_intake_termbreak_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_course_intake_termbreak_sp]
(
    @intake_id INT,
    @term_break_start VARCHAR(30),
    @term_break_end VARCHAR(30),
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_course_intake_termbreak
	 VALUES
    (
        @intake_id,
        @term_break_start,
        @term_break_end,
        1,
        @create_by,
        dbo.GetCurrentAUTTime(),
		null,
		null,
		null,
		null
    )

    SELECT 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_course_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_course_sp]
(
    @programme     VARCHAR(350),
    @course_name   VARCHAR(450),
    @course_code   VARCHAR(50),
    @cricos_code   VARCHAR(50),
    @description   VARCHAR(MAX),
    @flyer        NVARCHAR(MAX),
	@total_week int,
	@study_week int,
	@weeks_holiday int,
    @create_by     INT
)
AS
BEGIN
	INSERT INTO tbl_course
	VALUES
    (
        @programme,
        @course_name,
        @course_code,
        @cricos_code,
        @description,
        @flyer,
		@total_week,
		@study_week,
		@weeks_holiday,
        1,
        @create_by,
        dbo.GetCurrentAUTTime(),
		null,
		null,
		null,
		null
    )
	select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_credit_card_auth_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_credit_card_auth_form_sp]
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

	declare @id int = @@identity
	exec sel_credit_card_auth_form_sp @id
END
GO
/****** Object:  StoredProcedure [dbo].[ins_credit_transfer_application_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ins_credit_transfer_application_sp]
(
    @student_no VARCHAR(250),
    @student_last_name VARCHAR(250),
    @student_given_name VARCHAR(MAX),
    @student_full_name VARCHAR(MAX),
    @email VARCHAR(150),
    @country_code VARCHAR(10),
    @contact_no VARCHAR(20),
    @street_address VARCHAR(MAX),
    @street_address_line_2 VARCHAR(MAX),
    @city VARCHAR(50),
    @state_region VARCHAR(150),
    @zip VARCHAR(50),
    @country VARCHAR(50),
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_credit_transfer_application 
    
    VALUES 
    (
        @student_no, 
        @student_last_name, 
        @student_given_name, 
        @student_full_name, 
        @email, 
        @country_code, 
        @contact_no, 
        @street_address, 
        @street_address_line_2, 
        @city, 
        @state_region, 
        @zip, 
        @country, 
        1, 
        @create_by, 
        dbo.get_india_time(),
		null,
		null,
		null,
		null
    )
	select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_cricos_student_withdrawal_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_cricos_student_withdrawal_form_sp]
(
    @first_name VARCHAR(100),
    @last_name VARCHAR(100),
    @withdraw_date DATETIME,
    @student_id VARCHAR(100),
    @current_course VARCHAR(150),
    @subsequent_course VARCHAR(150),
    @reason_for_withdrawal VARCHAR(250),
    @student_signature VARCHAR(MAX),
    @sign_date DATETIME,
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_cricos_student_withdrwal_form 
    VALUES 
    (
        @first_name,
        @last_name,
        @withdraw_date,
        @student_id,
        @current_course,
        @subsequent_course,
        @reason_for_withdrawal,
        @student_signature,
        @sign_date,
        1, 
        @create_by,
        dbo.get_india_time(), 
        NULL,
        NULL,
        NULL,
        NULL 
    )
    
	declare @id int = @@identity
	exec sel_cricos_student_withdrawal_form_sp @id
    SELECT 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_ept_test_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_ept_test_form_sp]
    @f_name VARCHAR(200),
    @l_name VARCHAR(200),
    @email VARCHAR(300),
    @std_id_number VARCHAR(100),
    @nationality VARCHAR(200),
    @date_of_birth DATETIME,
    @passport_no VARCHAR(100),
    @stu_signature VARCHAR(MAX),
    @rb_1_from_france VARCHAR(20),
    @rb_2_how_old VARCHAR(20),
    @rb_3_where VARCHAR(30),
    @rb_4_windows VARCHAR(30),
    @rb_5_man_over VARCHAR(30),
    @rb_6_how_many_student VARCHAR(30),
    @rb_7_name_peter VARCHAR(30),
    @rb_8_artist VARCHAR(30),
    @rb_9_20_desks VARCHAR(30),
    @rb_10_romantic_films VARCHAR(30),
    @rb_11_right_now VARCHAR(30),
    @rb_12_at_school VARCHAR(30),
    @rb_13_piece_of_cake VARCHAR(30),
    @rb_14_living_room VARCHAR(30),
    @rb_15_meat VARCHAR(30),
    @rb_16_buses_late VARCHAR(30),
    @rb_17_to_restaurant VARCHAR(30),
    @rb_18_shopping VARCHAR(30),
    @rb_19_in_the_park VARCHAR(30),
    @rb_20_seen_fireworks VARCHAR(30),
    @rb_21_many_years VARCHAR(30),
    @rb_22_as_soon_as VARCHAR(30),
    @rb_23_lots_of_tourists VARCHAR(30),
    @rb_24_to_speak VARCHAR(30),
    @rb_25_to_cinema VARCHAR(30),
    @rb_26_wasnt_interested VARCHAR(30),
    @rb_27_iam_afraid VARCHAR(30),
    @rb_28_got_driver_licence VARCHAR(30),
    @rb_29_a_little VARCHAR(30),
    @rb_30_on_the_baby VARCHAR(30),
    @rb_31_these_little_things VARCHAR(30),
    @rb_32_ran_into_cofee VARCHAR(30),
    @rb_33_he_won VARCHAR(30),
    @rb_34_to_jane VARCHAR(30),
    @rb_35_is_dinner VARCHAR(30),
    @rb_36_the_flight VARCHAR(30),
    @rb_37_on_the_A2 VARCHAR(30),
    @rb_38_takes_place VARCHAR(30),
    @rb_39_in_the_fight VARCHAR(30),
    @rb_40_part_of_city VARCHAR(30),
    @about_article VARCHAR(200),
    @advantage_eng_learning VARCHAR(300),
    @advantage_stay_country VARCHAR(300),
    @time_money_resourse VARCHAR(300),
    @max_opportunity_for_english VARCHAR(300),
    @advantage_learn_eng_in_country VARCHAR(MAX),
    @learn_english_differ_method VARCHAR(MAX),
    @why_choose_study_english VARCHAR(MAX),
    @summary_of_passage VARCHAR(MAX),
    @who_is_gabi VARCHAR(MAX),
    @fiona_actress VARCHAR(10),
    @where_gabi_boss VARCHAR(MAX),
    @where_fiona_now VARCHAR(MAX),
    @fiona_second_operation VARCHAR(MAX),
    @fiona_mobile_number_is VARCHAR(10),
    @what_happened_to_fiona VARCHAR(MAX),
    @recorded_audio VARCHAR(MAX),    
    @create_by INT   
AS
BEGIN
    INSERT INTO tbl_ept_test_form 
    VALUES (
        @f_name, @l_name, @email, @std_id_number, @nationality, @date_of_birth, @passport_no, @stu_signature,
        @rb_1_from_france, @rb_2_how_old, @rb_3_where, @rb_4_windows, @rb_5_man_over, @rb_6_how_many_student, @rb_7_name_peter, @rb_8_artist,
        @rb_9_20_desks, @rb_10_romantic_films, @rb_11_right_now, @rb_12_at_school, @rb_13_piece_of_cake, @rb_14_living_room, @rb_15_meat, @rb_16_buses_late,
        @rb_17_to_restaurant, @rb_18_shopping, @rb_19_in_the_park, @rb_20_seen_fireworks, @rb_21_many_years, @rb_22_as_soon_as, @rb_23_lots_of_tourists, @rb_24_to_speak,
        @rb_25_to_cinema, @rb_26_wasnt_interested, @rb_27_iam_afraid, @rb_28_got_driver_licence, @rb_29_a_little, @rb_30_on_the_baby, @rb_31_these_little_things, @rb_32_ran_into_cofee,
        @rb_33_he_won, @rb_34_to_jane, @rb_35_is_dinner, @rb_36_the_flight, @rb_37_on_the_A2, @rb_38_takes_place, @rb_39_in_the_fight, @rb_40_part_of_city,
        @about_article, @advantage_eng_learning, @advantage_stay_country, @time_money_resourse, @max_opportunity_for_english, @advantage_learn_eng_in_country,
        @learn_english_differ_method, @why_choose_study_english, @summary_of_passage, @who_is_gabi, @fiona_actress, @where_gabi_boss, @where_fiona_now,
        @fiona_second_operation, @fiona_mobile_number_is, @what_happened_to_fiona, @recorded_audio, 1, @create_by, dbo.get_india_time(),null,null,null,null
    )

	declare @id int = scope_identity()
	exec sel_ept_form_sp @id
END
GO
/****** Object:  StoredProcedure [dbo].[ins_gte_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_gte_form_sp]
(
    @family_name VARCHAR(250),
    @given_name VARCHAR(250),
    @student_id VARCHAR(50),
    @birth_date DATETIME,
    @country VARCHAR(50),
    @citizenship VARCHAR(150),
    @agent_name VARCHAR(250),
    @agent_code VARCHAR(70),
    @agent_email VARCHAR(90),
    @course_selected VARCHAR(MAX),
    @current_add VARCHAR(MAX),
    @marital_status VARCHAR(10),
    @family VARCHAR(5),
    @family_detail VARCHAR(250),
    @health_condition VARCHAR(5),
    @health_conditiondetail VARCHAR(250),
    @refused_visa_aus VARCHAR(5),
    @refused_visa_aus_upd NVARCHAR(250),
    @refused_visa_aus_detail VARCHAR(250),
    @student_visa_other VARCHAR(5),
    @student_visa_other_detail VARCHAR(250),
    @visited_aus_breached VARCHAR(5),
    @doc_evidence_upd NVARCHAR(250),
    @visited_aus_breached_detail VARCHAR(250),
    @apply_admision VARCHAR(5),
    @apply_admision_detail VARCHAR(250),
    @previous_studied VARCHAR(5),
    @previous_studied_detail VARCHAR(250),
    @relatives_aus VARCHAR(5),
    @relatives_aus_detail VARCHAR(250),
    @accommodation_plan VARCHAR(5),
    @accommodation_plan_detail VARCHAR(250),
    @criminal_record VARCHAR(5),
    @criminal_record_detail VARCHAR(250),
    @gaps_education VARCHAR(5),
    @gaps_education_detail VARCHAR(250),
    @undertaken_IELTS VARCHAR(5),
    @undertaken_IELTS_upd NVARCHAR(250),
    @undertaken_IELTS_detail VARCHAR(250),
    @plans_intention_study_aus VARCHAR(MAX),
    @type_of_job VARCHAR(MAX),
    @sort_long_term VARCHAR(MAX),
    @expect_learn VARCHAR(MAX),
    @decide_study_aus VARCHAR(MAX),
    @other_course VARCHAR(MAX),
    @nortwest_institute VARCHAR(MAX),
    @livine_expence VARCHAR(5),
    @detail_familiy VARCHAR(250),
    @lerning_exp VARCHAR(5),
    @lerning_exp_detail NVARCHAR(MAX),
    @course VARCHAR(MAX),
    @change_area_study VARCHAR(MAX),
    @work_desc VARCHAR(5),
    @work_explain NVARCHAR(MAX),
    @planing_while_study NVARCHAR(MAX),
    @term_condition VARCHAR(5),
    @student_signature VARCHAR(MAX),
    @sign_date DATETIME,
    @create_by INT,
	@academic_course varchar(max),
	@academic_institution varchar(max),
	@academic_year varchar(max),
	@job_position varchar(max),
	@job_company varchar(max),
	@job_year varchar(max)
)
AS
BEGIN
    INSERT INTO tbl_gte_form
    VALUES
    (
        @family_name,
        @given_name,
        @student_id,
        @birth_date,
        @country,
        @citizenship,
        @agent_name,
        @agent_code,
        @agent_email,
        @course_selected,
        @current_add,
        @marital_status,
        @family,
        @family_detail,
        @health_condition,
        @health_conditiondetail,
        @refused_visa_aus,
        @refused_visa_aus_upd,
        @refused_visa_aus_detail,
        @student_visa_other,
        @student_visa_other_detail,
        @visited_aus_breached,
        @doc_evidence_upd,
        @visited_aus_breached_detail,
        @apply_admision,
        @apply_admision_detail,
        @previous_studied,
        @previous_studied_detail,
        @relatives_aus,
        @relatives_aus_detail,
        @accommodation_plan,
        @accommodation_plan_detail,
        @criminal_record,
        @criminal_record_detail,
        @gaps_education,
        @gaps_education_detail,
        @undertaken_IELTS,
        @undertaken_IELTS_upd,
        @undertaken_IELTS_detail,
        @plans_intention_study_aus,
        @type_of_job,
        @sort_long_term,
        @expect_learn,
        @decide_study_aus,
        @other_course,
        @nortwest_institute,
        @livine_expence,
        @detail_familiy,
        @lerning_exp,
        @lerning_exp_detail,
        @course,
        @change_area_study,
        @work_desc,
        @work_explain,
        @planing_while_study,
        @term_condition,
        @student_signature,
        @sign_date,
        1,
        @create_by,
        dbo.get_india_time(),
        NULL, 
        NULL,  
        NULL, 
        NULL   
    )
	declare @id int = @@identity
	exec ins_academic_history_sp @id,@academic_course,@academic_institution,@academic_year,@create_by
	exec ins_job_description_sp @id,@job_position,@job_company,@job_year,@create_by

	exec sel_gte_form_sp @id

    SELECT 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_job_description_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ins_job_description_sp]
    @form_id INT,
    @position VARCHAR(MAX),
    @company VARCHAR(MAX),
    @job_year VARCHAR(MAX),    
    @create_by INT
AS
BEGIN

    INSERT INTO tbl_job_description 
    SELECT
        @form_id,
        p.item AS position,
        c.item AS company,
        y.item AS job_year,
        1 AS status,  -- Assuming status is always 1 (active) when inserted.
        @create_by,
        dbo.get_india_time(),
        NULL AS modify_by,
        NULL AS modify_date,
        NULL AS delete_by,
        NULL AS delete_date
    FROM
        dbo.SplitString(@position, '|') AS p
    JOIN
        dbo.SplitString(@company, '|') AS c
    ON
        c.[index] = p.[index]
    JOIN
        dbo.SplitString(@job_year, '|') AS y
    ON
        y.[index] = p.[index]
END;
GO
/****** Object:  StoredProcedure [dbo].[ins_new_vet_orientation_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ins_new_vet_orientation_form_sp]
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
GO
/****** Object:  StoredProcedure [dbo].[ins_policies_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_policies_sp]
(
    @policies_name   VARCHAR(650),
    @policies_file   NVARCHAR(MAX),
    @create_by       INT
)
AS
BEGIN
   INSERT INTO tbl_policies
    VALUES
    (
        @policies_name,
        @policies_file,
        1,
        @create_by,
        dbo.GetCurrentAUTTime(),  
        NULL,        
        NULL,        
        NULL,        
        NULL         
    )

	select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_public_holiday_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ins_public_holiday_sp]
(
	@holiday_name varchar(650),
	@holiday_date DATE,
	@create_by int
)
as
begin
	insert into 
		tbl_public_holiday 
	values
		(
			@holiday_name,
			@holiday_date,
			1,
			@create_by,
			dbo.GetCurrentAUTTime(),
			null,
			null,
			null,
			null
		)
	select 'ok'
end
GO
/****** Object:  StoredProcedure [dbo].[ins_refund_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_refund_form_sp]
(
    @first_name VARCHAR(100),
    @last_name VARCHAR(100),
    @birth_date DATETIME,
    @nationality VARCHAR(50),
    @country_code VARCHAR(10),
    @contact_no VARCHAR(20),
    @email VARCHAR(150),
    @passport_no VARCHAR(150),
    @student_address VARCHAR(MAX),
    @course_detail VARCHAR(MAX),
    @reason_of_refund VARCHAR(MAX),
    @account_hold_name VARCHAR(250),
    @bank_code VARCHAR(100),
    @card_number VARCHAR(150),
    @bank_name VARCHAR(150),
    @account_address VARCHAR(MAX),
    @swift_code VARCHAR(100),
    @student_name VARCHAR(250),
    @student_signature VARCHAR(MAX),
    @sign_date DATETIME,
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_refund_form 
    VALUES 
    (
        @first_name,
        @last_name,
        @birth_date,
        @nationality,
        @country_code,
        @contact_no,
        @email,
        @passport_no,
        @student_address,
        @course_detail,
        @reason_of_refund,
        @account_hold_name,
        @bank_code,
        @card_number,
        @bank_name,
        @account_address,
        @swift_code,
        @student_name,
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
    
	declare @id int = scope_identity()

	exec sel_refund_form_sp @id
END
GO
/****** Object:  StoredProcedure [dbo].[ins_special_leave_request_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ins_special_leave_request_form_sp]
(
    @student_no VARCHAR(250),
    @student_last_name VARCHAR(250),
    @student_given_name VARCHAR(MAX),
    @student_full_name VARCHAR(MAX),
    @email VARCHAR(150),
    @country_code VARCHAR(10),
    @contact_no VARCHAR(20),
    @street_address VARCHAR(MAX),
    @street_address_line_2 VARCHAR(MAX),
    @city VARCHAR(50),
    @state_region VARCHAR(150),
    @zip VARCHAR(50),
    @country VARCHAR(50),
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_special_leave_request_form 
    
    VALUES 
    (
        @student_no, 
        @student_last_name, 
        @student_given_name, 
        @student_full_name, 
        @email, 
        @country_code, 
        @contact_no, 
        @street_address, 
        @street_address_line_2, 
        @city, 
        @state_region, 
        @zip, 
        @country, 
        1, 
        @create_by, 
        dbo.get_india_time(),
		null,
		null,
		null,
		null
    )
	select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_student_details_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ins_student_details_form_sp]
(
    @student_no VARCHAR(250),
    @student_last_name VARCHAR(250),
    @student_given_name VARCHAR(MAX),
    @student_full_name VARCHAR(MAX),
    @email VARCHAR(150),
    @country_code VARCHAR(10),
    @contact_no VARCHAR(20),
    @street_address VARCHAR(MAX),
    @street_address_line_2 VARCHAR(MAX),
    @city VARCHAR(50),
    @state_region VARCHAR(150),
    @zip VARCHAR(50),
    @country VARCHAR(50),
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_student_details_form 
    
    VALUES 
    (
        @student_no, 
        @student_last_name, 
        @student_given_name, 
        @student_full_name, 
        @email, 
        @country_code, 
        @contact_no, 
        @street_address, 
        @street_address_line_2, 
        @city, 
        @state_region, 
        @zip, 
        @country, 
        1, 
        @create_by, 
        dbo.get_india_time(),
		null,
		null,
		null,
		null
    )
	select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_student_request_forms_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ins_student_request_forms_sp]
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
	@country_code varchar(10),
	@contact_no varchar(20),
	@request varchar(100),
	@detail varchar(max),
	@documents nvarchar(max),
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
		@country_code,
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

	declare @id int = scope_identity()
	exec sel_student_request_forms_sp @id
		select 'ok'
end
GO
/****** Object:  StoredProcedure [dbo].[ins_tbl_agents_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_tbl_agents_sp]
(
    @AgentTable AgentTableType READONLY,
	@create_by int
)
AS
BEGIN
    DELETE FROM tbl_agents

    INSERT INTO tbl_agents
    (
        agency_name,
        business_name,
        contact_number,
        status,
        create_by,
        create_date
    )
    SELECT 
        agency_name,
        business_name,
        contact_number,
        1,          
        @create_by,
        dbo.GetCurrentAUTTime()
    FROM @AgentTable
	select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[ins_tbl_new_elicos_orientation_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ins_tbl_new_elicos_orientation_form_sp]
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
GO
/****** Object:  StoredProcedure [dbo].[sel_admin_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sel_admin_sp]
(
	@emil varchar(350),
	@pwd nvarchar(150)
)
AS
BEGIN
	  SELECT 
        admin_id,
        admin_name,
        email,
        mibile_no,
        status
    FROM 
        tbl_admin
    WHERE 
        email = @emil
        AND pwd = @pwd
        AND status = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sel_application_for_deferment_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_application_for_deferment_form_sp]
(
	@id int
)
as 
BEGIN
	select 
		student_name,
		student_id,
		format(deferment_date,'dd-MM-yyyy') as deferment_date,
		course,
		reason,
		enrolment_until,
		address_while_on_leave,
		email,
		phone_code,
		phone_no,
		contact_code,
		contact_no,
		student_signature,
		format(sign_date,'dd-MM-yyyy') as sign_date
	from
			tbl_application_for_deferment_form
	where id = @id
end;
GO
/****** Object:  StoredProcedure [dbo].[sel_change_of_campus_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sel_change_of_campus_form_sp]
(
	@id int
)
AS
BEGIN
	 SELECT 
        id,
        std_id,
        passport_no,
        student_name,
        format(cast(date_of_birth as date),'dd MMM,yyyy') as date_of_birth,
        street_address,
        country_code,
        contact_no,
        email,
        course_enrolled,
       format(cast( intake_date as date),'dd MMM,yyyy') as intake_date,
        change_campus,
        current_campus,
        course_name,
        reason_change_course,
        student_signature,
        format(cast( sign_date as date),'dd MMM,yyyy') as sign_date,
        status,
		format(create_date,'dd MMM, yyyy') as [date]

    FROM tbl_change_of_campus_form
	where
	status=1
	and id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sel_course_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sel_course_sp]
(
	@id int
)
AS
BEGIN
	select 
		course_id,
		programme,
		course_name,
		course_code,
		cricos_code,
		description,
		flyer,
		total_week,
		study_week,
		weeks_holiday 
	from 
		tbl_course
	where 
		status=1 
	and 
		course_id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sel_credit_card_auth_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sel_credit_card_auth_form_sp]
(
@id int
)
AS
BEGIN

    SELECT 
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
    FROM tbl_credit_card_auth_form
	where
		id = @id
END;
GO
/****** Object:  StoredProcedure [dbo].[sel_cricos_student_withdrawal_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_cricos_student_withdrawal_form_sp]
(
	@id int
)
as 
begin
	select
		first_name,
		last_name,
		format(withdraw_date,'dd-MM-yyyy') as withdraw_date,
		student_id,
		current_course,
		subsequent_course,
		reason_for_withdrawal,
		student_signature,
		format(sign_date,'dd-MM-yyyy') as sign_date
		from tbl_cricos_student_withdrwal_form
			where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sel_ept_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_ept_form_sp]
(
	@id int
)
as
begin
select
	  [ept_form_id]
      ,[f_name]
      ,[l_name]
      ,[email]
      ,[std_id_number]
      ,[nationality]
      ,format(date_of_birth,'dd MMM,yyyy') as date_of_birth
      ,[passport_no]
      ,[stu_signature]
      ,[rb_1_from_france]
      ,[rb_2_how_old]
      ,[rb_3_where]
      ,[rb_4_windows]
      ,[rb_5_man_over]
      ,[rb_6_how_many_student]
      ,[rb_7_name_peter]
      ,[rb_8_artist]
      ,[rb_9_20_desks]
      ,[rb_10_romantic_films]
      ,[rb_11_right_now]
      ,[rb_12_at_school]
      ,[rb_13_piece_of_cake]
      ,[rb_14_living_room]
      ,[rb_15_meat]
      ,[rb_16_buses_late]
      ,[rb_17_to_restaurant]
      ,[rb_18_shopping]
      ,[rb_19_in_the_park]
      ,[rb_20_seen_fireworks]
      ,[rb_21_many_years]
      ,[rb_22_as_soon_as]
      ,[rb_23_lots_of_tourists]
      ,[rb_24_to_speak]
      ,[rb_25_to_cinema]
      ,[rb_26_wasnt_interested]
      ,[rb_27_iam_afraid]
      ,[rb_28_got_driver_licence]
      ,[rb_29_a_little]
      ,[rb_30_on_the_baby]
      ,[rb_31_these_little_things]
      ,[rb_32_ran_into_cofee]
      ,[rb_33_he_won]
      ,[rb_34_to_jane]
      ,[rb_35_is_dinner]
      ,[rb_36_the_flight]
      ,[rb_37_on_the_A2]
      ,[rb_38_takes_place]
      ,[rb_39_in_the_fight]
      ,[rb_40_part_of_city]
      ,[about_article]
      ,[advantage_eng_learning]
      ,[advantage_stay_country]
      ,[time_money_resourse]
      ,[max_opportunity_for_english]
      ,[advantage_learn_eng_in_country]
      ,[learn_english_differ_method]
      ,[why_choose_study_english]
      ,[summary_of_passage]
      ,[who_is_gabi]
      ,[fiona_actress]
      ,[where_gabi_boss]
      ,[where_fiona_now]
      ,[fiona_second_operation]
      ,[fiona_mobile_number_is]
      ,[what_happened_to_fiona]
      ,[recorded_audio]
      ,[status]
      ,[create_by]
      ,[create_date]
	  ,'success1.jpg' as true_ans
	  ,'cross1.jpg' as false_ans
      
  from
	tbl_ept_test_form
	where ept_form_id = @id

	SELECT 
    e.ept_form_id,     
    SUM(
        CASE WHEN e.rb_1_from_france = a.rb_1_from_france THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_2_how_old = a.rb_2_how_old THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_3_where = a.rb_3_where THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_4_windows = a.rb_4_windows THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_5_man_over = a.rb_5_man_over THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_6_how_many_student = a.rb_6_how_many_student THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_7_name_peter = a.rb_7_name_peter THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_8_artist = a.rb_8_artist THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_9_20_desks = a.rb_9_20_desks THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_10_romantic_films = a.rb_10_romantic_films THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_11_right_now = a.rb_11_right_now THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_12_at_school = a.rb_12_at_school THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_13_piece_of_cake = a.rb_13_piece_of_cake THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_14_living_room = a.rb_14_living_room THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_15_meat = a.rb_15_meat THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_16_buses_late = a.rb_16_buses_late THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_17_to_restaurant = a.rb_17_to_restaurant THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_18_shopping = a.rb_18_shopping THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_19_in_the_park = a.rb_19_in_the_park THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_20_seen_fireworks = a.rb_20_seen_fireworks THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_21_many_years = a.rb_21_many_years THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_22_as_soon_as = a.rb_22_as_soon_as THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_23_lots_of_tourists = a.rb_23_lots_of_tourists THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_24_to_speak = a.rb_24_to_speak THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_25_to_cinema = a.rb_25_to_cinema THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_26_wasnt_interested = a.rb_26_wasnt_interested THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_27_iam_afraid = a.rb_27_iam_afraid THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_28_got_driver_licence = a.rb_28_got_driver_licence THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_29_a_little = a.rb_29_a_little THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_30_on_the_baby = a.rb_30_on_the_baby THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_31_these_little_things = a.rb_31_these_little_things THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_32_ran_into_cofee = a.rb_32_ran_into_cofee THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_33_he_won = a.rb_33_he_won THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_34_to_jane = a.rb_34_to_jane THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_35_is_dinner = a.rb_35_is_dinner THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_36_the_flight = a.rb_36_the_flight THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_37_on_the_A2 = a.rb_37_on_the_A2 THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_38_takes_place = a.rb_38_takes_place THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_39_in_the_fight = a.rb_39_in_the_fight THEN 0.5 ELSE 0 END +
        CASE WHEN e.rb_40_part_of_city = a.rb_40_part_of_city THEN 0.5 ELSE 0 END +
		case when e.about_article = a.about_article then 1 else 0 end +
		case when e.advantage_eng_learning = a.advantage_eng_learning then 1 else 0 end +
		case when e.advantage_stay_country = a.advantage_stay_country then 1 else 0 end +
		case when e.time_money_resourse = a.time_money_resourse then 1 else 0 end +
		case when e.max_opportunity_for_english = a.max_opportunity_for_english then 1 else 0 end
    ) AS score
FROM tbl_ept_test_form AS e
CROSS JOIN tbl_ept_answer AS a  
where ept_form_id = @id
GROUP BY e.ept_form_id


end
GO
/****** Object:  StoredProcedure [dbo].[sel_gte_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sel_gte_form_sp]
(
@id int
)
as
begin
select 
	id,
	family_name,
	given_name,
	student_id,
	format(birth_date, 'dd-MM-yyyy') as birth_date,
	country,
	citizenship,
	agent_name, 
	agent_code, 
	agent_email,
	course_selected,
	current_add,
	marital_status,
	family,
	family_detail,
	health_condition,
	health_conditiondetail,
	refused_visa_aus,
	refused_visa_aus_upd,
	refused_visa_aus_detail,
	student_visa_other,
	student_visa_other_detail,
	visited_aus_breached,
	doc_evidence_upd,
	visited_aus_breached_detail,
	apply_admision,
	apply_admision_detail,
	previous_studied,
	previous_studied_detail,
	relatives_aus,
	relatives_aus_detail,
	accommodation_plan,
	accommodation_plan_detail,
	criminal_record,
	criminal_record_detail,
	gaps_education,
	gaps_education_detail,
	undertaken_IELTS,
	undertaken_IELTS_upd,
	undertaken_IELTS_detail,
	plans_intention_study_aus,
	type_of_job,
	sort_long_term,
	expect_learn,
	decide_study_aus,
	other_course,
	nortwest_institute,
	livine_expence,
	detail_familiy,
	lerning_exp,
	lerning_exp_detail,
	course,
	change_area_study,
	work_desc,
	work_explain,
	planing_while_study,
	term_condition,
	student_signature,
	format(sign_date, 'dd-MM-yyyy') as sign_date,
	create_date
from 
	tbl_gte_form
where
	id = @id

	select 
		a.id,
		form_id,
		a.course as academic_course,
		a.institution,
		a.academic_year 
	from 
		tbl_gte_form as g 
	join 
		tbl_academic_history as a 
	on 
		g.id = a.form_id
	where
		g.id = @id

	select 
		j.id,
		j.form_id, 
		j.position,
		j.company,
	CAST(j.job_year as int) as job_year
	from 
		tbl_gte_form as g 
	join 
		tbl_job_description as j 
	on 
		g.id = j.form_id
	where
		g.id = @id
end

GO
/****** Object:  StoredProcedure [dbo].[sel_intake_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_intake_sp]
(
	@id int
)
as
begin
	select 
		intake_id,
		intake_date
	from 
		tbl_course_intake
	where
		status=1
	and intake_id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[sel_intake_tearmbreak_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sel_intake_tearmbreak_sp]
(
	@id int
)
as
begin
	select 
		termbreak_id,
		intake_id,
		term_break_start,
		term_break_end
	from 
		tbl_course_intake_termbreak
	where 
		status=1
	and
		termbreak_id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sel_new_elicos_orientation_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_new_elicos_orientation_form_sp]
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
GO
/****** Object:  StoredProcedure [dbo].[sel_new_vet_orientation_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_new_vet_orientation_form_sp]
(
	@id int
)
as
begin
	select 
		id,
		student_full_name,
		campus,
		email,
		qulification,
		country_code,
		contact_no,
		student_id_no,
		photo as student_photo,
		aus_line_1,
		aus_line_2,
		aus_cit,
		aus_state,
		aus_post_code,
		over_add_line__1,
		over_add_line__2,
		over_cit as over_city,
		over_country,
		post_code,
		usi_no,
		late_assignment,
		student_issue,
		serious_injury,
		student_visa,
		change_contact_time,
		special_leave,
		academic_misconduct,
		emergency_no,
		student_declaration,
		explanation,
		achievements,
		student_signature as [signature],
		format(create_date,'dd MMM, yyyy') as [date]
from
	tbl_new_vet_orientation_form
where
	id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[sel_policies_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sel_policies_sp]
(
	@id int
)
as
begin
	select 
		policies_id,
		policies_name,
		policies_file,
		status
	from 
		tbl_policies
	where 
		status = 1
	and policies_id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[sel_public_holidays_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sel_public_holidays_sp]
(
	@holiday_id int
)
AS
BEGIN
	SELECT 
        holiday_id,
        holiday_name,
      CAST(holiday_date AS DATE) as holiday_date,
        status
    FROM tbl_public_holiday
    WHERE status = 1
		and holiday_id=@holiday_id
END
GO
/****** Object:  StoredProcedure [dbo].[sel_refund_form_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_refund_form_sp]
(
	@id int
)
as
begin
	select 
		first_name,
		last_name,
		format(birth_date,'dd-MM-yyyy') as birth_date,
		nationality,
		country_code,
		contact_no,
		email,
		passport_no,
		student_address,
		course_detail,
		reson_of_refund,
		account_hold_name,
		bank_code,
		card_number,
		bank_name,
		account_address,
		swift_code,
		student_name,
		student_signature,
		format(sign_date,'dd-MM-yyyy') as sign_date 
	from tbl_refund_form
	where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[sel_student_request_forms_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sel_student_request_forms_sp]
(
	@id int
)
as 
begin
	select
		id,
		title,
		first_name,
		last_name,
		gender,
		student_id,
		register_date,
		residential_adress,
		residential_suburb,
		residential_postcode,
		mailing_adress,
		mailing_suburb,
		mailing_postcode,
		email,
		country_code,
		contact_no,
		request,
		detail,
		documents,
		student_signature,
		format(sign_date,'dd-MM-yyyy') as sign_date
		from tbl_student_request_forms
			where id=@id
				and status=1
end
GO
/****** Object:  StoredProcedure [dbo].[upd_course_intake_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[upd_course_intake_sp]
(
    @intake_date VARCHAR(30),
    @modify_by INT,
	@intake_id int
)
AS
BEGIN
    update 
		tbl_course_intake 
	set
		intake_date=@intake_date,
		modify_by=@modify_by,
		modify_date=dbo.GetCurrentAUTTime()
	where intake_id=@intake_id
	SELECT 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[upd_course_intake_termbreak_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[upd_course_intake_termbreak_sp]
(
    @intake_id INT,
    @term_break_start VARCHAR(30),
    @term_break_end VARCHAR(30),
    @modify_by INT,
	@id int
)
AS
BEGIN
    update 
		tbl_course_intake_termbreak
	set
		intake_id=@intake_id,
		term_break_start=@term_break_start,
		term_break_end=@term_break_end,
		modify_by=@modify_by,
		modify_date=dbo.GetCurrentAUTTime()
	where 
		termbreak_id=@id
    SELECT 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[upd_course_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[upd_course_sp]
(
	@id int,
	@programme varchar(350),
	@course_name varchar(450),
	@course_code varchar(50),
	@cricos_code varchar(50),
	@description varchar(max),
	@flyer nvarchar(max),
	@total_week int,
	@study_week int,
	@weeks_holiday int,
	@modify_by int
)
AS
BEGIN
	update 
		tbl_course
	set 
		programme=@programme,
		course_code=@course_code,
		course_name=@course_name,
		cricos_code=@cricos_code,
		description=@description,
		flyer=@flyer,
		total_week=@total_week,
		study_week=@study_week,
		weeks_holiday=@weeks_holiday,
		modify_by=@modify_by,
		modify_date=@modify_by
	where 
		course_id=@id
	select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[upd_policies_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[upd_policies_sp]
(
	@id int,
    @policies_name   VARCHAR(650),
    @policies_file   NVARCHAR(MAX),
    @modify_by       INT
)
AS
BEGIN
   update
		tbl_policies 
	set
		policies_name = @policies_name,
		policies_file = @policies_file,
		modify_by = @modify_by,
		modify_date = dbo.GetCurrentAUTTime()
	where 
		policies_id = @id

	select 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[upd_public_holiday_sp]    Script Date: 01-09-2025 18:47:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[upd_public_holiday_sp]
(
    @holiday_id INT ,
    @holiday_name VARCHAR(650),
    @holiday_date DATE,
    @modify_by INT
)
AS
BEGIN
    UPDATE tbl_public_holiday
        SET
            holiday_name = @holiday_name,
            holiday_date = @holiday_date,
            modify_by = @modify_by,
            modify_date = dbo.GetCurrentAUTTime()
        WHERE holiday_id = @holiday_id
	select 'ok'
END
GO
