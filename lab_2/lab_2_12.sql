USE lab

SELECT RoomT.Nomer_id, RoomT.Nomer
FROM RoomT JOIN 
	(
	SELECT SelledT.Person_id, SelledT.Nomer_id
	FROM SelledT
	) AS Selled_RoomT ON RoomT.Nomer_id = Selled_RoomT.Person_id

--SELECT Names, Families, Person_id
--FROM PersonT JOIN
--	(
--	SELECT *
--	FROM RoomT
--	) AS Selled_Room_PersonT ON RoomT.Person_id = PersonT.Person_id
