USE lab

SELECT DISTINCT CitiesT.City_id, CitiesT.City, 
	(
	SELECT DISTINCT COUNT(PersonT.Person_id)
	FROM PersonT
	WHERE PersonT.City_id = CitiesT.City_id
	) AS Popularit
FROM CitiesT JOIN PersonT ON PersonT.City_id = CitiesT.City_id

