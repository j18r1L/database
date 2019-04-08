USE lab

SELECT *
FROM SelledT
WHERE Price > ALL (
	SELECT SelledT.Price
	FROM SelledT
	WHERE Nomer_id BETWEEN 50 AND 60
	)