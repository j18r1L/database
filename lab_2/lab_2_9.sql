USE lab

SELECT City, Populations,
	CASE Country
	WHEN '������' THEN '�������!!'
	ELSE '�������'
	END AS '������???'
FROM CitiesT