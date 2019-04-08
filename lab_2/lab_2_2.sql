USE lab

SELECT Nomer_id, Person_id, CountDays
FROM SelledT
WHERE CountDays BETWEEN 5 AND 7
ORDER BY CountDays ASC