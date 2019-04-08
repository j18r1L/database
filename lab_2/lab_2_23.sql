USE lab
GO

CREATE TABLE dbo.TabT
(
	Person_id int NOT NULL,
	Names VARCHAR(50) NOT NULL,
	Families VARCHAR(50) NOT NULL,
	Nomer int NOT NULL,
	City VARCHAR(50) NOT NULL
	CONSTRAINT PK_TabT PRIMARY KEY CLUSTERED (Person_id ASC)
);
GO

INSERT INTO dbo.TabT VALUES (0, 'Иван', 'Васильенков', 101, 'Москва')
GO

WITH ReportsT(Person_id)
AS
(
	SELECT SelledT.Person_id
	FROM SelledT
	WHERE CountDays > 20

	UNION ALL

	SELECT TabT.Person_id
	FROM TabT JOIN SelledT ON TabT.Person_id = SelledT.Person_id
	WHERE City = 'Москва'
)

SELECT *
FROM ReportsT