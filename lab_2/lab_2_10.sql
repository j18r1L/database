USE lab

SELECT City_id, City, Populations,
	CASE 
	WHEN Populations < 100000 THEN '���������'
	WHEN Populations < 1000000 THEN '�����'
	ELSE '���������'

	END AS '��� ������'
FROM CitiesT