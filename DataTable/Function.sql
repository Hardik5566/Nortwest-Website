CREATE FUNCTION get_india_time()
RETURNS DATETIME
AS
BEGIN
    -- Add 2 hours and 15 minutes to the current UTC time
    RETURN  DATEADD(MINUTE, 30, DATEADD(HOUR, 5, GETUTCDATE()));
END;
GO

