INSERT CitiesT (City_id, City, Country, Populations)
SELECT 203, '������_����1', '������', 
	(
		SELECT AVG(Populations)
		FROM CitiesT
	)
FROM CitiesT