USE lab

SELECT City, Country, Populations
FROM CitiesT
WHERE Populations > 9000000
ORDER BY Populations
