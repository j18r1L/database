USE lab

SELECT Nomer, Bathroom
INTO #SVannoq
FROM RoomT
WHERE Bathroom = 'Ванна'