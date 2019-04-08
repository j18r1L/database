USE lab

SELECT Names, Families, Person_id
FROM PersonT
WHERE Person_id IN (
	SELECT Person_id
	FROM SelledT
	WHERE CountDays > 20
)