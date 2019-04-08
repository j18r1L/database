USE lab
GO

if OBJECT_ID (N'trig', 'TR') IS NOT NULL
	DROP TRIGGER trig

DROP TRIGGER trig
DROP TRIGGER trigI

CREATE TRIGGER trig
ON RoomT
AFTER UPDATE 
AS BEGIN
	RAISERROR(N'Произошло обновление в таблице',1, 1)
END
GO

CREATE TRIGGER trigI
ON RoomT
INSTEAD OF UPDATE 
AS BEGIN
	RAISERROR(N'Произошло обновление в таблице, instead',1, 1)
END
GO

UPDATE RoomT
SET Aircondition = NULL
WHERE Nomer_id < 5
GO

ddl триггер который при кдалении вывод инфо 