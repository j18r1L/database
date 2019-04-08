USE lab

SELECT City, Country, Populations
FROM CitiesT
WHERE Populations > 9000000
ORDER BY Populations

SELECT Nomer_id, Person_id, CountDays
FROM SelledT
WHERE CountDays BETWEEN 5 AND 7
ORDER BY CountDays ASC

SELECT Names, Families
FROM PersonT
WHERE Names LIKE 'Ì%'

