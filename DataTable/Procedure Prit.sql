----------------------------------------
--------------insert Course--------------
----------------------------------------
alter PROCEDURE ins_course_sp
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
----------------------------------------
--------------Display Course--------------
----------------------------------------
alter PROCEDURE dis_course_sp
(
	@programme varchar(350)
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
		weeks_holiday,
		status 
	from 
		tbl_course 
	where 
		status = 1
	and programme = @programme
END
----------------------------------------
--------------Display Course--------------
----------------------------------------
create PROCEDURE dis_course_admin_sp
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
----------------------------------------
--------------Delete Course--------------
----------------------------------------
create PROCEDURE del_course_sp
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
----------------------------------------
--------------Delete Course--------------
----------------------------------------
create PROCEDURE sel_course_sp
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
END----------------------------------------
--------------Delete Course--------------
----------------------------------------
create PROCEDURE upd_course_sp
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
----------------------------------------
-----------Insert Tearm Break-----------
----------------------------------------
CREATE PROCEDURE ins_course_intake_termbreak_sp
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
----------------------------------------
--------------Insert Intake-------------
----------------------------------------
CREATE PROCEDURE ins_course_intake_sp
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
----------------------------------------
--------------Dis Calender-------------
----------------------------------------
create proc dis_calender_sp
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
----------------------------------------
--------------Dis Intake-------------
----------------------------------------
alter proc dis_intake_sp
as
begin
	SELECT 
    i.intake_id,
    i.intake_date,
	format(cast(i.intake_date as date),'yyyy') as year
FROM tbl_course_intake i

WHERE i.status = 1
end
----------------------------------------
--------------delete Intake-------------
----------------------------------------
create proc del_intake_sp
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
----------------------------------------
--------------Select Intake-------------
----------------------------------------
alter proc sel_intake_sp
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
----------------------------------------
--------------Insert Intake-------------
----------------------------------------
alter PROCEDURE upd_course_intake_sp
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
----------------------------------------
--------------Dis Intake-------------
----------------------------------------
alter proc dis_intake_tearmbreak_sp
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
----------------------------------------
--------------Select Intake-------------
----------------------------------------
create proc sel_intake_tearmbreak_sp
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
----------------------------------------
-----------Update Tearm Break-----------
----------------------------------------
CREATE PROCEDURE upd_course_intake_termbreak_sp
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
----------------------------------------
-----------Delete Tearm Break-----------
----------------------------------------
CREATE PROCEDURE del_course_intake_termbreak_sp
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
----------------------------------------
--------------Display Course--------------
----------------------------------------
alter PROCEDURE dis_course_source_sp
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
----------------------------------------
-----------insert Public Holiday--------
----------------------------------------
alter proc ins_public_holiday_sp
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
----------------------------------------
-----------Display Public Holiday--------
----------------------------------------
alter PROCEDURE dis_public_holidays_sp
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
----------------------------------------
-----------Update Public Holiday--------
----------------------------------------
alter PROCEDURE upd_public_holiday_sp
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
----------------------------------------
-----------select Public Holiday--------
----------------------------------------
alter PROCEDURE sel_public_holidays_sp
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
----------------------------------------
-----------select Public Holiday--------
----------------------------------------
CREATE PROCEDURE del_public_holidays_sp
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
----------------------------------------
-----------select Public Holiday--------
----------------------------------------
alter PROCEDURE sel_admin_sp
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
----------------------------------------
----------Insert Policies---------------
----------------------------------------
CREATE PROCEDURE ins_policies_sp
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
----------------------------------------
----------Display Policies---------------
----------------------------------------
create proc dis_policies_sp
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
----------------------------------------
----------delete Policies---------------
----------------------------------------
alter proc del_policies_sp
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
----------------------------------------
----------Display Policies---------------
----------------------------------------
create proc sel_policies_sp
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
----------------------------------------
----------Insert Policies---------------
----------------------------------------
CREATE PROCEDURE upd_policies_sp
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
----------------------------------------
----------Insert Agents---------------
----------------------------------------
alter PROCEDURE ins_tbl_agents_sp
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

----------------------------------------
----------Display Agents---------------
----------------------------------------
alter PROCEDURE dis_tbl_agents_sp
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
----------------------------------------
----------Change Campus---------------
----------------------------------------
alter PROCEDURE [dbo].ins_change_of_campus_form_sp
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
----------------------------------------
---------Display Change Campus----------
----------------------------------------
ALTER PROCEDURE [dbo].[dis_change_of_campus_form_sp](	@from_date datetime,	@to_date datetime)ASBEGIN	 SELECT 
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
		format(create_date,'dd MMM, yyyy') as [date]    FROM tbl_change_of_campus_form	where	status=1	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)	END;----------------------------------------
---------Display Change Campus----------
----------------------------------------
create PROCEDURE [dbo].[sel_change_of_campus_form_sp](	@id int)ASBEGIN	 SELECT 
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
		format(create_date,'dd MMM, yyyy') as [date]    FROM tbl_change_of_campus_form	where	status=1	and id=@idEND----------------------------------------
