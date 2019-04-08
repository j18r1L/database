USE lab
GO

IF OBJECT_ID (N'dbo.TablF', N'FN') IS NOT NULL
	DROP FUNCTION dbo.tablF
GO

CREATE FUNCTION dbo.TablF()
RETURNS TABLE
AS
	RETURN (SELECT PersonT.Names, PersonT.Families, SelledT.Nomer_id
		FROM SelledT INNER JOIN PersonT ON PersonT.Person_id = SelledT.Person_id)
GO

SELECT *
FROM dbo.TablF()
GO