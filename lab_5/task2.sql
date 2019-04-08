CREATE TABLE nCities
( 
	City_id int, 
	City nvarchar(50),
	Country nvarchar(50),
) 
GO


DECLARE @idoc int
DECLARE @doc xml
SELECT @doc = c FROM OPENROWSET(BULK 'C:\Users\Марк\Documents\SQL Server Management Studio\lab5\cities.xml', SINGLE_BLOB) AS TEMP(c)
EXEC sp_xml_preparedocument @idoc OUTPUT, @doc

 

INSERT INTO nCities(City_id,City,Country) 
SELECT City_id, City, Country
FROM OPENXML (@idoc, 'Cities/row',2)
WITH (City_id int, City nvarchar(50), Country nvarchar(50))
GO

SELECT *
FROM nCities

EXEC sp_xml_preparedocument @idoc
GO