---------Ins Change Course----------
----------------------------------------
alter PROCEDURE ins_change_course_form_sp
(
	@student_name varchar(450),
	@std_id varchar(150),
	@country varchar(70),
	@passport_no varchar(350),
	@dob varchar(30),
	@course_enrolled varchar(350),
	@intake varchar(30),
	@address varchar(max),
	@email varchar(150),
	@country_code varchar(10),
	@contact_no varchar(20),
	@change_course varchar(350),
	@reason_change_course varchar(max),
	@student_signature varchar(max),
	@sign_date varchar(30),
	@create_by int
)
AS
BEGIN
	INSERT INTO dbo.tbl_change_course_forms
	VALUES
	(
		@student_name,
		@std_id,
		@country,
		@passport_no,
		@dob,
		@course_enrolled,
		@intake,
		@address,
		@email,
		@country_code,
		@contact_no,
		@change_course,
		@reason_change_course,
		@student_signature,
		@sign_date,
		1,
		@create_by,
		dbo.GetCurrentAUTTime(),
		null,
		null,
		null,
		null
	)
	declare @id int = @@identity
	exec sel_change_course_forms_sp @id
	
END
----------------------------------------
---------Select Change Course----------
----------------------------------------
alter PROCEDURE sel_change_course_forms_sp
(
    @id int
)
AS
BEGIN
   SELECT 
        id,
        student_name,
        std_id,
        country,
        passport_no,
         format(cast(dob as date),'dd MMM, yyyy') as dob,
        course_enrolled,
         format(cast(intake as date),'dd MMM, yyyy') as intake,
        address,
        email,
        country_code,
        contact_no,
        change_course,
        reason_change_course,
        student_signature,
        format(cast(sign_date as date),'dd MMM, yyyy') as sign_date,
        status
    FROM dbo.tbl_change_course_forms
    WHERE id = @id and status = 1
END
----------------------------------------
---------Display Change Course----------
----------------------------------------
alter PROCEDURE [dbo].[dis_change_course_form_sp]
(
    @from_date DATETIME,
    @to_date DATETIME
)
AS
BEGIN
    SELECT 
        id,
        student_name,
        std_id,
        country,
        passport_no,
        dob,
        course_enrolled,
        intake,
        address,
        email,
        country_code,
        contact_no,
        change_course,
        reason_change_course,
        student_signature,
        FORMAT(cast(sign_date as date), 'dd MMM, yyyy') AS sign_date,
        FORMAT(create_date, 'dd MMM, yyyy') AS [date]
    FROM dbo.tbl_change_course_forms
    WHERE 
        status = 1
        AND CAST(create_date AS DATE) BETWEEN CAST(@from_date AS DATE) AND CAST(@to_date AS DATE)
END;
----------------------------------------
---------Inser Deferment Form-----------
----------------------------------------
alter PROCEDURE [dbo].[ins_application_for_deferment_form_sp]
(
	 @student_name       VARCHAR(450),
    @student_id         VARCHAR(150),
    @birth_date         VARCHAR(30),
    @reason             VARCHAR(MAX),
    @course             VARCHAR(250),
    @course_start       VARCHAR(30),
    @course_end         VARCHAR(30),
    @deferment_start    VARCHAR(30),
    @deferment_end      VARCHAR(30),
    @student_signature  VARCHAR(MAX),
    @sign_date          DATETIME,
    @create_by          INT
	)
AS
BEGIN
    INSERT INTO [dbo].[tbl_application_for_deferment_form]
	VALUES
    (
        @student_name,
        @student_id,
        @birth_date,
        @reason,
        @course,
        @course_start,
        @course_end,
        @deferment_start,
        @deferment_end,
        @student_signature,
        @sign_date,
        1,
        @create_by,
        dbo.GetCurrentAUTTime(),
		null,
		null,
		null,
		null
    )
	declare @id int = scope_identity()
	select 
		id,
		student_name,
		student_id,
		format(cast(birth_date as date),'dd-MM-yyyy') as birth_date,
		reason,
		course,
		format(cast(course_start as date),'dd-MM-yyyy') as course_start,
		format(cast(course_end as date),'dd-MM-yyyy') as course_end,
		format(cast(deferment_start as date),'dd-MM-yyyy') as deferment_start,
		format(cast(deferment_end as date),'dd-MM-yyyy') as deferment_end,
		student_signature,
		format(cast(sign_date as date),'dd-MM-yyyy') as sign_date
		from
			tbl_application_for_deferment_form
		where id = @id and status=1
END 
----------------------------------------
---------Display Deferment Form-----------
----------------------------------------
alter proc [dbo].[dis_application_for_deferment_form_sp]
(	@from_date datetime,	@to_date datetime)
as 
begin
	select 
		id,
		student_name,
		student_id,
		format(cast(birth_date as date),'dd-MM-yyyy') as birth_date,
		reason,
		course,
		format(cast(course_start as date),'dd-MM-yyyy') as course_start,
		format(cast(course_end as date),'dd-MM-yyyy') as course_end,
		format(cast(deferment_start as date),'dd-MM-yyyy') as deferment_start,
		format(cast(deferment_end as date),'dd-MM-yyyy') as deferment_end,
		student_signature,
		format(cast(sign_date as date),'dd-MM-yyyy') as sign_date
		from
			tbl_application_for_deferment_form
			where	status=1	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)end----------------------------------------
