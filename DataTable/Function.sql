CREATE FUNCTION get_india_time()
RETURNS DATETIME
AS
BEGIN
    -- Add 2 hours and 15 minutes to the current UTC time
    RETURN  DATEADD(MINUTE, 30, DATEADD(HOUR, 5, GETUTCDATE()));
END;
GO


 ----------------------------------------
-------------Select new agent----------------
----------------------------------------
CREATE FUNCTION dbo.fn_CleanID(@val NVARCHAR(100))
RETURNS NVARCHAR(100)
AS
BEGIN
    RETURN TRIM(CHAR(9) + CHAR(10) + CHAR(13) + CHAR(32) + CHAR(160) FROM @val)
END
