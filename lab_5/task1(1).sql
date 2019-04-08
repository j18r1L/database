USE lab
GO

SELECT City, Names, Families
FROM CitiesT JOIN PersonT ON PersonT.City_id = CitiesT.City_id
FOR XML AUTO

SELECT City, Names, Families
FROM CitiesT JOIN PersonT ON PersonT.City_id = CitiesT.City_id
FOR XML RAW

SELECT City, Names, Families
FROM CitiesT JOIN PersonT ON PersonT.City_id = CitiesT.City_id
FOR XML PATH

SELECT
	1 AS tag,
	NULL AS parent,
	City_id AS [City!1!ID!element],
	City AS [City!1!CityName!element]
FROM CitiesT
WHERE City_id < 8
FOR XML EXPLICIT, ROOT('City');

SELECT City_id, City
FROM CitiesT
FOR XML PATH, ROOT ('City')