---------Insert creadit transfer-----------
----------------------------------------
alter PROCEDURE dbo.ins_credit_transfer_application_sp
(
    @student_last_name    VARCHAR(250) = NULL,
    @title                VARCHAR(50) = NULL,
    @student_given_name   VARCHAR(MAX) = NULL,
    @birth_date           VARCHAR(30) = NULL,
    @street_address       VARCHAR(MAX) = NULL,
    @postcode             VARCHAR(50) = NULL,
    @state_region         VARCHAR(150) = NULL,
    @email                VARCHAR(150) = NULL,
    @country_code         VARCHAR(10) = NULL,
    @contact_no           VARCHAR(20) = NULL,
    @student_id           VARCHAR(150) = NULL,
    @course_code          VARCHAR(150) = NULL,
    @course_title         VARCHAR(350) = NULL,
    @application_date     DATETIME = NULL,
    @unit_codes           VARCHAR(MAX) = NULL,
    @unit_titles          VARCHAR(MAX) = NULL,
    @evidence_supplied    VARCHAR(MAX) = NULL,
    @ct_granted           VARCHAR(MAX) = NULL,
    @student_signature    VARCHAR(MAX) = NULL,
    @sign_date            DATETIME = NULL,
    @student_full_name    VARCHAR(MAX) = NULL,
    @create_by            INT = NULL
)
AS
BEGIN
    INSERT INTO dbo.tbl_credit_transfer_application
    VALUES
    (
        @student_last_name,
        @title,
        @student_given_name,
        @birth_date,
        @street_address,
        @postcode,
        @state_region,
        @email,
        @country_code,
        @contact_no,
        @student_id,
        @course_code,
        @course_title,
        @application_date,
        @unit_codes,
        @unit_titles,
        @evidence_supplied,
        @ct_granted,
        @student_signature,
        @sign_date,
        @student_full_name,
        1,               -- default active status
        @create_by,
        dbo.GetCurrentAUTTime(),
		null,
		null,
		null,
		null
    )
	declare @id int = @@identity
	exec sel_credit_transfer_Report_sp @id
END
 
--------------------------------------------
---------Display creadit transfer-----------
--------------------------------------------
alter PROCEDURE [dbo].dis_credit_transfer_application_sp(	@from_date datetime,	@to_date datetime)ASBEGINselect		id,		student_last_name,
        title,
        student_given_name,
        format(cast(birth_date as date),'dd MMM, yyyy') as birth_date,
        street_address,
        postcode,
        state_region,
        email,
        country_code,
        contact_no,
        student_id,
        course_code,
        course_title,
        format(cast(application_date as date),'dd MMM, yyyy') as application_date,
        unit_codes,
        unit_titles,
        evidence_supplied,
        ct_granted,
        student_signature,
        format(cast(sign_date as date),'dd MMM, yyyy') as sign_date,
        student_full_name,
        status    FROM tbl_credit_transfer_application	where	status=1	and CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)	END;----------------------------------------
---------ins realese form----------
----------------------------------------
alter PROCEDURE ins_release_request_form_sp
(
	@student_name varchar(450),
	@std_id varchar(150),
	@country varchar(70),
	@passport_no varchar(350),
	@dob varchar(30),
	@course_enrolled varchar(350),
	@intake varchar(30),
	@address varchar(max),
	@email varchar(150),
	@country_code varchar(10),
	@contact_no varchar(20),
	@reason_for_release varchar(max),
	@student_signature varchar(max),
	@sign_date varchar(30),
	@create_by int
)
AS
BEGIN
	INSERT INTO dbo.tbl_release_request_form
	VALUES
	(
		@student_name,
		@std_id,
		@country,
		@passport_no,
		@dob,
		@course_enrolled,
		@intake,
		@address,
		@email,
		@country_code,
		@contact_no,
		@reason_for_release,
		@student_signature,
		@sign_date,
		1,
		@create_by,
		dbo.GetCurrentAUTTime(),
		null,
		null,
		null,
		null
	)
	declare @id int = @@identity
	exec sel_release_request_form_sp @id
	
END
----------------------------------------
---------release_request_form----------
----------------------------------------
alter PROCEDURE sel_release_request_form_sp
(
    @id int
)
AS
BEGIN
   SELECT 
        id,
        student_name,
        std_id,
        country,
        passport_no,
         format(cast(dob as date),'dd MMM, yyyy') as dob,
        course_enrolled,
         format(cast(intake as date),'dd MMM, yyyy') as intake,
        address,
        email,
        country_code,
        contact_no,
        reason_for_release,
        student_signature,
        format(cast(sign_date as date),'dd MMM, yyyy') as sign_date,
        status
    FROM dbo.tbl_release_request_form
    WHERE id = @id and status = 1
END
-----------------------------------------------
---------Display release_request_form----------
-----------------------------------------------
alter PROCEDURE [dbo].dis_release_request_form_sp
(
    @from_date DATETIME,
    @to_date DATETIME
)
AS
BEGIN
    SELECT 
        id,
        student_name,
        std_id,
        country,
        passport_no,
        dob,
        course_enrolled,
        intake,
        address,
        email,
        country_code,
        contact_no,
        reason_for_release,
        student_signature,
        FORMAT(cast(sign_date as date), 'dd MMM, yyyy') AS sign_date,
        FORMAT(create_date, 'dd MMM, yyyy') AS [date]
    FROM dbo.tbl_release_request_form
    WHERE 
        status = 1
        AND CAST(create_date AS DATE) BETWEEN CAST(@from_date AS DATE) AND CAST(@to_date AS DATE)
