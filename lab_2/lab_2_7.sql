USE lab

SELECT AVG(Price) AS аvgИван
FROM SelledT JOIN PersonT ON SelledT.Person_id = PersonT.Person_id
WHERE PersonT.Names = 'Иван'

SELECT AVG(Price) AS аvgСерега
FROM SelledT JOIN PersonT ON SelledT.Person_id = PersonT.Person_id
WHERE PersonT.Names = 'Серега'

SELECT AVG(Price) AS аvgМаша
FROM SelledT JOIN PersonT ON SelledT.Person_id = PersonT.Person_id
WHERE PersonT.Names = 'Маша'