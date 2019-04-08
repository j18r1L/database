USE master
CREATE DATABASE RK
GO

USE RK

CREATE TABLE ZverT
(  Zver_id int NOT NULL,
	Sreda_id int NOT NULL,
	Class_id int NOT NULL,
   Names VARCHAR(50) NOT NULL,
   Open_name VARCHAR(50) NOT NULL,
   Open_date DATE NOT NULL,
);
GO

CREATE TABLE ClassT
(  Class_id int NOT NULL,
   Names VARCHAR(50) NOT NULL,
   Note VARCHAR(100) NOT NULL,
);
GO

CREATE TABLE SredaT
(  Sreda_id int NOT NULL,
   Note VARCHAR(100) NOT NULL,
);
GO

ALTER TABLE ZverT
ADD CONSTRAINT Zver_pk PRIMARY KEY (Zver_id) 
GO 

ALTER TABLE SredaT
ADD CONSTRAINT Sreda_pk PRIMARY KEY (Sreda_id) 
GO 

ALTER TABLE ClassT
ADD CONSTRAINT Class_pk PRIMARY KEY (Class_id) 
GO 

ALTER TABLE ZverT
ADD CONSTRAINT Sreda_fk FOREIGN KEY (Sreda_id) 
REFERENCES SredaT (Sreda_id) 
ON DELETE CASCADE 
ON UPDATE CASCADE 
GO 

ALTER TABLE ZverT
ADD CONSTRAINT Class_fk FOREIGN KEY (Class_id) 
REFERENCES ClassT (Class_id) 
ON DELETE CASCADE 
ON UPDATE CASCADE 
GO 

INSERT INTO ClassT (Class_id, Names, Note) VALUES
(1, 'Птицы', 'Летают'),
(2, 'Рыбы', 'Плавают');
GO

INSERT INTO ZverT (Zver_id, Sreda_id, Class_id, Names, Open_name, Open_date) VALUES
(1, 1, 1, 'Орел', 'Васильев', '01/01/2001'),
(2, 1, 2, 'Судак', 'Конев', '02/01/1998'),
(3, 2, 1, 'Пингвин', 'Горелов', '06/06/2006');
GO

INSERT INTO SredaT (Sreda_id, Note) VALUES
(1, 'Привлекательная'),
(2, 'Плохая'),
(3, 'Хорошая');
GO


SELECT Names, Open_name, Zver_id, Class_id, Sreda_id,
	(
	SELECT MAX(Open_date)
	FROM ZverT
	WHERE ZverT.Class_id > 1
	) AS MaxDate
FROM ZverT
WHERE Class_id > 1

SELECT MAX(Open_date) AS MAXDATE, MIN(Open_date) AS MINDATE
FROM ZverT
GROUP BY Sreda_id

SELECT 
MAX(Open_date) OVER(PARTITION BY Sreda_id) AS MAXDATE,
MIN(Open_date) OVER(PARTITION BY Sreda_id) AS MINDATE
FROM ZverT
GO 

CREATE PROCEDURE Sozdanie (@test NVARCHAR(200))
	AS ALTER TABLE ZverT
	ADD COLUMN @test NVARCHAR(200)

	