USE lab

SELECT Names, Families, City_id
FROM PersonT
WHERE Families = '���������' AND EXISTS (
	SELECT CitiesT.City_id
	FROM CitiesT
	WHERE PersonT.City_id  = '20'
	)