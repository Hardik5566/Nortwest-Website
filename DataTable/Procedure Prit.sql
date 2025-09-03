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
	exec sel_credit_transfer_application_sp @id
END
----------------------------------------
---------select creadit transfer-----------
----------------------------------------
alter PROCEDURE dbo.sel_credit_transfer_application_sp
(
    @id INT 
)
AS
BEGIN
    
       SELECT 
        student_last_name,
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
        status
        FROM dbo.tbl_credit_transfer_application
        WHERE id = @id AND delete_date IS NULL;
END
--------------------------------------------
---------Display creadit transfer-----------
--------------------------------------------
alter PROCEDURE [dbo].dis_credit_transfer_application_sp(	@from_date datetime,	@to_date datetime)ASBEGINselect		student_last_name,
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
    FROM dbo.tbl_qualification_issuance_form
    WHERE 
        status = 1
        AND CAST(create_date AS DATE) BETWEEN CAST(@from_date AS DATE) AND CAST(@to_date AS DATE)
END
