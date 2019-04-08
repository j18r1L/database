INSERT CitiesT (City_id, City, Country, Populations)
SELECT 203, 'Москва_сити1', 'Россия', 
	(
		SELECT AVG(Populations)
		FROM CitiesT
	)
FROM CitiesT