END;
-----------------------------------------------
---------Insert release_request_form----------
-----------------------------------------------
create PROCEDURE ins_qualification_issuance_form_sp
(
    @student_name VARCHAR(450),
    @std_id VARCHAR(150),
    @course VARCHAR(150),
    @date_request VARCHAR(30),
    @documents NVARCHAR(MAX),
    @create_by INT
)
AS
BEGIN
    INSERT INTO dbo.tbl_qualification_issuance_form
    VALUES
    (
        @student_name,
        @std_id,
        @course,
        @date_request,
        @documents,
        1, -- active
        @create_by,
        dbo.GetCurrentAUTTime(),
        NULL,
        NULL,
        NULL,
        NULL
    )

    DECLARE @id INT = @@identity
    EXEC sel_qualification_issuance_form_sp @id
END

-----------------------------------------------
---------Select release_request_form----------
-----------------------------------------------
alter PROCEDURE sel_qualification_issuance_form_sp
(
    @id INT
)
AS
BEGIN
     SELECT 
        id,
        student_name,
        std_id,
        course,
        format(cast(date_request as date),'dd MMM, yyyy' )as date_request,
        documents,
		status
    FROM dbo.tbl_qualification_issuance_form
    WHERE id = @id AND status = 1
END
-----------------------------------------------
---------Display release_request_form----------
-----------------------------------------------
alter PROCEDURE dis_qualification_issuance_form_sp
(
    @from_date DATETIME,
    @to_date DATETIME
)
AS
BEGIN
		SELECT 
			id,
			student_name,
			std_id,
			course,
			format(cast(date_request as date),'dd MMM, yyyy' )as date_request,
			documents,
			FORMAT(create_date, 'dd MMM, yyyy') AS create_date
		FROM 
			dbo.tbl_qualification_issuance_form
		WHERE 
			status = 1
			AND CAST(create_date AS DATE) BETWEEN CAST(@from_date AS DATE) AND CAST(@to_date AS DATE)
END
----------------------------------------
--------------insert Gst--------------
----------------------------------------
alter PROCEDURE dbo.ins_GST_Form
(
    @visa_type NVARCHAR(MAX),
    @visa_from_date NVARCHAR(MAX),
    @visa_expiry_date NVARCHAR(MAX),
    @job_titles NVARCHAR(MAX),
    @job_salaries NVARCHAR(MAX),
    @job_start_date NVARCHAR(MAX),
    @job_end_date NVARCHAR(MAX),
    @job_current NVARCHAR(550),
    @currently_employed VARCHAR(500),
    @highschool VARCHAR(350),
    @university VARCHAR(350),
    @education_qualificaton NVARCHAR(MAX),
    @level_of_study NVARCHAR(MAX),
    @study_year NVARCHAR(MAX),
    @plan_to_fund NVARCHAR(MAX),
    @total_access_fund VARCHAR(50),
    @financial_evidance NVARCHAR(MAX),
    @has_course_exp VARCHAR(10),
    @course_experience NVARCHAR(MAX),
    @has_study_gap VARCHAR(10),
    @study_gap NVARCHAR(MAX),
    @reason_for_australia NVARCHAR(MAX),
    @career_goals_australia NVARCHAR(MAX),
    @home_country_ties NVARCHAR(MAX),
    @australia_family_ties NVARCHAR(MAX),
    @post_study_plan NVARCHAR(MAX),
    @other_relevant_info NVARCHAR(MAX),
    @student_name NVARCHAR(200),
    @sign_date DATE,
    @signature_img NVARCHAR(MAX),
    @create_by INT,
	@has_employee varchar(150),
	@complete_highschool varchar(150),
	@complete_university varchar(150)
)
AS
BEGIN
    INSERT INTO dbo.tbl_gst_form
    VALUES
    (
        @visa_type,
        @visa_from_date,
        @visa_expiry_date,
        @job_titles,
        @job_salaries,
        @job_start_date,
        @job_end_date,
        @job_current,
		@has_employee ,
		@currently_employed,
        @complete_highschool ,
		@highschool,
        @complete_university,
		@university,
        @education_qualificaton,
        @level_of_study,
        @study_year,
        @plan_to_fund,
        @total_access_fund,
        @financial_evidance,
        @has_course_exp,
        @course_experience,
        @has_study_gap,
        @study_gap,
        @reason_for_australia,
        @career_goals_australia,
        @home_country_ties,
        @australia_family_ties,
        @post_study_plan,
        @other_relevant_info,
        @student_name,
        @sign_date,
        @signature_img,
        1,
        @create_by,
        dbo.GetCurrentAUTTime(),
		null,
		null,
		null,
		null
    )
	declare @id int = @@identity
	exec sel_gst_form_sp @id
