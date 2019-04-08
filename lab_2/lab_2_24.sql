USE lab
GO

SELECT PersonT.Person_id, PersonT.Names, PersonT.Families, SelledT.Price,
AVG(SelledT.Price) OVER(PARTITION BY PersonT.Person_id, PersonT.Names) AS AVGPrice,
MIN(SelledT.Price) OVER(PARTITION BY PersonT.Person_id, PersonT.Names) AS MINPrice,
MAX(SelledT.Price) OVER(PARTITION BY PersonT.Person_id, PersonT.Names) AS MAXPrice
FROM PersonT LEFT OUTER JOIN SelledT ON PersonT.Person_id = SelledT.Person_id

