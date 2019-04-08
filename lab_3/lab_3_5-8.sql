--1
CREATE PROCEDURE param @count int
AS
SELECT City, populations
FROM CitiesT
WHERE populations > @count

EXEC param 9000000
GO
--2
--DROP PROCEDURE Recurs
--CREATE PROCEDURE Recurs (@i int)
--AS BEGIN
--	DECLARE @current int;
--	SELECT @current
--	SET @current = City_id
--	FROM CitiesT
--	WHERE City_id = @current
--	IF @current > @i
--		BEGIN
--		PRINT @i
--		SET @i = @i - 1
--		EXEC Recurs @i
--		END;
--END;
--GO

EXEC Recurs 5
GO
--3
CREATE PROCEDURE Curs @i int 
AS BEGIN
	DECLARE @Cit NVARCHAR(50), @pop int
	DECLARE Cursort CURSOR FOR
		SELECT City, populations
		FROM CitiesT
		WHERE City_id > @i
	OPEN Cursort
	FETCH Cursort INTO @Cit, @pop
	WHILE @@FETCH_STATUS = 0
	BEGIN
		print ' ' + @Cit + str(@pop);
		fetch Cursort INTO @Cit, @pop
	END;
	CLOSE Cursort;
	DEALLOCATE Cursort;
END;
GO

EXEC Curs 5
GO

--4
CREATE PROCEDURE met (@table NVARCHAR(50))
AS
SELECT *
FROM sys.objects
WHERE name = @table
GO

EXEC met CitiesT