END
----------------------------------------
--------------Select Gst--------------
----------------------------------------
alter proc sel_gst_form_sp
(
	@id int
)
as
begin
		select		
				FormID,
				visa_type,
				visa_from_date,
				visa_expiry_date,
				job_titles,
				job_salaries,
				job_start_date,
				job_end_date,
				job_current,
				has_employee,
				currently_employed,
				complete_high_school,
				highschool,
				complete_university_school,
				university,
				education_qualificaton,
				level_of_study,
				study_year,
				plan_to_fund,
				total_access_fund,
				financial_evidance,
				has_course_exp,
				course_experience,
				has_study_gap,
				study_gap,
				reason_for_australia,
				career_goals_australia,
				home_country_ties,
				australia_family_ties,
				post_study_plan,
				other_relevant_info,
				student_name,
				format(sign_date ,'dd MMM, yyyy') as sign_date,
				signature_img,
				status

		from
			tbl_gst_form
		where status = 1 and FormID=@id
		
			SELECT 
		t.FormID,
		s.Item AS Salary,
		tt.Item AS JobTitle,
		format(cast(ttt.item as date),'dd MMM, yyyy') as job_start_date,
		format(cast(je.item as date),'dd MMM, yyyy') as job_end_date,
		jc.item  as job_current
		FROM tbl_gst_form t
		CROSS APPLY dbo.SplitString(t.job_salaries + '|', '|') AS s
		CROSS APPLY dbo.SplitString(t.job_titles + '|', '|') AS tt
		cross apply dbo.SplitString(t.job_start_date + '|', '|') AS ttt
		cross apply dbo.SplitString(t.job_end_date + '|', '|') AS je
		cross apply dbo.SplitString(t.job_current + '|', '|') AS jc

	WHERE s.[index] = tt.[index]
	and s.[index] = ttt.[index]
	and s.[index] = je.[index]
	and s.[index] = jc.[index]
	and t.formID=@id


		SELECT 
			t.FormID,
			 vt.Item AS VisaType,
			format(cast(vf.Item as date),'dd MMM, yyyy') AS VisaFromDate,
			format(cast(ve.Item as date),'dd MMM, yyyy')AS VisaExpiryDate
		FROM tbl_gst_form t
			CROSS APPLY dbo.SplitString(t.visa_type + '|', '|') AS vt
			CROSS APPLY dbo.SplitString(t.visa_from_date + '|', '|') AS vf
			CROSS APPLY dbo.SplitString(t.visa_expiry_date + '|', '|') AS ve
		WHERE vt.[index] = vf.[index]
			  AND vt.[index] = ve.[index]
			  and t.FormID =@id

			  SELECT 
    t.formID,
    eq.Item AS EducationQualification,
    ls.Item AS LevelOfStudy,
    sy.Item AS StudyYear
FROM tbl_gst_form t
CROSS APPLY dbo.SplitString(t.education_qualificaton + '|', '|') AS eq
CROSS APPLY dbo.SplitString(t.level_of_study + '|', '|') AS ls
CROSS APPLY dbo.SplitString(t.study_year + '|', '|') AS sy
WHERE eq.[index] = ls.[index]
  AND eq.[index] = sy.[index]
  AND t.formID = @id

end
----------------------------------------
--------------Display Gst--------------
----------------------------------------
create proc dis_gst_form_sp
(
    @from_date DATETIME,
    @to_date DATETIME
)
as
begin
		select		
				FormID,
				has_employee,
				currently_employed,
				complete_high_school,
				highschool,
				complete_university_school,
				university,
				plan_to_fund,
				total_access_fund,
				financial_evidance,
				has_course_exp,
				course_experience,
				has_study_gap,
				study_gap,
				reason_for_australia,
				career_goals_australia,
				home_country_ties,
				australia_family_ties,
				post_study_plan,
				other_relevant_info,
				student_name,
				format(sign_date ,'dd MMM, yyyy') as sign_date,
				signature_img,
				status,
				create_date

		from
			tbl_gst_form
		where status = 1 
			AND CAST(create_date AS DATE) BETWEEN CAST(@from_date AS DATE) AND CAST(@to_date AS DATE)
end
--------------------------------------------------
--------------Select Credit Transfer--------------
--------------------------------------------------
alter PROCEDURE [dbo].[sel_credit_transfer_Report_sp](	@id int)ASBEGIN     SELECT 
		id,
       title,
	   student_given_name,
	   student_last_name,
        format(cast(birth_date as date),'dd MMM, yyyy') as birth_date,
        street_address,
        postcode,
        state_region,
        email,
        (country_code+contact_no) as contact_no,
        student_id,
        course_code,
        course_title,
        format(cast(application_date as date),'dd MMM, yyyy') as application_date,
        student_signature,
        format(cast(sign_date as date),'dd MMM, yyyy') as sign_date,
        student_full_name,
        status
        FROM dbo.tbl_credit_transfer_application	where status=1	and id = @id	exec sel_CT_sp @idEND;--------------------------------------------------
--------------Select Credit Transfer--------------
--------------------------------------------------
alter proc sel_CT_sp
(
	@id int
)
as
begin
	SELECT 
    u.Item AS unit_codes,
    i.Item AS unit_titles,
    t.Item AS evidence_supplied,
    ct.Item as ct_granted
