USE lab

SELECT City_id, City, Populations,
	CASE 
	WHEN Populations < 100000 THEN 'ÄÅÐÅÂÓØÊÀ'
	WHEN Populations < 1000000 THEN 'ÃÎÐÎÄ'
	ELSE 'ÌÅÃÀÏÎËÈÑ'

	END AS 'Òèï ãîðîäà'
FROM CitiesT