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
create PROCEDURE ins_tbl_agents_sp
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
        email,
        status,
        create_by,
        create_date
    )
    SELECT 
        agency_name,
        business_name,
        contact_number,
        email,
        1,           -- status
        @create_by,
        dbo.GetCurrentAUTTime()
    FROM @AgentTable
	select 'ok'
END

----------------------------------------
----------Display Agents---------------
----------------------------------------
CREATE PROCEDURE dis_tbl_agents_sp
AS
BEGIN
   SELECT 
        agent_id,
        agency_name,
        business_name,
        contact_number,
        email,
        status
    FROM 
		tbl_agents
	where 
		status = 1
END