FROM tbl_credit_transfer_application cta
CROSS APPLY dbo.SplitString(cta.unit_titles, '|') AS i
CROSS APPLY dbo.SplitString(cta.evidence_supplied, '|') AS t
CROSS APPLY dbo.SplitString(cta.unit_codes, '|') AS u
cross apply dbo.SplitString(cta.ct_granted, '|') AS ct
WHERE i.[Index] = t.[Index]
  AND i.[Index] = u.[Index]
   AND i.[Index] = ct.[Index]
   and id=@id

end
--------------------------------------------------
--------------Select Course Entry--------------
--------------------------------------------------
ALTER proc [dbo].[print_course_entry_form_sp]
(
@stu_id int
)
as
begin
(
	select 
		stu_id,
		 name,
		 dob,
		 phone,
		 email,
		 std_id,
		 interested_course,
		 hope_from_course,
		 career_goal,
		 past_course,
		 course_experience,
		 learning_style,
		 sel_learning_style,
		 learning_material,
		 learning_material_other,
		 support_for_course,
		 other_support,
		 currently_working,
		 workspace,
		 updated_cv,
		 worked_in_industry,
		 role,
		 applying_rpl,
		 other_information,
		 completed_course,
		 transcripts,
		 regular_access,
		 solution_and_strategy,
		 approx_computer_use,
		 digital_literacy,
		 discuss_solution,
		 score,
		 login_pc,
		 send_email,
		 navigate_website,
		 create_folder,
		 find_information,
		 attach_document,
		 save_emails,
		 login_on_system,
		 use_social_media,
		 candidate_suitable,
		 additional_information,
		 details,
		 additional_support,
		 contain_online_component,
		 comments,
		 suitable_for_enrolment,
		 staff_name,
		 position,
		 signature,
		 format(signature_date , 'dd MMM, yyyy') as signature_date,
		format (create_date ,'dd MMM, yyyy') as create_date
	from 
		tbl_course_entrty_form
	where
		stu_id = @stu_id
)
end
--------------------------------------------------
--------------Insert Course Entry--------------
--------------------------------------------------
create PROCEDURE [dbo].[ins_course_entry_form_sp]
(
    @name varchar(200),
    @dob datetime,
    @phone varchar(15),
    @email varchar(50),
	@std_id varchar(50),
    @interested_course varchar(max),
    @hope_from_course varchar(max),
    @career_goal varchar(max),
    @past_course varchar(max),
    @course_experience varchar(max),
    @learning_style varchar(max),
    @sel_learning_style varchar(max),
    @learning_material varchar(max),
    @learning_material_other varchar(200),
    @support_for_course varchar(max),
    @other_support varchar(max),
    @currently_working bit,
    @workspace varchar(200),
    @updated_cv varchar(max),
    @worked_in_industry bit,
    @role varchar(100),
    @applying_rpl bit,
    @other_information varchar(max),
    @completed_course bit,
    @transcripts varchar(max),
    @regular_access bit,
    @solution_and_strategy varchar(max),
    @approx_computer_use varchar(200),
    @digital_literacy bit,
    @discuss_solution varchar(max),
    @score varchar(30),
    @login_pc varchar(100),
    @send_email varchar(100),
    @navigate_website varchar(100),
    @create_folder varchar(100),
    @find_information varchar(100),
    @attach_document varchar(100),
    @save_emails varchar(100),
    @login_on_system varchar(100),
    @use_social_media varchar(100),
    @candidate_suitable varchar(100),
    @additional_information bit,
    @details varchar(max),
    @additional_support varchar(max),
    @contain_online_component bit,
    @comments varchar(max),
    @suitable_for_enrolment varchar(max),
    @staff_name varchar(100),
    @position varchar(100),
    @signature varchar(max),
	@signature_date datetime
   
)
AS
BEGIN
    INSERT INTO tbl_course_entrty_form
    
    VALUES
    (
        @name,
        @dob,
        @phone,
        @email,
		@std_id,
        @interested_course,
        @hope_from_course,
        @career_goal,
        @past_course,
        @course_experience,
        @learning_style,
        @sel_learning_style,
        @learning_material,
        @learning_material_other,
        @support_for_course,
        @other_support,
        @currently_working,
        @workspace,
        @updated_cv,
        @worked_in_industry,
        @role,
        @applying_rpl,
        @other_information,
        @completed_course,
        @transcripts,
        @regular_access,
        @solution_and_strategy,
        @approx_computer_use,
        @digital_literacy,
        @discuss_solution,
        @score,
        @login_pc,
        @send_email,
        @navigate_website,
        @create_folder,
        @find_information,
        @attach_document,
        @save_emails,
        @login_on_system,
        @use_social_media,
        @candidate_suitable,
        @additional_information,
        @details,
        @additional_support,
        @contain_online_component,
        @comments,
        @suitable_for_enrolment,
        @staff_name,
        @position,
        @signature,
		@signature_date,
        0,
        dbo.getcurrentauttime(),
        NULL,
        NULL,
        NULL,
        NULL
    )
	

	declare @stu_id int = @@identity
	--select @stu_id as stu_id

	exec print_course_entry_form_sp @stu_id

