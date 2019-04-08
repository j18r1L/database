--SELECT T.Families, T.City_id
--FROM
--	(
--		SELECT A.Names, A.Families, A.City_id
--		FROM
--			(
--				SELECT PersonT.Names, PersonT.Families, CitiesT.City_id, CitiesT.City
--				FROM PersonT JOIN CitiesT ON PersonT.City_id = CitiesT.City_id
--			) AS A
--	) AS T
--ORDER BY T.Families ASC

--изменить на 3 подзапросов из разных значений

--UPDATE SelledT
--SET Price = 112000
--WHERE Person_id = 704

USE lab
GO

SELECT Names, Families, PersonT.Person_id
FROM PersonT
WHERE PersonT.Person_id IN
	(
	SELECT Person_id
	FROM SelledT
	GROUP BY Person_id
	HAVING SUM(Price) =
		(
		SELECT MAX(SP)
		FROM
			(
			SELECT SUM(Price) AS SP
			FROM SelledT
			GROUP BY Person_id
			) AS CT2
		)
	)
