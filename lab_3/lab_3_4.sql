DROP FUNCTION recurs

CREATE FUNCTION recurs(@i int)
RETURNS int 
AS 
BEGIN 
	DECLARE @count int; 
	SELECT @count = populations
	FROM CitiesT
	If @count > @i 
		set @i = dbo.recurs(@count)
	return @count
END;
GO

print(dbo.recurs(null))