END
--------------------------------------------------
--------------Display Course Entry--------------
--------------------------------------------------
alter proc [dbo].[dis_course_entry_form_sp]
(
    @from_date DATETIME,
    @to_date DATETIME
)
as
begin
(
	select 
		stu_id,
		 name,
		 dob,
		 phone,
		 email,
		 std_id,
		 interested_course,
		 hope_from_course,
		 career_goal,
		 past_course,
		 course_experience,
		 learning_style,
		 sel_learning_style,
		 learning_material,
		 learning_material_other,
		 support_for_course,
		 other_support,
		 currently_working,
		 workspace,
		 updated_cv,
		 worked_in_industry,
		 role,
		 applying_rpl,
		 other_information,
		 completed_course,
		 transcripts,
		 regular_access,
		 solution_and_strategy,
		 approx_computer_use,
		 digital_literacy,
		 discuss_solution,
		 score,
		 login_pc,
		 send_email,
		 navigate_website,
		 create_folder,
		 find_information,
		 attach_document,
		 save_emails,
		 login_on_system,
		 use_social_media,
		 candidate_suitable,
		 additional_information,
		 details,
		 additional_support,
		 contain_online_component,
		 comments,
		 suitable_for_enrolment,
		 staff_name,
		 position,
		 signature,	
		 format(signature_date , 'dd MMM, yyyy') as signature_date,
		format (create_date ,'dd MMM, yyyy') as create_date
	from 
		tbl_course_entrty_form
	where
		 CAST(create_date AS date) between CAST(@from_date AS date) and CAST(@to_date AS date)
)
end
--------------------------------------------------
--------------Insert Agent Application--------------
--------------------------------------------------
alter PROCEDURE ins_agent_app_form_sp
(
    @register_buissness_name VARCHAR(450),
    @trading_name VARCHAR(350),
    @abn VARCHAR(450),
    @proprietor_directors_name VARCHAR(350),
    @year_established VARCHAR(30),
    @website VARCHAR(450),
    @email VARCHAR(550),
    @phone VARCHAR(15),
    @country_code VARCHAR(10),
	@contact varchar(15),
    @address VARCHAR(MAX),
    @postal_address VARCHAR(MAX),
    @employed_agents_names VARCHAR(MAX),
    @services_international_student VARCHAR(80),
    @staff_count VARCHAR(50),
    @staff_name VARCHAR(MAX),
    @service VARCHAR(MAX),
    @fee VARCHAR(MAX),
    @agent_association_details VARCHAR(MAX),
    @referral_origin_countries VARCHAR(MAX),
    @staff_update_plan VARCHAR(MAX),
    @partner_institution_details VARCHAR(MAX),
    @contact_person_name_number VARCHAR(MAX),
    @contact_person_email VARCHAR(MAX),
    @full_name VARCHAR(450),
    @position VARCHAR(450),
    @signature VARCHAR(MAX),
    @signature_date datetime null,
    @create_by INT
)
AS
BEGIN
    INSERT INTO tbl_agent_app_form
    VALUES
    (
        @register_buissness_name,
        @trading_name,
        @abn,
        @proprietor_directors_name,
        @year_established,
        @website,
        @email,
        @phone,
        @country_code,
		@contact,
        @address,
        @postal_address,
        @employed_agents_names,
        @services_international_student,
        @staff_count,
        @staff_name,
        @service,
        @fee,
        @agent_association_details,
        @referral_origin_countries,
        @staff_update_plan,
        @partner_institution_details,
        @contact_person_name_number,
        @contact_person_email,
        @full_name,
        @position,
        @signature,
        @signature_date,
        1,
        @create_by,
        dbo.getcurrentauttime(),
		null,
		null,
		null,
		null
    )
	declare @id int = @@identity
	exec sel_agent_app_form_sp @id
	exec sel_employed_agents_sp @id
	exec sel_staff_name_sp @id
	exec sel_service_fee_sp @id
	exec sel_staff_update_plan_sp @id
	exec sel_agents_association_sp @id
	exec sel_institutes_detail_sp @id
END
--------------------------------------------------
--------------Select Agent Application--------------
--------------------------------------------------
alter PROCEDURE sel_agent_app_form_sp
(
    @agent_id INT
)
AS
BEGIN
    
    SELECT 
        agent_form_id,
        register_buissness_name,
        trading_name,
        abn,
        proprietor_directors_name,
        year_established,
        website,
        email,
        phone,
        country_code,
        contact_no,
        address,
        postal_address,
        services_international_student,
         REPLACE(staff_count, '|', ',') as staff_count,
        referral_origin_countries,
        REPLACE(staff_count, '|', ',') as referral_origin_countries,
        staff_update_plan,
        partner_institution_details,
        contact_person_name_number,
        contact_person_email,
        full_name,
        position,
        signature,
        signature_date,
        status
    FROM tbl_agent_app_form
    WHERE agent_form_id = @agent_id
	and status = 1
END
--------------------------------------------------
--------------Select Employee Agents--------------
--------------------------------------------------
alter proc sel_employed_agents_sp
(
	@id int
)
as
begin 
SELECT 
    t.agent_form_id,
    ea.Item AS employed_agents_names
	FROM 
		tbl_agent_app_form t
	CROSS APPLY dbo.SplitString(t.employed_agents_names + '|', '|') AS ea
		WHERE 
		t.status = 1
    AND t.agent_form_id = @id	
