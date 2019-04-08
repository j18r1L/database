CREATE FUNCTION Gets()
RETURNS @Reports TABLE
(
	PersonID int, 
	Names nvarchar(30),
	Nomer_id int,
	Price int
)
AS
BEGIN
	INSERT INTO @Reports
	SELECT PersonT.Person_id, PersonT.Names, SelledT.Nomer_id, SelledT.Price
	FROM PersonT JOIN SelledT ON SelledT.Person_id = PersonT.Person_id
	WHERE SelledT.Price > 20000
RETURN
END
GO

SELECT * 
FROM Gets()
GO