USE lab

SELECT City, Populations,
	CASE Country
	WHEN 'Россия' THEN 'РОДИНАА!!'
	ELSE 'ЗАБУГОР'
	END AS 'Родина???'
FROM CitiesT