end
--------------------------------------------------
--------------Select Employee Agents--------------
--------------------------------------------------
alter proc sel_staff_name_sp
(
	@id int
)
as
begin 
SELECT 
    t.agent_form_id,
    s.Item AS staff_full_name
FROM 
    tbl_agent_app_form t
CROSS APPLY dbo.SplitString(t.staff_name + '|', '|') AS s
WHERE 
    t.status = 1
    AND t.agent_form_id = @id
ORDER BY 
    t.agent_form_id, 
    s.[Index];
end
--------------------------------------------------
--------------Select Service Fee--------------
--------------------------------------------------
alter proc sel_service_fee_sp
(
	@id int
)
as
begin 
		SELECT 
			t.agent_form_id,
			s.Item AS service,
			f.Item AS fee
		FROM 
			tbl_agent_app_form t
		CROSS APPLY
			dbo.SplitString(t.service + '|', '|') AS s
		CROSS APPLY 
			dbo.SplitString(t.fee + '|', '|') AS f
		WHERE
			t.status = 1
			 AND s.[Index] = f.[Index]  
			 AND t.agent_form_id = @id
		ORDER BY 
			t.agent_form_id,
			s.[Index];
end
--------------------------------------------------
--------------Select Service Fee--------------
--------------------------------------------------
ALTER proc sel_staff_update_plan_sp
(
	@id int
)
as
begin 
	SELECT 
		t.agent_form_id,
		s.Item AS staff_update_plan
	FROM tbl_agent_app_form t
	CROSS APPLY 
			dbo.SplitString(t.staff_update_plan + '|', '|') AS s
	WHERE 
		t.status = 1
	AND 
		t.agent_form_id = @id
	ORDER BY 
		t.agent_form_id, s.[Index]
end
--------------------------------------------------
--------------Select Employee Agents--------------
--------------------------------------------------
alter proc sel_agents_association_sp
(
	@id int
)
as
begin 
	-- Split agent_association_details by '|' and keep index
SELECT 
    t.agent_form_id,
    s.Item AS agent_association_details
FROM tbl_agent_app_form t
CROSS APPLY dbo.SplitString(t.agent_association_details+ '|', '|') AS s
WHERE t.status = 1
  AND t.agent_form_id = @id
ORDER BY t.agent_form_id, s.[Index];

end
--------------------------------------------------
--------------Select Employee Agents--------------
--------------------------------------------------
alter proc sel_institutes_detail_sp
(
	@id int
)
as
begin 
		SELECT 
			t.agent_form_id,
			p.Item AS partner_institution_details,
			c.Item AS contact_person_name_number,
			e.Item AS contact_person_email
		FROM
			tbl_agent_app_form t
		CROSS APPLY 
			dbo.SplitString(t.partner_institution_details+ '|', '|') AS p
		CROSS APPLY 
			dbo.SplitString(t.contact_person_name_number+ '|', '|') AS c
		CROSS APPLY 
			dbo.SplitString(t.contact_person_email+ '|', '|') AS e
		WHERE
			t.status = 1
		  AND p.[Index] = c.[Index]
		  AND p.[Index] = e.[Index]
		  AND t.agent_form_id = @id
		ORDER BY 
			t.agent_form_id, p.[Index];

end
--------------------------------------------------
--------------test Employee Agents--------------
--------------------------------------------------
create proc sel_agent_application_sp
(
	@id int
)
as
begin 
	exec sel_agent_app_form_sp @id
	exec sel_employed_agents_sp @id
	exec sel_staff_name_sp @id
	exec sel_service_fee_sp @id
	exec sel_staff_update_plan_sp @id
	exec sel_agents_association_sp @id
	exec sel_institutes_detail_sp @id
end
--------------------------------------------------
--------------test Employee Agents--------------
--------------------------------------------------
CREATE PROCEDURE dis_agent_application_sp
(
    @from_date DATETIME,
    @to_date   DATETIME
)
AS
BEGIN
   SELECT 
        agent_form_id,
        register_buissness_name,
        trading_name,
        abn,
        proprietor_directors_name,
        full_name,
		register_buissness_name,
		trading_name,
        signature,
        create_date
    FROM tbl_agent_app_form
    WHERE status = 1
      AND CAST(create_date AS DATE) 
          BETWEEN CAST(@from_date AS DATE) AND CAST(@to_date AS DATE);
END
--------------------------------------------------
--------------Insert Contact Us-------------------
--------------------------------------------------
alter PROCEDURE ins_contact_us_form_sp
(
    @name VARCHAR(450),
    @email VARCHAR(350),
    @message NVARCHAR(MAX),
    @create_by INT
)
AS
BEGIN
    
    INSERT INTO tbl_contact_us_form
    VALUES
    (
        @name,
        @email,
        @message,
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
--------------------------------------------------
--------------Display Contact Us-------------------
--------------------------------------------------
alter PROCEDURE dis_contact_us_form_sp
(
    @from_date DATETIME,
    @to_date   DATETIME
)
AS
BEGIN
	SELECT 
        id,
        name,
        email,
        message,
        status,
        create_by,
        create_date
    FROM 
        tbl_contact_us_form
    WHERE 
        status = 1 
		AND CAST(create_date AS DATE) 
          BETWEEN CAST(@from_date AS DATE) AND CAST(@to_date AS DATE);
END
