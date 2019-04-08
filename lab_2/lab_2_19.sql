UPDATE CitiesT
SET Populations = 
	(
		SELECT MAX(Populations)
		FROM CitiesT
	)
WHERE City_id = 200

SELECT populations
FROM citiesT
WHERE City_id = 200