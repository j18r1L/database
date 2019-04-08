WITH Room(Nomer_id, Nomer, CountDays, Aircondition)
AS
	(
		SELECT RoomT.Nomer_id, RoomT.Nomer, SelledT.CountDays, RoomT.Aircondition
		FROM RoomT JOIN SelledT ON RoomT.Nomer_id = SelledT.Nomer_id
	)
SELECT *
FROM Room