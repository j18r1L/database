DELETE FROM CitiesT
WHERE City_id IN
	(
		SELECT MAX(City_id)
		FROM CitiesT
	)